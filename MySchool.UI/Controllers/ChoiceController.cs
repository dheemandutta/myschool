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
    public class ChoiceController : Controller
    {
        // GET: Choice
        public ActionResult Index()
        {
            GetQuestionForDrp();
            return View();
        }



        public JsonResult Add(ChoiceEntities choiceEntities)
        {
            ChoiceBL topicBL = new ChoiceBL();
            return Json(topicBL.SaveChoice(choiceEntities), JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetChoiceByID(int ID)
        {
            ChoiceBL topicBL = new ChoiceBL();
            return Json(topicBL.GetChoiceByID(ID), JsonRequestBehavior.AllowGet);
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

            ChoiceBL topicBL = new ChoiceBL();
            int totalrecords = 0;

            List<ChoiceEntities> topicEntities = new List<ChoiceEntities>();
            topicEntities = topicBL.GetChoicePageWise(pageIndex, ref totalrecords, length);

            var data = topicEntities;
            return Json(new { draw = draw, recordsFiltered = totalrecords, recordsTotal = totalrecords, data = data }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult DeleteChoice(int ID)
        {
            ChoiceBL topicBL = new ChoiceBL();
            int recordaffected = topicBL.DeleteChoice(ID);
            return Json(recordaffected, JsonRequestBehavior.AllowGet);

        }

        //for Question drp
        public void GetQuestionForDrp()
        {
            ChoiceBL topicBL = new ChoiceBL();
            List<ChoiceEntities> pocoList = new List<ChoiceEntities>();

            pocoList = topicBL.GetQuestionForDrp();

            List<ChoiceEntities> itmasterList = new List<ChoiceEntities>();

            foreach (ChoiceEntities up in pocoList)
            {
                ChoiceEntities unt = new ChoiceEntities();
                unt.ID = up.ID;
                unt.QuestionName = up.QuestionName;

                itmasterList.Add(unt);
            }

            ViewBag.QuestionForDrp = itmasterList.Select(x =>
                                            new SelectListItem()
                                            {
                                                Text = x.QuestionName,
                                                Value = x.ID.ToString()
                                            });

        }
    }
}