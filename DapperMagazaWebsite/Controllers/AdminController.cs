using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Dapper;
using DapperMagazaWebsite.Models;

namespace DapperMagazaWebsite.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult AdminSignUp()
        {
            return View(DP.ReturnList<AdminModel>("AdminListele"));
        }
        [HttpGet]
        public ActionResult AdminEY(int id = 0)
        {
            if (id == 0)
                return View();
            else
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@AdminID", id);
                return View(DP.ReturnList<AdminModel>("AdminSirala", param).FirstOrDefault<AdminModel>());
            }


        }
        [HttpPost]
        public ActionResult AdminEY(AdminModel user)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@AdminID", user.AdminID);
            param.Add("@AdminName", user.AdminName);
            param.Add("@AdminPassword", user.AdminPassword);
            DP.EXReturn("AdminEY", param);
            return RedirectToAction("AdminEY");
        }

        public ActionResult ADelete(int id = 0)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@AdminID", id);
            DP.EXReturn("ASil", param);
            return RedirectToAction("AdminSignUp");
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


    }
}