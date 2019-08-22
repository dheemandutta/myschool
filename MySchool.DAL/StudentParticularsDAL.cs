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
    public class StudentParticularsDAL
    {
        //for StudentName drp
        public List<StudentParticularsEntities> GetStudentForDrp()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetStudentForDrp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            DataTable myTable = ds.Tables[0];
            List<StudentParticularsEntities> studentParticularsList = myTable.AsEnumerable().Select(m => new StudentParticularsEntities()
            {
                StudentID = m.Field<int>("ID"),
                StudentName = m.Field<string>("StudentName")

            }).ToList();

            con.Close();
            return studentParticularsList;
        }

        //for Grade drp
        public List<StudentParticularsEntities> GetGradeForDrp()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetGradeForDrp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            DataTable myTable = ds.Tables[0];
            List<StudentParticularsEntities> studentParticularsList = myTable.AsEnumerable().Select(m => new StudentParticularsEntities()
            {
                GradeID = m.Field<int>("ID"),
                Grade = m.Field<string>("Grade")

            }).ToList();

            con.Close();
            return studentParticularsList;
        }

        //for Section drp
        public List<StudentParticularsEntities> GetSectionForDrp()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetSectionForDrp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            DataTable myTable = ds.Tables[0];
            List<StudentParticularsEntities> studentParticularsList = myTable.AsEnumerable().Select(m => new StudentParticularsEntities()
            {
                SectionID = m.Field<int>("ID"),
                Section = m.Field<string>("Section")

            }).ToList();

            con.Close();
            return studentParticularsList;
        }
    }
}
