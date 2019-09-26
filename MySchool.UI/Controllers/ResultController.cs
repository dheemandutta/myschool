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
    public class ResultController : Controller
    {
        // GET: Result
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult MockTestResult()
        {
            //int x = int.Parse(Session["UserId"].ToString());
            List<QuestionAnswerEntities> exam = new List<QuestionAnswerEntities>();
            QuestionBL question =  new QuestionBL();
            exam = question.GetQuestionWithAnswerByUserID(int.Parse(Session["UserId"].ToString()));
            return View(exam);
        }

        public ActionResult RealExamResult()
        {
            ResultEntities realexam = new ResultEntities();
            QuestionBL question = new QuestionBL();
            realexam = question.GetRightAnswerByUserID(int.Parse(Session["UserId"].ToString()));
            return View(realexam);
        }
    }
}