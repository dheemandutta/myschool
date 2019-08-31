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
    public class StudentParticularsController : Controller
    {
        // GET: StudentParticularsg
        public ActionResult Index()
        {
            GetSectionForDrp();
            GetStudentForDrp();
            GetGradeForDrp();
            return View();
            //return View(new StudentParticularsEntities());
        }

        public JsonResult Add(StudentParticularsEntities studentParticularsEntities)
        {
            StudentParticularsBL studentParticularsBL = new StudentParticularsBL();
            return Json(studentParticularsBL.SaveStudentParticulars(studentParticularsEntities), JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetStudentParticularsByID(int ID)
        {
            StudentParticularsBL studentParticularsBL = new StudentParticularsBL();
            return Json(studentParticularsBL.GetStudentParticularsByID(ID), JsonRequestBehavior.AllowGet);
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

            StudentParticularsBL studentParticularsBL = new StudentParticularsBL();
            int totalrecords = 0;

            List<StudentParticularsEntities> studentParticularsEntities = new List<StudentParticularsEntities>();
            studentParticularsEntities = studentParticularsBL.GetStudentParticularsPageWise(pageIndex, ref totalrecords, length);

            var data = studentParticularsEntities;
            return Json(new { draw = draw, recordsFiltered = totalrecords, recordsTotal = totalrecords, data = data }, JsonRequestBehavior.AllowGet);
        }

        //for Catagory drp
        public void GetStudentForDrp()
        {
            StudentParticularsBL studentParticularsBL = new StudentParticularsBL();
            List<StudentParticularsEntities> pocoList = new List<StudentParticularsEntities>();

            pocoList = studentParticularsBL.GetStudentForDrp();

            List<StudentParticularsEntities> itmasterList = new List<StudentParticularsEntities>();

            foreach (StudentParticularsEntities up in pocoList)
            {
                StudentParticularsEntities unt = new StudentParticularsEntities();
                unt.StudentID = up.StudentID;
                unt.StudentName = up.StudentName;

                itmasterList.Add(unt);
            }

            ViewBag.StudentParticulars = itmasterList.Select(x =>
                                            new SelectListItem()
                                            {
                                                Text = x.StudentName,
                                                Value = x.StudentID.ToString()
                                            });

        }

        //for Grade drp
        public void GetGradeForDrp()
        {
            StudentParticularsBL studentParticularsBL = new StudentParticularsBL();
            List<StudentParticularsEntities> pocoList = new List<StudentParticularsEntities>();

            pocoList = studentParticularsBL.GetGradeForDrp();

            List<StudentParticularsEntities> itmasterList = new List<StudentParticularsEntities>();

            foreach (StudentParticularsEntities up in pocoList)
            {
                StudentParticularsEntities unt = new StudentParticularsEntities();
                unt.GradeID = up.GradeID;
                unt.Grade = up.Grade;

                itmasterList.Add(unt);
            }

            ViewBag.GradeForDrp = itmasterList.Select(x =>
                                            new SelectListItem()
                                            {
                                                Text = x.Grade,
                                                Value = x.GradeID.ToString()
                                            });

        }

        //for Section drp
        public void GetSectionForDrp()
        {
            StudentParticularsBL studentParticularsBL = new StudentParticularsBL();
            List<StudentParticularsEntities> pocoList = new List<StudentParticularsEntities>();

            pocoList = studentParticularsBL.GetSectionForDrp();

            List<StudentParticularsEntities> itmasterList = new List<StudentParticularsEntities>();

            foreach (StudentParticularsEntities up in pocoList)
            {
                StudentParticularsEntities unt = new StudentParticularsEntities();
                unt.SectionID = up.SectionID;
                unt.Section = up.Section;

                itmasterList.Add(unt);
            }

            ViewBag.SectionForDrp = itmasterList.Select(x =>
                                            new SelectListItem()
                                            {
                                                Text = x.Section,
                                                Value = x.SectionID.ToString()
                                            });

        }
    }
}