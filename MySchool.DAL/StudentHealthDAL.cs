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
    public class StudentHealthDAL
    {
        public int SaveStudentHealth(StudentHealthEntities studentHealthEntities)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpInsertUpdateStudentHealth", con);
            cmd.CommandType = CommandType.StoredProcedure;

            if (String.IsNullOrEmpty(studentHealthEntities.ID.ToString()) || (studentHealthEntities.ID == 0))
            {
                cmd.Parameters.AddWithValue("@ID", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@ID", studentHealthEntities.ID);
            }

            cmd.Parameters.AddWithValue("@StudentID", studentHealthEntities.StudentID);

            if (!String.IsNullOrEmpty(studentHealthEntities.BloodGroup))
            {
                cmd.Parameters.AddWithValue("@BloodGroup", studentHealthEntities.BloodGroup);
            }
            else
            {
                cmd.Parameters.AddWithValue("@BloodGroup", DBNull.Value);
            }

            if (!String.IsNullOrEmpty(studentHealthEntities.KnownMadicalProblems))
            {
                cmd.Parameters.AddWithValue("@KnownMadicalProblems", studentHealthEntities.KnownMadicalProblems);
            }
            else
            {
                cmd.Parameters.AddWithValue("@KnownMadicalProblems", DBNull.Value);
            }

            if (!String.IsNullOrEmpty(studentHealthEntities.DoctorName))
            {
                cmd.Parameters.AddWithValue("@DoctorName", studentHealthEntities.DoctorName);
            }
            else
            {
                cmd.Parameters.AddWithValue("@DoctorName", DBNull.Value);
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

        public StudentHealthEntities GetStudentHealthByID(int ID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetStudentHealthByID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            StudentHealthEntities studentHealthEntities = new StudentHealthEntities();

            studentHealthEntities.ID = Convert.ToInt32(ds.Tables[0].Rows[0]["ID"].ToString());
            studentHealthEntities.StudentID = Convert.ToInt32(ds.Tables[0].Rows[0]["StudentID"]);

            studentHealthEntities.BloodGroup = Convert.ToString(ds.Tables[0].Rows[0]["BloodGroup"]);
            studentHealthEntities.KnownMadicalProblems = Convert.ToString(ds.Tables[0].Rows[0]["KnownMadicalProblems"]);
            studentHealthEntities.DoctorName = Convert.ToString(ds.Tables[0].Rows[0]["DoctorName"]);

            return studentHealthEntities;
        }


        public List<StudentHealthEntities> GetStudentHealthPageWise(int pageIndex, ref int recordCount, int length)
        {
            List<StudentHealthEntities> studentHealthEntities = new List<StudentHealthEntities>();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("stpGetStudentHealthPageWise", con))
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
                        studentHealthEntities.Add(new StudentHealthEntities
                        {
                            ID = Convert.ToInt32(dr["ID"]),

                            StudentName = Convert.ToString(dr["StudentName"]),
                            BloodGroup = Convert.ToString(dr["BloodGroup"]),
                            KnownMadicalProblems = Convert.ToString(dr["KnownMadicalProblems"]),
                            DoctorName = Convert.ToString(dr["DoctorName"])
                        });
                    }
                    recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                    con.Close();
                }
            }
            return studentHealthEntities;
        }
    }
}
