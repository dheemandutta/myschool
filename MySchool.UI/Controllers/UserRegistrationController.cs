using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MySchool.Entities;
using MySchool.BL;

namespace MySchool.UI.Controllers
{
    public class UserRegistrationController : Controller
    {
        // GET: UserRegistration
        public ActionResult Index()
        {
            GetExamForDrp();
            return View();
        }

        public JsonResult Add(UserRegistrationEntities userRegistrationEntities)
        {
            UserRegistrationBL userRegistrationBL = new UserRegistrationBL();
            return Json(userRegistrationBL.SaveUser(userRegistrationEntities), JsonRequestBehavior.AllowGet);
        }

        //for GetExamForDrp drp
        public void GetExamForDrp()
        {
            ExamBL examBL = new ExamBL();
            List<ExamEntities> pocoList = new List<ExamEntities>();

            pocoList = examBL.GetExamForDrp();

            List<ExamEntities> itmasterList = new List<ExamEntities>();

            foreach (ExamEntities up in pocoList)
            {
                ExamEntities unt = new ExamEntities();
                unt.ExamID = up.ExamID;
                unt.ExamName = up.ExamName;

                itmasterList.Add(unt);
            }

            ViewBag.Exam = itmasterList.Select(x =>
                                            new SelectListItem()
                                            {
                                                Text = x.ExamName,
                                                Value = x.ExamID.ToString()
                                            });

        }
    }
}