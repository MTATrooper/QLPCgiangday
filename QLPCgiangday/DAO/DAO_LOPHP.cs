using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using QLPCgiangday.DATA;

namespace QLPCgiangday.DAO
{
    class DAO_LOPHP
    {
        Connection cn = new Connection();
        public List<DAL_LOPHP> GetDSLOPHP()
        {
            DataTable dt = cn.LoadTable("Select * from LOPHOCPHAN");
            List<DAL_LOPHP> DSLOPHP = new List<DAL_LOPHP>();
            foreach (DataRow dr in dt.Rows)
            {
                DAL_LOPHP lop = new DAL_LOPHP(dr);
                DSLOPHP.Add(lop);
            }
            return DSLOPHP;
        }
        public int Insert_LOP(DAL_LOPHP lop)
        {
            string[] para = new string[7] { "@malop", "@ten", "@qs", "@ngonngu", "@mahp", "@matd", @"mahe" };
            object[] values = new object[7] { lop.MALOP, lop.TENLOP, lop.QUANSO, lop.NNGD, lop.MAHP, lop.MATD, lop.MAHEDT };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("Themlop", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Update_LOP(DAL_LOPHP lop)
        {
            string[] para = new string[7] { "@malop", "@ten", "@qs", "@ngonngu", "@mahp", "@matd", @"mahe" };
            object[] values = new object[7] { lop.MALOP, lop.TENLOP, lop.QUANSO, lop.NNGD, lop.MAHP, lop.MATD, lop.MAHEDT };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("Sualop", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Delete_LOP(DAL_LOPHP lop)
        {
            string[] para = new string[1] { "@malop" };
            object[] values = new object[1] { lop.MALOP };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("XoaLop", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public DataTable SearchLOP(string search, string col)
        {
            string[] para = new string[1] { "@ten" };
            object[] values = new object[1] { search };
            string query = "";
            DataTable dt = new DataTable();
            try
            {
                if (col == "MALOP")
                {
                    query = "SearchLOPma";
                }
                else if (col == "TENLOP") query = "SearchLOPten";
                dt = cn.FillDataTable(query, CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return dt;
        }
    }
}
