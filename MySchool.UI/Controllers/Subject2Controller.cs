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
using Newtonsoft.Json;

namespace MySchool.UI.Controllers
{
    public class Subject2Controller : Controller
    {
        // GET: Subject2
        public ActionResult Index()
        {
            //GetSubjectForDrp();
            return View();
        }

        public JsonResult Add(SubjectEntities subjectEntities)
        {
            //SubjectEntities x = new SubjectEntities();

            //x = JsonConvert.DeserializeObject<SubjectEntities>(subjectEntities);

            Subject2BL subjectBL = new Subject2BL();
            return Json(subjectBL.SaveSubject(subjectEntities), JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetSubjectByID(int ID)
        {
            Subject2BL subjectBL = new Subject2BL();
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

            Subject2BL subjectBL = new Subject2BL();
            int totalrecords = 0;

            List<SubjectEntities> subjectEntities = new List<SubjectEntities>();
            subjectEntities = subjectBL.GetSubjectPageWise(pageIndex, ref totalrecords, length);

            var data = subjectEntities;
            return Json(new { draw = draw, recordsFiltered = totalrecords, recordsTotal = totalrecords, data = data }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult DeleteSubject(int ID)
        {
            Subject2BL subjectBL = new Subject2BL();
            int recordaffected = subjectBL.DeleteSubject(ID);
            return Json(recordaffected, JsonRequestBehavior.AllowGet);

        }

        ////for Subject drp
        //public void GetSubjectForDrp()
        //{
        //    Subject2BL subjectBL = new Subject2BL();
        //    List<SubjectEntities> pocoList = new List<SubjectEntities>();

        //    pocoList = subjectBL.GetSubjectForDrp();

        //    List<SubjectEntities> itmasterList = new List<SubjectEntities>();

        //    foreach (SubjectEntities up in pocoList)
        //    {
        //        SubjectEntities unt = new SubjectEntities();
        //        unt.ID = up.ID;
        //        unt.SubjectName = up.SubjectName;

        //        itmasterList.Add(unt);
        //    }

        //    ViewBag.SubjectForDrp = itmasterList.Select(x =>
        //                                    new SelectListItem()
        //                                    {
        //                                        Text = x.SubjectName,
        //                                        Value = x.ID.ToString()
        //                                    });

        //}
    }
}