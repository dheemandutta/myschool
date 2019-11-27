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
    public class StudentAttendentDAL
    {
        public List<StudentAttendentEntities> GetStudentAttendentPageWise(int pageIndex, ref int recordCount, int length)
        {
            List<StudentAttendentEntities> studentAttendentEntities = new List<StudentAttendentEntities>();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("stpGetStudentAttendentPageWise", con))
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
                        studentAttendentEntities.Add(new StudentAttendentEntities
                        {
                            ID = Convert.ToInt32(dr["ID"]),
                            StudentName = Convert.ToString(dr["StudentName"]),
                            IsPresents = Convert.ToString(dr["IsPresents"])
                        });
                    }
                    recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                    con.Close();
                }
            }
            return studentAttendentEntities;
        }

        //for Grade drp
        public List<GradeEntities> GetAllGradeForDrp()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetAllGradeForDrp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            DataTable myTable = ds.Tables[0];
            List<GradeEntities> unitMasterList = myTable.AsEnumerable().Select(m => new GradeEntities()
            {
                ID = m.Field<int>("ID"),
                Grade = m.Field<string>("Grade")

            }).ToList();
            con.Close();
            return unitMasterList;
        }



        //for GradeNew drp
        public List<GradeEntities> GetAllGradeForDrpNew()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetAllGradeForDrp_New", con);
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            DataTable myTable = ds.Tables[0];
            List<GradeEntities> unitMasterList = myTable.AsEnumerable().Select(m => new GradeEntities()
            {
                ID = m.Field<int>("ID"),
                Grade = m.Field<string>("Grade")
            }).ToList();
            con.Close();
            return unitMasterList;
        }

        //for SectionByGradeId drp
        public List<SectionEntities> GetAllSectionByGradeIdForDrp_New(string ID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetAllSectionByGradeIdForDrp_New", con);
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            DataTable myTable = ds.Tables[0];
            List<SectionEntities> unitMasterList = myTable.AsEnumerable().Select(m => new SectionEntities()
            {
                ID = m.Field<int>("ID"),
                Section = m.Field<string>("Section")
            }).ToList();
            con.Close();
            return unitMasterList;
        }

        //for StudentBySectionID drp
        public List<StudentEntities> stpGetAllStudentBySectionIdForDrp_New(string ID, string YearID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetAllStudentBySectionIdForDrp_New", con);
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@YearID", YearID);
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            DataTable myTable = ds.Tables[0];
            List<StudentEntities> unitMasterList = myTable.AsEnumerable().Select(m => new StudentEntities()
            {
                ID = m.Field<int>("ID"),
                StudentName = m.Field<string>("StudentName")
            }).ToList();
            con.Close();
            return unitMasterList;
        }
    }
}
