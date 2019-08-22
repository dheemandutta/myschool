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
    public class YearDAL
    { 
        public int SaveYear(YearEntities yearEntities)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpSaveYear", con);
            cmd.CommandType = CommandType.StoredProcedure;

            //if (!String.IsNullOrEmpty(yearEntities.Year))
            //{
            //    cmd.Parameters.AddWithValue("@Year", yearEntities.Year);
            //}
            //else
            //{
            //    cmd.Parameters.AddWithValue("@Year", DBNull.Value);
            //}
            cmd.Parameters.AddWithValue("@Year", yearEntities.Year);

            //if (!String.IsNullOrEmpty(yearEntities.YearDesc))
            //{
            //    cmd.Parameters.AddWithValue("@YearDesc", yearEntities.YearDesc);
            //}
            //else
            //{
            //    cmd.Parameters.AddWithValue("@YearDesc", DBNull.Value);
            //}
            cmd.Parameters.AddWithValue("@YearDesc", yearEntities.YearDesc);

            if (yearEntities.ID > 0)
            {
                cmd.Parameters.AddWithValue("@ID", yearEntities.ID);
            }
            else
            {
                cmd.Parameters.AddWithValue("@ID", DBNull.Value);
            }

            int recordsAffected = cmd.ExecuteNonQuery();
            con.Close();
            return recordsAffected;
        }

        public List<YearEntities> GetYearPageWise(int pageIndex, ref int recordCount, int length)
        {
            List<YearEntities> yearEntities = new List<YearEntities>();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("stpGetYearPageWise", con))
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
                        yearEntities.Add(new YearEntities
                        {
                            //ID = Convert.ToInt32(dr["ID"]),
                            Year = Convert.ToString(dr["Year"]),
                            YearDesc = Convert.ToString(dr["YearDesc"])
                        });
                    }
                    recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                    con.Close();
                }
            }
            return yearEntities;
        }
    }
}
