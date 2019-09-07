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
        public int SaveStudentParticulars(StudentParticularsEntities studentParticularsEntities)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpInsertUpdateStudentParticulars", con);
            cmd.CommandType = CommandType.StoredProcedure;

            if (String.IsNullOrEmpty(studentParticularsEntities.ID.ToString()) || (studentParticularsEntities.ID == 0))
            {
                cmd.Parameters.AddWithValue("@ID", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@ID", studentParticularsEntities.ID);
            }

            cmd.Parameters.AddWithValue("@FirstName", studentParticularsEntities.FirstName);

            if (!String.IsNullOrEmpty(studentParticularsEntities.LastName))
            {
                cmd.Parameters.AddWithValue("@LastName", studentParticularsEntities.LastName);
            }
            else
            {
                cmd.Parameters.AddWithValue("@LastName", DBNull.Value);
            }

            if (!String.IsNullOrEmpty(studentParticularsEntities.DOB))
            {
                cmd.Parameters.AddWithValue("@DOB", studentParticularsEntities.DOB);
            }
            else
            {
                cmd.Parameters.AddWithValue("@DOB", DBNull.Value);
            }

            cmd.Parameters.AddWithValue("@GradeID", studentParticularsEntities.GradeID);

            if (!String.IsNullOrEmpty(studentParticularsEntities.StartDate))
            {
                cmd.Parameters.AddWithValue("@StartDate", studentParticularsEntities.StartDate);
            }
            else
            {
                cmd.Parameters.AddWithValue("@StartDate", DBNull.Value);
            }

            if (!String.IsNullOrEmpty(studentParticularsEntities.EndDate))
            {
                cmd.Parameters.AddWithValue("@EndDate", studentParticularsEntities.EndDate);
            }
            else
            {
                cmd.Parameters.AddWithValue("@EndDate", DBNull.Value);
            }

            if (!String.IsNullOrEmpty(studentParticularsEntities.LeavingReason))
            {
                cmd.Parameters.AddWithValue("@LeavingReason", studentParticularsEntities.LeavingReason);
            }
            else
            {
                cmd.Parameters.AddWithValue("@LeavingReason", DBNull.Value);
            }

            if (!String.IsNullOrEmpty(studentParticularsEntities.Gender))
            {
                cmd.Parameters.AddWithValue("@Gender", studentParticularsEntities.Gender);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Gender", DBNull.Value);
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

        public StudentParticularsEntities GetStudentParticularsByID(int ID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpGetStudentParticularsByID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            StudentParticularsEntities studentParticularsEntities = new StudentParticularsEntities();
            studentParticularsEntities.ID = Convert.ToInt32(ds.Tables[0].Rows[0]["ID"].ToString());
            studentParticularsEntities.FirstName = Convert.ToString(ds.Tables[0].Rows[0]["FirstName"]);
            studentParticularsEntities.LastName = Convert.ToString(ds.Tables[0].Rows[0]["LastName"]);
            studentParticularsEntities.DOB = Convert.ToString(ds.Tables[0].Rows[0]["DOB"]);
            studentParticularsEntities.GradeID = Convert.ToInt32(ds.Tables[0].Rows[0]["GradeID"]);
            studentParticularsEntities.StartDate = Convert.ToString(ds.Tables[0].Rows[0]["StartDate"]);
            studentParticularsEntities.EndDate = Convert.ToString(ds.Tables[0].Rows[0]["EndDate"]);
            studentParticularsEntities.LeavingReason = Convert.ToString(ds.Tables[0].Rows[0]["LeavingReason"]);
            studentParticularsEntities.Gender = Convert.ToString(ds.Tables[0].Rows[0]["Gender"]);
            //studentParticularsEntities.GradeId = Convert.ToInt32(ds.Tables[0].Rows[0]["GradeId"].ToString());
            return studentParticularsEntities;
        }

        public List<StudentParticularsEntities> GetStudentParticularsPageWise(int pageIndex, ref int recordCount, int length)
        {
            List<StudentParticularsEntities> studentParticularsEntities = new List<StudentParticularsEntities>();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("stpGetStudentParticularsPageWise", con))
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
                        studentParticularsEntities.Add(new StudentParticularsEntities
                        {
                            ID = Convert.ToInt32(dr["ID"]),
                            StudentName = Convert.ToString(dr["StudentName"]),
                            DOB = Convert.ToString(dr["DOB"]),
                            Grade = Convert.ToString(dr["Grade"]),
                            Gender = Convert.ToString(dr["Gender"]),
                            Photo = Convert.ToString(dr["Photo"]),

                        });
                    }
                    recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                    con.Close();
                }
            }
            return studentParticularsEntities;
        }

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





        public List<StudentParticularsEntities> GetStudentSearchByNamePageWise(int pageIndex, ref int recordCount, int length, string searchval)
        {
            List<StudentParticularsEntities> sList = new List<StudentParticularsEntities>();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("stpGetStudentSearchByNamePageWise", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
                    cmd.Parameters.AddWithValue("@PageSize", length);
                    cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                    cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                    if (!string.IsNullOrEmpty(searchval))
                        cmd.Parameters.AddWithValue("@SearchValue", searchval);
                    else
                        cmd.Parameters.AddWithValue("@SearchValue", DBNull.Value);

                    con.Open();

                    DataSet ds = new DataSet();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                    //prodPOList = Common.CommonDAL.ConvertDataTable<ProductPOCO>(ds.Tables[0]);

                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        sList.Add(new StudentParticularsEntities
                        {
                            ID = Convert.ToInt32(dr["ID"]),
                            StudentName = Convert.ToString(dr["StudentName"]),
                            DOB = Convert.ToString(dr["DOB"]),
                            Grade = Convert.ToString(dr["Grade"]),
                            Gender = Convert.ToString(dr["Gender"])
                        });
                    }
                    recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                    con.Close();
                }
            }
            return sList;
        }
    }
}
