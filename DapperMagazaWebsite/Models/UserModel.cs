using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DapperMagazaWebsite.Models
{
    public class UserModel
    {
        public int UserID { get; set; }
        public string UserName { get; set; }
        public string UPhone { get; set; }
        public string UMail { get; set; }
        public string UPassword { get; set; }
        public string UAddress { get; set; }
       
    }
}