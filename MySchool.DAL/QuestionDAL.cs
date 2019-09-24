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

        public int DeleteQuestion(int ID, ref string oUTPUT)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpDeleteQuestionByID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", ID);
            int recordAffected = cmd.ExecuteNonQuery();
            oUTPUT = Convert.ToString(cmd.Parameters["@OUTPUT"].Value);
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

       
        public static DataTable CreateTable()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Ans", typeof(string));
            dt.Columns.Add("IsAns", typeof(int));
            return dt;
        }

        //private static List<T> ConvertDataTable<T>(DataTable dt)
        //{
        //    List<T> data = new List<T>();
        //    foreach (DataRow row in dt.Rows)
        //    {
        //        T item = GetItem<T>(row);
        //        data.Add(item);
        //    }
        //    return data;
        //}
        //private static T GetItem<T>(DataRow dr)
        //{
        //    Type temp = typeof(T);
        //    T obj = Activator.CreateInstance<T>();

        //    foreach (DataColumn column in dr.Table.Columns)
        //    {
        //        foreach (PropertyInfo pro in temp.GetProperties())
        //        {
        //            if (pro.Name == column.ColumnName)
        //                pro.SetValue(obj, dr[column.ColumnName], null);
        //            else
        //                continue;
        //        }
        //    }
        //    return obj;
        //}

        public int SaveOrUpdate(QuestionViewEntities questionEntities)
        {
            DataTable atable = CreateTable();
            if(questionEntities.AnswerEntities != null)
            foreach (AnswerEntities item in questionEntities.AnswerEntities)
            {
                atable.Rows.Add(item.AnswerText,Convert.ToInt32(item.IsRightAnswer));
            }

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpInsertUpdateQuestion", con);
            cmd.CommandType = CommandType.StoredProcedure;

            if (String.IsNullOrEmpty(questionEntities.QuestionEntities.Id.ToString()) || (questionEntities.QuestionEntities.Id == 0))
            {
                cmd.Parameters.AddWithValue("@Id", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Id", questionEntities.QuestionEntities.Id);
            }

            cmd.Parameters.AddWithValue("@QuestionText", questionEntities.QuestionEntities.QuestionText);

            cmd.Parameters.AddWithValue("@TopicId", questionEntities.QuestionEntities.TopicId);


            //if (!String.IsNullOrEmpty(questionEntities.ImagePath))
            //{
            //    cmd.Parameters.AddWithValue("@ImagePath", questionEntities.ImagePath);
            //}
            //else
            //{
            //    cmd.Parameters.AddWithValue("@ImagePath", DBNull.Value);
            //}

            cmd.Parameters.AddWithValue("@Marks", questionEntities.QuestionEntities.Marks);


            cmd.Parameters.AddWithValue("@AnswerList", atable);
            cmd.Parameters[4].SqlDbType = SqlDbType.Structured;

            int recordsAffected = cmd.ExecuteNonQuery();
            con.Close();
            return recordsAffected;
        }

        public List<ChoiceEntities> GetAnswerPageWise(int Id, int pageIndex, ref int recordCount, int length)
        {

            List<ChoiceEntities> ranksPOList = new List<ChoiceEntities>();
            List<ChoiceEntities> ranksPO = new List<ChoiceEntities>();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("stpGettblAnswerPageWise", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@QuestionId", Id);
                    cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
                    cmd.Parameters.AddWithValue("@PageSize", length);
                    cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                    cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                    con.Open();

                    DataSet ds = new DataSet();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                    //prodPOList = Common.CommonDAL.ConvertDataTable<ProductPOCO>(ds.Tables[0]);

                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        ranksPOList.Add(new ChoiceEntities
                        {
                            Id = Convert.ToInt32(dr["Id"]),
                            ChoiceText = Convert.ToString(dr["ChoiceText"]),
                            IsAnswer = Convert.ToBoolean(dr["IsAnswer"])
                        });
                    }
                    recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                    con.Close();
                }
            }
            return ranksPOList;
        }


        public ChoiceEntities GetAnswerByID(int ID)
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
            topicEntities.Id = Convert.ToInt32(ds.Tables[0].Rows[0]["Id"].ToString());
            //topicEntities.QuestionId = Convert.ToInt32(ds.Tables[0].Rows[0]["QuestionId"]);
            topicEntities.ChoiceText = Convert.ToString(ds.Tables[0].Rows[0]["ChoiceText"]);
            topicEntities.IsAnswer = Convert.ToBoolean(ds.Tables[0].Rows[0]["IsAnswer"]);
            return topicEntities;
        }


        public void GetQuestionPaper(int questionCount, int userId)
        {
            QuestionViewEntities questionViewEntities = new QuestionViewEntities();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetQuestion", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@QuestionCount", questionCount);
            cmd.Parameters.AddWithValue("@UserId", userId);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            //ExamPaper examPaper = new ExamPaper();
            //examPaper  = CreateDataSet(ds);
            //return examPaper;
        }

        public ExamPaper GetNextPrevQuestion(int pageIndex,int pageSize,int userId)
        {
            QuestionViewEntities questionViewEntities = new QuestionViewEntities();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetNextQuestion", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
            cmd.Parameters.AddWithValue("@PageSize", pageSize);
            cmd.Parameters.Add(new SqlParameter("@QuestionCount", SqlDbType.Int));
            cmd.Parameters[2].Direction = ParameterDirection.Output;
            cmd.Parameters.AddWithValue("@UserId", userId);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int questCount = (int)(cmd.Parameters[2].Value);
            con.Close();
            ExamPaper examPaper = new ExamPaper();
            examPaper = CreateDataSet(ds);
            examPaper.PageSize = pageSize;
            examPaper.PageIndex = pageIndex;
            examPaper.QuestionCount = questCount;
            return examPaper;
        }

        public void SaveUserAnswer(int answerId,int useranswerId)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpSaveUserAnswer", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@AnswerId", useranswerId);
            cmd.Parameters.AddWithValue("@Id", answerId);
            int records = cmd.ExecuteNonQuery();
            con.Close();
        }

        private ExamPaper CreateDataSet(DataSet dsQuestion)
        {
            ExamPaper examPaper = new ExamPaper();
            List<QuestionEntities> questionEntitiesList = new List<QuestionEntities>();
            List<int> IdList = new List<int>();
            for (int i = 0; i < dsQuestion.Tables[0].Rows.Count; i++)
            {
                QuestionEntities questionEntities = new QuestionEntities();
                questionEntities.Id = Convert.ToInt32(dsQuestion.Tables[0].Rows[i]["Id"].ToString());
                questionEntities.QuestionText = Convert.ToString(dsQuestion.Tables[0].Rows[i]["QuestionText"]);
                questionEntities.Marks = Convert.ToDecimal(dsQuestion.Tables[0].Rows[i]["Marks"]);

                IdList.Add(questionEntities.Id);

                DataTable dtAns = dsQuestion.Tables[1].AsEnumerable()
                                    .Where(r => r.Field<int>("QuestionId") == int.Parse(dsQuestion.Tables[0].Rows[i]["Id"].ToString())).CopyToDataTable();

                List<AnswerEntities> answerEntities = new List<AnswerEntities>();
                for (int j = 0; j < dtAns.Rows.Count; j++)
                {
                    AnswerEntities answerEntities1 = new AnswerEntities();
                    answerEntities1.ID = Convert.ToInt32(dtAns.Rows[j]["Id"].ToString());
                    answerEntities1.AnswerText = Convert.ToString(dtAns.Rows[j]["ChoiceText"]);
                    answerEntities1.QuestionID = Convert.ToInt32(dtAns.Rows[j]["QuestionId"].ToString());
                    answerEntities1.IsRightAnswer = Convert.ToString(dtAns.Rows[j]["IsAnswer"].ToString());
                    answerEntities1.IsUserAnswer = Convert.ToInt32(dtAns.Rows[j]["IsUserAnswer"].ToString());

                    answerEntities.Add(answerEntities1);
                    
                }

                questionEntities.AnswerEntities = answerEntities;
                questionEntitiesList.Add(questionEntities);
            }

            examPaper.QuestionEntities = questionEntitiesList;
            examPaper.QuestionList = IdList;

            List<int> qCnt = new List<int>();

            for (int k = 0; k < dsQuestion.Tables[2].Rows.Count; k++)
            {
                qCnt.Add(int.Parse(dsQuestion.Tables[2].Rows[k][0].ToString()));
            }

            examPaper.AnsweredQuestionList = qCnt;

            return examPaper;
        }


        //for stpGettblSubjectForDrp drp
        public List<QuestionEntities> GettblSubjectForDrp()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGettblSubjectForDrp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            DataTable myTable = ds.Tables[0];
            List<QuestionEntities> subjectParticularsList = myTable.AsEnumerable().Select(m => new QuestionEntities()
            {
                Id = m.Field<int>("Id"),
                SubjectName = m.Field<string>("SubjectName")

            }).ToList();

            con.Close();
            return subjectParticularsList;
        }




        public List<int> GetAllQuestion(int userId)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetQuestionCount", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", userId);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            List<int> questionList = new List<int>();
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                questionList.Add(int.Parse(ds.Tables[0].Rows[i]["Id"].ToString()));
            }

            return questionList;
        }
    }
}
