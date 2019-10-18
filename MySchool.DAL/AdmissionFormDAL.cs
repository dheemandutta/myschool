
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using MySchool.Entities;


namespace MySchool.DAL
{
    public class AdmissionFormDAL
    {
        public int SaveorUpdate(AdmissionFormEntities admissionEntity)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpInsertUpdateAdmissionForm", con);
            cmd.CommandType = CommandType.StoredProcedure;
            if (String.IsNullOrEmpty(admissionEntity.ID.ToString()) || (admissionEntity.ID == 0)){
                cmd.Parameters.AddWithValue("@ID", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@ID", admissionEntity.ID);
            }

            cmd.Parameters.AddWithValue("@FormNumber", admissionEntity.FormNumber);
            cmd.Parameters.AddWithValue("@SFName", admissionEntity.SFName);
            cmd.Parameters.AddWithValue("@SMName", admissionEntity.SMName);
            cmd.Parameters.AddWithValue("@SLNAme", admissionEntity.SLNAme);
            cmd.Parameters.AddWithValue("@Gender", admissionEntity.Gender);
            cmd.Parameters.AddWithValue("@DateTime DOB", admissionEntity.DOB);
            cmd.Parameters.AddWithValue("@FFName", admissionEntity.FFName);
            cmd.Parameters.AddWithValue("@FMName", admissionEntity.FMName);
            cmd.Parameters.AddWithValue("@FLName", admissionEntity.FLName);
            cmd.Parameters.AddWithValue("@MFName", admissionEntity.MFName);
            cmd.Parameters.AddWithValue("@MMName", admissionEntity.MMName);
            cmd.Parameters.AddWithValue("@MLName", admissionEntity.MLName);
            cmd.Parameters.AddWithValue("@GFName", admissionEntity.GFName);
            cmd.Parameters.AddWithValue("@GMName", admissionEntity.GMName);
            cmd.Parameters.AddWithValue("@GLName", admissionEntity.GLName);
            cmd.Parameters.AddWithValue("@Address", admissionEntity.Address);
            cmd.Parameters.AddWithValue("@MoutherTounge", admissionEntity.MoutherTounge);
            cmd.Parameters.AddWithValue("@FatherQualification", admissionEntity.FatherQualification);
            cmd.Parameters.AddWithValue("@MotherQualification", admissionEntity.MotherQualification);
            cmd.Parameters.AddWithValue("@FatherOccupation", admissionEntity.FatherOccupation);
            cmd.Parameters.AddWithValue("@FatherAnnualIncome", admissionEntity.FatherAnnualIncome);
            cmd.Parameters.AddWithValue("@MotherOccupation", admissionEntity.MotherOccupation);
            cmd.Parameters.AddWithValue("@MotherAnnualIncome", admissionEntity.MotherAnnualIncome);
            cmd.Parameters.AddWithValue("@GradeID", admissionEntity.GradeID);
            cmd.Parameters.AddWithValue("@YearID", admissionEntity.YearID);
            cmd.Parameters.AddWithValue("@IdentificationMarks", admissionEntity.IdentificationMarks);
            cmd.Parameters.AddWithValue("@SpecialMedicalProblem", admissionEntity.SpecialMedicalProblem);
            cmd.Parameters.AddWithValue("@RelationWithGuardian", admissionEntity.RelationWithGuardian);
            cmd.Parameters.AddWithValue("@SPhoto", admissionEntity.SPhoto);
            cmd.Parameters.AddWithValue("@FPhoto", admissionEntity.FPhoto);
            cmd.Parameters.AddWithValue("@FSign", admissionEntity.FSign);
            cmd.Parameters.AddWithValue("@MPhoto", admissionEntity.MPhoto);
            cmd.Parameters.AddWithValue("@MSign", admissionEntity.MSign);
            cmd.Parameters.AddWithValue("@FContactNo", admissionEntity.FContactNo);
            cmd.Parameters.AddWithValue("@MContactNo", admissionEntity.MContactNo);
            cmd.Parameters.AddWithValue("@Email", admissionEntity.Email);

            int recordAffected = cmd.ExecuteNonQuery();
            con.Close();
            return recordAffected;
        }

        public List<AdmissionFormEntities> GetAdmissionFormPageWise(int pageIndex, ref int recordCount, int length)
        {
            List<AdmissionFormEntities> topicEntities = new List<AdmissionFormEntities>();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("stpGetAdmissionFormPageWise", con))
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
                        topicEntities.Add(new AdmissionFormEntities
                        {
                            ID = Convert.ToInt32(dr["Id"]),
                            FormNumber = Convert.ToString(dr["FormNumber"]),
                            StudentName = Convert.ToString(dr["StudentName"]),
                            DOB1 = Convert.ToString(dr["DOB"]),
                            Address = Convert.ToString(dr["Address"]),
                            IdentificationMarks = Convert.ToString(dr["IdentificationMarks"])
                        });
                    }
                    recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                    con.Close();
                }
            }
            return topicEntities;
        }

        public int UpdateSelectionStatus(AdmissionFormEntities admissionForm)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpUpdateAdmissionFormSelectionStatus", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", admissionForm.ID);
            cmd.Parameters.AddWithValue("@isSelectedForAdmission", admissionForm.isSelectedForInterview);
            int reccordAffected = cmd.ExecuteNonQuery();
            con.Close();
            return reccordAffected;
        }
    }
}