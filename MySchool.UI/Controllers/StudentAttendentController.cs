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
    public class StudentAttendentController : Controller
    {
        // GET: StudentAttendent
        public ActionResult Index()
        {
            GetAllGradeForDrpNew();
            return View();
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

            StudentAttendentBL studentAttendentBL = new StudentAttendentBL();
            int totalrecords = 0;

            List<StudentAttendentEntities> studentAttendentEntities = new List<StudentAttendentEntities>();
            studentAttendentEntities = studentAttendentBL.GetStudentAttendentPageWise(pageIndex, ref totalrecords, length);

            var data = studentAttendentEntities;
            return Json(new { draw = draw, recordsFiltered = totalrecords, recordsTotal = totalrecords, data = data }, JsonRequestBehavior.AllowGet);
        }

        //for Grade drp
        public void GetAllGradeForDrp()
        {
            StudentAttendentBL studentAttendentBL = new StudentAttendentBL();
            List<GradeEntities> pocoList = new List<GradeEntities>();

            pocoList = studentAttendentBL.GetAllGradeForDrp();

            List<GradeEntities> itmasterList = new List<GradeEntities>();

            foreach (GradeEntities up in pocoList)
            {
                GradeEntities unt = new GradeEntities();
                unt.ID = up.ID;
                unt.Grade = up.Grade;

                itmasterList.Add(unt);
            }
            ViewBag.StudentAttendentMaster = itmasterList.Select(x =>
                                            new SelectListItem()
                                            {
                                                Text = x.Grade,
                                                Value = x.ID.ToString()
                                            });
        }





        //for Grade drp new
        public void GetAllGradeForDrpNew()
        {
            StudentAttendentBL studentAttendentBL = new StudentAttendentBL();
            List<GradeEntities> pocoList = new List<GradeEntities>();

            pocoList = studentAttendentBL.GetAllGradeForDrpNew();

            List<GradeEntities> itmasterList = new List<GradeEntities>();

            foreach (GradeEntities up in pocoList)
            {
                GradeEntities unt = new GradeEntities();
                unt.ID = up.ID;
                unt.Grade = up.Grade;

                itmasterList.Add(unt);
            }
            ViewBag.StudentAttendentMaster = itmasterList.Select(x =>
                                            new SelectListItem()
                                            {
                                                Text = x.Grade,
                                                Value = x.ID.ToString()
                                            });
        }

        //for SectionByGradeId drp new
        public JsonResult GetAllSectionByGradeIdForDrp_New(string ID)
        {
            StudentAttendentBL studentAttendentBL = new StudentAttendentBL();
            List<SectionEntities> pocoList = new List<SectionEntities>();

            pocoList = studentAttendentBL.GetAllSectionByGradeIdForDrp_New(ID);

            List<SectionEntities> itmasterList = new List<SectionEntities>();

            foreach (SectionEntities up in pocoList)
            {
                SectionEntities comp = new SectionEntities();
                comp.ID = up.ID;
                comp.Section = up.Section;

                itmasterList.Add(comp);
            }
            //ViewBag.StudentAttendentMaster = itmasterList.Select(x =>
            //                                new SelectListItem()
            //                                {
            //                                    Text = x.Section,
            //                                    Value = x.ID.ToString()
            //                                });
            var data = itmasterList;
            return Json(data, JsonRequestBehavior.AllowGet);
        }




        //for StudentBySectionID drp new
        public JsonResult stpGetAllStudentBySectionIdForDrp_New(string ID, string YearID)
        {
            StudentAttendentBL studentAttendentBL = new StudentAttendentBL();
            List<StudentEntities> pocoList = new List<StudentEntities>();

            pocoList = studentAttendentBL.stpGetAllStudentBySectionIdForDrp_New(ID, YearID);

            List<StudentEntities> itmasterList = new List<StudentEntities>();

            foreach (StudentEntities up in pocoList)
            {
                StudentEntities comp = new StudentEntities();
                comp.ID = up.ID;
                comp.StudentName = up.StudentName;

                itmasterList.Add(comp);
            }
            //ViewBag.StudentAttendentMaster = itmasterList.Select(x =>
            //                                new SelectListItem()
            //                                {
            //                                    Text = x.Section,
            //                                    Value = x.ID.ToString()
            //                                });
            var data = itmasterList;
            return Json(data, JsonRequestBehavior.AllowGet);
            //return Json(equipmentsBL.SaveEquipments(equipmentsPC, int.Parse(Session["VesselID"].ToString())), JsonRequestBehavior.AllowGet);
        }


    }
}