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
    public class tblConfigController : Controller
    {
        // GET: tblConfig
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult Add(tblConfigEntities configEntities)
        {
            tblConfigBL topicBL = new tblConfigBL();
            return Json(topicBL.SavetblConfig(configEntities), JsonRequestBehavior.AllowGet);
        }

        public ActionResult GettblConfigByKeyName(int ID/*string KeyName*/)
        {
            tblConfigBL topicBL = new tblConfigBL();
            return Json(topicBL.GettblConfigByKeyName(ID), JsonRequestBehavior.AllowGet);
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

            tblConfigBL topicBL = new tblConfigBL();
            int totalrecords = 0;

            List<tblConfigEntities> topicEntities = new List<tblConfigEntities>();
            topicEntities = topicBL.GettblConfigPageWise(pageIndex, ref totalrecords, length);

            var data = topicEntities;
            return Json(new { draw = draw, recordsFiltered = totalrecords, recordsTotal = totalrecords, data = data }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult DeletetblConfig(string KeyName)
        {
            tblConfigBL topicBL = new tblConfigBL();
            int recordaffected = topicBL.DeletetblConfig(KeyName);
            return Json(recordaffected, JsonRequestBehavior.AllowGet);

        }
    }
}