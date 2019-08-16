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
    public class SectionDAL
    {
        public int SaveOrUpdate(SectionEntities section)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpInsertUpdateSection", con);
            cmd.CommandType = CommandType.StoredProcedure;
            if (String.IsNullOrEmpty(section.ID.ToString()) || (section.ID == 0))
            {
                cmd.Parameters.AddWithValue("@ID", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@ID", section.ID);
            }

            cmd.Parameters.AddWithValue("@GradeId", section.GradeId);
            cmd.Parameters.AddWithValue("Section", section.Section);
            int rowAffected = cmd.ExecuteNonQuery();
            return rowAffected;
        }

        public List<SectionEntities> GetAllSection()
        {
            List<SectionEntities> sectionsList = new List<SectionEntities>();
            SectionEntities section = new SectionEntities();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetAllGradeForDrp", con);
            cmd.CommandType = CommandType.StoredProcedure;



        }
        
    }
}
