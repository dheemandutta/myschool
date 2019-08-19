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
            GetAllGradeForDrp();
            return View();

        }

        public ActionResult SaveOrUpdate(SectionEntities sectionentities)
        {
            SectionBL sectionBl = new SectionBL();
            int rowAffected = sectionBl.SaveOrUpdate(sectionentities);
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

        public JsonResult LoadAllSectionPageWise()
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

            SectionBL sectionBl = new SectionBL();
            int totalrecords = 0;

            List<SectionEntities> sectionList = new List<SectionEntities>();
            sectionList = sectionBl.GetAllSectionPageWise(pageIndex, ref totalrecords, length);

            var data = sectionList;
            return Json(new { draw = draw, recordsFiltered = totalrecords, recordsTotal = totalrecords, data = data }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult DeleteSeciton(int ID)
        {
            SectionBL sectionBl = new SectionBL();
            int recordaffected = sectionBl.Delete(ID);
            return Json(recordaffected, JsonRequestBehavior.AllowGet);

        }

        public ActionResult GetSectionByID(int ID)
        {
            SectionBL sectionBl= new SectionBL();
            return Json(sectionBl.GetSectionByID(ID), JsonRequestBehavior.AllowGet);
        }
    }
}