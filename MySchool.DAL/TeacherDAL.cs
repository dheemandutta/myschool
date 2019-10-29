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
        //public int SaveOrUpdate(TeacherEntities teacher)
        //{
        //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand("usp_Insert_Update_Teacher", con);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    if (string.IsNullOrEmpty(teacher.ID.ToString()) || (teacher.ID == 0))
        //    {
        //        cmd.Parameters.AddWithValue("@ID", DBNull.Value);
        //    }
        //    else
        //    {
        //        cmd.Parameters.AddWithValue("@ID", teacher.ID);
        //    }

        //    cmd.Parameters.AddWithValue("@FName", teacher.tFName);
        //    cmd.Parameters.AddWithValue("@LName", teacher.tLName);
        //    cmd.Parameters.AddWithValue("@Photo", teacher.Photo);
        //    cmd.Parameters.AddWithValue("@Gender", teacher.Gender);
        //    cmd.Parameters.AddWithValue("@Address", teacher.Address);
        //    cmd.Parameters.AddWithValue("@Ph1", teacher.Ph1);
        //    cmd.Parameters.AddWithValue("@Ph2", teacher.Ph2);
        //    cmd.Parameters.AddWithValue("@StartDate", teacher.StartDate);
        //    cmd.Parameters.AddWithValue("@EndDate", teacher.EndDate);
        //    cmd.Parameters.AddWithValue("@Comments", teacher.Comments);
        //    cmd.Parameters.AddWithValue("@Designation", teacher.Designation);

        //    cmd.Parameters.AddWithValue("@QualificationID", teacher.TeacherQualificationID);

        //    cmd.Parameters.AddWithValue("@QualName", teacher.QualName);
        //    cmd.Parameters.AddWithValue("@QualCertPath", teacher.QualCertPath);
        //    cmd.Parameters.AddWithValue("@QualStatus", teacher.QualStatus);
        //    cmd.Parameters.AddWithValue("@QualCompletionDate", teacher.QualCompletionDate);

        //    cmd.Parameters.AddWithValue("@TeacherSubjectId", teacher.TeacheSubjectId);
        //    cmd.Parameters.AddWithValue("@TeacherIDinQualification", teacher.TeacherIDInTeacherQualification);
        //    cmd.Parameters.AddWithValue("@SubjectID", teacher.SubjectID);
        //    cmd.Parameters.AddWithValue("@isPrimarySubject", teacher.isPrimarySubject);

        //    int recordAffected = cmd.ExecuteNonQuery();
        //    return recordAffected;
        //}
    }
}
