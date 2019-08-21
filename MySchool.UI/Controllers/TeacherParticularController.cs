using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MySchool.BL;
using MySchool.Entities;

namespace MySchool.UI.Controllers
{
    public class TeacherParticularController : Controller
    {
        // GET: TeacherParticular
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult SaveOrUpdate(TeacherEntities teachenetities)
        {
            TeacherBL teacherBl = new TeacherBL();
            int recordAffected= teacherBl.SaveOrUpdate(teachenetities);
            return Json(recordAffected, JsonRequestBehavior.AllowGet);
        }
    }
}