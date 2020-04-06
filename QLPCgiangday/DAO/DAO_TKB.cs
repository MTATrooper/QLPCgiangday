using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using QLPCgiangday.DATA;

namespace QLPCgiangday.DAO
{
    class DAO_TKB
    {
        Connection cn = new Connection();
        /*public List<DAL_TKB> GetDSTKB()
        {
            DataTable dt = cn.LoadTable("Select * from THOIKHOABIEU");
            List<DAL_TKB> DSTKB = new List<DAL_TKB>();
            foreach (DataRow dr in dt.Rows)
            {
                DAL_TKB lop = new DAL_TKB(dr);
                DSTKB.Add(lop);
            }
            return DSTKB;
        }*/
        public int Insert_TKB(DAL_TKB tkb)
        {
            string[] para = new string[5] { "@malop", "@thu", "@tuan", "@kip", "@tiet" };
            object[] values = new object[5] { tkb.MALOP, tkb.THU, tkb.TUAN, tkb.KIPHOC, tkb.TIET };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("ThemTKB", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Update_TKB(DAL_TKB tkb)
        {
            string[] para = new string[5] { "@malop", "@thu", "@tuan", "@kip", "@tiet" };
            object[] values = new object[5] { tkb.MALOP, tkb.THU, tkb.TUAN, tkb.KIPHOC, tkb.TIET };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("SuaTKB", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Delete_TKB(string bomon)
        {
            string[] para = new string[1] { "@tenbm" };
            object[] values = new object[1] { bomon };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("XoaTKB_BM", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
    }
}
