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
    public class TopicDAL
    {
        public int SaveTopic(TopicEntities topicEntities)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpInsertUpdateTopic", con);
            cmd.CommandType = CommandType.StoredProcedure;

            if (String.IsNullOrEmpty(topicEntities.ID.ToString()) || (topicEntities.ID == 0))
            {
                cmd.Parameters.AddWithValue("@Id", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Id", topicEntities.ID);
            }

            cmd.Parameters.AddWithValue("@TopicName", topicEntities.TopicName);

            cmd.Parameters.AddWithValue("@SubjectId", topicEntities.SubjectId);

            int recordsAffected = cmd.ExecuteNonQuery();
            con.Close();
            return recordsAffected;
        }

        public TopicEntities GetTopicByID(int ID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetTopicByID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", ID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            TopicEntities topicEntities = new TopicEntities();
            topicEntities.ID = Convert.ToInt32(ds.Tables[0].Rows[0]["ID"].ToString());
            topicEntities.TopicName = Convert.ToString(ds.Tables[0].Rows[0]["TopicName"]);
            topicEntities.SubjectId = Convert.ToInt32(ds.Tables[0].Rows[0]["SubjectId"]);
            return topicEntities;
        }

        public List<TopicEntities> GetTopicPageWise(int pageIndex, ref int recordCount, int length)
        {
            List<TopicEntities> topicEntities = new List<TopicEntities>();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("stpGetTopicPageWise", con))
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
                        topicEntities.Add(new TopicEntities
                        {
                            ID = Convert.ToInt32(dr["Id"]),
                            TopicName = Convert.ToString(dr["TopicName"]),
                            SubjectName = Convert.ToString(dr["SubjectName"])
                        });
                    }
                    recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                    con.Close();
                }
            }
            return topicEntities;
        }

        public int DeleteTopic(int ID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpDeleteTopicByID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", ID);
            int recordAffected = cmd.ExecuteNonQuery();
            con.Close();
            return recordAffected;
        }

        //for SubjectName drp
        public List<TopicEntities> GetSubjectForDrp()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetAlltblSubjectForDrp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            DataTable myTable = ds.Tables[0];
            List<TopicEntities> subjectParticularsList = myTable.AsEnumerable().Select(m => new TopicEntities()
            {
                ID = m.Field<int>("Id"),
                SubjectName = m.Field<string>("SubjectName")

            }).ToList();

            con.Close();
            return subjectParticularsList;
        }
    }
}
