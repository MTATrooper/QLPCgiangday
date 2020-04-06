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
    public partial class Changepass : DevExpress.XtraEditors.XtraUserControl
    {
        private Connection cn = new Connection();
        private string ma = "";
        public Changepass(string ma)
        {
            InitializeComponent();
            this.ma = ma;
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            string pass = cn.LoadTable("select Pass from TAIKHOAN where MaGV = '" + ma + "'").Rows[0][0].ToString();
            if (txtMKcu.Text == pass)
            {
                if (txtMKmoi.Text == txtXNMK.Text)
                {
                    string[] para = new string[2] { "@ma", "@pass" };
                    object[] values = new object[2] { ma, txtXNMK.Text };
                    int check = 0;
                    check = cn.Excute_Sql("suaTK", CommandType.StoredProcedure, para, values);
                    if (check > 0) MessageBox.Show("Sửa thành công!");
                }
                else
                {
                    MessageBox.Show("Mật khẩu xác nhận không trùng khớp!");
                    txtXNMK.Clear();
                }
            }
            else
            {
                MessageBox.Show("Mật khẩu cũ không đúng!");
                txtMKcu.Clear();
            }
        }
    }
}
