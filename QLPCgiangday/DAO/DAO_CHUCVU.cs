using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using QLPCgiangday.DATA;

namespace QLPCgiangday.DAO
{
    class DAO_CHUCVU
    {
        Connection cn = new Connection();
        public List<DAL_CHUCVU> GetDSCHUCVU()
        {
            DataTable dt = cn.LoadTable("Select * from CHUCVU");
            List<DAL_CHUCVU> DSCHUCVU = new List<DAL_CHUCVU>();
            foreach (DataRow dr in dt.Rows)
            {
                DAL_CHUCVU hh = new DAL_CHUCVU(dr);
                DSCHUCVU.Add(hh);
            }
            return DSCHUCVU;
        }
        public int Insert_CV(DAL_CHUCVU hh)
        {
            string[] para = new string[3] { "@ma", "@ten", "@hsgt" };
            object[] values = new object[3] { hh.MaCV, hh.TenCV, hh.Hesogiamtai };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("ThemCV", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Update_CV(DAL_CHUCVU hp)
        {
            string[] para = new string[3] { "@ma", "@ten", "@hsgt" };
            object[] values = new object[3] { hp.MaCV, hp.TenCV, hp.Hesogiamtai };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("SuaCV", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Delete_CV(DAL_CHUCVU hp)
        {
            string[] para = new string[1] { "@ma" };
            object[] values = new object[1] { hp.MaCV };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("XoaCV", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
    }
}
