﻿using System;
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
    public class Subject2DAL
    {
        public int SaveSubject(SubjectEntities subjectEntities)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpInsertUpdatetblSubject", con);
            cmd.CommandType = CommandType.StoredProcedure;

            if (String.IsNullOrEmpty(subjectEntities.ID.ToString()) || (subjectEntities.ID == 0))
            {
                cmd.Parameters.AddWithValue("@Id", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Id", subjectEntities.ID);
            }

            cmd.Parameters.AddWithValue("@SubjectName", subjectEntities.SubjectName);

            //cmd.Parameters.AddWithValue("@GradeID", subjectEntities.GradeID);

            int recordsAffected = cmd.ExecuteNonQuery();
            con.Close();
            return recordsAffected;
        }

        public SubjectEntities GetSubjectByID(int ID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGettblSubjectByID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", ID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            SubjectEntities subjectEntities = new SubjectEntities();
            subjectEntities.ID = Convert.ToInt32(ds.Tables[0].Rows[0]["ID"].ToString());
            subjectEntities.SubjectName = Convert.ToString(ds.Tables[0].Rows[0]["SubjectName"]);
            //subjectEntities.GradeID = Convert.ToInt32(ds.Tables[0].Rows[0]["GradeID"]);
            return subjectEntities;
        }

        public List<SubjectEntities> GetSubjectPageWise(int pageIndex, ref int recordCount, int length)
        {
            List<SubjectEntities> subjectEntities = new List<SubjectEntities>();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("stpGettblSubjectPageWise", con))
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
                        subjectEntities.Add(new SubjectEntities
                        {
                            ID = Convert.ToInt32(dr["ID"]),
                            SubjectName = Convert.ToString(dr["SubjectName"]),
                            //Grade = Convert.ToString(dr["Grade"])
                        });
                    }
                    recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                    con.Close();
                }
            }
            return subjectEntities;
        }

        public int DeleteSubject(int ID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpDeletetblSubjectByID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", ID);
            int recordAffected = cmd.ExecuteNonQuery();
            con.Close();
            return recordAffected;
        }

        //for SubjectName drp
        public List<SubjectEntities> GetSubjectForDrp()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGettblSubjectForDrp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            DataTable myTable = ds.Tables[0];
            List<SubjectEntities> subjectParticularsList = myTable.AsEnumerable().Select(m => new SubjectEntities()
            {
                ID = m.Field<int>("Id"),
                SubjectName = m.Field<string>("SubjectName")

            }).ToList();

            con.Close();
            return subjectParticularsList;
        }
    }
}
