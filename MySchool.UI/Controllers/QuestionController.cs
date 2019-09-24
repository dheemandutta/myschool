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
using System.Configuration;

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

        public ActionResult test()
        {
            return View();
        }

        public ActionResult Exam()
        {
            return View();
        }


        public ActionResult StartTest()
        {
            // GettblSubjectForDrp();
            QuestionBL topicBL = new QuestionBL();
            int questionCount = int.Parse(ConfigurationManager.AppSettings["QuestionCount"].ToString());
            topicBL.GetQuestionPaper(questionCount,int.Parse(Session["UserId"].ToString()));
            return View();
        }

        [HttpPost]
        public ActionResult StartTest(QuestionEntities q)
        {
            // GettblSubjectForDrp();
            return RedirectToAction("Exam", "Question");
        }

        public ActionResult QuestionPaper()
        {
            ExamPaper examPaper = new ExamPaper();
            if (Session["QuestionPaper"] == null)
            {

                QuestionBL topicBL = new QuestionBL();
                // i = i + 1;
                int questionCount = int.Parse(ConfigurationManager.AppSettings["QuestionCount"].ToString());

                examPaper = topicBL.GetNextPrevQuestion(1,1, int.Parse(Session["UserId"].ToString()));
                examPaper.QuestionEntities = examPaper.QuestionEntities.OrderBy(o => o.Id).ToList();
                examPaper.QuestionEntities[0].IsShown = true;
                examPaper.QuestionEntities[0].HasAlreadyShown = true;
                examPaper.PageIndex = 1;
                examPaper.PageSize = 1;
                Session["QuestionPaper"] = examPaper;
            }
            else
            {
                examPaper = (ExamPaper)Session["QuestionPaper"];
            }


            return View(examPaper);

           // return View(examPaper);
        }

        [HttpPost]
        public ActionResult QuestionPaper(FormCollection collection, string command)
        {
            QuestionBL topicBL = new QuestionBL();

            //int questionCount = int.Parse(ConfigurationManager.AppSettings["QuestionCount"].ToString());
            ExamPaper examPaper = new ExamPaper();
            examPaper = (ExamPaper)Session["QuestionPaper"]; //topicBL.GetQuestionPaper(questionCount);
            examPaper.QuestionEntities = examPaper.QuestionEntities.OrderBy(o => o.Id).ToList();
            // int index = examPaper.QuestionEntities.FindIndex(item => item.IsShown);
            int rightAnswerIndex = 0; // examPaper.QuestionEntities[0].AnswerEntities.FindIndex(o => o.ID == int.Parse(collection.AllKeys[0]));

            foreach (AnswerEntities item in examPaper.QuestionEntities[0].AnswerEntities)
            {
                if(collection.AllKeys.Length == 2)
                if (item.ID == int.Parse(collection.AllKeys[0]))
                {
                    item.IsUserAnswer = 1;
                    topicBL.SaveUserAnswer(item.ID, item.IsUserAnswer); //save userdata
                    break;
                }
            }

            examPaper.QuestionEntities[0].IsShown = false;

            if(command == "Next")
            {
                if (examPaper.PageIndex < int.Parse(ConfigurationManager.AppSettings["QuestionCount"].ToString()))
                    examPaper.PageIndex += 1;
                   
            }
            else if(command == "Previous")
            {
                if (examPaper.PageIndex <= int.Parse(ConfigurationManager.AppSettings["QuestionCount"].ToString()) && examPaper.PageIndex > 1)
                    examPaper.PageIndex -= 1;
            }

            examPaper = topicBL.GetNextPrevQuestion(examPaper.PageIndex, examPaper.PageSize, int.Parse(Session["UserId"].ToString()));



            //Session.Abandon();
            Session["QuestionPaper"] = examPaper;

            return RedirectToAction("QuestionPaper", "Question");
        }

        public JsonResult GetFirstQuestion()
        {
            ExamPaper examPaper = new ExamPaper();
            QuestionBL topicBL = new QuestionBL();
            // i = i + 1;
            int questionCount = int.Parse(ConfigurationManager.AppSettings["QuestionCount"].ToString());

            //examPaper = topicBL.GetQuestionPaper(questionCount);
            examPaper.QuestionEntities = examPaper.QuestionEntities.OrderBy(o => o.Id).ToList();
            examPaper.QuestionEntities[0].IsShown = true;
            examPaper.QuestionEntities[0].HasAlreadyShown = true;
            Session["QuestionPaper"] = examPaper;

            return Json(examPaper, JsonRequestBehavior.AllowGet);
        }


    

        [HttpPost]
        public ActionResult GetQuestion(ExamPaper exam)
        {
            QuestionBL topicBL = new QuestionBL();
            
            //int questionCount = int.Parse(ConfigurationManager.AppSettings["QuestionCount"].ToString());
            ExamPaper examPaper = new ExamPaper();
            examPaper = (ExamPaper)Session["QuestionPaper"]; //topicBL.GetQuestionPaper(questionCount);
            examPaper.QuestionEntities = examPaper.QuestionEntities.OrderBy(o => o.Id).ToList();
            int index = examPaper.QuestionEntities.FindIndex(item => item.IsShown);
            examPaper.QuestionEntities[index].IsShown = false;

            if(index <= examPaper.QuestionEntities.Count-2)
            {
                examPaper.QuestionEntities[index+1].IsShown = true;
                examPaper.QuestionEntities[index+1].HasAlreadyShown = true;
            }
            else
            {
                examPaper.QuestionEntities[index].IsShown = true;
                examPaper.QuestionEntities[index].HasAlreadyShown = true;
            }


            //Session.Abandon();
            Session["QuestionPaper"] = examPaper;
         
            
            return RedirectToAction("QuestionPaper","Question");
        }

        [HttpPost]
        public ActionResult PrevQuestion(ExamPaper exam)
        {
            QuestionBL topicBL = new QuestionBL();

            //int questionCount = int.Parse(ConfigurationManager.AppSettings["QuestionCount"].ToString());
            ExamPaper examPaper = new ExamPaper();
            examPaper = (ExamPaper)Session["QuestionPaper"]; //topicBL.GetQuestionPaper(questionCount);
            examPaper.QuestionEntities = examPaper.QuestionEntities.OrderBy(o => o.Id).ToList();
            int index = examPaper.QuestionEntities.FindIndex(item => item.IsShown);
            examPaper.QuestionEntities[index].IsShown = false;

            if (index <= examPaper.QuestionEntities.Count-1 && index > 0)
            {
                examPaper.QuestionEntities[index - 1].IsShown = true;
                examPaper.QuestionEntities[index - 1].HasAlreadyShown = true;
            }

            if(index == 0)
            {
                examPaper.QuestionEntities[index].IsShown = true;
                examPaper.QuestionEntities[index].HasAlreadyShown = true;
            }

           // Session.Abandon();
            Session["QuestionPaper"] = examPaper;


            return RedirectToAction("QuestionPaper", "Question");
        }

        //[HttpPost]
        //public ActionResult Index(HttpPostedFileBase postedFile)
        //{
        //    if (postedFile != null)
        //    {
        //        string path = Server.MapPath("~/QuestionIMG/");
        //        if (!Directory.Exists(path))
        //        {
        //            Directory.CreateDirectory(path);
        //        }

        //        postedFile.SaveAs(path + Path.GetFileName(postedFile.FileName));
        //        ViewBag.Message = "File uploaded successfully.";
        //    }

        //    return View();
        //}

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

        public ActionResult DeleteQuestion(int ID, ref string recordCount)
        {
            QuestionBL topicBL = new QuestionBL();
            int recordaffected = topicBL.DeleteQuestion(ID, ref recordCount);
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



        public ActionResult SaveOrUpdate(QuestionViewEntities questionEntities)
        {
            QuestionBL teacherBl = new QuestionBL();
            int recordAffected = teacherBl.SaveOrUpdate(questionEntities);
            return Json(recordAffected, JsonRequestBehavior.AllowGet);
        }





        public JsonResult LoadDataForChild(int Id)
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

            List<ChoiceEntities> topicEntities = new List<ChoiceEntities>();
            topicEntities = topicBL.GetAnswerPageWise(Id,pageIndex, ref totalrecords, length);

            var data = topicEntities;
            return Json(new { draw = draw, recordsFiltered = totalrecords, recordsTotal = totalrecords, data = data }, JsonRequestBehavior.AllowGet);
        }


        public ActionResult GetAnswerByID(int ID)
        {
            QuestionBL topicBL = new QuestionBL();
            return Json(topicBL.GetAnswerByID(ID), JsonRequestBehavior.AllowGet);
        }



        //public ActionResult GetQuestionPaper()
        //{
        //    QuestionBL topicBL = new QuestionBL();
        //    int questionCount = int.Parse(ConfigurationManager.AppSettings["QuestionCount"].ToString());
        //    return Json(topicBL.GetQuestionPaper(questionCount), JsonRequestBehavior.AllowGet);
        //}


        //for GettblSubjectForDrp drp
        public void GettblSubjectForDrp()
        {
            QuestionBL topicBL = new QuestionBL();
            List<QuestionEntities> pocoList = new List<QuestionEntities>();

            pocoList = topicBL.GettblSubjectForDrp();

            List<QuestionEntities> itmasterList = new List<QuestionEntities>();

            foreach (QuestionEntities up in pocoList)
            {
                QuestionEntities unt = new QuestionEntities();
                unt.Id = up.Id;
                unt.SubjectName = up.SubjectName;

                itmasterList.Add(unt);
            }

            ViewBag.SubjectForDrp = itmasterList.Select(x =>
                                            new SelectListItem()
                                            {
                                                Text = x.SubjectName,
                                                Value = x.Id.ToString()
                                            });

        }



        //private int GetQuestionCount(int QuestionCount)
        //{
        //    QuestionBL topicBL = new QuestionBL();
        //    return topicBL.GetAllQuestion(QuestionCount);
        //}

        public JsonResult GetNextQuestion(string pageindex,string pagesize)
        {
            ExamPaper examPaper = new ExamPaper();
            QuestionBL topicBL = new QuestionBL();
         
            int questionCount = int.Parse(ConfigurationManager.AppSettings["QuestionCount"].ToString());

            examPaper = topicBL.GetNextPrevQuestion(1, 1, int.Parse(Session["UserId"].ToString()));
            examPaper.QuestionEntities = examPaper.QuestionEntities.OrderBy(o => o.Id).ToList();

            return Json(examPaper, JsonRequestBehavior.AllowGet);

        }

    }
}