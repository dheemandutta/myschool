using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MySchool.Entities;
using MySchool.BL;

namespace MySchool.UI.Controllers
{
    public class SectionController : Controller
    {
        // GET: Section
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Save(SectionEntities section)
        {
            SectionBL sectionBl = new SectionBL();
            int rowAffected = sectionBl.SaveOrUpdate(section);
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
                    Text=x.Grade,
                    Value=x.ID.ToString()
                }
            );
        }
    }
}