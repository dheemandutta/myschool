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
    public class AdmissionFormController : Controller
    {
        // GET: AdmissionForm
        public ActionResult Index()
        {
            GetAllGradeForDrp();
            AdmissionFormEntities admissionFormEntities = new AdmissionFormEntities();            
            AdmissionFormBL admissionFormBL = new AdmissionFormBL();

            //admissionFormEntities = admissionFormBL.GetAdmissionOfMaxIdByID(Session[""].ToString());
            admissionFormEntities = admissionFormBL.GetAdmissionOfMaxIdByID(1.ToString());
            return View(admissionFormEntities);
        }

        [HttpPost]
        public ActionResult Index(AdmissionFormEntities admissionForm, HttpPostedFileBase fileUpload, HttpPostedFileBase fileUpload1, HttpPostedFileBase fileUpload2)
        {
            AdmissionFormBL admissionBl = new AdmissionFormBL();

            //upload images
            string FileName = Path.GetFileNameWithoutExtension(fileUpload.FileName);
            string FileName1 = Path.GetFileNameWithoutExtension(fileUpload1.FileName);
            string FileName2 = Path.GetFileNameWithoutExtension(fileUpload2.FileName);

            //To Get File Extension
            string FileExtension = Path.GetExtension(fileUpload.FileName);
            string FileExtension1 = Path.GetExtension(fileUpload.FileName);
            string FileExtension2 = Path.GetExtension(fileUpload.FileName);


            //Add applicant fullname + fathername + mothername To Attached File Name
            string applicantFullName = admissionForm.SFName + admissionForm.SLNAme;
            string applicantFatherName = admissionForm.FFName + admissionForm.FLName;
            string applicantMotherName = admissionForm.MFName + admissionForm.MLName;

           
            FileName = applicantFullName + "-" + applicantFatherName + "-"+ applicantMotherName  + FileName.Trim() + "-" + FileExtension;
            FileName1 = applicantFullName + "-" + applicantFatherName + "-" + applicantMotherName + FileName1.Trim() + "-" + FileExtension1;
            FileName2 = applicantFullName + "-" + applicantFatherName + "-" + applicantMotherName + FileName2.Trim() + "-" + FileExtension2;

            //Get Upload path from Web.Config file AppSettings.
            string UploadPath = ConfigurationManager.AppSettings["StudentImagePath"].ToString();

            //Its Create complete path to store in server.
            admissionForm.StudentImagePath = Server.MapPath(UploadPath) + "\\" + FileName;
            admissionForm.FatherImagePath = Server.MapPath(UploadPath) + "\\" + FileName1;
            admissionForm.MotherImagePath = Server.MapPath(UploadPath) + "\\" + FileName2;

            //To copy and save file into server.
            fileUpload.SaveAs(admissionForm.StudentImagePath);
            fileUpload1.SaveAs(admissionForm.FatherImagePath);
            fileUpload2.SaveAs(admissionForm.MotherImagePath);



            admissionBl.SaveOrUpdate(admissionForm);
            return View();
        }

        public ActionResult AdmissionList()
        {
            return View();
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

            AdmissionFormBL topicBL = new AdmissionFormBL();
            int totalrecords = 0;

            List<AdmissionFormEntities> topicEntities = new List<AdmissionFormEntities>();
            topicEntities = topicBL.GetAdmissionFormPageWise(pageIndex, ref totalrecords, length);

            var data = topicEntities;
            return Json(new { draw = draw, recordsFiltered = totalrecords, recordsTotal = totalrecords, data = data }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult SaveOrUpdate(AdmissionFormEntities admissionForm)
        {
            AdmissionFormBL admissionBl = new AdmissionFormBL();
            int recordAffected = admissionBl.SaveOrUpdate(admissionForm);
            return Json(recordAffected, JsonRequestBehavior.AllowGet);
        }

        public ActionResult UpdateSelectionForAdmissionStatus(int ID)
        {
            AdmissionFormBL admissionBl = new AdmissionFormBL();
            int recordAffected = admissionBl.UpdateSelectionForAdmissionStatus(ID);
            return Json(recordAffected, JsonRequestBehavior.AllowGet);
        }

        public bool ValidateFile(HttpPostedFileBase file)
        {
            switch (file.ContentType)
            {
                // Example: return valid = true for following file types:
                case ("image.gif"):
                case ("image/jpg"):
                case ("image/png"):
                    return true;

                // Otherwise if anything else, return false
                default: return false;
            }
        }

        public void GetAllGradeForDrp()
        {
            List<GradeEntities> gradeList = new List<GradeEntities>();
            SectionBL sectionBl = new SectionBL();
            gradeList = sectionBl.GetAllGradeForDrp();
            ViewBag.getAllGradeForDrp = gradeList.Select(x =>
                new SelectListItem()
                {
                    Text = x.Grade,
                    Value = x.ID.ToString()
                }
            );
        }

        public ActionResult GetAdmissionFormDetailsByID(int ID)
        {
            AdmissionFormBL admissionFormBl = new AdmissionFormBL();
            return Json(admissionFormBl.GetActualAdmissionByID(ID), JsonRequestBehavior.AllowGet);
        }
    }
}