using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MySchool.Entities;
using MySchool.BL;

namespace Accountant.UI.Controllers
{
    public class DashboardController : Controller
    {
        // GET: Dashboard
        public ActionResult Dashboard_v1()
        {
            return View();
        }
        public ActionResult Dashboard_v2()
        {
            return View();
        }
        public ActionResult Dashboard_v3()
        {
            return View();
        }
        public ActionResult Dashboard_h()
        {
            return View();
        }

        public ActionResult Index()
        {
           
            return View();
        }

        public JsonResult SaveOrUpdateDashBoard(DashboardEntities dashboard)
        {
            DashboardBL dashboardbl = new DashboardBL();
            return Json(dashboardbl.SaveOrUpdateDashboard(dashboard), JsonRequestBehavior.AllowGet);
        }
    }
}