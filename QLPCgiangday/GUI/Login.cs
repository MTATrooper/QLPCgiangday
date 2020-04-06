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
    public partial class Login : DevExpress.XtraEditors.XtraForm
    {
        private Connection cn = new Connection();
        private int pq = 0;
        public Login()
        {
            InitializeComponent();
            DevExpress.LookAndFeel.DefaultLookAndFeel themes = new DevExpress.LookAndFeel.DefaultLookAndFeel();
            themes.LookAndFeel.SkinName = "Springtime";
        }

        private void btnlogin_Click(object sender, EventArgs e)
        {
            string login = string.Format("Select * from TAIKHOAN where username = '{0}'", txtusername.Text);
            DataTable dt = cn.LoadTable(login);
            if(dt.Rows.Count == 0)
            {
                MessageBox.Show("Tên đăng nhập không đúng!", "Thông báo!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtusername.Select();
            }
            /*if (txtusername.Text != dt.Rows[0][0].ToString())
            {
                MessageBox.Show("Tên đăng nhập không đúng!", "Thông báo!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtusername.Select();
            }*/
            else if (txtpass.Text != dt.Rows[0][3].ToString())
            {
                MessageBox.Show("Mật khẩu đăng nhập không đúng!", "Thông báo!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtpass.Select();
            }
            else
            {
                string quyen = dt.Rows[0][2].ToString();
                if (quyen == "admin") pq = 1;
                if (quyen == "user") pq = 0;
                this.Hide();
                FormMain fm = new FormMain(pq, dt.Rows[0][1].ToString());
                fm.ShowDialog();
                txtusername.Text = txtpass.Text = "";
                this.Show();
            }
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnDK_Click(object sender, EventArgs e)
        {
            this.Hide();
            Dangky dk = new Dangky();
            dk.ShowDialog();
            txtusername.Text = txtpass.Text = "";
            this.Show();
        }
    }
}