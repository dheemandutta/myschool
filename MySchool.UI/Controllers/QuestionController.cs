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
    public class QuestionController : Controller
    {
        // GET: Question
        public ActionResult Index()
        {
            GetTopicForDrp();
            return View();
        }

        [HttpPost]
        public ActionResult Index(HttpPostedFileBase postedFile)
        {
            if (postedFile != null)
            {
                string path = Server.MapPath("~/QuestionIMG/");
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }

                postedFile.SaveAs(path + Path.GetFileName(postedFile.FileName));
                ViewBag.Message = "File uploaded successfully.";
            }

            return View();
        }

        public JsonResult Add(QuestionEntities questionEntities)
        {
            QuestionBL topicBL = new QuestionBL();
            return Json(topicBL.SaveQuestion(questionEntities), JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetQuestionByID(int ID)
        {
            QuestionBL topicBL = new QuestionBL();
            return Json(topicBL.GetQuestionByID(ID), JsonRequestBehavior.AllowGet);
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

            QuestionBL topicBL = new QuestionBL();
            int totalrecords = 0;

            List<QuestionEntities> topicEntities = new List<QuestionEntities>();
            topicEntities = topicBL.GetQuestionPageWise(pageIndex, ref totalrecords, length);

            var data = topicEntities;
            return Json(new { draw = draw, recordsFiltered = totalrecords, recordsTotal = totalrecords, data = data }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult DeleteQuestion(int ID)
        {
            QuestionBL topicBL = new QuestionBL();
            int recordaffected = topicBL.DeleteQuestion(ID);
            return Json(recordaffected, JsonRequestBehavior.AllowGet);

        }

        //for Topic drp
        public void GetTopicForDrp()
        {
            QuestionBL topicBL = new QuestionBL();
            List<QuestionEntities> pocoList = new List<QuestionEntities>();

            pocoList = topicBL.GetTopicForDrp();

            List<QuestionEntities> itmasterList = new List<QuestionEntities>();

            foreach (QuestionEntities up in pocoList)
            {
                QuestionEntities unt = new QuestionEntities();
                unt.Id = up.Id;
                unt.TopicName = up.TopicName;

                itmasterList.Add(unt);
            }

            ViewBag.TopicForDrp = itmasterList.Select(x =>
                                            new SelectListItem()
                                            {
                                                Text = x.TopicName,
                                                Value = x.Id.ToString()
                                            });

        }
    }
}