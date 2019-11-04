
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
            cmd.Parameters.AddWithValue("@DOB", admissionEntity.DOB);
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
            List<AdmissionFormEntities> admissionfrom = new List<AdmissionFormEntities>();

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
                        admissionfrom.Add(new AdmissionFormEntities
                        {
                            ID = Convert.ToInt32(dr["Id"]),
                            FormNumber = Convert.ToString(dr["FormNumber"]),
                            StudentName = Convert.ToString(dr["StudentName"]),
                            DOB1 = Convert.ToString(dr["DOB"]),
                            Address = Convert.ToString(dr["Address"]),
                            IdentificationMarks = Convert.ToString(dr["IdentificationMarks"]),
                            isSelectedForAdmission = Convert.ToBoolean(dr["isSelectedForAdmission"])
                        });
                    }
                    recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                    con.Close();
                }
            }
            return admissionfrom;
        }

        public int UpdateSelectionForAdmissionStatus(int ID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpUpdateAdmissionFormSelectionStatus", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            int reccordAffected = cmd.ExecuteNonQuery();
            con.Close();
            return reccordAffected;
        }


        public ActualAdmissionEntities GetActualAdmissionByID(int ID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetActualAdmissionByID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            ActualAdmissionEntities actualAdmission = new ActualAdmissionEntities();
            actualAdmission.ID = Convert.ToInt32(ds.Tables[0].Rows[0]["ID"].ToString());
            actualAdmission.AdmissionNumber = Convert.ToString(ds.Tables[0].Rows[0]["FormNumber"]);
            actualAdmission.FormNumber = Convert.ToString(ds.Tables[0].Rows[0]["FormNumber"]);
            actualAdmission.SFName = Convert.ToString(ds.Tables[0].Rows[0]["SFName"]);
            actualAdmission.SMName = Convert.ToString(ds.Tables[0].Rows[0]["SMName"]);
            actualAdmission.SLNAme = Convert.ToString(ds.Tables[0].Rows[0]["SLNAme"]);
            actualAdmission.Gender = Convert.ToString(ds.Tables[0].Rows[0]["Gender"]);
            actualAdmission.DOB1 = Convert.ToString(ds.Tables[0].Rows[0]["DOB"]);
            actualAdmission.FFName = Convert.ToString(ds.Tables[0].Rows[0]["FFName"]);
            actualAdmission.FMName = Convert.ToString(ds.Tables[0].Rows[0]["FMName"]);
            actualAdmission.FLName = Convert.ToString(ds.Tables[0].Rows[0]["FLName"]);
            actualAdmission.MFName = Convert.ToString(ds.Tables[0].Rows[0]["MFName"]);
            actualAdmission.MMName = Convert.ToString(ds.Tables[0].Rows[0]["MMName"]);
            actualAdmission.MLName = Convert.ToString(ds.Tables[0].Rows[0]["MLName"]);
            actualAdmission.GFName = Convert.ToString(ds.Tables[0].Rows[0]["GFName"]);
            actualAdmission.GMName = Convert.ToString(ds.Tables[0].Rows[0]["GMName"]);
            actualAdmission.GLName = Convert.ToString(ds.Tables[0].Rows[0]["GLName"]);
            actualAdmission.Address = Convert.ToString(ds.Tables[0].Rows[0]["Address"]);
            actualAdmission.MoutherTounge = Convert.ToString(ds.Tables[0].Rows[0]["MoutherTounge"]);
            actualAdmission.FatherQualification = Convert.ToString(ds.Tables[0].Rows[0]["FatherQualification"]);
            actualAdmission.MotherQualification = Convert.ToString(ds.Tables[0].Rows[0]["MotherQualification"]);
            actualAdmission.FatherOccupation = Convert.ToString(ds.Tables[0].Rows[0]["FatherOccupation"]);
            actualAdmission.FatherAnnualIncome = Convert.ToDecimal(ds.Tables[0].Rows[0]["FatherAnnualIncome"]);
            actualAdmission.MotherOccupation = Convert.ToString(ds.Tables[0].Rows[0]["MotherOccupation"]);
            actualAdmission.MotherAnnualIncome = Convert.ToDecimal(ds.Tables[0].Rows[0]["MotherAnnualIncome"]);
            actualAdmission.GradeID = Convert.ToInt32(ds.Tables[0].Rows[0]["GradeID"]);
            actualAdmission.YearID = Convert.ToInt32(ds.Tables[0].Rows[0]["YearID"]);
            actualAdmission.isSelectedForInterview = Convert.ToBoolean(ds.Tables[0].Rows[0]["isSelectedForInterview"]);
            actualAdmission.IdentificationMarks = Convert.ToString(ds.Tables[0].Rows[0]["IdentificationMarks"]);
            actualAdmission.SpecialMedicalProblem = Convert.ToString(ds.Tables[0].Rows[0]["SpecialMedicalProblem"]);
            actualAdmission.RelationWithGuardian = Convert.ToString(ds.Tables[0].Rows[0]["RelationWithGuardian"]);
            actualAdmission.SPhoto = Convert.ToString(ds.Tables[0].Rows[0]["SPhoto"]);
            actualAdmission.FPhoto = Convert.ToString(ds.Tables[0].Rows[0]["FPhoto"]);
            actualAdmission.FSign = Convert.ToString(ds.Tables[0].Rows[0]["FSign"]);
            actualAdmission.MPhoto = Convert.ToString(ds.Tables[0].Rows[0]["MPhoto"]);
            actualAdmission.MSign = Convert.ToString(ds.Tables[0].Rows[0]["MSign"]);
            actualAdmission.FContactNo = Convert.ToString(ds.Tables[0].Rows[0]["FContactNo"]);
            actualAdmission.MContactNo = Convert.ToString(ds.Tables[0].Rows[0]["MContactNo"]);
            actualAdmission.Email = Convert.ToString(ds.Tables[0].Rows[0]["Email"]);
            actualAdmission.Religion = Convert.ToString(ds.Tables[0].Rows[0]["Religion"]);
            actualAdmission.Caste = Convert.ToString(ds.Tables[0].Rows[0]["Caste"]);
            actualAdmission.FormFillDate2 = Convert.ToString(ds.Tables[0].Rows[0]["FormFillDate"]);
            //actualAdmission.StudentName = Convert.ToString(ds.Tables[0].Rows[0]["StudentName"]);
            //actualAdmission.MotherName = Convert.ToString(ds.Tables[0].Rows[0]["MotherName"]);
            //actualAdmission.FatherName = Convert.ToString(ds.Tables[0].Rows[0]["FatherName"]);
            return actualAdmission;
        }


        public int GetAdmissionOfMaxIdByID()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetAdmissionOfMaxIdByID", con);
            cmd.CommandType = CommandType.StoredProcedure;

            int? maxAdmissionID = (int?)cmd.ExecuteScalar();
            con.Close();
            if (maxAdmissionID.HasValue)
                maxAdmissionID += 1;
            else
                maxAdmissionID = 0;

            return maxAdmissionID.Value;
        }
    }
}