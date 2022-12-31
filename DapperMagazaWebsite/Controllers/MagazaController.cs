using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DapperMagazaWebsite.Models;
using Dapper;

namespace DapperMagazaWebsite.Controllers
{
    public class MagazaController : Controller
    {
        // GET: Magaza
        [Authorize]
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Index1()
        {
            return View();
        }

        public ActionResult SignUp()
        {
            return View(DP.ReturnList<UserModel>("UserListele"));
        }


        [HttpGet]
        public ActionResult EY(int id = 0)
        {
            if (id == 0)
                return View();
            else
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@UserID", id);
                return View(DP.ReturnList<UserModel>("UserSirala", param).FirstOrDefault<UserModel>());
            }


        }
        [HttpPost]
        public ActionResult EY(UserModel user)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@UserID", user.UserID);
            param.Add("@UserName", user.UserName);
            param.Add("@UPhone", user.UPhone);
            param.Add("@UMail", user.UMail);
            param.Add("@UPassword", user.UPassword);
            param.Add("@UAddress", user.UAddress);
            
            DP.EXReturn("UserEY", param);
            return RedirectToAction("EY");
        }

        public ActionResult Delete(int id = 0)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@UserID", id);
            DP.EXReturn("USil", param);
            return RedirectToAction("SignUp");
        }

        public ActionResult Category()
        {
            return View();
        }
        public ActionResult Blog()
        {
            return View();
        }

        public ActionResult AboutUs()
        {
            return View();
        }

        public ActionResult Contact()
        {
            return View();
        }



    }
}