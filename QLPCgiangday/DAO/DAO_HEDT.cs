using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using QLPCgiangday.DATA;

namespace QLPCgiangday.DAO
{
    class DAO_HEDT
    {
        Connection cn = new Connection();
        public List<DAL_HEDT> GetDSHEDT()
        {
            DataTable dt = cn.LoadTable("Select * from HEDAOTAO");
            List<DAL_HEDT> DSHEDT = new List<DAL_HEDT>();
            foreach (DataRow dr in dt.Rows)
            {
                DAL_HEDT hh = new DAL_HEDT(dr);
                DSHEDT.Add(hh);
            }
            return DSHEDT;
        }
        public int Insert_HE(DAL_HEDT hh)
        {
            string[] para = new string[2] { "@ma", "@ten" };
            object[] values = new object[2] { hh.MAHE, hh.TENHE };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("ThemHE", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Update_HE(DAL_HEDT hp)
        {
            string[] para = new string[2] { "@ma", "@ten" };
            object[] values = new object[2] { hp.MAHE, hp.TENHE };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("SuaHE", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Delete_HE(DAL_HEDT hp)
        {
            string[] para = new string[1] { "@ma" };
            object[] values = new object[1] { hp.MAHE };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("XoaHE", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
    }
}
