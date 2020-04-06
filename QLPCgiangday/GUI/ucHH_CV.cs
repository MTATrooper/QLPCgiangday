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
using System.Data;
using System.Data.SqlClient;
using QLPCgiangday.DAO;
using QLPCgiangday.DATA;

namespace QLPCgiangday.GUI
{
    public partial class ucHH_CV : DevExpress.XtraEditors.XtraUserControl
    {
        private int pq = 0;
        public ucHH_CV(int pq)
        {
            InitializeComponent();
            this.pq = pq;
            if(pq == 0) btnHuy.Enabled = btnLuuCV.Enabled = btnLuuHH.Enabled = btnSuaCV.Enabled = btnSuaHH.Enabled = btnThemHH.Enabled = btnXoaCV.Enabled = btnXoaHH.Enabled = btnThemCV.Enabled = false;
        }
        private Connection cn = new Connection();
        private string sqlCD = "Select * from CHUCDANH";
        private string sqlCV = "Select * from CHUCVU";
        private int valCD = 0;
        private int valCV = 0;
        public void hienthiCD()
        {
            try
            {
                txtMACD.Text = dataCD.CurrentRow.Cells["MACD"].Value.ToString();
                txtTenCD.Text = dataCD.CurrentRow.Cells["TENCD"].Value.ToString();
                txtDMGD.Text = dataCD.CurrentRow.Cells["DMGIANGDAY"].Value.ToString();
            }
            catch { }
        }
        public void hienthiCV()
        {
            try
            {
                txtMaCV.Text = dataCV.CurrentRow.Cells["MACV"].Value.ToString();
                txtTenCV.Text = dataCV.CurrentRow.Cells["TENCV"].Value.ToString();
                txtSTGT.Text = dataCV.CurrentRow.Cells["HESOGIAMTAI"].Value.ToString();
            }
            catch { }
        }

        private void ucHH_CV_Load(object sender, EventArgs e)
        {
            dataCD.DataSource = cn.LoadTable(sqlCD);
            dataCV.DataSource = cn.LoadTable(sqlCV);
            hienthiCD(); hienthiCV();
        }

        private void dataHH_RowPrePaint(object sender, DataGridViewRowPrePaintEventArgs e)
        {
            dataCD.Rows[e.RowIndex].Cells["STTCD"].Value = e.RowIndex + 1;
        }

        private void dataCV_RowPrePaint(object sender, DataGridViewRowPrePaintEventArgs e)
        {
            dataCV.Rows[e.RowIndex].Cells["STTCV"].Value = e.RowIndex + 1;
        }

        private void dataHH_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            hienthiCD();
        }

        private void dataCV_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            hienthiCV();
        }

        private void dataHH_KeyDown(object sender, KeyEventArgs e)
        {
            hienthiCD();
        }

        private void dataCV_KeyDown(object sender, KeyEventArgs e)
        {
            hienthiCV();
        }
       // Xu ly HOC HAM
        private void btnThemHH_Click(object sender, EventArgs e)
        {
            txtTenCD.Text = txtDMGD.Text = "";
            btnSuaHH.Enabled = btnXoaHH.Enabled = dataCD.Enabled = panelCV.Enabled = false;
            txtTenCD.Select();
            txtMACD.Text = cn.NextID("CHUCDANH", "MACD", "CD");
            valCD = 1;
        }

        private void btnSuaHH_Click(object sender, EventArgs e)
        {
            btnThemHH.Enabled = btnXoaHH.Enabled = dataCD.Enabled = panelCV.Enabled = false;
            txtMACD.ReadOnly = true;
            txtTenCD.Select();
            valCD = 2;
        }

        private void btnXoaHH_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn xóa học hàm này?", "Verify!", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                int cur = dataCD.CurrentRow.Index;
                DataRow row = cn.LoadTable(sqlCD).Rows[cur];
                DAL_CHUCDANH hh = new DAL_CHUCDANH(row);
                DAO_CHUCDANH daoHH = new DAO_CHUCDANH();
                int check = daoHH.Delete_CD(hh);
                int index = dataCD.CurrentRow.Index == dataCD.RowCount - 1 ? dataCD.RowCount - 2 : cur;
                if (check != 0)
                {
                    dataCD.DataSource = cn.LoadTable(sqlCD);
                    if (dataCD.RowCount > 1) dataCD.CurrentCell = dataCD.Rows[index].Cells[0];
                }
                else MessageBox.Show("Không xóa được học hàm này!", "Thông báo!");
                hienthiCD();
            }
        }

        private void btnLuuHH_Click(object sender, EventArgs e)
        {
            DAL_CHUCDANH hh = new DAL_CHUCDANH(txtMACD.Text, txtTenCD.Text, Convert.ToInt32(txtDMGD.Text));
            DAO_CHUCDANH daoHH = new DAO_CHUCDANH();
            int index = valCD == 1 ? dataCD.RowCount : dataCD.CurrentRow.Index;
            int check = 0;
            if (valCD == 1) check = daoHH.Insert_CD(hh);
            else if (valCD == 2) check = daoHH.Update_CD(hh);
            else return;
            if (check != 0)
            {
                dataCD.DataSource = cn.LoadTable(sqlCD);
                dataCD.CurrentCell = dataCD.Rows[index].Cells[0];
            }
            else MessageBox.Show("Không thực hiện được thao tác!", "Thông báo!");
            btnThemHH.Enabled = btnSuaHH.Enabled = btnXoaHH.Enabled = panelCV.Enabled = dataCD.Enabled = true;
            valCD = 0; txtMACD.ReadOnly = false;
            hienthiCD();
        }
        //Xu ly CHUC VU
        private void btnThemCV_Click(object sender, EventArgs e)
        {
            txtTenCV.Text = txtSTGT.Text = "";
            btnSuaCV.Enabled = btnXoaCV.Enabled = dataCV.Enabled = panelHH.Enabled = false;
            txtTenCV.Select();
            txtMaCV.Text = cn.NextID("CHUCVU", "MACV", "CV");
            valCV = 1;
        }

        private void btnSuaCV_Click(object sender, EventArgs e)
        {
            btnThemCV.Enabled = btnXoaCV.Enabled = dataCV.Enabled = panelHH.Enabled = false;
            txtMaCV.ReadOnly = true;
            txtTenCV.Select();
            valCV = 2;
        }

        private void btnXoaCV_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn xóa chức vụ này?", "Verify!", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                int cur = dataCV.CurrentRow.Index;
                DataRow row = cn.LoadTable(sqlCV).Rows[cur];
                DAL_CHUCVU cv = new DAL_CHUCVU(row);
                DAO_CHUCVU daoCV = new DAO_CHUCVU();
                int check = daoCV.Delete_CV(cv);
                int index = dataCV.CurrentRow.Index == dataCV.RowCount - 1 ? dataCV.RowCount - 2 : cur;
                if (check != 0)
                {
                    dataCV.DataSource = cn.LoadTable(sqlCV);
                    if (dataCV.RowCount > 1) dataCV.CurrentCell = dataCV.Rows[index].Cells[0];
                }
                else MessageBox.Show("Không xóa được học hàm này!", "Thông báo!");
                hienthiCV();
            }
        }

        private void btnLuuCV_Click(object sender, EventArgs e)
        {
            DAL_CHUCVU cv = new DAL_CHUCVU(txtMaCV.Text, txtTenCV.Text, Convert.ToInt32(txtSTGT.Text));
            DAO_CHUCVU daoCV = new DAO_CHUCVU();
            int index = valCV == 1 ? dataCV.RowCount : dataCV.CurrentRow.Index;
            int check = 0;
            if (valCV == 1) check = daoCV.Insert_CV(cv);
            else if (valCV == 2) check = daoCV.Update_CV(cv);
            else return;
            if (check != 0)
            {
                dataCV.DataSource = cn.LoadTable(sqlCV);
                dataCV.CurrentCell = dataCV.Rows[index].Cells[0];
            }
            else MessageBox.Show("Không thực hiện được thao tác!", "Thông báo!");
            btnThemCV.Enabled = btnSuaCV.Enabled = btnXoaCV.Enabled = panelHH.Enabled = dataCV.Enabled = true;
            valCV = 0; txtMaCV.ReadOnly = false;
            hienthiCV();
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            btnThemHH.Enabled = btnSuaHH.Enabled = btnXoaHH.Enabled = panelHH.Enabled = panelCV.Enabled = btnThemCV.Enabled =
                btnSuaCV.Enabled = btnXoaCV.Enabled = true;
            txtMACD.ReadOnly = txtMaCV.ReadOnly = false;
            valCD = valCV = 0;
            hienthiCD(); hienthiCV();
        }
    }
}
