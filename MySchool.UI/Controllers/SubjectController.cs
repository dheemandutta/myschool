using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MySchool.Entities;
using MySchool.BL;

namespace MySchool.UI.Controllers
{
    public class SubjectController : Controller
    {
        // GET: Subject
        public ActionResult Index()
        {
            GetAllGradeForDrp();
            return View();
        }

        public ActionResult SaveOrUpdate(SubjectEntities subjecttities)
        {
            SubjectBL subjectBl = new SubjectBL();
            int rowAffected = subjectBl.SaveOrUpdate(subjecttities);
            return Json(rowAffected, JsonRequestBehavior.AllowGet);
        }

        public void GetAllGradeForDrp()
        {
            List<GradeEntities> gradeList = new List<GradeEntities>();
            SectionBL sectionBl = new SectionBL();
            gradeList = sectionBl.GetAllGradeForDrp();
            ViewBag.getAllGradeForDrp = gradeList.Select(x =>
                new SelectListItem
                {
                    Text = x.Grade,
                    Value = x.ID.ToString()
                }
            );
        }

    }
}