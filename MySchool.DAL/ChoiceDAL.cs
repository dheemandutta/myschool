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
    public class ChoiceDAL
    {
        public int SaveChoice(ChoiceEntities choiceEntities)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpInsertUpdateChoice", con);
            cmd.CommandType = CommandType.StoredProcedure;

            if (String.IsNullOrEmpty(choiceEntities.ID.ToString()) || (choiceEntities.ID == 0))
            {
                cmd.Parameters.AddWithValue("@Id", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Id", choiceEntities.ID);
            }

            cmd.Parameters.AddWithValue("@ChoiceText", choiceEntities.ChoiceText);

            cmd.Parameters.AddWithValue("@QuestionId", choiceEntities.QuestionId);

            int recordsAffected = cmd.ExecuteNonQuery();
            con.Close();
            return recordsAffected;
        }

        public ChoiceEntities GetChoiceByID(int ID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetChoiceByID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", ID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            ChoiceEntities topicEntities = new ChoiceEntities();
            topicEntities.ID = Convert.ToInt32(ds.Tables[0].Rows[0]["ID"].ToString());
            topicEntities.ChoiceText = Convert.ToString(ds.Tables[0].Rows[0]["ChoiceText"]);
            topicEntities.QuestionId = Convert.ToInt32(ds.Tables[0].Rows[0]["QuestionId"]);
            return topicEntities;
        }

        public List<ChoiceEntities> GetChoicePageWise(int pageIndex, ref int recordCount, int length)
        {
            List<ChoiceEntities> topicEntities = new List<ChoiceEntities>();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("stpGetChoicePageWise", con))
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
                        topicEntities.Add(new ChoiceEntities
                        {
                            ID = Convert.ToInt32(dr["Id"]),
                            ChoiceText = Convert.ToString(dr["ChoiceText"]),
                            QuestionName = Convert.ToString(dr["QuestionText"])
                        });
                    }
                    recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                    con.Close();
                }
            }
            return topicEntities;
        }

        public int DeleteChoice(int ID, ref string oUTPUT)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpDeleteChoiceByID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", ID);
            int recordAffected = cmd.ExecuteNonQuery();
            oUTPUT = Convert.ToString(cmd.Parameters["@OUTPUT"].Value);
            con.Close();
            return recordAffected;
        }

        //for QuestionName drp
        public List<ChoiceEntities> GetQuestionForDrp()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetQuestionForDrp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            DataTable myTable = ds.Tables[0];
            List<ChoiceEntities> subjectParticularsList = myTable.AsEnumerable().Select(m => new ChoiceEntities()
            {
                ID = m.Field<int>("Id"),
                QuestionName = m.Field<string>("QuestionText")

            }).ToList();

            con.Close();
            return subjectParticularsList;
        }
    }
}
