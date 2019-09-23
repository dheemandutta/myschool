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
    }
}
