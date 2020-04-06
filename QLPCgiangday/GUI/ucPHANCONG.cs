using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using QLPCgiangday.DAO;
using QLPCgiangday.DATA;
using DevExpress.XtraEditors.Repository;

namespace QLPCgiangday.GUI
{
    public partial class ucPHANCONG : DevExpress.XtraEditors.XtraUserControl
    {
        private Connection cn = new Connection();
        private ConnectionExcell cne = new ConnectionExcell();
        private string bomon = "";
        private string namebm = "";
        private DAO_PHANCONG DAO_PC = new DAO_PHANCONG();
        private int pq = 0;
        public ucPHANCONG(int pq)
        {
            InitializeComponent();
            this.pq = pq;
            if (pq == 0 || bomon == "") btnExport.Enabled = false;
        }
        private string GetMABM(string bomon)
        {
            DataTable dt = cn.LoadTable("Select MABM from BOMON where TENBM = N'" + bomon + "'");
            if (dt.Rows.Count > 0) return dt.Rows[0][0].ToString();
            else return "";
        }
        private void Display_sotietday()
        {
            string ky = dataPC.GetRowCellValue(2, "BẢNG PHÂN CÔNG GIẢNG DẠY").ToString();
            string nam = dataPC.GetRowCellValue(2, "F6").ToString();
            string query = string.Format("select * from dbo.THEODOIGD('{0}',N'{1}',N'{2}')", GetMABM(bomon), ky, nam);
            gridSOTIETDAY.DataSource = cn.LoadTable(query);
            RepositoryItemLookUpEdit rigv = new RepositoryItemLookUpEdit();
            rigv.DataSource = cn.LoadTable("select MAGV, TENGV from GIAOVIEN");
            rigv.ValueMember = "MAGV";
            rigv.DisplayMember = "TENGV";
            dataSOTIETDAY.Columns["MAGV"].ColumnEdit = rigv;
        }
        private void btnCNM_Click(object sender, EventArgs e)
        {
            if(txtLink.Text == "")
            {
                MessageBox.Show("Bạn chưa chọn đường dẫn", "Thông báo!");
                return;
            }
            bomon = "Công nghệ mạng"; namebm = "CNM";
            lbBM.Text = "Bộ môn " + btnCNM.Text;
            gridPC.DataSource = cne.ImportExcel(txtLink.Text, "BM_73");
            gridSOTIETDAY.DataSource = null;
            if (pq == 1 && bomon != "") btnExport.Enabled = true;
            Display_sotietday();
        }

        private void btnATTT_Click(object sender, EventArgs e)
        {
            if (txtLink.Text == "")
            {
                MessageBox.Show("Bạn chưa chọn đường dẫn", "Thông báo!");
                return;
            }
            bomon = "An toàn thông tin"; namebm = "ATTT";
            lbBM.Text = "Bộ môn " + btnATTT.Text;
            gridPC.DataSource = cne.ImportExcel(txtLink.Text, "BM_80");
            gridSOTIETDAY.DataSource = null;
            if (pq == 1 && bomon != "") btnExport.Enabled = true;
            Display_sotietday();
        }

        private void btnCNPM_Click(object sender, EventArgs e)
        {
            if (txtLink.Text == "")
            {
                MessageBox.Show("Bạn chưa chọn đường dẫn", "Thông báo!");
                return;
            }
            bomon = "Công nghệ phần mềm"; namebm = "CNPM";
            lbBM.Text = "Bộ môn " + btnCNPM.Text;
            gridPC.DataSource = cne.ImportExcel(txtLink.Text, "BM_77");
            gridSOTIETDAY.DataSource = null;
            if (pq == 1 && bomon != "") btnExport.Enabled = true;
            Display_sotietday();
        }

        private void btnKHMT_Click(object sender, EventArgs e)
        {
            if (txtLink.Text == "")
            {
                MessageBox.Show("Bạn chưa chọn đường dẫn", "Thông báo!");
                return;
            }
            bomon = "Khoa học máy tính"; namebm = "KHMT";
            lbBM.Text = "Bộ môn " + btnKHMT.Text;
            gridPC.DataSource = cne.ImportExcel(txtLink.Text, "BM_02");
            gridSOTIETDAY.DataSource = null;
            if (pq == 1 && bomon != "") btnExport.Enabled = true;
            Display_sotietday();
        }

        private void btnHTTT_Click(object sender, EventArgs e)
        {
            if (txtLink.Text == "")
            {
                MessageBox.Show("Bạn chưa chọn đường dẫn", "Thông báo!");
                return;
            }
            bomon = "Hệ thống thông tin"; namebm = "HTTT";
            lbBM.Text = "Bộ môn " + btnHTTT.Text;
            gridPC.DataSource = cne.ImportExcel(txtLink.Text, "BM_03");
            gridSOTIETDAY.DataSource = null;
            if (pq == 1 && bomon != "") btnExport.Enabled = true;
            Display_sotietday();
        }

        private void btnTTMT_Click(object sender, EventArgs e)
        {
            if (txtLink.Text == "")
            {
                MessageBox.Show("Bạn chưa chọn đường dẫn", "Thông báo!");
                return;
            }
            bomon = "Trung tâm máy tính"; namebm = "TTMT";
            lbBM.Text = "Bộ môn " + btnTTMT.Text;
            gridPC.DataSource = cne.ImportExcel(txtLink.Text, "BM_74");
            gridSOTIETDAY.DataSource = null;
            if (pq == 1 && bomon != "") btnExport.Enabled = true;
            Display_sotietday();
        }

        private void btnTOAN_Click(object sender, EventArgs e)
        {
            if (txtLink.Text == "")
            {
                MessageBox.Show("Bạn chưa chọn đường dẫn", "Thông báo!");
                return;
            }
            bomon = "Toán"; namebm = "TOAN";
            lbBM.Text = "Bộ môn " + btnTOAN.Text;
            gridPC.DataSource = cne.ImportExcel(txtLink.Text, "BM_01");
            gridSOTIETDAY.DataSource = null;
            if (pq == 1 && bomon != "") btnExport.Enabled = true;
            Display_sotietday();
        }

        private void btnBrowse_Click(object sender, EventArgs e)
        {
            // Browse đến file cần import
            OpenFileDialog ofd = new OpenFileDialog();
            // Lấy đường dẫn file import vừa chọn
            txtLink.Text = ofd.ShowDialog() == DialogResult.OK ? ofd.FileName : "";
        }
        
        private string GetMALHP(string mahp, string tenlop)
        {
            string query = string.Format("Select MALOP from LOPHOCPHAN where TENLOP = N'{0}' and MAHP = '{1}'", tenlop, mahp);
            DataTable dt = cn.LoadTable(query);
            if (dt.Rows.Count > 0) return dt.Rows[0][0].ToString();
            else return "";
        }
        private void phancong(FormPC pc)
        {
            string mahp = "";
            int sotiet = 0;
            if (dataPC.GetRowCellValue(dataPC.FocusedRowHandle, "F2").ToString() == "")
            {
                int cur = dataPC.FocusedRowHandle;
                while (dataPC.GetRowCellValue(cur, "F2").ToString() == "")
                {
                    cur--;
                }
                mahp = dataPC.GetRowCellValue(cur, "F2").ToString();
                sotiet = Convert.ToInt32(dataPC.GetRowCellValue(cur, "F6"));
            }
            else
            {
                mahp = dataPC.GetRowCellValue(dataPC.FocusedRowHandle, "F2").ToString();
                sotiet = Convert.ToInt32(dataPC.GetRowCellValue(dataPC.FocusedRowHandle, "F6"));
            }
            string magv1 = pc.GetMAGV1();
            string magv2 = pc.GetMAGV2();
            string kip = dataPC.GetRowCellValue(dataPC.FocusedRowHandle, "F8").ToString();                
            string malop = GetMALHP(mahp, dataPC.GetRowCellValue(dataPC.FocusedRowHandle, "F10").ToString());
            string diadiem = dataPC.GetRowCellValue(dataPC.FocusedRowHandle, "F11").ToString();
            string ky = dataPC.GetRowCellValue(2, "BẢNG PHÂN CÔNG GIẢNG DẠY").ToString();
            string nam = dataPC.GetRowCellValue(2, "F6").ToString();
            DAL_PHANCONG phancong = new DAL_PHANCONG(malop, magv1, magv2, kip, diadiem, sotiet, ky, nam);
            DAO_PC.Delete_PC(phancong);
            int dem = 0;
            try
            {
                int check2 = DAO_PC.Insert_PC(phancong);
                if (check2 == 0)
                {
                    MessageBox.Show("Không thêm được dòng này");
                    dem++;
                }
            }
            catch
            {
                MessageBox.Show("Lỗi cập nhật");
                dem++;
            }
            finally
            {
                Display_sotietday();
            }
        }

        private void dataPC_RowClick(object sender, DevExpress.XtraGrid.Views.Grid.RowClickEventArgs e)
        {
            if(dataPC.FocusedRowHandle >= 8)
            {
                FormPC pc = new FormPC(GetMABM(bomon));
                pc.ShowDialog();
                dataPC.SetFocusedRowCellValue("F12", pc.GetGV1());
                dataPC.SetFocusedRowCellValue("F13", pc.GetGV2());
                phancong(pc);
            }
        }

        private void btnExport_Click(object sender, EventArgs e)
        {
            cne.Xuat(dataPC);
        }

        private void btnHistory_Click(object sender, EventArgs e)
        {
            FormHistory hs = new FormHistory();
            hs.ShowDialog();
        }
    }
}
