using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QLPCgiangday.DATA;
using System.Data;
using System.Windows.Forms;

namespace QLPCgiangday.DAO
{
    class DAO_PHANCONG
    {
        Connection cn = new Connection();
        public List<DAL_PHANCONG> GetDSPC()
        {
            DataTable dt = cn.LoadTable("Select * from PHANCONG");
            List<DAL_PHANCONG> DSPC = new List<DAL_PHANCONG>();
            foreach (DataRow dr in dt.Rows)
            {
                DAL_PHANCONG bm = new DAL_PHANCONG(dr);
                DSPC.Add(bm);
            }
            return DSPC;
        }
        public int Insert_PC(DAL_PHANCONG pc)
        {
            string[] para = new string[8] { "@malop", "@magv1", "@magv2", "@kip", "@diadiem", "@sotiet", "@ky", "@nam" };
            object[] values = new object[8] { pc.MALOP, pc.MAGV1, pc.MAGV2, pc.KIPHOC, pc.DIADIEM, pc.Sotiet, pc.Kyhoc, pc.Namhoc };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("ThemPC", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Update_PC(DAL_PHANCONG pc)
        {
            string[] para = new string[8] { "@malop", "@magv1", "@magv2", "@kip", "@diadiem", "@sotiet", "@ky", "@nam" };
            object[] values = new object[8] { pc.MALOP, pc.MAGV1, pc.MAGV2, pc.KIPHOC, pc.DIADIEM, pc.Sotiet, pc.Kyhoc, pc.Namhoc };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("SuaPC", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Delete_PC(DAL_PHANCONG pc)
        {
            string[] para = new string[1] { "@malop" };
            object[] values = new object[1] { pc.MALOP };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("XoaPC", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        public int Delete_PC(string tenbm)
        {
            string[] para = new string[1] { "@tenbm" };
            object[] values = new object[1] { tenbm };
            int check = 0;
            try
            {
                check = cn.Excute_Sql("XoaPC_BM", CommandType.StoredProcedure, para, values);
            }
            catch
            { }
            return check;
        }
        /*public void Update(DevExpress.XtraGrid.Views.Grid.GridView gridView)
        {
            DAL_PHANCONG pc;
            for(int i = 8; i< gridView.RowCount; i++)
            {
                if (gridView.GetRowCellValue(i,"F2").ToString() != "")
                {
                    string 
                    pc = new DAL_PHANCONG(row);
                    try
                    {
                        int check2 = DAO_PC.Insert_PC(pc);
                        if (check2 == 0)
                        {
                            MessageBox.Show("Không thêm được " + row["Lớp"].ToString());
                            dem++;
                        }
                    }
                    catch
                    {
                        MessageBox.Show("Lỗi cập nhật " + row["Lớp"].ToString());
                        dem++;
                    }
                }
            }
        }*/
    }
}
