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

namespace QLPCgiangday.GUI
{
    public partial class Info : DevExpress.XtraEditors.XtraUserControl
    {
        private string ma = "";
        private Connection cn = new Connection();
        public Info(string ma)
        {
            InitializeComponent();
            this.ma = ma;
        }

        private void Info_Load(object sender, EventArgs e)
        {
            DataTable dt = cn.LoadTable("Select * from GIAOVIEN where MAGV = '" + ma + "'");
            txtmagv.Text = ma;
            txthoten.Text = dt.Rows[0]["TENGV"].ToString();
            txtns.Text = dt.Rows[0]["NGAYSINH"].ToString();
            txtdiachi.Text = dt.Rows[0]["DIACHI"].ToString();
            txtsdt.Text = dt.Rows[0]["SDT"].ToString();
            txtbomon.Text = cn.LoadTable("select TENBM from BOMON bm, GIAOVIEN gv where bm.MABM = gv.MABM and MAGV = '"+ma+"'").Rows[0][0].ToString();
        }
    }
}
