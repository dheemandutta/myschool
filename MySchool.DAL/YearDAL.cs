using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using MySchool.Entities;
//using AutoMapper;
namespace MySchool.DAL
{ 
    public class YearDAL
    {

       // IMapper mapper;
        //public YearDAL()
        //{
        //    var config = new MapperConfiguration(cfg =>
        //    {
        //        cfg.CreateMap<IDataReader, YearEntities>();
        //    });

        //    mapper = config.CreateMapper();
        //}
        public int SaveYear(YearEntities yearEntities)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpSaveYear", con);
            cmd.CommandType = CommandType.StoredProcedure;

           
            cmd.Parameters.AddWithValue("@Year", yearEntities.Year);

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


                    // List<YearEntities>  x = AutoMapper.Mapper.Map<IDataReader, List<YearEntities>>(ds.Tables[0].CreateDataReader());

                    //List<YearEntities> xx = mapper.Map<IDataReader, List<YearEntities>>(ds.Tables[0].CreateDataReader());

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
