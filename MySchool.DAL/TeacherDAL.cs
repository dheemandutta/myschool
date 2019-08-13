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
    public class TeacherDAL
    {
        public int SaveOrUpdate(TeacherEntities teacher, TeacherQualEntities teacherQualification)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_Insert_Update_Teacher", con);
            cmd.CommandType = CommandType.StoredProcedure;
            if (string.IsNullOrEmpty(teacher.ID.ToString()) || (teacher.ID == 0))
            {
                cmd.Parameters.AddWithValue("@ID", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@ID", teacher.ID);
            }
            cmd.Parameters.AddWithValue("@FName", teacher.FName);
            cmd.Parameters.AddWithValue("@LName", teacher.LName);
            cmd.Parameters.AddWithValue("@Photo", teacher.Photo);
            cmd.Parameters.AddWithValue("@Gender", teacher.Gender);
            cmd.Parameters.AddWithValue("@Address", teacher.Address);
            cmd.Parameters.AddWithValue("@Ph1", teacher.Ph1);
            cmd.Parameters.AddWithValue("@Ph2", teacher.Ph2);
            cmd.Parameters.AddWithValue("@StartDate", teacher.StartDate);
            cmd.Parameters.AddWithValue("@EndDate", teacher.EndDate);
            cmd.Parameters.AddWithValue("@Comments", teacher.Comments);
            cmd.Parameters.AddWithValue("@Designation", teacher.Designation);

            cmd.Parameters.AddWithValue("@ID1", teacherQualification.ID);
            cmd.Parameters.AddWithValue("@TeacherID", teacherQualification.TeacherID);
            cmd.Parameters.AddWithValue("@QualName", teacherQualification.QualName);
            cmd.Parameters.AddWithValue("@QualCertPath", teacherQualification.QualCertPath);
            cmd.Parameters.AddWithValue("@QualStatus", teacherQualification.QualStatus);
            cmd.Parameters.AddWithValue("@QualCompletionDate", teacherQualification.QualCompletionDate);

            int recordAffected = cmd.ExecuteNonQuery();
            return recordAffected;
        }
    }
}
