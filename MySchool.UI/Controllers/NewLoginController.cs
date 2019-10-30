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
using System.Web.Security;

namespace MySchool.UI.Controllers
{
    public class NewLoginController : Controller
    {
        // GET: NewLogin
        public ActionResult Index()
        {
            return View();
        }
    }
}