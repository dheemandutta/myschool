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
    public class QuestionDAL
    {
        public int SaveQuestion(QuestionEntities questionEntities)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpInsertUpdateQuestion", con);
            cmd.CommandType = CommandType.StoredProcedure;

            if (String.IsNullOrEmpty(questionEntities.Id.ToString()) || (questionEntities.Id == 0))
            {
                cmd.Parameters.AddWithValue("@Id", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Id", questionEntities.Id);
            }

            cmd.Parameters.AddWithValue("@QuestionText", questionEntities.QuestionText);

            cmd.Parameters.AddWithValue("@TopicId", questionEntities.TopicId);

         
            //if (!String.IsNullOrEmpty(questionEntities.ImagePath))
            //{
            //    cmd.Parameters.AddWithValue("@ImagePath", questionEntities.ImagePath);
            //}
            //else
            //{
            //    cmd.Parameters.AddWithValue("@ImagePath", DBNull.Value);
            //}

            cmd.Parameters.AddWithValue("@Marks", questionEntities.Marks);

            int recordsAffected = cmd.ExecuteNonQuery();
            con.Close();
            return recordsAffected;
        }

        public QuestionEntities GetQuestionByID(int ID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetQuestionByID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", ID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            QuestionEntities topicEntities = new QuestionEntities();
            topicEntities.Id = Convert.ToInt32(ds.Tables[0].Rows[0]["Id"].ToString());
            topicEntities.QuestionText = Convert.ToString(ds.Tables[0].Rows[0]["QuestionText"]);
            topicEntities.TopicId = Convert.ToInt32(ds.Tables[0].Rows[0]["TopicId"]);
            topicEntities.ImagePath = Convert.ToString(ds.Tables[0].Rows[0]["ImagePath"]);
            topicEntities.Marks = Convert.ToDecimal(ds.Tables[0].Rows[0]["Marks"]);
            return topicEntities;
        }

        public List<QuestionEntities> GetQuestionPageWise(int pageIndex, ref int recordCount, int length)
        {
            List<QuestionEntities> topicEntities = new List<QuestionEntities>();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("stpGetQuestionPageWise", con))
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
                        topicEntities.Add(new QuestionEntities
                        {
                            Id = Convert.ToInt32(dr["Id"]),
                            QuestionText = Convert.ToString(dr["QuestionText"]),
                            TopicName = Convert.ToString(dr["TopicName"]),
                            //ImagePath = Convert.ToString(dr["ImagePath"]),
                            Marks = Convert.ToDecimal(dr["Marks"])
                        });
                    }
                    recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                    con.Close();
                }
            }
            return topicEntities;
        }

        public int DeleteQuestion(int ID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpDeleteQuestionByID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", ID);
            int recordAffected = cmd.ExecuteNonQuery();
            con.Close();
            return recordAffected;
        }

        //for Topic drp
        public List<QuestionEntities> GetTopicForDrp()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetTopicForDrp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            DataTable myTable = ds.Tables[0];
            List<QuestionEntities> subjectParticularsList = myTable.AsEnumerable().Select(m => new QuestionEntities()
            {
                Id = m.Field<int>("Id"),
                TopicName = m.Field<string>("TopicName")

            }).ToList();

            con.Close();
            return subjectParticularsList;
        }
    }
}
