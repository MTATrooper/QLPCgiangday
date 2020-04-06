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

namespace QLPCgiangday.GUI
{
    public partial class ucBomon : DevExpress.XtraEditors.XtraUserControl
    {
        private int pq = 0;
        public ucBomon(int pq)
        {
            InitializeComponent();
            this.pq = pq;
            if (pq == 0) btnHuyBM.Enabled = btnLuuBM.Enabled = btnSuaBM.Enabled = btnThemBM.Enabled = btnXoaBM.Enabled = false;
        }

        private Connection cn = new Connection();
        private string sql = "Select * from BOMON";
        private int val = 0;
        private void hienthiBomon()
        {
            txtMABM.Text = dataBomon.CurrentRow.Cells["MABM"].Value.ToString();
            txtTENBM.Text = dataBomon.CurrentRow.Cells["TENBM"].Value.ToString();
            txtSOGV.Text = dataBomon.CurrentRow.Cells["SOGV"].Value.ToString();
            DataTable dt = cn.LoadTable("Select MAGV, TENGV from GIAOVIEN where MAGV = '" + dataBomon.CurrentRow.Cells["MAChunhiem"].Value.ToString() + "'");
            cbBCN.Text = dt.Rows[0][1].ToString();
        }

        private void ucBomon_Load(object sender, EventArgs e)
        {
            Connection cn = new Connection();
            dataBomon.DataSource = cn.LoadTable(sql);
            cbBCN.DataSource = cn.LoadTable("Select MAGV, TENGV from GIAOVIEN");
            cbBCN.ValueMember = "MAGV";
            cbBCN.DisplayMember = "TENGV";
            hienthiBomon();
        }

        private void dataBomon_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            hienthiBomon();
        }

        private void dataBomon_RowPrePaint(object sender, DataGridViewRowPrePaintEventArgs e)
        {
            dataBomon.Rows[e.RowIndex].Cells["STT"].Value = e.RowIndex + 1;
        }

        private void dataBomon_KeyDown(object sender, KeyEventArgs e)
        {
            hienthiBomon();
        }
        /*private void timkiemBM()
        {
            Connection cn = new Connection();
            string search = "";
            if (cbBsearch.Text.Equals("Mã bộ môn")) search = "SearchBMma";
            else search = "SearchBMten"; 
            SqlCommand cmd = new SqlCommand(search, cn.Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter p = new SqlParameter("@ten", txtsearch.Text);
            cmd.Parameters.Add(p);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            dataBomon.DataSource = dt;
            if (txtsearch.Text == "") dataBomon.DataSource = cn.LoadTable(sql);
        }*/

        private void txtsearch_TextChanged(object sender, EventArgs e)
        {
            //timkiemBM();
            string col = "";
            if (cbBsearch.Text == "Mã bộ môn") col = "MABM";
            else col = "TENBM";
            DAO_BOMON daoHP = new DAO_BOMON();
            DataTable dt = daoHP.SearchBM(txtsearch.Text, col);
            dataBomon.DataSource = dt;
            if (txtsearch.Text == "") dataBomon.DataSource = cn.LoadTable(sql);
        }

        private void btnsearch_Click(object sender, EventArgs e)
        {
            //timkiemBM();
            if (dataBomon.RowCount == 1)
                MessageBox.Show("Không tìm thấy bộ môn!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);
        }
        
        private void btnThemBM_Click(object sender, EventArgs e)
        {
            txtMABM.Text = txtTENBM.Text = txtSOGV.Text = "";
            btnSuaBM.Enabled = btnXoaBM.Enabled = panelControl1.Enabled = false;
            txtTENBM.Select();
            Connection cn = new Connection();
            txtMABM.Text = cn.NextID("BOMON","MABM","BM");
            val = 1;
        }

        private void btnSuaBM_Click(object sender, EventArgs e)
        {
            btnThemBM.Enabled = btnXoaBM.Enabled = false;
            txtMABM.ReadOnly = true;
            txtTENBM.Select();
            val = 2;
        }

        private void btnXoaBM_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn xóa bộ môn này?", "Verify!", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                int cur = dataBomon.CurrentRow.Index;
                DataRow row = cn.LoadTable(sql).Rows[cur];
                DAL_BOMON bm = new DAL_BOMON(row);
                DAO_BOMON daoBM = new DAO_BOMON();
                int check = daoBM.Delete_BM(bm);
                int index = cur == dataBomon.RowCount - 1 ? dataBomon.RowCount - 2 : cur;
                if (check != 0)
                {
                    dataBomon.DataSource = cn.LoadTable(sql);
                    if (dataBomon.RowCount > 1) dataBomon.CurrentCell = dataBomon.Rows[index].Cells[0];
                }
                else MessageBox.Show("Không xóa được học phần này!", "Thông báo!");
                hienthiBomon();
            }
        }

        private void btnLuuBM_Click(object sender, EventArgs e)
        {
            DAL_BOMON bm = new DAL_BOMON(txtMABM.Text, txtTENBM.Text, Convert.ToInt32(txtSOGV.Text), cbBCN.SelectedValue.ToString());
            DAO_BOMON daoBM = new DAO_BOMON();
            int index = val == 1 ? dataBomon.RowCount : dataBomon.CurrentRow.Index;
            int check = 0;
            if (val == 1) check = daoBM.Insert_BM(bm);
            else if (val == 2) check = daoBM.Update_BM(bm);
            else return;
            if (check != 0)
            {
                dataBomon.DataSource = cn.LoadTable(sql);
                dataBomon.CurrentCell = dataBomon.Rows[index].Cells[0];
            }
            else MessageBox.Show("Không thực hiện được thao tác!", "Thông báo!");
            hienthiBomon();
            txtMABM.ReadOnly = false;
            panelControl1.Enabled = btnThemBM.Enabled = btnSuaBM.Enabled = btnXoaBM.Enabled = true;
            val = 0;
        }

        private void btnHuyBM_Click(object sender, EventArgs e)
        {
            btnThemBM.Enabled = btnSuaBM.Enabled = btnXoaBM.Enabled = true;
            if (txtsearch.Text != "") txtsearch.Text = "";
            hienthiBomon();
            txtMABM.ReadOnly = false;
        }
    }
}
