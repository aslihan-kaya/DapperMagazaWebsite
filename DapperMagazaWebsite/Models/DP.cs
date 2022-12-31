using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dapper;
using System.Data;
using System.Data.SqlClient;


namespace DapperMagazaWebsite.Models
{
    public class DP
    {
        private static string connectionString =@"Server=MSI;Database=VintaShop;Integrated Security=true;";



        public static void EXReturn(string procadi, DynamicParameters param = null) //DynamicParameters param=null diyerek kaç tane parametre kullanacağım belli olmadığı zamanlarda kullanırım.

        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                con.Execute(procadi, param, commandType: CommandType.StoredProcedure);
            }
        }

        public static IEnumerable<T> ReturnList<T>//T bilinmeyendir
            (string procadi, DynamicParameters param = null)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                return con.Query<T>(procadi, param, commandType: CommandType.StoredProcedure);
                //Query sorgu yazmamız için Dapper ın içinde bulunan bir prosedür.
            }
        }
    }
}