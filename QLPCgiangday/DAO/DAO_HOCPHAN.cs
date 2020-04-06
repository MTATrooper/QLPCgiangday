using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QLPCgiangday.DATA;
using System.Data;
using System.Data.SqlClient;

namespace QLPCgiangday.DAO
{
    class DAO_HOCPHAN
    {
        Connection cn = new Connection();
        public List<DAL_HOCPHAN> GetDSHOCPHAN()
        {
            DataTable dt = cn.LoadTable("Select * from HOCPHAN");
            List<DAL_HOCPHAN> DSHOCPHAN = new List<DAL_HOCPHAN>();
            foreach(DataRow dr  in dt.Rows)
            {
                DAL_HOCPHAN hp = new DAL_HOCPHAN(dr);
                DSHOCPHAN.Add(hp);
            }
            return DSHOCPHAN;
        }
        public int Insert_HP(DAL_HOCPHAN hp)
        {
            string[] para = new string[5] { "@ma", "@ten", "@sotc", "@sotiet", "@mamh" };
            object[] values = new object[5] { hp.MaHP, hp.TenHP, hp.SOTC, hp.SoTiet, hp.MaMH };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("ThemHP", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Update_HP(DAL_HOCPHAN hp)
        {
            string[] para = new string[5] { "@ma", "@ten", "@sotc", "@sotiet", "@mamh" };
            object[] values = new object[5] { hp.MaHP, hp.TenHP, hp.SOTC, hp.SoTiet, hp.MaMH };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("SuaHP", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Delete_HP(DAL_HOCPHAN hp)
        {
            string[] para = new string[1] { "@ma" };
            object[] values = new object[1] { hp.MaHP };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("XoaHP", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public DataTable SearchHP(string search, string col)
        {
            string[] para = new string[1] { "@ten" };
            object[] values = new object[1] { search };
            string query = "";
            DataTable dt = new DataTable();
            try
            {
                if (col == "MAHP")
                {
                    query = "SearchHPma";
                }
                else if (col == "TENHP") query = "SearchHPten";
                dt = cn.FillDataTable(query,CommandType.StoredProcedure,para,values);
            }
            catch
            { }
            return dt;
        }
    }
}
