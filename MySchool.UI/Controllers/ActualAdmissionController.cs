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
    public class ActualAdmissionController : Controller
    {
        // GET: ActualAdmission
        public ActionResult Index()
        {
            ActualAdmissionEntities actualAdmissionEntities = new ActualAdmissionEntities();
            AdmissionFormBL admissionFormBL = new AdmissionFormBL();
            actualAdmissionEntities = admissionFormBL.GetActualAdmissionByID(1);
            return View(actualAdmissionEntities);
        }

        public ActionResult GetActualAdmissionByID(int ID)
        {
            AdmissionFormBL admissionFormBL = new AdmissionFormBL();
            return Json(admissionFormBL.GetActualAdmissionByID(ID), JsonRequestBehavior.AllowGet);
        }
    }
}