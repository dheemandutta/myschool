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
    public class YearController : Controller
    {
        // GET: Year
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GetAllAcademicYear()
        {
            GetAllAcademicYearForDrp();
            return View();
        }

        public JsonResult Add(YearEntities yearEntities)
        {
            YearBL yearBL = new YearBL();
            return Json(yearBL.SaveYear(yearEntities), JsonRequestBehavior.AllowGet);
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

            YearBL yearBL = new YearBL();
            int totalrecords = 0;

            List<YearEntities> yearEntities = new List<YearEntities>();
            yearEntities = yearBL.GetYearPageWise(pageIndex, ref totalrecords, length);

            var data = yearEntities;
            return Json(new { draw = draw, recordsFiltered = totalrecords, recordsTotal = totalrecords, data = data }, JsonRequestBehavior.AllowGet);
        }

        public void GetAllAcademicYearForDrp()
        {
            YearBL yearbl = new YearBL();
            List<YearEntities> yearlist = new List<YearEntities>();
            yearlist = yearbl.GetAllYearForDrp();
            ViewBag.getAllYear = yearlist.Select(x =>
                  new SelectListItem
                  {
                      Text = x.YearDesc,
                      Value = x.ID.ToString()
                  }
            );
        }
    }
}