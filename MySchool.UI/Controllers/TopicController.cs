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
    public class TopicController : Controller
    {
        // GET: Topic
        public ActionResult Index()
        {
            GetSubjectForDrp();
            return View();
        }


        public JsonResult Add(TopicEntities topicEntities)
        {
            TopicBL topicBL = new TopicBL();
            return Json(topicBL.SaveTopic(topicEntities), JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetTopicByID(int ID)
        {
            TopicBL topicBL = new TopicBL();
            return Json(topicBL.GetTopicByID(ID), JsonRequestBehavior.AllowGet);
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

            TopicBL topicBL = new TopicBL();
            int totalrecords = 0;

            List<TopicEntities> topicEntities = new List<TopicEntities>();
            topicEntities = topicBL.GetTopicPageWise(pageIndex, ref totalrecords, length);

            var data = topicEntities;
            return Json(new { draw = draw, recordsFiltered = totalrecords, recordsTotal = totalrecords, data = data }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult DeleteTopic(int ID)
        {
            TopicBL topicBL = new TopicBL();
            int recordaffected = topicBL.DeleteTopic(ID);
            return Json(recordaffected, JsonRequestBehavior.AllowGet);

        }

        //for Subject drp
        public void GetSubjectForDrp()
        {
            TopicBL topicBL = new TopicBL();
            List<TopicEntities> pocoList = new List<TopicEntities>();

            pocoList = topicBL.GetSubjectForDrp();

            List<TopicEntities> itmasterList = new List<TopicEntities>();

            foreach (TopicEntities up in pocoList)
            {
                TopicEntities unt = new TopicEntities();
                unt.ID = up.ID;
                unt.SubjectName = up.SubjectName;

                itmasterList.Add(unt);
            }

            ViewBag.SubjectForDrp = itmasterList.Select(x =>
                                            new SelectListItem()
                                            {
                                                Text = x.SubjectName,
                                                Value = x.ID.ToString()
                                            });

        }
    }
}