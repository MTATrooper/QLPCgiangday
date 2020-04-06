using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using QLPCgiangday.DATA;
using System.Data.SqlClient;

namespace QLPCgiangday.DAO
{
    class DAO_KYHOC
    {
        Connection cn = new Connection();
        public List<DAL_KYHOC> GetDSKYHOC()
        {
            DataTable dt = cn.LoadTable("Select * from KYHOC");
            List<DAL_KYHOC> DSKYHOC = new List<DAL_KYHOC>();
            foreach (DataRow dr in dt.Rows)
            {
                DAL_KYHOC hh = new DAL_KYHOC(dr);
                DSKYHOC.Add(hh);
            }
            return DSKYHOC;
        }
        public int Insert_KH(DAL_KYHOC hh)
        {
            string[] para = new string[4] { "@magv", "@macd", "@macv", "@ten" };
            object[] values = new object[4] { hh.MAGV, hh.MAHH, hh.MACV, hh.TENKY };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("ThemKH", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Update_KH(DAL_KYHOC hh)
        {
            string[] para = new string[4] { "@magv", "@macd", "@macv", "@ten" };
            object[] values = new object[4] { hh.MAGV, hh.MAHH, hh.MACV, hh.TENKY };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("SuaKH", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Delete_KH(DAL_KYHOC hh)
        {
            string[] para = new string[3] { "@magv", "@macd", "@macv" };
            object[] values = new object[3] { hh.MAGV, hh.MAHH, hh.MACV };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("XoaKH", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Tong_HSGT(string magv)
        {
            SqlCommand cmd = new SqlCommand("Select dbo.Tong_HSGT(@magv) from GIAOVIEN", cn.Conn);
            cmd.Parameters.AddWithValue("@magv", magv);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return int.Parse(dt.Rows[0][0].ToString());
        }
    }
}
