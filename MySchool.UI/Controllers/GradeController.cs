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

        public JsonResult LoadAllGradePageWise()
        {
            int draw, start, length;
            int pageIndex = 0;

            if (null != Request.Form.GetValues("draw"))
            {
                draw = int.Parse(Request.Form.GetValues("draw").FirstOrDefault().ToString());
                start = int.Parse(Request.Form.GetValues("start").FirstOrDefault().ToString());
                length = int.Parse(Request.Form.GetValues("length").FirstOrDefault().ToString());
            }
            else
            {
                draw = 1;
                start = 0;
                length = 50;
            }

            if (start == 0)
            {
                pageIndex = 1;
            }
            else
            {
                pageIndex = (start / length) + 1;
            }

            GradeBL gradeBl = new GradeBL();
            int totalrecords = 0;

            List<GradeEntities> gradeList = new List<GradeEntities>();
            gradeList = gradeBl.GetAllGradePageWise(pageIndex, ref totalrecords, length);

            var data = gradeList;
            return Json(new { draw = draw, recordsFiltered = totalrecords, recordsTotal = totalrecords, data = data }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Save(GradeEntities gradeentities)
        {
            GradeBL gradebl = new GradeBL();
            int recordAffected = gradebl.SaveGrade(gradeentities);
            return Json(recordAffected, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetGradeAllPageWise()
        {
            int draw, start, length;
            int pageIndex = 0;

            if (null != Request.Form.GetValues("draw"))
            {
                draw = int.Parse(Request.Form.GetValues("draw").FirstOrDefault().ToString());
                start = int.Parse(Request.Form.GetValues("start").FirstOrDefault().ToString());
                length = int.Parse(Request.Form.GetValues("length").FirstOrDefault().ToString());
            }
            else
            {
                draw = 1;
                start = 0;
                length = 50;
            }

            if (start == 0)
            {
                pageIndex = 1;
            }
            else
            {
                pageIndex = (start / length) + 1;
            }

            GradeBL gradeBl = new GradeBL();
            int totalrecords = 0;

            List<GradeEntities> gradeList = new List<GradeEntities>();
            gradeList = gradeBl.GetAllGradePageWise(pageIndex, ref totalrecords, length);

            var data = gradeList;
            return Json(new { draw = draw, recordsFiltered = totalrecords, recordsTotal = totalrecords, data = data }, JsonRequestBehavior.AllowGet);
        }
    }
}