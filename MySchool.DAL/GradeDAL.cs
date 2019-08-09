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
    public class GradeDAL
    {
        public List<GradeGroupEntities> GetAllGradeGroup()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_Get_GradeGroup", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            List<GradeGroupEntities> gradeGroupList = new List<GradeGroupEntities>();
            GradeGroupEntities gradeGroup = new GradeGroupEntities();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                gradeGroupList.Add(new GradeGroupEntities
                {
                    ID = Convert.ToInt32(dr["ID"].ToString()),
                    GradeGroup = Convert.ToString(dr["GradeGroup"]),
                });
            }
            con.Close();
            return gradeGroupList;
        }

        public int SaveGrade(GradeEntities grade)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_Insert_Grade", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Grade", grade.Grade);
            cmd.Parameters.AddWithValue("@GradeGroupID", grade.GradeGroupID);
            int recordAffected = cmd.ExecuteNonQuery();
            con.Close();
            return recordAffected;
            /*iuhiuy*/
        }

        public int UpdateGrade(GradeEntities grade)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_Update_Grade_By_GradeID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", grade.ID);
            cmd.Parameters.AddWithValue("@Grade", grade.Grade);
            cmd.Parameters.AddWithValue("@GradeGroupID", grade.GradeGroupID);
            int recordAffected = cmd.ExecuteNonQuery();
            con.Close();
            return recordAffected;
        }
        

        public List<GradeEntities> GetAllGrade()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_Get_Grade_All", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            List<GradeEntities> gradeList = new List<GradeEntities>();
            GradeEntities garde = new GradeEntities();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                gradeList.Add(new GradeEntities
                {
                    ID = Convert.ToInt32(dr["ID"].ToString()),
                    Grade = Convert.ToString(dr["Grade"].ToString()),
                    GradeGroupID = Convert.ToInt32(dr["GradeGroupID"].ToString()),
                    GradeGroup = Convert.ToString(dr["GradeGroup"]),
                });
            }
            con.Close();
            return gradeList;
        }

        public List<GradeEntities> GetAllGradePageWise(int pageIndex, ref int recordCount, int length)
        {
            List<GradeEntities> gradeList = new List<GradeEntities>();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("usp_Get_Grade_All_PageWise", con);
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
                gradeList.Add(new GradeEntities
                {
                    ID= Convert.ToInt32(dr["ID"].ToString()),
                    Grade= Convert.ToString(dr["Grade"]),
                    GradeGroupID= Convert.ToInt32(dr["GradeGroupID"].ToString()),
                    GradeGroup=Convert.ToString(dr["GradeGroup"]),
                });
                recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
            }
            con.Close();
            return gradeList;
        }

        public GradeEntities GetGradeByID(int GradeID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_Get_Grade_By_GradeID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", GradeID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            GradeEntities grade = new GradeEntities();
            grade.ID = Convert.ToInt32(ds.Tables[0].Rows[0]["ID"].ToString());
            grade.Grade = Convert.ToString(ds.Tables[0].Rows[0]["Grade"]);
            grade.GradeGroupID = Convert.ToInt32(ds.Tables[0].Rows[0]["GradeGroupID"].ToString());
            return grade;
        }
    }
}
    