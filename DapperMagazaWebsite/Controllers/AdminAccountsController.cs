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
    public class AdminAccountsController : Controller
    {
        // GET: AdminAccounts
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult AdminLogin()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AdminLogin(Admin user)
        {
            using (VintaShopEntities1 db = new VintaShopEntities1())
            {
                var result = db.AdminInformations.Where(x => x.AdminName == user.AdminName && x.AdminPassword == user.AdminPassword);



                if (result.Count() != 0)
                {
                    FormsAuthentication.SetAuthCookie(user.AdminName, false);
                    return RedirectToAction("Index", "Magaza");
                }
                else
                {
                    TempData["msg"] = "hatalı";
                }
            }
            return View();

        }
        public ActionResult ALogout()
        {
            Session.Clear();
            FormsAuthentication.SignOut();
            return View("AdminLogin");
        }

    }
}