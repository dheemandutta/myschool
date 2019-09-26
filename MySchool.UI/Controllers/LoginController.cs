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
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            ViewData["SubTitle"] = "";
            ViewData["Message"] = "";

            return View();
        }

        public ActionResult Logout()
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Login");
        }

        public bool AuthenticateUser(string userName, string password)
        {
            UserRegistrationBL userBl = new UserRegistrationBL();
            UserRegistrationEntities loggedinUser = new UserRegistrationEntities();

            loggedinUser = userBl.ValidateUser(userName, password);

            if (loggedinUser.ID > 0)
            {

                FormsAuthentication.SetAuthCookie(loggedinUser.FirstName,false);
                


                System.Web.HttpContext.Current.Session["UserName"] = loggedinUser.UserName;
                System.Web.HttpContext.Current.Session["RoleId"] = loggedinUser.RoleId;
                System.Web.HttpContext.Current.Session["Name"] = loggedinUser.FirstName +' '+ loggedinUser.LastName;
                System.Web.HttpContext.Current.Session["UserId"] = loggedinUser.ID;
                return true;
            }
            else
            {
                return false;
            }

        }

        [HttpPost]
        public ActionResult Index(UserRegistrationEntities loginViewModelEntities)
        {
            ViewData["SubTitle"] = "";
            ViewData["Message"] = "";

            bool isAuthenticated = AuthenticateUser(loginViewModelEntities.UserName, loginViewModelEntities.Password);
            loginViewModelEntities.IsAuthenticated = isAuthenticated;

            if (isAuthenticated)
            {
                FormsAuthentication.SetAuthCookie(loginViewModelEntities.UserName, false);

                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewData["Message"] = "Invalid Login/Password";

            }

            return View(loginViewModelEntities);
        }
    }
}