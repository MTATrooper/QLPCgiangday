using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using QLPCgiangday.DATA;

namespace QLPCgiangday.DAO
{
    class DAO_BOMON
    {
        Connection cn = new Connection();
        public List<DAL_BOMON> GetDSLOPHP()
        {
            DataTable dt = cn.LoadTable("Select * from BOMON");
            List<DAL_BOMON> DSBM = new List<DAL_BOMON>();
            foreach (DataRow dr in dt.Rows)
            {
                DAL_BOMON bm = new DAL_BOMON(dr);
                DSBM.Add(bm);
            }
            return DSBM;
        }
        public int Insert_BM(DAL_BOMON bm)
        {
            string[] para = new string[4] { "@ma", "@ten", "@sogv", "@macn" };
            object[] values = new object[4] { bm.MaBM, bm.TenBM, bm.Sogv, bm.MaCnBM };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("ThemBM", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Update_BM(DAL_BOMON bm)
        {
            string[] para = new string[4] { "@ma", "@ten", "@sogv", "@macn" };
            object[] values = new object[4] { bm.MaBM, bm.TenBM, bm.Sogv, bm.MaCnBM };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("SuaBM", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Delete_BM(DAL_BOMON bm)
        {
            string[] para = new string[1] { "@ma" };
            object[] values = new object[1] { bm.MaBM };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("XoaBM", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public DataTable SearchBM(string search, string col)
        {
            string[] para = new string[1] { "@ten" };
            object[] values = new object[1] { search };
            string query = "";
            DataTable dt = new DataTable();
            try
            {
                if (col == "MABM")
                {
                    query = "SearchBMma";
                }
                else if (col == "TENBM") query = "SearchBMten";
                dt = cn.FillDataTable(query, CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return dt;
        }
    }
}
