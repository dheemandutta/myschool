using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MySchool.BL;
using MySchool.Entities;

namespace MySchool.UI.Controllers
{
    public class TeacherController : Controller
    {
        // GET: TeacherParticular
        public ActionResult Index()
        {
            GetAllSubjectForDrp();
            return View();
        }

        public ActionResult SaveOrUpdate(TeacherEntities teachenetities)
        {
            TeacherBL teacherBl = new TeacherBL();
            int recordAffected = teacherBl.SaveOrUpdate(teachenetities);
            return Json(recordAffected, JsonRequestBehavior.AllowGet);
        }

        public void GetAllSubjectForDrp()
        {
            List<SubjectEntities> subjectList = new List<SubjectEntities>();
            SubjectBL subjectBl = new SubjectBL();
            subjectList = subjectBl.GetAllSubjectForDrp();
            ViewBag.getAllGradeForDrp = subjectList.Select(x =>
                new SelectListItem
                {
                    Text = x.SubjectName,
                    Value = x.ID.ToString()
                }
            );
        }
    }
}