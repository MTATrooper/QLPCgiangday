using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QLPCgiangday.DATA;
using System.Data;

namespace QLPCgiangday.DAO
{
    class DAO_MONHOC
    {
        Connection cn = new Connection();
        public List<DAL_MONHOC> GetDSMH()
        {
            DataTable dt = cn.LoadTable("Select * from MONHOC");
            List<DAL_MONHOC> DSMH = new List<DAL_MONHOC>();
            foreach (DataRow dr in dt.Rows)
            {
                DAL_MONHOC mh = new DAL_MONHOC(dr);
                DSMH.Add(mh);
            }
            return DSMH;
        }
        public int Insert_MH(DAL_MONHOC mh)
        {
            string[] para = new string[3] { "@ma", "@ten", "@mabm" };
            object[] values = new object[3] { mh.MaMH, mh.TenMH, mh.MaBM };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("ThemMH", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Update_MH(DAL_MONHOC mh)
        {
            string[] para = new string[3] { "@ma", "@ten", "@mabm" };
            object[] values = new object[3] { mh.MaMH, mh.TenMH, mh.MaBM };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("SuaMH", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Delete_MH(DAL_MONHOC mh)
        {
            string[] para = new string[1] { "@ma" };
            object[] values = new object[1] { mh.MaMH };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("XoaMH", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
    }
}
