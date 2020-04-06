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
using System.Data.SqlClient;
using DevExpress.XtraEditors.Repository;

namespace QLPCgiangday.GUI
{
    public partial class ucKYHOC : DevExpress.XtraEditors.XtraUserControl
    {
        private Connection cn = new Connection();
        private string sql = "Select * from KYHOC";
        private DAO_KYHOC DAO_KH = new DAO_KYHOC();
        private int val = 0;
        private int pq = 0;
        public ucKYHOC(int pq)
        {
            InitializeComponent();
            this.pq = pq;
            if (pq == 0) btnHuy.Enabled = btnLuu.Enabled = btnSua.Enabled = btnXoa.Enabled = btnThem.Enabled = false;
        }
        private int TaiGD()
        {
            int DM = int.Parse(txtDMGD.Text);
            int HS = int.Parse(txtHSGT.Text);
            return DM - DM * HS / 100;
        }
        private void hienthiKH()
        {
            try
            {
                txtTENKY.Text = dataKH1.GetRowCellValue(dataKH1.FocusedRowHandle, "TENKY").ToString();
                cbBGV.Text = dataKH1.GetRowCellDisplayText(dataKH1.FocusedRowHandle, "MAGV");
                cbBCD.Text = dataKH1.GetRowCellDisplayText(dataKH1.FocusedRowHandle, "MACD");
                cbBCV.Text = dataKH1.GetRowCellDisplayText(dataKH1.FocusedRowHandle, "MACV");
                lbGV.Text = cbBGV.Text;
                txtDMGD.Text = cn.LoadTable("select DMGIANGDAY from CHUCDANH where TENCD = N'" + cbBCD.Text + "'").Rows[0][0].ToString();
                string magv = dataKH1.GetRowCellValue(dataKH1.FocusedRowHandle, "MAGV").ToString();
                int hsgt = DAO_KH.Tong_HSGT(magv) > 50 ? 50 : DAO_KH.Tong_HSGT(magv);
                txtHSGT.Text = hsgt.ToString();
                txtTai.Text = TaiGD().ToString();
            }
            catch { }
        }

        private void ucKYHOC_Load(object sender, EventArgs e)
        {
            dataKH.DataSource = cn.LoadTable(sql);
            RepositoryItemLookUpEdit rigv = new RepositoryItemLookUpEdit();
            rigv.DataSource = cn.LoadTable("select MAGV, TENGV from GIAOVIEN");
            rigv.ValueMember = "MAGV";
            rigv.DisplayMember = "TENGV";
            dataKH1.Columns["MAGV"].ColumnEdit = rigv;
            RepositoryItemLookUpEdit rihh = new RepositoryItemLookUpEdit();
            rihh.DataSource = cn.LoadTable("select * from CHUCDANH");
            rihh.ValueMember = "MACD";
            rihh.DisplayMember = "TENCD";
            dataKH1.Columns["MACD"].ColumnEdit = rihh;
            RepositoryItemLookUpEdit ricv = new RepositoryItemLookUpEdit();
            ricv.DataSource = cn.LoadTable("select * from CHUCVU");
            ricv.ValueMember = "MACV";
            ricv.DisplayMember = "TENCV";
            dataKH1.Columns["MACV"].ColumnEdit = ricv;
            cbBGV.DataSource = cn.LoadTable("Select MAGV, TENGV from GIAOVIEN");
            cbBGV.ValueMember = "MAGV";
            cbBGV.DisplayMember = "TENGV";
            cbBCD.DataSource = cn.LoadTable("Select MACD, TENCD from CHUCDANH");
            cbBCD.ValueMember = "MACD";
            cbBCD.DisplayMember = "TENCD";
            cbBCV.DataSource = cn.LoadTable("Select MACV, TENCV from CHUCVU");
            cbBCV.ValueMember = "MACV";
            cbBCV.DisplayMember = "TENCV";
            hienthiKH();
        }

        private void dataKH_KeyDown(object sender, KeyEventArgs e)
        {
            hienthiKH();
        }

        private void dataKH1_FocusedRowChanged(object sender, DevExpress.XtraGrid.Views.Base.FocusedRowChangedEventArgs e)
        {
            hienthiKH();
        }

        private void dataKH1_CustomDrawCell(object sender, DevExpress.XtraGrid.Views.Base.RowCellCustomDrawEventArgs e)
        {
            if (e.Column == STT) e.DisplayText = Convert.ToString(e.RowHandle + 1);
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            btnSua.Enabled = btnXoa.Enabled = dataKH.Enabled = false;
            txtTENKY.Text = "";
            val = 1;
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            btnThem.Enabled = btnXoa.Enabled = dataKH.Enabled = false;
            txtTENKY.Select();
            val = 2;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn xóa mục này?", "Verify!", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                int cur = dataKH1.FocusedRowHandle;
                DataRow row = cn.LoadTable(sql).Rows[cur];
                DAL_KYHOC kh = new DAL_KYHOC(row);
                int check = DAO_KH.Delete_KH(kh);
                int index = cur == dataKH1.RowCount - 1 ? dataKH1.RowCount - 2 : cur;
                if (check != 0)
                {
                    dataKH.DataSource = cn.LoadTable(sql);
                    if (dataKH1.RowCount > 1) dataKH1.FocusedRowHandle = index;
                }
                else MessageBox.Show("Không xóa được mục này!", "Thông báo!");
                hienthiKH();
            }
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            DAL_KYHOC kh = new DAL_KYHOC(cbBGV.SelectedValue.ToString(),cbBCD.SelectedValue.ToString(),cbBCV.SelectedValue.ToString(),txtTENKY.Text);
            int index = val == 1 ? dataKH1.RowCount : dataKH1.FocusedRowHandle;
            int check = 0;
            if (val == 1) check = DAO_KH.Insert_KH(kh);
            else if (val == 2) check = DAO_KH.Update_KH(kh);
            else return;
            if (check != 0)
            {
                dataKH.DataSource = cn.LoadTable(sql);
                //dataKH1.FocusedRowHandle = index;
            }
            else MessageBox.Show("Không thực hiện được thao tác!", "Thông báo!");
            btnThem.Enabled = btnSua.Enabled = btnXoa.Enabled = dataKH.Enabled = true;
            val = 0;
            hienthiKH();
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            btnThem.Enabled = btnSua.Enabled = btnXoa.Enabled = dataKH.Enabled = true;
            val = 0;
            hienthiKH();
        }
    }
}
