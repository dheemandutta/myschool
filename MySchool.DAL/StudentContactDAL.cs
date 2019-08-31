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
    public class StudentContactDAL
    {
        public int SaveStudentContact(StudentContactEntities studentContactEntities)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpInsertUpdateStudentContact", con);
            cmd.CommandType = CommandType.StoredProcedure;

            if (String.IsNullOrEmpty(studentContactEntities.ID.ToString()) || (studentContactEntities.ID == 0))
            {
                cmd.Parameters.AddWithValue("@ID", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@ID", studentContactEntities.ID);
            }

            cmd.Parameters.AddWithValue("@StudentID", studentContactEntities.StudentID);

            if (!String.IsNullOrEmpty(studentContactEntities.FatherFName))
            {
                cmd.Parameters.AddWithValue("@FatherFName", studentContactEntities.FatherFName);
            }
            else
            {
                cmd.Parameters.AddWithValue("@FatherFName", DBNull.Value);
            }

            if (!String.IsNullOrEmpty(studentContactEntities.FatherLName))
            {
                cmd.Parameters.AddWithValue("@FatherLName", studentContactEntities.FatherLName);
            }
            else
            {
                cmd.Parameters.AddWithValue("@FatherLName", DBNull.Value);
            }

            if (!String.IsNullOrEmpty(studentContactEntities.FatherAddress))
            {
                cmd.Parameters.AddWithValue("@FatherAddress", studentContactEntities.FatherAddress);
            }
            else
            {
                cmd.Parameters.AddWithValue("@FatherAddress", DBNull.Value);
            }

            if (!String.IsNullOrEmpty(studentContactEntities.FPh1))
            {
                cmd.Parameters.AddWithValue("@FPh1", studentContactEntities.FPh1);
            }
            else
            {
                cmd.Parameters.AddWithValue("@FPh1", DBNull.Value);
            }

            if (!String.IsNullOrEmpty(studentContactEntities.FPh2))
            {
                cmd.Parameters.AddWithValue("@FPh2", studentContactEntities.FPh2);
            }
            else
            {
                cmd.Parameters.AddWithValue("@FPh2", DBNull.Value);
            }

            if (!String.IsNullOrEmpty(studentContactEntities.MotherFName))
            {
                cmd.Parameters.AddWithValue("@MotherFName", studentContactEntities.MotherFName);
            }
            else
            {
                cmd.Parameters.AddWithValue("@MotherFName", DBNull.Value);
            }

            if (!String.IsNullOrEmpty(studentContactEntities.MotherLName))
            {
                cmd.Parameters.AddWithValue("@MotherLName", studentContactEntities.MotherLName);
            }
            else
            {
                cmd.Parameters.AddWithValue("@MotherLName", DBNull.Value);
            }

            if (!String.IsNullOrEmpty(studentContactEntities.MotherAddress))
            {
                cmd.Parameters.AddWithValue("@MotherAddress", studentContactEntities.MotherAddress);
            }
            else
            {
                cmd.Parameters.AddWithValue("@MotherAddress", DBNull.Value);
            }

            if (!String.IsNullOrEmpty(studentContactEntities.MPh1))
            {
                cmd.Parameters.AddWithValue("@MPh1", studentContactEntities.MPh1);
            }
            else
            {
                cmd.Parameters.AddWithValue("@MPh1", DBNull.Value);
            }

            if (!String.IsNullOrEmpty(studentContactEntities.MPh2))
            {
                cmd.Parameters.AddWithValue("@MPh2", studentContactEntities.MPh2);
            }
            else
            {
                cmd.Parameters.AddWithValue("@MPh2", DBNull.Value);
            }

            if (!String.IsNullOrEmpty(studentContactEntities.GFName))
            {
                cmd.Parameters.AddWithValue("@GFName", studentContactEntities.GFName);
            }
            else
            {
                cmd.Parameters.AddWithValue("@GFName", DBNull.Value);
            }

            if (!String.IsNullOrEmpty(studentContactEntities.GLName))
            {
                cmd.Parameters.AddWithValue("@GLName", studentContactEntities.GLName);
            }
            else
            {
                cmd.Parameters.AddWithValue("@GLName", DBNull.Value);
            }

            if (!String.IsNullOrEmpty(studentContactEntities.GAddress))
            {
                cmd.Parameters.AddWithValue("@GAddress", studentContactEntities.GAddress);
            }
            else
            {
                cmd.Parameters.AddWithValue("@GAddress", DBNull.Value);
            }

            if (!String.IsNullOrEmpty(studentContactEntities.GPh1))
            {
                cmd.Parameters.AddWithValue("@GPh1", studentContactEntities.GPh1);
            }
            else
            {
                cmd.Parameters.AddWithValue("@GPh1", DBNull.Value);
            }

            if (!String.IsNullOrEmpty(studentContactEntities.GPh2))
            {
                cmd.Parameters.AddWithValue("@GPh2", studentContactEntities.GPh2);
            }
            else
            {
                cmd.Parameters.AddWithValue("@GPh2", DBNull.Value);
            }


            //if (studentParticularsEntities.ID > 0)
            //{
            //    cmd.Parameters.AddWithValue("@ID", studentParticularsEntities.ID);
            //}
            //else
            //{
            //    cmd.Parameters.AddWithValue("@ID", DBNull.Value);
            //}

            int recordsAffected = cmd.ExecuteNonQuery();
            con.Close();
            return recordsAffected;
        }

        public StudentContactEntities GetStudentContactByID(int ID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetStudentContactByID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            StudentContactEntities studentContactEntities = new StudentContactEntities();

            studentContactEntities.ID = Convert.ToInt32(ds.Tables[0].Rows[0]["ID"].ToString());
            studentContactEntities.StudentID = Convert.ToInt32(ds.Tables[0].Rows[0]["StudentID"]);

            studentContactEntities.FatherFName = Convert.ToString(ds.Tables[0].Rows[0]["FatherFName"]);
            studentContactEntities.FatherLName = Convert.ToString(ds.Tables[0].Rows[0]["FatherLName"]);
            studentContactEntities.FatherAddress = Convert.ToString(ds.Tables[0].Rows[0]["FatherAddress"]);
            studentContactEntities.FPh1 = Convert.ToString(ds.Tables[0].Rows[0]["FPh1"]);
            studentContactEntities.FPh2 = Convert.ToString(ds.Tables[0].Rows[0]["FPh2"]);

            studentContactEntities.MotherFName = Convert.ToString(ds.Tables[0].Rows[0]["MotherFName"]);
            studentContactEntities.MotherLName = Convert.ToString(ds.Tables[0].Rows[0]["MotherLName"]);
            studentContactEntities.MotherAddress = Convert.ToString(ds.Tables[0].Rows[0]["MotherAddress"]);
            studentContactEntities.MPh1 = Convert.ToString(ds.Tables[0].Rows[0]["MPh1"]);
            studentContactEntities.MPh2 = Convert.ToString(ds.Tables[0].Rows[0]["MPh2"]);

            studentContactEntities.GFName = Convert.ToString(ds.Tables[0].Rows[0]["GFName"]);
            studentContactEntities.GLName = Convert.ToString(ds.Tables[0].Rows[0]["GLName"]);
            studentContactEntities.GAddress = Convert.ToString(ds.Tables[0].Rows[0]["GAddress"]);
            studentContactEntities.GPh1 = Convert.ToString(ds.Tables[0].Rows[0]["GPh1"]);
            studentContactEntities.GPh2 = Convert.ToString(ds.Tables[0].Rows[0]["GPh2"]);

            return studentContactEntities;
        }

        public List<StudentContactEntities> GetStudentContactPageWise(int pageIndex, ref int recordCount, int length)
        {
            List<StudentContactEntities> studentContactEntities = new List<StudentContactEntities>();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("stpGetStudentContactPageWise", con))
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
                        studentContactEntities.Add(new StudentContactEntities
                        {
                            ID = Convert.ToInt32(dr["ID"]),
                            //StudentID = Convert.ToInt32(dr["StudentID"]),

                            //FatherFName = Convert.ToString(dr["FatherFName"]),
                            //FatherLName = Convert.ToString(dr["FatherLName"]),
                            //FatherAddress = Convert.ToString(dr["FatherAddress"]),
                            //FPh1 = Convert.ToString(dr["FPh1"]),
                            //FPh2 = Convert.ToString(dr["FPh2"]),

                            //MotherFName = Convert.ToString(dr["MotherFName"]),
                            //MotherLName = Convert.ToString(dr["MotherLName"]),
                            //MotherAddress = Convert.ToString(dr["MotherAddress"]),
                            //MPh1 = Convert.ToString(dr["MPh1"]),
                            //MPh2 = Convert.ToString(dr["MPh2"]),

                            StudentName = Convert.ToString(dr["StudentName"]),
                            GName = Convert.ToString(dr["GName"]),
                            GAddress = Convert.ToString(dr["GAddress"]),
                            GPh1 = Convert.ToString(dr["GPh1"]),
                            //GPh2 = Convert.ToString(dr["GPh2"])
                        });
                    }
                    recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                    con.Close();
                }
            }
            return studentContactEntities;
        }
    }
}
