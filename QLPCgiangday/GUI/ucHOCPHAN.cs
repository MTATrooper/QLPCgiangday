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
using System.Data.SqlClient;
using QLPCgiangday.DATA;
using QLPCgiangday.DAO;
using DevExpress.XtraEditors.Repository;

namespace QLPCgiangday.GUI
{
    public partial class ucHOCPHAN : DevExpress.XtraEditors.XtraUserControl
    {
        private int pq = 0;
        public ucHOCPHAN(int pq)
        {
            InitializeComponent();
            this.pq = pq;
            if (pq == 0) btnHuy.Enabled = btnLuu.Enabled = btnSua.Enabled = btnXoa.Enabled = btnThem.Enabled = false;
        }
        private Connection cn = new Connection();
        private string sql = "Select * from HOCPHAN";
        private int val = 0;
        private void hienthiHP()
        {
            try
            {
                txtMA.Text = dataHP.GetRowCellValue(dataHP.FocusedRowHandle, "MAHP").ToString();
                txtTEN.Text = dataHP.GetRowCellValue(dataHP.FocusedRowHandle, "TENHP").ToString();
                txtSOTC.Text = dataHP.GetRowCellValue(dataHP.FocusedRowHandle, "SOTC").ToString();
                txtSOTiet.Text = dataHP.GetRowCellValue(dataHP.FocusedRowHandle, "SOTIET").ToString();
                cbBMH.Text = dataHP.GetFocusedRowCellDisplayText("MAMH");
            }
            catch { }
        }
        private void ucHOCPHAN_Load(object sender, EventArgs e)
        {
            RepositoryItemLookUpEdit ribm = new RepositoryItemLookUpEdit();
            ribm.DataSource = cn.LoadTable("select MAMH, TENMH from MONHOC");
            ribm.ValueMember = "MAMH";
            ribm.DisplayMember = "TENMH";
            dataHP.Columns["MAMH"].ColumnEdit = ribm;
            gridHP.DataSource = cn.LoadTable(sql);
            cbBMH.DataSource = cn.LoadTable("Select MAMH, TENMH from MONHOC");
            cbBMH.ValueMember = "MAMH";
            cbBMH.DisplayMember = "TENMH";
            hienthiHP();
        }
        private void dataHP_CustomDrawCell(object sender, DevExpress.XtraGrid.Views.Base.RowCellCustomDrawEventArgs e)
        {
            if (e.Column == STT) e.DisplayText = Convert.ToString(e.RowHandle + 1);
        }

        private void dataHP_FocusedRowChanged(object sender, DevExpress.XtraGrid.Views.Base.FocusedRowChangedEventArgs e)
        {
            hienthiHP();
        }

        private void dataHP_KeyDown(object sender, KeyEventArgs e)
        {
            hienthiHP();
        }
        private void btnThem_Click(object sender, EventArgs e)
        {
            txtTEN.Text = txtSOTC.Text = txtSOTiet.Text = "";
            btnSua.Enabled = btnXoa.Enabled = gridHP.Enabled = false;
            txtTEN.Select();
            txtMA.Text = cn.NextID("HOCPHAN", "MAHP", "HP");
            val = 1;
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            btnThem.Enabled = btnXoa.Enabled = false;
            txtMA.ReadOnly = true;
            txtTEN.Select();
            val = 2;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn xóa học phần này?", "Verify!", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                int cur = dataHP.FocusedRowHandle;
                DataRow row = cn.LoadTable(sql).Rows[cur];
                DAL_HOCPHAN hp = new DAL_HOCPHAN(row);
                DAO_HOCPHAN daoHP = new DAO_HOCPHAN();
                int check = daoHP.Delete_HP(hp);
                int index = cur == dataHP.RowCount - 1 ? dataHP.RowCount - 2 : cur;
                if (check != 0)
                {
                    gridHP.DataSource = cn.LoadTable(sql);
                    if (dataHP.RowCount > 1) dataHP.FocusedRowHandle = index;
                }
                else MessageBox.Show("Không xóa được học phần này!", "Thông báo!");
                hienthiHP();
            }
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            DAL_HOCPHAN hp = new DAL_HOCPHAN(txtMA.Text, txtTEN.Text, Convert.ToInt32(txtSOTC.Text), Convert.ToInt32(txtSOTiet.Text),cbBMH.SelectedValue.ToString());
            DAO_HOCPHAN daoHP = new DAO_HOCPHAN();
            int index = val == 1 ? dataHP.RowCount : dataHP.FocusedRowHandle;
            int check = 0;
            if (val == 1) check = daoHP.Insert_HP(hp);
            else if (val == 2) check = daoHP.Update_HP(hp);
            else return;
            if (check != 0)
            {
                gridHP.DataSource = cn.LoadTable(sql);
                dataHP.FocusedRowHandle = index;
            }
            else  MessageBox.Show("Không thực hiện được thao tác!", "Thông báo!");
            btnThem.Enabled = btnSua.Enabled = btnXoa.Enabled = gridHP.Enabled = true;
            val = 0; txtMA.ReadOnly = false;
            hienthiHP();
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            btnThem.Enabled = btnSua.Enabled = btnXoa.Enabled = gridHP.Enabled = true;
            txtMA.ReadOnly = false;
            val = 0;
            hienthiHP();
        }       
    }
}
