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
    public class ExamController : Controller
    {
        // GET: Exam
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult LoadAllExamPageWise()
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

            ExamBL ExamBl = new ExamBL();
            int totalrecords = 0;

            List<ExamEntities> ExamList = new List<ExamEntities>();
            ExamList = ExamBl.GetAllExamPageWise(pageIndex, ref totalrecords, length);

            var data = ExamList;
            return Json(new { draw = draw, recordsFiltered = totalrecords, recordsTotal = totalrecords, data = data }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult SaveOrUpdate(ExamEntities Examentities)
        {
            ExamBL Exambl = new ExamBL();
            int recordAffected = Exambl.SaveOrUpdateExam(Examentities);
            return Json(recordAffected, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetExamByID(int ID)
        {
            ExamBL Exambl = new ExamBL();
            return Json(Exambl.GetExamByID(ID), JsonRequestBehavior.AllowGet);
        }

        public ActionResult DeleteExam(int ID)
        {
            ExamBL ExamBl = new ExamBL();
            int recordaffected = ExamBl.DeleteExam(ID);
            return Json(recordaffected, JsonRequestBehavior.AllowGet);

        }

    }
}