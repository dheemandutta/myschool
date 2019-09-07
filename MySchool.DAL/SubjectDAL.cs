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
    public class SubjectDAL
    {
        public int SaveOrUpdate(SubjectEntities subject)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("@stpInsertUpdateSubject", con);
            cmd.CommandType = CommandType.StoredProcedure;

            if (String.IsNullOrEmpty(subject.ID.ToString()) || (subject.ID == 0))
            {
                cmd.Parameters.AddWithValue("@ID", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@ID", subject.ID);
            }

            cmd.Parameters.AddWithValue("@SubjectName", subject.SubjectName);
            cmd.Parameters.AddWithValue("@GradeID", subject.GradeID);
            int recordAffected = cmd.ExecuteNonQuery();
            con.Close();
            return recordAffected;
        }

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
    }
}
