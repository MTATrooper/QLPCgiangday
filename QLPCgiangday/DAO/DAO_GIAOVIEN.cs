using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QLPCgiangday.DATA;
using System.Data;

namespace QLPCgiangday.DAO
{
    class DAO_GIAOVIEN
    {
        Connection cn = new Connection();
        public List<DAL_GIAOVIEN> GetDSGV()
        {
            DataTable dt = cn.LoadTable("Select * from GIAOVIEN");
            List<DAL_GIAOVIEN> DSGV = new List<DAL_GIAOVIEN>();
            foreach (DataRow dr in dt.Rows)
            {
                DAL_GIAOVIEN gv = new DAL_GIAOVIEN(dr);
                DSGV.Add(gv);
            }
            return DSGV;
        }
        public int Insert_GV(DAL_GIAOVIEN gv)
        {
            string[] para = new string[6] { "@ma", "@ten", "@ngaysinh", "@sdt", "@diachi", "@mabm" };
            object[] values = new object[6] { gv.Magv, gv.Tengv, gv.Ngaysinh, gv.SDT, gv.Diachi, gv.MaBM };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("ThemGV", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Update_GV(DAL_GIAOVIEN gv)
        {
            string[] para = new string[6] { "@ma", "@ten", "@ngaysinh", "@sdt", "@diachi", "@mabm" };
            object[] values = new object[6] { gv.Magv, gv.Tengv, gv.Ngaysinh, gv.SDT, gv.Diachi, gv.MaBM };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("SuaGV", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Delete_GV(DAL_GIAOVIEN gv)
        {
            string[] para = new string[1] { "@ma" };
            object[] values = new object[1] { gv.Magv };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("XoaGV", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
    }
}
