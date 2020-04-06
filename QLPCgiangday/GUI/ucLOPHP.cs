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
    public partial class ucLOPHP : DevExpress.XtraEditors.XtraUserControl
    {
        private int pq = 0;
        public ucLOPHP(int pq)
        {
            InitializeComponent();
            this.pq = pq;
            if (pq == 0) btnHuy.Enabled = btnLuu.Enabled = btnSua.Enabled = btnXoa.Enabled = btnThem.Enabled = false;
        }
        private Connection cn = new Connection();
        private string sql = "Select * from LOPHOCPHAN";
        private int val = 0;
        private void hienthiLOP()
        {
            try
            {
                txtMALOP.Text = dataLOP.GetRowCellValue(dataLOP.FocusedRowHandle, "MALOP").ToString();
                txtTENLOP.Text = dataLOP.GetRowCellValue(dataLOP.FocusedRowHandle, "TENLOP").ToString();
                txtSOHV.Text = dataLOP.GetRowCellValue(dataLOP.FocusedRowHandle, "QUANSO").ToString();
                cbBNNGD.Text = dataLOP.GetRowCellValue(dataLOP.FocusedRowHandle, "NGONNGUGD").ToString();
                cbBHP.Text = dataLOP.GetFocusedRowCellDisplayText("MAHP").ToString();
                cbBTD.Text = dataLOP.GetFocusedRowCellDisplayText("MATD").ToString();
                cbBHE.Text = dataLOP.GetFocusedRowCellDisplayText("MAHE").ToString();
            }
            catch { }
        }

        private void ucLOPHP_Load(object sender, EventArgs e)
        {
            gridLOP.DataSource = cn.LoadTable(sql);
            RepositoryItemLookUpEdit rihp = new RepositoryItemLookUpEdit();
            rihp.DataSource = cn.LoadTable("select MAHP, TENHP from HOCPHAN");
            rihp.ValueMember = "MAHP";
            rihp.DisplayMember = "TENHP";
            dataLOP.Columns["MAHP"].ColumnEdit = rihp;
            RepositoryItemLookUpEdit ritd = new RepositoryItemLookUpEdit();
            ritd.DataSource = cn.LoadTable("select MATD, TENTD from TRINHDODT");
            ritd.ValueMember = "MATD";
            ritd.DisplayMember = "TENTD";
            dataLOP.Columns["MATD"].ColumnEdit = ritd;
            RepositoryItemLookUpEdit rihe = new RepositoryItemLookUpEdit();
            rihe.DataSource = cn.LoadTable("select MAHEDT, TENHEDT from HEDAOTAO");
            rihe.ValueMember = "MAHEDT";
            rihe.DisplayMember = "TENHEDT";
            dataLOP.Columns["MAHEDT"].ColumnEdit = rihe;
            //
            cbBHP.DataSource = cn.LoadTable("select MAHP, TENHP from HOCPHAN");
            cbBHP.ValueMember = "MAHP";
            cbBHP.DisplayMember = "TENHP";
            cbBTD.DataSource = cn.LoadTable("select MATD, TENTD from TRINHDODT");
            cbBTD.ValueMember = "MATD";
            cbBTD.DisplayMember = "TENTD";
            cbBHE.DataSource = cn.LoadTable("select MAHEDT, TENHEDT from HEDAOTAO");
            cbBHE.ValueMember = "MAHEDT";
            cbBHE.DisplayMember = "TENHEDT";
            hienthiLOP();
        }
        private void dataLOP_CustomDrawCell(object sender, DevExpress.XtraGrid.Views.Base.RowCellCustomDrawEventArgs e)
        {
            if (e.Column == STT) e.DisplayText = Convert.ToString(e.RowHandle + 1);
        }

        private void dataLOP_FocusedRowChanged(object sender, DevExpress.XtraGrid.Views.Base.FocusedRowChangedEventArgs e)
        {
            hienthiLOP();
        }

        private void dataLOP_KeyDown(object sender, KeyEventArgs e)
        {
            hienthiLOP();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            txtTENLOP.Text = txtSOHV.Text = "";
            btnSua.Enabled = btnXoa.Enabled = gridLOP.Enabled = false;
            txtTENLOP.Select();
            txtMALOP.Text = cn.NextID("LOPHOCPHAN", "MALOP", "LOP");
            val = 1;
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            btnThem.Enabled = btnXoa.Enabled = false;
            txtMALOP.ReadOnly = true;
            txtTENLOP.Select();
            val = 2;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn xóa lớp này?", "Verify!", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                int cur = dataLOP.FocusedRowHandle;
                DataRow row = cn.LoadTable(sql).Rows[cur];
                DAL_LOPHP lop = new DAL_LOPHP(row);
                DAO_LOPHP daoLOP = new DAO_LOPHP();
                int check = daoLOP.Delete_LOP(lop);
                int index = cur == dataLOP.RowCount - 1 ? dataLOP.RowCount - 2 : cur;
                if (check != 0)
                {
                    gridLOP.DataSource = cn.LoadTable(sql);
                    if (dataLOP.RowCount > 1) dataLOP.FocusedRowHandle = index;
                }
                else MessageBox.Show("Không xóa được học phần này!", "Thông báo!");
                hienthiLOP();
            }
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            DAL_LOPHP hp = new DAL_LOPHP(txtMALOP.Text, txtTENLOP.Text, Convert.ToInt32(txtSOHV.Text), 
                cbBNNGD.Text, cbBHP.SelectedValue.ToString(), cbBTD.SelectedValue.ToString(), cbBHE.SelectedValue.ToString());
            DAO_LOPHP daoLOP = new DAO_LOPHP();
            int index = val == 1 ? dataLOP.RowCount : dataLOP.FocusedRowHandle;
            int check = 0;
            if (val == 1) check = daoLOP.Insert_LOP(hp);
            else if (val == 2) check = daoLOP.Update_LOP(hp);
            else return;
            if (check != 0)
            {
                gridLOP.DataSource = cn.LoadTable(sql);
                dataLOP.FocusedRowHandle = index;
            }
            else MessageBox.Show("Không thực hiện được thao tác!", "Thông báo!");
            btnThem.Enabled = btnSua.Enabled = btnXoa.Enabled = gridLOP.Enabled = true;
            val = 0; txtMALOP.ReadOnly = false;
            hienthiLOP();
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            btnThem.Enabled = btnSua.Enabled = btnXoa.Enabled = gridLOP.Enabled = true;
            txtMALOP.ReadOnly = false;
            val = 0;
            hienthiLOP();
        }
    }
}
