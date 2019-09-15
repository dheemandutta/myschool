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
    public class tblConfigDAL
    {
        public int SaveConfig(tblConfigEntities configEntities)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpInsertUpdatetblConfig", con);
            cmd.CommandType = CommandType.StoredProcedure;

            //if (String.IsNullOrEmpty(configEntities.ID.ToString()) || (configEntities.ID == 0))
            //{
            //    cmd.Parameters.AddWithValue("@Id", DBNull.Value);
            //}
            //else
            //{
            //    cmd.Parameters.AddWithValue("@Id", configEntities.ID);
            //}

            cmd.Parameters.AddWithValue("@KeyName", configEntities.KeyName);

            cmd.Parameters.AddWithValue("@ConfigValue", configEntities.ConfigValue);

            int recordsAffected = cmd.ExecuteNonQuery();
            con.Close();
            return recordsAffected;
        }

        public List<tblConfigEntities> GettblConfigPageWise(int pageIndex, ref int recordCount, int length)
        {
            List<tblConfigEntities> topicEntities = new List<tblConfigEntities>();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("stpGettblConfigPageWise", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
                    cmd.Parameters.AddWithValue("@PageSize", length);
                    cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                    cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                    con.Open();

                    DataSet ds = new DataSet();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);

                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        topicEntities.Add(new tblConfigEntities
                        {
                            //ID = Convert.ToInt32(dr["Id"]),
                            KeyName = Convert.ToString(dr["KeyName"]),
                            ConfigValue = Convert.ToString(dr["ConfigValue"])
                        });
                    }
                    recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                    con.Close();
                }
            }
            return topicEntities;
        }

        public int DeletetblConfig(string KeyName)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpDeletetblConfigByID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@KeyName", KeyName);
            int recordAffected = cmd.ExecuteNonQuery();
            con.Close();
            return recordAffected;
        }
    }
}
