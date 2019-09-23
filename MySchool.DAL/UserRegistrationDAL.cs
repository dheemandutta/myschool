using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using MySchool.Entities;

namespace MySchool.DAL
{
    public class UserRegistrationDAL
    {
        public int SaveUser(UserRegistrationEntities userRegistrationEntities)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpInsertUser", con);
            cmd.CommandType = CommandType.StoredProcedure;

            if (String.IsNullOrEmpty(userRegistrationEntities.ID.ToString()) || (userRegistrationEntities.ID == 0))
            {
                cmd.Parameters.AddWithValue("@ID", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@ID", userRegistrationEntities.ID);
            }

            cmd.Parameters.AddWithValue("@ExamId", userRegistrationEntities.ExamId);

            cmd.Parameters.AddWithValue("@FirstName", userRegistrationEntities.FirstName);
            cmd.Parameters.AddWithValue("@LastName", userRegistrationEntities.LastName);
            cmd.Parameters.AddWithValue("@UserName", userRegistrationEntities.UserName);
            cmd.Parameters.AddWithValue("@Password", userRegistrationEntities.Password);

            int recordsAffected = cmd.ExecuteNonQuery();
            con.Close();
            return recordsAffected;
        }

        public UserRegistrationEntities ValidateUser(string userName, string password)
        {
            UserRegistrationEntities user = new UserRegistrationEntities();
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("stpGetUserByIDAndPass", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserName", userName);
                    cmd.Parameters.AddWithValue("@Password", password);
                    con.Open();

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                    con.Close();
                }
            }
            return ConvertDataTableUser(ds);
        }

        private UserRegistrationEntities ConvertDataTableUser(DataSet ds)
        {
            UserRegistrationEntities user = new UserRegistrationEntities();
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow item in ds.Tables[0].Rows)
                    {
                        if (item["UserName"] != DBNull.Value)
                            user.UserName = item["UserName"].ToString();
                        if (item["FirstName"] != DBNull.Value)
                            user.FirstName = item["FirstName"].ToString();
                        if (item["LastName"] != DBNull.Value)
                            user.LastName = item["LastName"].ToString();
                        if (item["RoleID"] != DBNull.Value)
                            user.RoleId = int.Parse(item["RoleID"].ToString());
                        if (item["ID"] != DBNull.Value)
                            user.ID = int.Parse(item["ID"].ToString());
                    }
                }
            }

            return user;
        }

    }
}
