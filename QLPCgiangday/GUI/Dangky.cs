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
    public partial class Dangky : DevExpress.XtraEditors.XtraForm
    {
        private Connection cn = new Connection();
        public Dangky()
        {
            InitializeComponent();
        }

        private void btndky_Click(object sender, EventArgs e)
        {
            DataTable t = cn.LoadTable("select username from TAIKHOAN ");
            int kt = 0;
            foreach (DataRow item in t.Rows)
            {
                if (txtusername.Text == item["username"].ToString())
                {
                    kt = 1;
                    break;
                }
            }
            if (txtpass.Text == txtxn.Text && kt == 0)
            {
                string[] para = new string[3] { "user", "@ma", "@pass" };
                object[] values = new object[3] { txtusername.Text, txtma.Text, txtpass.Text };
                int check = 0;
                check = cn.Excute_Sql("themTK", CommandType.StoredProcedure, para, values);
                if (check > 0)
                {
                    if (MessageBox.Show("Thêm thành công!", "Thông báo!", MessageBoxButtons.OK) == DialogResult.OK)
                    {
                        this.Close();
                        return;
                    }
                }
            }
            if (kt == 1) MessageBox.Show("Tên tài khoản đã tồn tại!", "Thông báo!", MessageBoxButtons.OK, MessageBoxIcon.Error);
            if (kt == 0) MessageBox.Show("Mật khẩu xác nhận lại không đúng!", "Thông báo!", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        private void btnthoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}