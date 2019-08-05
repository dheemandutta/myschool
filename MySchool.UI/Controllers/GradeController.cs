using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MySchool.BL;
using MySchool.Entities;
using System.Globalization;
using System.Web.Script.Serialization;
using System.IO;


//using CableMan.Models;



namespace MySchool.UI.Controllers
{
    public class GradeController : Controller
    {
        // GET: Grade
        public ActionResult Index()
        {
            GetGradeGroupAll();
            return View();
        }


        public void GetGradeGroupAll()
        {
            GradeBL gradebl = new GradeBL();
            List<GradeGroupEntities> gradeList = new List<GradeGroupEntities>();
            gradeList = gradebl.GetAllGradeGroup();
            ViewBag.getAllGradeGroup = gradeList.Select(x =>
                  new SelectListItem
                  {
                      Text = x.GradeGroup,
                      Value = x.ID.ToString()
                  }
            );
        }

        public ActionResult Save(GradeEntities grade)
        {
            GradeBL gradebl = new GradeBL();
            int recordAffected = gradebl.SaveGrade(grade);
            return Json(recordAffected, JsonRequestBehavior.AllowGet);
        }
    }
}