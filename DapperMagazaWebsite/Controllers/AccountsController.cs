using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using DapperMagazaWebsite.Models;
using Microsoft.SqlServer.Server;

namespace DapperMagazaWebsite.Controllers
{

    [AllowAnonymous]
    public class AccountsController : Controller
    {
        // GET: Accounts
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(User user)
        {
            using (VintaShopEntities1 db = new VintaShopEntities1())
            {
                var result = db.UserInformations.Where(x => x.UserName == user.UserName && x.UPassword == user.UPassword);



                if (result.Count() != 0)
                {
                    FormsAuthentication.SetAuthCookie(user.UserName, false);
                    return RedirectToAction("Index", "Magaza");
                }
                else
                {
                    TempData["msg"] = "hatalı";
                }
            }
            return View();

        }
        public ActionResult Logout()
        {
            Session.Clear();
            FormsAuthentication.SignOut();
            return View("Login");
        }




       

    }
}

      

        