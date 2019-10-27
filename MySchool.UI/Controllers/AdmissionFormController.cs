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
    public class AdmissionFormController : Controller
    {
        // GET: AdmissionForm
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(AdmissionFormEntities admissionForm)
        {
            AdmissionFormBL admissionBl = new AdmissionFormBL();
            admissionBl.SaveOrUpdate(admissionForm);
            return View();
        }

        public ActionResult AdmissionList()
        {
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

            AdmissionFormBL topicBL = new AdmissionFormBL();
            int totalrecords = 0;

            List<AdmissionFormEntities> topicEntities = new List<AdmissionFormEntities>();
            topicEntities = topicBL.GetAdmissionFormPageWise(pageIndex, ref totalrecords, length);

            var data = topicEntities;
            return Json(new { draw = draw, recordsFiltered = totalrecords, recordsTotal = totalrecords, data = data }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult SaveOrUpdate(AdmissionFormEntities admissionForm)
        {
            AdmissionFormBL admissionBl = new AdmissionFormBL();
            int recordAffected = admissionBl.SaveOrUpdate(admissionForm);
            return Json(recordAffected, JsonRequestBehavior.AllowGet);
        }

        public ActionResult UpdateSelectionForAdmissionStatus(int ID)
        {
            AdmissionFormBL admissionBl = new AdmissionFormBL();
            int recordAffected = admissionBl.UpdateSelectionForAdmissionStatus(ID);
            return Json(recordAffected, JsonRequestBehavior.AllowGet);
        }
    }
}