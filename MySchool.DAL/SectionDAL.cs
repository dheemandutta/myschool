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
            con.Close();
            return rowAffected;
        }

        //public List<SectionEntities> GetAllSection()
        //{
        //    List<SectionEntities> sectionsList = new List<SectionEntities>();
        //    SectionEntities section = new SectionEntities();
        //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand("stpGetAllGradeForDrp", con);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    SqlDataAdapter da = new SqlDataAdapter(cmd);
        //    DataSet ds = new DataSet();
        //    da.Fill(ds);

        //    foreach (DataRow dr in ds.Tables[0].Rows)
        //    {
        //        sectionsList.Add(new SectionEntities
        //        {
        //            ID=Convert.ToInt32(dr["ID"].ToString()),
        //            GradeId=Convert.ToInt32(dr["GradeId"].ToString()),
        //            Section=Convert.ToString(dr["Section"]),
        //        });
        //    }

        //    con.Close();
        //    return sectionsList;

        //}

        public List<GradeEntities> GetAllGradeForDrp()
        {
            List<GradeEntities> gradeList = new List<GradeEntities>();
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetAllGradeForDrp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            con.Close();
            
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                gradeList.Add(new GradeEntities
                {
                    ID = Convert.ToInt32(dr["ID"]),
                    Grade = Convert.ToString(dr["Grade"]),
                });
            }
            return gradeList;
        }

        public int Delete(int ID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpDeleteSectionBySectionID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            int recordAffected = cmd.ExecuteNonQuery();
            con.Close();
            return recordAffected;
        }

        public List<SectionEntities> GetAllSectionPageWise(int PageIndex, ref int recordCount, int lenght)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetSectionAllPageWise", con);
            cmd.CommandType = CommandType.StoredProcedure;
            List<SectionEntities> sectionList = new List<SectionEntities>();
            cmd.Parameters.AddWithValue("@PageIndex", PageIndex);
            cmd.Parameters.AddWithValue("@PageSize", lenght);
            cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
            cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
            con.Close();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                sectionList.Add(new SectionEntities
                {
                    ID = Convert.ToInt32(dr["ID"].ToString()),
                    Section= Convert.ToString(dr["Section"]),
                    GradeId = Convert.ToInt32(dr["GradeId"].ToString()),
                    Grade = Convert.ToString(dr["Grade"]),
                });
                recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
            }
            con.Close();
            return sectionList;
        }
        
        public SectionEntities GetSectionByID(int sectionID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetSectionBySectionID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", sectionID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            SectionEntities section= new SectionEntities();
            section.ID = Convert.ToInt32(ds.Tables[0].Rows[0]["ID"].ToString());
            section.Section= Convert.ToString(ds.Tables[0].Rows[0]["Section"]);
            section.GradeId = Convert.ToInt32(ds.Tables[0].Rows[0]["GradeId"].ToString());
           // section.Grade= Convert.ToString(ds.Tables[0].Rows[0]["Grade"].ToString());
            return section;
        }
    }
}
