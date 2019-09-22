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
    public class ExamDAL
    {

        public List<ExamEntities> GetAllExam()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);

            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetExamAll", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            List<ExamEntities> ExamList = new List<ExamEntities>();
            ExamEntities exam = new ExamEntities();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                ExamList.Add(new ExamEntities
                {
                    ID = Convert.ToInt32(dr["ID"].ToString()),
                    ExamName = Convert.ToString(dr["ExamName"]),
                });
            }
            con.Close();
            return ExamList;
        }

        public int SaveOrUpdateExam(ExamEntities exam)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpInsertUpdateExam", con);
            cmd.CommandType = CommandType.StoredProcedure;
            if (String.IsNullOrEmpty(exam.ID.ToString()) || (exam.ID == 0))
            {
                cmd.Parameters.AddWithValue("@ID", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@ID", exam.ID);
            }
            cmd.Parameters.AddWithValue("@ExamName", exam.ExamName);

            int recordAffected = cmd.ExecuteNonQuery();
            con.Close();
            return recordAffected;
        }

        //public int UpdateExam(ExamEntities Exam)
        //{
        //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand("stpUpdateExamByExamID", con);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Parameters.AddWithValue("@id", Exam.ID);
        //    cmd.Parameters.AddWithValue("@Exam", Exam.Exam);
        //    cmd.Parameters.AddWithValue("@ExamID", Exam.ExamID);
        //    int recordAffected = cmd.ExecuteNonQuery();
        //    con.Close();
        //    return recordAffected;
        //}
        public int DeleteExam(int ID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpDeleteExamByExamID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", ID);
            int recordAffected = cmd.ExecuteNonQuery();
            con.Close();
            return recordAffected;
        }

        public List<ExamEntities> GetAllExamPageWise(int pageIndex, ref int recordCount, int length)
        {
            List<ExamEntities> ExamList = new List<ExamEntities>();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("stpGetExamAllPageWise", con);
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
                ExamList.Add(new ExamEntities
                {
                    ID = Convert.ToInt32(dr["ID"].ToString()),
                    ExamName = Convert.ToString(dr["ExamName"])
                });
                recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
            }
            con.Close();
            return ExamList;
        }

        public ExamEntities GetExamByID(int ExamID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetExamByExamID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ExamID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            ExamEntities Exam = new ExamEntities();
            Exam.ID = Convert.ToInt32(ds.Tables[0].Rows[0]["ID"].ToString());
            Exam.ExamName = Convert.ToString(ds.Tables[0].Rows[0]["ExamName"]);
            return Exam;
        }



        //for Exam drp
        public List<ExamEntities> GetExamForDrp()  
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetExamForDrp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            DataTable myTable = ds.Tables[0];
            List<ExamEntities> studentParticularsList = myTable.AsEnumerable().Select(m => new ExamEntities()
            {
                ExamID = m.Field<int>("ID"),
                ExamName = m.Field<string>("ExamName")

            }).ToList();

            con.Close();
            return studentParticularsList;
        }
    }
}