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
using QLPCgiangday.DAO;
using QLPCgiangday.DATA;
using DevExpress.XtraEditors.Repository;

namespace QLPCgiangday.GUI
{
    public partial class ucGIAOVIEN : DevExpress.XtraEditors.XtraUserControl
    {
        private int pq = 0;
        public ucGIAOVIEN(int pq)
        {
            InitializeComponent();
            this.pq = pq;
            if(pq == 0) btnThem.Enabled = btnSua.Enabled = btnXoa.Enabled = btnLuu.Enabled = btnHuy.Enabled = false;
        }
        private Connection cn = new Connection();
        private string sql = "select * from GIAOVIEN";
        private int val = 0;
        private DAO_GIAOVIEN DAO_GV = new DAO_GIAOVIEN();
        private void hienthiGV()
        {
            try
            {
                txtMa.Text = dataGV.GetRowCellValue(dataGV.FocusedRowHandle, "MAGV").ToString();
                txtTen.Text = dataGV.GetRowCellValue(dataGV.FocusedRowHandle, "TENGV").ToString();
                datetime_NS.Value = Convert.ToDateTime(dataGV.GetRowCellValue(dataGV.FocusedRowHandle, "NGAYSINH"));
                txtSDT.Text = dataGV.GetRowCellValue(dataGV.FocusedRowHandle, "SDT").ToString();
                txtDC.Text = dataGV.GetRowCellValue(dataGV.FocusedRowHandle, "DIACHI").ToString();
                cbBBM.Text = dataGV.GetFocusedRowCellDisplayText("MABM");
            }
            catch { }
        }

        private void ucGIAOVIEN_Load(object sender, EventArgs e)
        {
            gridGV.DataSource = cn.LoadTable(sql);
            RepositoryItemLookUpEdit ribm = new RepositoryItemLookUpEdit();
            ribm.DataSource = cn.LoadTable("select MABM, TENBM from BOMON");
            ribm.ValueMember = "MABM";
            ribm.DisplayMember = "TENBM";
            dataGV.Columns["MABM"].ColumnEdit = ribm;
            cbBBM.DataSource = cn.LoadTable("Select MABM, TENBM from BOMON");
            cbBBM.ValueMember = "MABM";
            cbBBM.DisplayMember = "TENBM";
            hienthiGV();
        }

        private void dataGV_CustomDrawCell(object sender, DevExpress.XtraGrid.Views.Base.RowCellCustomDrawEventArgs e)
        {
            if (e.Column == STT) e.DisplayText = Convert.ToString(e.RowHandle + 1);
        }
        private void dataGV_FocusedRowChanged(object sender, DevExpress.XtraGrid.Views.Base.FocusedRowChangedEventArgs e)
        {
            hienthiGV();
        }
        private void dataGV_KeyDown(object sender, KeyEventArgs e)
        {
            hienthiGV();
        }
        private void btnThem_Click(object sender, EventArgs e)
        {
            txtMa.Clear(); txtTen.Clear(); txtSDT.Clear();
            txtDC.Clear();
            btnSua.Enabled = btnXoa.Enabled = gridGV.Enabled = false;
            txtMa.Text = cn.NextID("GIAOVIEN", "MAGV", "GV");
            txtTen.Select();
            val = 1;
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            btnThem.Enabled = btnXoa.Enabled = gridGV.Enabled = false;
            txtTen.Select();
            txtMa.ReadOnly = true;
            val = 2;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn xóa mục này?", "Verify!", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                int cur = dataGV.FocusedRowHandle;
                DataRow row = cn.LoadTable(sql).Rows[cur];
                DAL_GIAOVIEN gv = new DAL_GIAOVIEN(row);
                int check = DAO_GV.Delete_GV(gv);
                int index = cur == dataGV.RowCount - 1 ? dataGV.RowCount - 2 : cur;
                if (check != 0)
                {
                    gridGV.DataSource = cn.LoadTable(sql);
                    if (dataGV.RowCount > 1) dataGV.FocusedRowHandle = index;
                }
                else MessageBox.Show("Không xóa được mục này!", "Thông báo!");
                hienthiGV();
            }
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            DAL_GIAOVIEN gv = new DAL_GIAOVIEN(txtMa.Text, txtTen.Text, datetime_NS.Value, txtSDT.Text, txtDC.Text, cbBBM.SelectedValue.ToString());
            int index = val == 1 ? dataGV.RowCount : dataGV.FocusedRowHandle;
            int check = 0;
            if (val == 1) check = DAO_GV.Insert_GV(gv);
            else if (val == 2) check = DAO_GV.Update_GV(gv);
            else return;
            if (check != 0)
            {
                gridGV.DataSource = cn.LoadTable(sql);
                dataGV.FocusedRowHandle = index;
            }
            else MessageBox.Show("Không thực hiện được thao tác!", "Thông báo!");
            btnThem.Enabled = btnSua.Enabled = btnXoa.Enabled = gridGV.Enabled = true;
            val = 0; txtMa.ReadOnly = false;
            hienthiGV();
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            btnThem.Enabled = btnSua.Enabled = btnXoa.Enabled = gridGV.Enabled = true;
            txtMa.ReadOnly = false;
            val = 0;
            hienthiGV();
        }

    }
}
