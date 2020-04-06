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
    public partial class ucTKB : DevExpress.XtraEditors.XtraUserControl
    {
        private Connection cn = new Connection();
        private ConnectionExcell cne = new ConnectionExcell();
        private DAO_TKB dao_TKB = new DAO_TKB();
        private string bomon = "", namebm = "";
        private int pq = 0;
        public ucTKB(int pq)
        {
            InitializeComponent();
            this.pq = pq;
            if (pq == 0 || bomon == "") btnUPDATE.Enabled = false;
        }
        private void hienthi()
        {
            RepositoryItemLookUpEdit rilop = new RepositoryItemLookUpEdit();
            rilop.DataSource = cn.LoadTable("select MALOP, TENLOP from LOPHOCPHAN");
            rilop.ValueMember = "MALOP";
            rilop.DisplayMember = "TENLOP";
            for(int i = 1; i<= 15; i++)
            {
                dataTKB.Columns["Tuần " + i.ToString()].ColumnEdit = rilop;
            }
        }
        private void btnCNM_Click(object sender, EventArgs e)
        {
            if (txtLink.Text == "")
            {
                MessageBox.Show("Bạn chưa chọn đường dẫn", "Thông báo!");
                return;
            }
            bomon = "Công nghệ mạng"; namebm = "CNM";
            lbBM.Text = "Bộ môn " + bomon;
            gridTKB.DataSource = cne.ImportExcel(txtLink.Text, namebm);
            //hienthi();
            if (pq == 1 && bomon != "") btnUPDATE.Enabled = true;
        }

        private void btnATTT_Click(object sender, EventArgs e)
        {
            if (txtLink.Text == "")
            {
                MessageBox.Show("Bạn chưa chọn đường dẫn", "Thông báo!");
                return;
            }
            bomon = "An toàn thông tin"; namebm = "ATTT";
            lbBM.Text = "Bộ môn " + bomon;
            gridTKB.DataSource = cne.ImportExcel(txtLink.Text, namebm);
            //hienthi();
            if (pq == 1 && bomon != "") btnUPDATE.Enabled = true;
        }

        private void btnHTTT_Click(object sender, EventArgs e)
        {
            if (txtLink.Text == "")
            {
                MessageBox.Show("Bạn chưa chọn đường dẫn", "Thông báo!");
                return;
            }
            bomon = "Hệ thống thông tin"; namebm = "HTTT";
            lbBM.Text = "Bộ môn " + bomon;
            gridTKB.DataSource = cne.ImportExcel(txtLink.Text, namebm);
            // hienthi();
            if (pq == 1 && bomon != "") btnUPDATE.Enabled = true;
        }

        private void btnCNPM_Click(object sender, EventArgs e)
        {
            if (txtLink.Text == "")
            {
                MessageBox.Show("Bạn chưa chọn đường dẫn", "Thông báo!");
                return;
            }
            bomon = "Công nghệ phần mềm"; namebm = "CNPM";
            lbBM.Text = "Bộ môn " + bomon;
            gridTKB.DataSource = cne.ImportExcel(txtLink.Text, namebm);
            // hienthi();
            if (pq == 1 && bomon != "") btnUPDATE.Enabled = true;
        }

        private void btnKHMT_Click(object sender, EventArgs e)
        {
            if (txtLink.Text == "")
            {
                MessageBox.Show("Bạn chưa chọn đường dẫn", "Thông báo!");
                return;
            }
            bomon = "Khoa học máy tính"; namebm = "KHMT";
            lbBM.Text = "Bộ môn " + bomon;
            gridTKB.DataSource = cne.ImportExcel(txtLink.Text, namebm);
            //hienthi();
            if (pq == 1 && bomon != "") btnUPDATE.Enabled = true;
        }

        private void btnTOAN_Click(object sender, EventArgs e)
        {
            if (txtLink.Text == "")
            {
                MessageBox.Show("Bạn chưa chọn đường dẫn", "Thông báo!");
                return;
            }
            bomon = "Toán"; namebm = "TOAN";
            lbBM.Text = "Bộ môn " + bomon;
            gridTKB.DataSource = cne.ImportExcel(txtLink.Text, namebm);
            //hienthi();
            if (pq == 1 && bomon != "") btnUPDATE.Enabled = true;
        }

        private void btnTTMT_Click(object sender, EventArgs e)
        {
            if (txtLink.Text == "")
            {
                MessageBox.Show("Bạn chưa chọn đường dẫn", "Thông báo!");
                return;
            }
            bomon = "Trung tâm máy tính"; namebm = "TTMT";
            lbBM.Text = "Bộ môn " + bomon;
            gridTKB.DataSource = cne.ImportExcel(txtLink.Text, namebm);
            //hienthi();
            if (pq == 1 && bomon != "") btnUPDATE.Enabled = true;
        }

        private void btnBrowse_Click(object sender, EventArgs e)
        {
            // Browse đến file cần import
            OpenFileDialog ofd = new OpenFileDialog();
            // Lấy đường dẫn file import vừa chọn
            txtLink.Text = ofd.ShowDialog() == DialogResult.OK ? ofd.FileName : "";
        }

        private void btnUPDATE_Click(object sender, EventArgs e)
        {
            int dem = 0;
            try
            {
                int check = dao_TKB.Delete_TKB(bomon);
                DataTable dt = cne.ImportExcel(@"E:\C#\Hoc C#\Winform\Thời khóa biểu.xlsx", namebm);
                DAL_TKB tkb;
                string thu = "", kip = "", tiet = "", malop = "";
                foreach(DataRow row in dt.Rows)
                {
                    if (row["Thứ"].ToString() != "") thu = row["Thứ"].ToString();
                    if (row["Kíp học"].ToString() != "") kip = row["Kíp học"].ToString();
                    if (row["Tiết"].ToString() != "") tiet = row["Tiết"].ToString();
                    for (int i = 1; i <= 15; i++)
                    {
                        if(row["Tuần " + i.ToString()].ToString() != "")
                        {
                            malop = row["Tuần " + i.ToString()].ToString();
                            tkb = new DAL_TKB(malop, thu, "Tuần " + i.ToString(), kip, tiet);
                            try
                            {
                                int check2 = dao_TKB.Insert_TKB(tkb);
                                if (check2 == 0)
                                {
                                    MessageBox.Show("Không thêm được " + row["Tuần " + i.ToString()].ToString());
                                    dem++;
                                    break;
                                }
                            }
                            catch
                            {
                                MessageBox.Show("Lỗi cập nhật " + row["Tuần " + i.ToString()].ToString());
                                dem++;
                            }
                        }
                    }
                }
            }
            catch
            {
                MessageBox.Show("Không xóa được thông tin cũ!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                dem++;
            }
            finally
            {
                if (dem == 0) MessageBox.Show("Cập nhật thành công!", "Thông báo", MessageBoxButtons.OK);
            }
        }
        
    }
}
