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
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MySchoolConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("@usp_Get_GradeGroup", con);
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
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MySchoolConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("ups_Insert_Grade", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Grade", grade.Grade);
            cmd.Parameters.AddWithValue("@GradeGroupID", grade.GradeGroupID);
            int recordAffected = cmd.ExecuteNonQuery();
            con.Close();
            return recordAffected;
        }
    }
}
