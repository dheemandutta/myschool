using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySchool.Entities;
using MySchool.DAL;
namespace MySchool.BL
{
    public class DashboardBL
    {
        public int SaveOrUpdateDashboard(DashboardEntities dashboard)
        {
            DashboardDAL dashboardDal = new DashboardDAL();
            return dashboardDal.SaveOrUpdateDashBoard(dashboard);
        }
    }
}
