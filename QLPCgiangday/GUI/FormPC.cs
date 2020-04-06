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

namespace QLPCgiangday.GUI
{
    public partial class FormPC : DevExpress.XtraEditors.XtraForm
    {
        private string MABM = "";
        private Connection cn = new Connection();
        public FormPC(string MABM)
        {
            InitializeComponent();
            this.MABM = MABM;
        }

        private void FormPC_Load(object sender, EventArgs e)
        {
            cbBGV1.DataSource = cn.LoadTable("Select MAGV, TENGV from GIAOVIEN where MABM = '" + MABM + "'");
            cbBGV1.ValueMember = "MAGV";
            cbBGV1.DisplayMember = "TENGV";
            cbBGV2.DataSource = cn.LoadTable("Select MAGV, TENGV from GIAOVIEN where MABM = '" + MABM + "'");
            cbBGV2.ValueMember = "MAGV";
            cbBGV2.DisplayMember = "TENGV";
        }
        public string GetGV1()
        {
            return cbBGV1.Text;
        }
        public string GetGV2()
        {
            return cbBGV2.Text;
        }
        public string GetMAGV1()
        {
            return cbBGV1.SelectedValue.ToString();
        }
        public string GetMAGV2()
        {
            return cbBGV2.SelectedValue.ToString();
        }
        private void btnOK_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}