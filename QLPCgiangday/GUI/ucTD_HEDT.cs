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

namespace QLPCgiangday.GUI
{
    public partial class ucTD_HEDT : DevExpress.XtraEditors.XtraUserControl
    {
        private int pq = 0;
        public ucTD_HEDT(int pq)
        {
            InitializeComponent();
            this.pq = pq;
            if (pq == 0) btnHuy.Enabled = btnLuuTD.Enabled = btnSuaTD.Enabled = btnXoaTD.Enabled = btnThemTD.Enabled = btnLuuHE.Enabled = btnSuaHE.Enabled = btnXoaHE.Enabled = btnThemHE.Enabled = false;
        }
        private Connection cn = new Connection();
        private string sqlTD = "Select * from TRINHDODT";
        private string sqlHE = "Select * from HEDAOTAO";
        private int valTD = 0;
        private int valHE = 0;
        public void hienthiTD()
        {
            try
            {
                txtMATD.Text = dataTD.CurrentRow.Cells["MATD"].Value.ToString();
                txtTenTD.Text = dataTD.CurrentRow.Cells["TENTD"].Value.ToString();
            }
            catch { }
        }
        public void hienthiHE()
        {
            try
            {
                txtMAHE.Text = dataHE.CurrentRow.Cells["MAHEDT"].Value.ToString();
                txtTENHE.Text = dataHE.CurrentRow.Cells["TENHEDT"].Value.ToString();
            }
            catch { }
        }

        private void ucTD_HEDT_Load(object sender, EventArgs e)
        {
            dataTD.DataSource = cn.LoadTable(sqlTD);
            dataHE.DataSource = cn.LoadTable(sqlHE);
            hienthiTD(); hienthiHE();
        }

        private void dataTD_RowPrePaint(object sender, DataGridViewRowPrePaintEventArgs e)
        {
            dataTD.Rows[e.RowIndex].Cells["STTTD"].Value = e.RowIndex + 1;
        }

        private void dataHE_RowPrePaint(object sender, DataGridViewRowPrePaintEventArgs e)
        {
            dataHE.Rows[e.RowIndex].Cells["STTHE"].Value = e.RowIndex + 1;
        }

        private void dataTD_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            hienthiTD();
        }

        private void dataHE_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            hienthiHE();
        }

        private void dataTD_KeyDown(object sender, KeyEventArgs e)
        {
            hienthiTD();
        }

        private void dataHE_KeyDown(object sender, KeyEventArgs e)
        {
            hienthiHE();
        }
        // Xu ly trinh do dao tao
        private void btnThemTD_Click(object sender, EventArgs e)
        {
            txtTenTD.Text = "";
            btnSuaTD.Enabled = btnXoaTD.Enabled = dataTD.Enabled = panelHE.Enabled = false;
            txtTenTD.Select();
            txtMATD.Text = cn.NextID("TRINHDODT", "MATD", "TD");
            valTD = 1;
        }

        private void btnSuaTD_Click(object sender, EventArgs e)
        {
            btnThemTD.Enabled = btnXoaTD.Enabled = dataTD.Enabled = panelHE.Enabled = false;
            txtMATD.ReadOnly = true;
            txtTenTD.Select();
            valTD = 2;
        }

        private void btnXoaTD_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn xóa trình độ này?", "Verify!", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                int cur = dataTD.CurrentRow.Index;
                DataRow row = cn.LoadTable(sqlTD).Rows[cur];
                DAL_TRINHDODT hh = new DAL_TRINHDODT(row);
                DAO_TRINHDODT daoHH = new DAO_TRINHDODT();
                int check = daoHH.Delete_TD(hh);
                int index = dataTD.CurrentRow.Index == dataTD.RowCount - 1 ? dataTD.RowCount - 2 : cur;
                if (check != 0)
                {
                    dataTD.DataSource = cn.LoadTable(sqlTD);
                    if (dataTD.RowCount > 1) dataTD.CurrentCell = dataTD.Rows[index].Cells[0];
                }
                else MessageBox.Show("Không xóa được trình độ này!", "Thông báo!");
                hienthiTD();
            }
        }

        private void btnLuuTD_Click(object sender, EventArgs e)
        {
            DAL_TRINHDODT hh = new DAL_TRINHDODT(txtMATD.Text, txtTenTD.Text);
            DAO_TRINHDODT daoHH = new DAO_TRINHDODT();
            int index = valTD == 1 ? dataTD.RowCount : dataTD.CurrentRow.Index;
            int check = 0;
            if (valTD == 1) check = daoHH.Insert_TD(hh);
            else if (valTD == 2) check = daoHH.Update_TD(hh);
            else return;
            if (check != 0)
            {
                dataTD.DataSource = cn.LoadTable(sqlTD);
                dataTD.CurrentCell = dataTD.Rows[index].Cells[0];
            }
            else MessageBox.Show("Không thực hiện được thao tác!", "Thông báo!");
            btnThemTD.Enabled = btnSuaTD.Enabled = btnXoaTD.Enabled = panelHE.Enabled = dataTD.Enabled = true;
            valTD = 0; txtMATD.ReadOnly = false;
            hienthiTD();
        }
        // Xu ly He dao tao
        private void btnThemHE_Click(object sender, EventArgs e)
        {
            txtTENHE.Text = "";
            btnSuaHE.Enabled = btnXoaHE.Enabled = dataHE.Enabled = panelTD.Enabled = false;
            txtTENHE.Select();
            txtMAHE.Text = cn.NextID("HEDAOTAO", "MAHEDT", "HE");
            valHE = 1;
        }

        private void btnSuaHE_Click(object sender, EventArgs e)
        {
            btnThemHE.Enabled = btnXoaHE.Enabled = dataHE.Enabled = panelTD.Enabled = false;
            txtMAHE.ReadOnly = true;
            txtTENHE.Select();
            valHE = 2;
        }

        private void btnXoaHE_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn xóa hệ này?", "Verify!", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                int cur = dataHE.CurrentRow.Index;
                DataRow row = cn.LoadTable(sqlHE).Rows[cur];
                DAL_HEDT hh = new DAL_HEDT(row);
                DAO_HEDT daoHH = new DAO_HEDT();
                int check = daoHH.Delete_HE(hh);
                int index = dataHE.CurrentRow.Index == dataHE.RowCount - 1 ? dataHE.RowCount - 2 : cur;
                if (check != 0)
                {
                    dataHE.DataSource = cn.LoadTable(sqlHE);
                    if (dataHE.RowCount > 1) dataHE.CurrentCell = dataHE.Rows[index].Cells[0];
                }
                else MessageBox.Show("Không xóa được hệ này!", "Thông báo!");
                hienthiHE();
            }
        }

        private void btnLuuHE_Click(object sender, EventArgs e)
        {
            DAL_HEDT hh = new DAL_HEDT(txtMAHE.Text, txtTENHE.Text);
            DAO_HEDT daoHH = new DAO_HEDT();
            int index = valHE == 1 ? dataHE.RowCount : dataHE.CurrentRow.Index;
            int check = 0;
            if (valHE == 1) check = daoHH.Insert_HE(hh);
            else if (valHE == 2) check = daoHH.Update_HE(hh);
            else return;
            if (check != 0)
            {
                dataHE.DataSource = cn.LoadTable(sqlHE);
                dataHE.CurrentCell = dataHE.Rows[index].Cells[0];
            }
            else MessageBox.Show("Không thực hiện được thao tác!", "Thông báo!");
            btnThemHE.Enabled = btnSuaHE.Enabled = btnXoaHE.Enabled = panelTD.Enabled = dataHE.Enabled = true;
            valHE = 0; txtMAHE.ReadOnly = false;
            hienthiHE();
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            btnThemTD.Enabled = btnSuaTD.Enabled = btnXoaTD.Enabled = panelTD.Enabled = panelHE.Enabled = btnThemHE.Enabled =
                btnSuaHE.Enabled = btnXoaHE.Enabled = true;
            txtMATD.ReadOnly = txtMAHE.ReadOnly = false;
            valTD = valHE = 0;
            hienthiTD(); hienthiHE();
        }
    }
}
