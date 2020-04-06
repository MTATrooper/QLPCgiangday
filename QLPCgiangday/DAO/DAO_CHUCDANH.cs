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
    class DAO_CHUCDANH
    {
        Connection cn = new Connection();
        public List<DAL_CHUCDANH> GetDSHOCHAM()
        {
            DataTable dt = cn.LoadTable("Select * from CHUCDANH");
            List<DAL_CHUCDANH> DSCHUCDANH = new List<DAL_CHUCDANH>();
            foreach (DataRow dr in dt.Rows)
            {
                DAL_CHUCDANH hh = new DAL_CHUCDANH(dr);
                DSCHUCDANH.Add(hh);
            }
            return DSCHUCDANH;
        }
        public int Insert_CD(DAL_CHUCDANH cd)
        {
            string[] para = new string[3] { "@ma", "@ten", "@dmgd" };
            object[] values = new object[3] { cd.MaCD, cd.TenCD, cd.Dmgd };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("ThemCD", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Update_CD(DAL_CHUCDANH cd)
        {
            string[] para = new string[3] { "@ma", "@ten", "@dmgd" };
            object[] values = new object[3] { cd.MaCD, cd.TenCD, cd.Dmgd };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("SuaCD", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Delete_CD(DAL_CHUCDANH cd)
        {
            string[] para = new string[1] { "@ma" };
            object[] values = new object[1] { cd.MaCD };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("XoaCD", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
    }
}
