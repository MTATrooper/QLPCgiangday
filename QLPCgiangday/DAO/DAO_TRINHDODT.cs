using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using QLPCgiangday.DATA;

namespace QLPCgiangday.DAO
{
    class DAO_TRINHDODT
    {
        Connection cn = new Connection();
        public List<DAL_TRINHDODT> GetDSTRINHDO()
        {
            DataTable dt = cn.LoadTable("Select * from TRINHDODT");
            List<DAL_TRINHDODT> DSTRINHDO = new List<DAL_TRINHDODT>();
            foreach (DataRow dr in dt.Rows)
            {
                DAL_TRINHDODT hh = new DAL_TRINHDODT(dr);
                DSTRINHDO.Add(hh);
            }
            return DSTRINHDO;
        }
        public int Insert_TD(DAL_TRINHDODT hh)
        {
            string[] para = new string[2] { "@ma", "@ten" };
            object[] values = new object[2] { hh.MATD, hh.TENTD };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("ThemTD", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Update_TD(DAL_TRINHDODT hp)
        {
            string[] para = new string[2] { "@ma", "@ten" };
            object[] values = new object[2] { hp.MATD, hp.TENTD };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("SuaTD", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Delete_TD(DAL_TRINHDODT hp)
        {
            string[] para = new string[1] { "@ma" };
            object[] values = new object[1] { hp.MATD };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("XoaTD", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
    }
}
