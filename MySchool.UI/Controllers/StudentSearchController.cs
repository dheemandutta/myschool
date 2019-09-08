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
    public class StudentSearchController : Controller
    {
        // GET: StudentSearch
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult LoadData(string searchvalue)
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

            List<StudentParticularsEntities> studentParticularsEntitiesList = new List<StudentParticularsEntities>();
            studentParticularsEntitiesList = studentParticularsBL.GetStudentSearchByNamePageWise(pageIndex, ref totalrecords, length, searchvalue);

            var data = studentParticularsEntitiesList;

            return Json(new { draw = draw, recordsFiltered = totalrecords, recordsTotal = totalrecords, data = data }, JsonRequestBehavior.AllowGet);
        }
    }
}