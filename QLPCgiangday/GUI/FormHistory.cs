using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using DevExpress.XtraEditors.Repository;

namespace QLPCgiangday.GUI
{
    public partial class FormHistory : DevExpress.XtraEditors.XtraForm
    {
        private Connection cn = new Connection();
        public FormHistory()
        {
            InitializeComponent();
        }

        private void hienthi()
        {
            RepositoryItemLookUpEdit rilop = new RepositoryItemLookUpEdit();
            rilop.DataSource = cn.LoadTable("select MALOP, TENLOP from LOPHOCPHAN");
            rilop.ValueMember = "MALOP";
            rilop.DisplayMember = "TENLOP";
            dataHis.Columns["MALOP"].ColumnEdit = rilop;
            RepositoryItemLookUpEdit rigv1 = new RepositoryItemLookUpEdit();
            rigv1.DataSource = cn.LoadTable("select MAGV, TENGV from GIAOVIEN");
            rigv1.ValueMember = "MAGV";
            rigv1.DisplayMember = "TENGV";
            dataHis.Columns["MAGV1"].ColumnEdit = rigv1;
            RepositoryItemLookUpEdit rigv2 = new RepositoryItemLookUpEdit();
            rigv2.DataSource = cn.LoadTable("select MAGV, TENGV from GIAOVIEN");
            rigv2.ValueMember = "MAGV";
            rigv2.DisplayMember = "TENGV";
            dataHis.Columns["MAGV2"].ColumnEdit = rigv2;
        }
        private void FormHistory_Load(object sender, EventArgs e)
        {
            cbBKY.DataSource = cn.LoadTable("Select distinct KYHOC from PHANCONG");
            cbBKY.DisplayMember = "KYHOC";
            cbBNAM.DataSource = cn.LoadTable("Select distinct NAMHOC from PHANCONG");
            cbBNAM.DisplayMember = "NAMHOC";
            string query1 = "Select MABM, TENBM from BOMON";
            cbBBM.DataSource = cn.LoadTable(query1);
            cbBBM.ValueMember = "MABM";
            cbBBM.DisplayMember = "TENBM";
            string query = string.Format("Select * from dbo.GetPhancong(N'{0}') where KYHOC = N'{1}' and NAMHOC = N'{2}'", 
                cbBBM.Text, cbBKY.Text, cbBNAM.Text);
            gridHis.DataSource = cn.LoadTable(query);
            hienthi();
        }

        private void cbBKY_SelectedIndexChanged(object sender, EventArgs e)
        {
            string query = string.Format("Select * from dbo.GetPhancong(N'{0}') where KYHOC = N'{1}' and NAMHOC = N'{2}'",
                cbBBM.Text, cbBKY.Text, cbBNAM.Text);
            gridHis.DataSource = cn.LoadTable(query);
            hienthi();
        }

        private void cbBNAM_SelectedIndexChanged(object sender, EventArgs e)
        {
            string query = string.Format("Select * from dbo.GetPhancong(N'{0}') where KYHOC = N'{1}' and NAMHOC = N'{2}'",
                cbBBM.Text, cbBKY.Text, cbBNAM.Text);
            gridHis.DataSource = cn.LoadTable(query);
            hienthi();
        }

        private void cbBBM_SelectedIndexChanged(object sender, EventArgs e)
        {
            string query = string.Format("Select * from dbo.GetPhancong(N'{0}') where KYHOC = N'{1}' and NAMHOC = N'{2}'",
                cbBBM.Text, cbBKY.Text, cbBNAM.Text);
            gridHis.DataSource = cn.LoadTable(query);
            hienthi();
        }
    }
}