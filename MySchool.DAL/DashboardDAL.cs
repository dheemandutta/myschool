using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySchool.Entities;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace MySchool.DAL
{
    public class DashboardDAL
    {
        public int SaveOrUpdateDashBoard(DashboardEntities dashboard)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings[""].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("stpInsertUpdateDashboard", con);
            cmd.CommandType = CommandType.StoredProcedure;
            if (String.IsNullOrEmpty(dashboard.id.ToString()) || (dashboard.id == 0))
            {
                cmd.Parameters.AddWithValue("@id", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@id", dashboard.id);
            }

            cmd.Parameters.AddWithValue("@subject", dashboard.subject);
            cmd.Parameters.AddWithValue("@description", dashboard.description);
            cmd.Parameters.AddWithValue("@releaseDate", dashboard.releaseDate);
            cmd.Parameters.AddWithValue("@expiryDate", dashboard.expiryDate);
            cmd.Parameters.AddWithValue("@importance", dashboard.importance);
            //cmd.Parameters.AddWithValue("@filepath", dashboard.filepath);

            int recordAffected = cmd.ExecuteNonQuery();
            con.Close();
            return recordAffected;
        }
    }
}
