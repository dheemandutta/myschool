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
    public class SubjectController : Controller
    {
        // GET: Subject
        public ActionResult Index()
        {
            //GetGradeForDrp();
            LoadData();
            return View();
        }

        public JsonResult Add(SubjectEntities subjectEntities)
        {
            SubjectBL subjectBL = new SubjectBL();
            return Json(subjectBL.SaveSubject(subjectEntities), JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetSubjectByID(int ID)
        {
            SubjectBL subjectBL = new SubjectBL();
            return Json(subjectBL.GetSubjectByID(ID), JsonRequestBehavior.AllowGet);
        }

        public JsonResult LoadData()
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

            SubjectBL subjectBL = new SubjectBL();
            int totalrecords = 0;

            List<SubjectEntities> subjectEntities = new List<SubjectEntities>();
            subjectEntities = subjectBL.GetSubjectPageWise(pageIndex, ref totalrecords, length);

            var data = subjectEntities;
            return Json(new { draw = draw, recordsFiltered = totalrecords, recordsTotal = totalrecords, data = data }, JsonRequestBehavior.AllowGet);
        }

        //for Grade drp
        //public void GetGradeForDrp()
        //{
        //    StudentParticularsBL studentParticularsBL = new StudentParticularsBL();
        //    List<StudentParticularsEntities> pocoList = new List<StudentParticularsEntities>();

        //    pocoList = studentParticularsBL.GetGradeForDrp();

        //    List<StudentParticularsEntities> itmasterList = new List<StudentParticularsEntities>();

        //    foreach (StudentParticularsEntities up in pocoList)
        //    {
        //        StudentParticularsEntities unt = new StudentParticularsEntities();
        //        unt.GradeID = up.GradeID;
        //        unt.Grade = up.Grade;

        //        itmasterList.Add(unt);
        //    }

        //    ViewBag.GradeForDrp = itmasterList.Select(x =>
        //                                    new SelectListItem()
        //                                    {
        //                                        Text = x.Grade,
        //                                        Value = x.GradeID.ToString()
        //                                    });

        //}

        public ActionResult DeleteSubject(int ID)
        {
            SubjectBL subjectBl = new SubjectBL();
            int recordAffected = subjectBl.DeleteSubject(ID);
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