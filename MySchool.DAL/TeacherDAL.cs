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
        public int SaveOrUpdate(TeacherEntities teacher)
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

            cmd.Parameters.AddWithValue("@TFName", teacher.TFName);
            cmd.Parameters.AddWithValue("@TMName", teacher.TMName);
            cmd.Parameters.AddWithValue("@TLName", teacher.TLName);
            cmd.Parameters.AddWithValue("@Gender", teacher.Gender);
            cmd.Parameters.AddWithValue("@DOB", teacher.DOB);
            cmd.Parameters.AddWithValue("@FFName", teacher.FFName);
            cmd.Parameters.AddWithValue("@FMName", teacher.FMName);
            cmd.Parameters.AddWithValue("@FLName", teacher.FLName);
            cmd.Parameters.AddWithValue("@MFName", teacher.MFName);
            cmd.Parameters.AddWithValue("@MMName", teacher.MMName);
            cmd.Parameters.AddWithValue("@MLName", teacher.MLName);
            cmd.Parameters.AddWithValue("@Religion", teacher.Religion);
            cmd.Parameters.AddWithValue("@Caste", teacher.Caste);
            cmd.Parameters.AddWithValue("@email", teacher.email);
            cmd.Parameters.AddWithValue("@MotherTounge", teacher.MotherTounge);
            cmd.Parameters.AddWithValue("@Address", teacher.Address);
            cmd.Parameters.AddWithValue("@Ph1", teacher.Ph1);
            cmd.Parameters.AddWithValue("@Ph2", teacher.Ph2);
            cmd.Parameters.AddWithValue("@StartDate", teacher.StartDate);
            cmd.Parameters.AddWithValue("@EndDate", teacher.EndDate);
            cmd.Parameters.AddWithValue("@Photo", teacher.Photo);
            cmd.Parameters.AddWithValue("@Sign", teacher.Sign);
            cmd.Parameters.AddWithValue("@Comments", teacher.Comments);
            cmd.Parameters.AddWithValue("@Designation", teacher.Designation);


            //Teacher Qualification

            cmd.Parameters.AddWithValue("@TeacherQualificationID", teacher.TeacherQualificationID);
            cmd.Parameters.AddWithValue("@TeacherIDInTeacherQualification", teacher.TeacherIDInTeacherQualification);
            cmd.Parameters.AddWithValue("@QualName", teacher.QualName);
            cmd.Parameters.AddWithValue("@QualCertPath", teacher.QualCertPath);
            cmd.Parameters.AddWithValue("@QualStatus", teacher.QualStatus);
            cmd.Parameters.AddWithValue("@QualCompletionDate", teacher.QualCompletionDate);

            //Teacher Subject
            cmd.Parameters.AddWithValue("@TeacheSubjectId", teacher.TeacheSubjectId);
            cmd.Parameters.AddWithValue("@TeacherIDinTeacherSubject", teacher.TeacherIDinTeacherSubject);
            cmd.Parameters.AddWithValue("@SubjectID", teacher.SubjectID);
            cmd.Parameters.AddWithValue("@isPrimarySubject", teacher.isPrimarySubject);

            int recordAffected = cmd.ExecuteNonQuery();
            return recordAffected;
        }
    }
}
