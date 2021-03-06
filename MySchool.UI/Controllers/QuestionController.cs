﻿using System;
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
        
        public ActionResult Exam(string id)
        {
            ExamPaper exam = new ExamPaper();
            exam.ExamType = id;
            Session["ExamType"] = id;
            return View(exam);
        }

        public ActionResult OnlineTest(string id)
        {
            ExamPaper exam = new ExamPaper();
            exam.ExamType = id;
            Session["ExamType"] = id;
            
            if (TempData["exampaper"] != null)
            {
                exam = (ExamPaper)TempData["exampaper"];
                TempData["exampaper"] = exam;
            }
            else
            {
                exam = GetQuestion("1", "1", null, null,"60");
                TempData["exampaper"] = exam;
            }

            return View(exam);
        }


        public ActionResult StartTest()
        {
            // GettblSubjectForDrp();
            QuestionBL topicBL = new QuestionBL();
            tblConfigBL configBL = new tblConfigBL();
            int questionCount = int.Parse(ConfigurationManager.AppSettings["QuestionCount"].ToString());

            questionCount = int.Parse( configBL.GettblConfigByKeyName("QuestionCount").ConfigValue);

            topicBL.GetQuestionPaper(questionCount,int.Parse(Session["UserId"].ToString()));
            return View();
        }

        [HttpPost]
        public ActionResult StartTest(FormCollection q)
        {
            // Actual
            //return RedirectToAction("Exam", "Question", new { id = q[0].ToString() });
            //POC
            return RedirectToAction("OnlineTest", "Question", new { id = q[0].ToString() });
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
                    //topicBL.SaveUserAnswer(item.ID, item.IsUserAnswer, int.Parse(Session["UserId"].ToString())); //save userdata
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

        //public JsonResult GetNextQuestion(string pageindex,string pagesize, string radioValue,string quesId)
        //{
        //    ExamPaper examPaper = new ExamPaper();
        //    QuestionBL topicBL = new QuestionBL();
        //    if (radioValue != null)
        //    {
        //        if(! String.IsNullOrEmpty(quesId))
        //            if(int.Parse(quesId) > 0 && !String.IsNullOrEmpty(radioValue))
        //        topicBL.SaveUserAnswer(int.Parse(radioValue), int.Parse(quesId), int.Parse(Session["UserId"].ToString()));
        //    }

        //    int questionCount = int.Parse(ConfigurationManager.AppSettings["QuestionCount"].ToString());

        //    examPaper = topicBL.GetNextPrevQuestion(int.Parse(pageindex), int.Parse(pagesize), int.Parse(Session["UserId"].ToString()));
        //    examPaper.QuestionEntities = examPaper.QuestionEntities.OrderBy(o => o.Id).ToList();

        //    return Json(examPaper, JsonRequestBehavior.AllowGet);

        //}

        public ExamPaper GetQuestion(string pageindex, string pagesize, string radioValue, string quesId,string currentTime)
        {
            ExamPaper examPaper = new ExamPaper();
            QuestionBL topicBL = new QuestionBL();

            if (radioValue != null && radioValue != String.Empty)
            {
                if (!String.IsNullOrEmpty(quesId))
                    if (int.Parse(quesId) > 0 && !String.IsNullOrEmpty(radioValue))
                        topicBL.SaveUserAnswer(int.Parse(radioValue), int.Parse(quesId), int.Parse(Session["UserId"].ToString()),currentTime);
            }
            else
            {
                ExamBL examBL = new ExamBL();
                examBL.UpdateExamTime(int.Parse(Session["UserId"].ToString()), currentTime);
            }

            int questionCount = int.Parse(ConfigurationManager.AppSettings["QuestionCount"].ToString());

            examPaper = topicBL.GetNextPrevQuestion(int.Parse(pageindex), int.Parse(pagesize), int.Parse(Session["UserId"].ToString()));
            examPaper.QuestionEntities = examPaper.QuestionEntities.OrderBy(o => o.Id).ToList();


            return examPaper;
        }


        [HttpPost]
        [MultipleButton(Name = "action", Argument = "Next")]
        public ActionResult Next(ExamPaper mm) 
        {
            ExamPaper exam = new ExamPaper();

            if (TempData["exampaper"] != null)
            {
                exam = (ExamPaper)TempData["exampaper"];
            }
            exam.PageSize = 1;
            if (mm.UserAnswer != null)
                exam.UserAnswer = mm.UserAnswer;
            else
                exam.UserAnswer = String.Empty;
            if (exam.PageIndex > 0) exam.PageIndex = exam.PageIndex + 1;
            ExamPaper examPaper = GetQuestion(exam.PageIndex.ToString(), exam.PageSize.ToString(),exam.UserAnswer.ToString(), exam.QuestionEntities[0].Id.ToString(),mm.CurrentTime);
            TempData["exampaper"] = examPaper;
            return RedirectToAction("OnlineTest", "Question", new { id = "RealTest" });
        }

        [HttpPost]
        [MultipleButton(Name = "action", Argument = "Previous")]
        public ActionResult Previous(ExamPaper mm)
        {

            ExamPaper exam = new ExamPaper();

            if (TempData["exampaper"] != null)
            {
                exam = (ExamPaper)TempData["exampaper"];
            }
            exam.PageSize = 1;
            if (mm.UserAnswer != null)
                exam.UserAnswer = mm.UserAnswer;
            else
                exam.UserAnswer = String.Empty;
            if (exam.PageIndex > 0) exam.PageIndex = exam.PageIndex - 1;
            ExamPaper examPaper = GetQuestion(exam.PageIndex.ToString(), exam.PageSize.ToString(), exam.UserAnswer.ToString(), exam.QuestionEntities[0].Id.ToString(),mm.CurrentTime);
            TempData["exampaper"] = examPaper;

            return RedirectToAction("OnlineTest", "Question", new { id = "RealTest" });
        }

        [HttpPost]
        [MultipleButton(Name = "action", Argument = "Result")]
        public ActionResult ExamResult()
        {
            string examType = Session["ExamType"].ToString();

            if(examType == "MockTest")
            return RedirectToAction("MockTestResult", "Result");
            else
                return RedirectToAction("RealExamResult", "Result");

        }





        public JsonResult GettblConfigByExamTime()
        {
            ExamBL examBL = new ExamBL(); 
            var data = examBL.GettblConfigByExamTime(Session["UserId"].ToString());
            return Json(data, JsonRequestBehavior.AllowGet);
        }
    }
}