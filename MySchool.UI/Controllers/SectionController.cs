using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using MySchool.BL;
using MySchool.Entities;
namespace MySchool.UI.Controllers
{
    public class SectionController : Controller
    {
        // GET: Section
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult SaveOrUpdate(SectionEntities section)
        {
            SectionBL sectionBl = new SectionBL();
            int recordAffected = sectionBl.SaveOrUpdate(section);
            return Json(recordAffected, JsonRequestBehavior.AllowGet);
        }

    }
}