using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using MySchool.Entities;
namespace MySchool.DAL
{
    public class AdmissionDAL
    {
        public AdmissionFormEntities GetStudentDetailsForAdmission(int id)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetStudentDetailsForAdmissionByID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID",id);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            AdmissionFormEntities admission = new AdmissionFormEntities();
            admission.ID = Convert.ToInt32(ds.Tables[0].Rows[0]["ID"].ToString());
            admission.FormNumber = ds.Tables[0].Rows[0]["FormNumber"].ToString();
            admission.SFName = ds.Tables[0].Rows[0]["SFName"].ToString();
            admission.SMName = ds.Tables[0].Rows[0]["SMName"].ToString();
            admission.SLNAme = ds.Tables[0].Rows[0]["SLName"].ToString();
            admission.Gender = ds.Tables[0].Rows[0]["Gender"].ToString();
            admission.DOB = Convert.ToDateTime(ds.Tables[0].Rows[0]["DOB"].ToString());
            admission.FFName = ds.Tables[0].Rows[0]["FFName"].ToString();
            admission.FMName = ds.Tables[0].Rows[0]["FMName"].ToString();
            admission.FLName = ds.Tables[0].Rows[0]["FLName"].ToString();
            admission.MFName = ds.Tables[0].Rows[0]["MFName"].ToString();
            admission.MMName = ds.Tables[0].Rows[0]["MMName"].ToString();
            admission.MLName = ds.Tables[0].Rows[0]["MLName"].ToString();
            admission.GFName = ds.Tables[0].Rows[0]["GFName"].ToString();
            admission.GMName = ds.Tables[0].Rows[0]["GMName"].ToString();
            admission.GLName = ds.Tables[0].Rows[0]["GLName"].ToString();
            admission.Address = ds.Tables[0].Rows[0]["Address"].ToString();
            admission.MoutherTounge = ds.Tables[0].Rows[0]["MoutherTounge"].ToString();
            admission.FatherQualification = ds.Tables[0].Rows[0]["FatherQualification"].ToString();
            admission.MotherQualification = ds.Tables[0].Rows[0]["MotherQualification"].ToString();
            admission.FatherOccupation = ds.Tables[0].Rows[0]["FatherOccupation"].ToString();
            admission.FatherAnnualIncome = Convert.ToDecimal(ds.Tables[0].Rows[0]["FatherAnnualIncome"].ToString());
            admission.MotherOccupation = ds.Tables[0].Rows[0]["MotherOccupation"].ToString();
            admission.MotherAnnualIncome = Convert.ToDecimal(ds.Tables[0].Rows[0]["MotherAnnualIncome"].ToString());
            admission.GradeID = Convert.ToInt32(ds.Tables[0].Rows[0]["GradeID"].ToString());
            admission.YearID = Convert.ToInt32(ds.Tables[0].Rows[0]["YearID"].ToString());
            admission.IdentificationMarks = ds.Tables[0].Rows[0]["IdentificationMarks"].ToString();
            admission.SpecialMedicalProblem = ds.Tables[0].Rows[0]["SpecialMedicalProblem"].ToString();
            admission.RelationWithGuardian = ds.Tables[0].Rows[0]["RelationWithGuardian"].ToString();
            admission.SPhoto = ds.Tables[0].Rows[0]["SPhoto"].ToString();
            admission.FPhoto = ds.Tables[0].Rows[0]["FPhoto"].ToString();
            admission.FSign = ds.Tables[0].Rows[0]["FSign"].ToString();
            admission.MPhoto = ds.Tables[0].Rows[0]["MPhoto"].ToString();
            admission.MSign = ds.Tables[0].Rows[0]["MSign"].ToString();
            admission.FContactNo = ds.Tables[0].Rows[0]["FContactNo"].ToString();
            admission.MContactNo = ds.Tables[0].Rows[0]["MContactNo"].ToString();
            admission.Email = ds.Tables[0].Rows[0]["Email"].ToString();
            admission.Religion = ds.Tables[0].Rows[0]["Religion"].ToString();
            admission.Caste = ds.Tables[0].Rows[0]["Caste"].ToString();
            admission.FormFillDate = Convert.ToDateTime(ds.Tables[0].Rows[0]["FormFillDate"].ToString());
            return admission;
        }

        public List<AdmissionFormEntities> GetStudentListForAdmissionPageWise(int pageIndex, ref int recordCount, int length)
        {
            List<AdmissionFormEntities> admissionForm = new List<AdmissionFormEntities>();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("stpGetAdmissionFormDetailsPageWie2", con))
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
                        admissionForm.Add(new AdmissionFormEntities
                        {
                            ID = Convert.ToInt32(dr["Id"]),
                            SPhoto = Convert.ToString(dr["SPhoto"]),
                            FormNumber = Convert.ToString(dr["FormNumber"]),
                            StudentName = Convert.ToString(dr["StudentName"]),
                            MotherName = Convert.ToString(dr["MotherName"]),
                            FatherName = Convert.ToString(dr["MotherName"])
                        });
                    }
                    recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                    con.Close();
                }
            }
            return admissionForm;
        }
    }
}
