using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DapperMagazaWebsite.Models
{
    public class Admin
    {
        [Required]
        public string AdminName { get; set; }
        [Required]
        [DataType(DataType.Password)]
        public string AdminPassword { get; set; }
    }
}