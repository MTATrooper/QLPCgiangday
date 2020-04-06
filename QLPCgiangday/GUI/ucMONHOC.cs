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
    public partial class ucMONHOC : DevExpress.XtraEditors.XtraUserControl
    {
        private int pq = 0;
        public ucMONHOC(int pq)
        {
            InitializeComponent();
            this.pq = pq;
            if (pq == 0) btnHuy.Enabled = btnLuu.Enabled = btnSua.Enabled = btnXoa.Enabled = btnThem.Enabled = false;
        }
        private string sql = "Select * from MONHOC";
        private int val = 0;
        private Connection cn = new Connection();
        private DAO_MONHOC DAO_MH = new DAO_MONHOC();
        private void hienthiMONHOC()
        {
            try
            {
                txtMA.Text = dataMH.GetRowCellValue(dataMH.FocusedRowHandle, "MAMH").ToString();
                txtTEN.Text = dataMH.GetRowCellValue(dataMH.FocusedRowHandle, "TENMH").ToString();
                cbBBM.Text = dataMH.GetFocusedRowCellDisplayText("MABM").ToString();
            }
            catch { }
        }

        private void ucMONHOC_Load(object sender, EventArgs e)
        {
            gridMH.DataSource = cn.LoadTable(sql);
            RepositoryItemLookUpEdit ribm = new RepositoryItemLookUpEdit();
            ribm.DataSource = cn.LoadTable("select MABM, TENBM from BOMON");
            ribm.ValueMember = "MABM";
            ribm.DisplayMember = "TENBM";
            dataMH.Columns["MABM"].ColumnEdit = ribm;
            cbBBM.DataSource = cn.LoadTable("select MABM, TENBM from BOMON");
            cbBBM.ValueMember = "MABM";
            cbBBM.DisplayMember = "TENBM";
            hienthiMONHOC();
        }

        private void dataMH_CustomDrawCell(object sender, DevExpress.XtraGrid.Views.Base.RowCellCustomDrawEventArgs e)
        {
            if (e.Column == STT) e.DisplayText = Convert.ToString(e.RowHandle + 1);
        }
        private void dataMH_KeyDown(object sender, KeyEventArgs e)
        {
            hienthiMONHOC();
        }

        private void dataMH_FocusedRowChanged(object sender, DevExpress.XtraGrid.Views.Base.FocusedRowChangedEventArgs e)
        {
            hienthiMONHOC();
        }
        private void btnThem_Click(object sender, EventArgs e)
        {
            txtTEN.Text = "";
            btnSua.Enabled = btnXoa.Enabled = gridMH.Enabled = false;
            txtTEN.Select();
            txtMA.Text = cn.NextID("MONHOC", "MAMH", "MH");
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
            if (MessageBox.Show("Bạn có muốn xóa mục này?", "Verify!", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                int cur = dataMH.FocusedRowHandle;
                DataRow row = cn.LoadTable(sql).Rows[cur];
                DAL_MONHOC mh = new DAL_MONHOC(row);
                int check = DAO_MH.Delete_MH(mh);
                int index = cur == dataMH.RowCount - 1 ? dataMH.RowCount - 2 : cur;
                if (check != 0)
                {
                    gridMH.DataSource = cn.LoadTable(sql);
                    if (dataMH.RowCount > 1) dataMH.FocusedRowHandle = index;
                }
                else MessageBox.Show("Không xóa được mục này!", "Thông báo!");
                hienthiMONHOC();
            }
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            DAL_MONHOC mh = new DAL_MONHOC(txtMA.Text, txtTEN.Text, cbBBM.SelectedValue.ToString());
            int index = val == 1 ? dataMH.RowCount : dataMH.FocusedRowHandle;
            int check = 0;
            if (val == 1) check = DAO_MH.Insert_MH(mh);
            else if (val == 2) check = DAO_MH.Update_MH(mh);
            else return;
            if (check != 0)
            {
                gridMH.DataSource = cn.LoadTable(sql);
                dataMH.FocusedRowHandle = index;
            }
            else MessageBox.Show("Không thực hiện được thao tác!", "Thông báo!");
            btnThem.Enabled = btnSua.Enabled = btnXoa.Enabled = gridMH.Enabled = true;
            val = 0; txtMA.ReadOnly = false;
            hienthiMONHOC();
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            btnThem.Enabled = btnSua.Enabled = btnXoa.Enabled = gridMH.Enabled = true;
            txtMA.ReadOnly = false;
            val = 0;
            hienthiMONHOC();
        }
        
    }
}
