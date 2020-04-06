using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using QLPCgiangday.GUI;

namespace QLPCgiangday
{
    public partial class FormMain : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        private int pq = 0;
        private string MAGV = "";
        private Connection cn = new Connection();
        public FormMain(int pq, string magv)
        {
            InitializeComponent();
            this.pq = pq;
            this.MAGV = magv;
            DevExpress.LookAndFeel.DefaultLookAndFeel themes = new DevExpress.LookAndFeel.DefaultLookAndFeel();
            themes.LookAndFeel.SkinName = "Springtime";
            labeluser.Text = cn.LoadTable("Select TENGV from GIAOVIEN where MAGV = '" + MAGV + "'").Rows[0][0].ToString();
        }
        private void btnBM_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            panelMain.Controls.Clear();
            ucBomon bomon = new ucBomon(pq);
            panelMain.Controls.Add(bomon);
            bomon.Dock = DockStyle.Fill;
        }

        private void barbtnGV_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            panelMain.Controls.Clear();
            ucGIAOVIEN giao_vien = new ucGIAOVIEN(pq);
            panelMain.Controls.Add(giao_vien);
            giao_vien.Dock = DockStyle.Fill;
        }

        private void barbtnMH_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            panelMain.Controls.Clear();
            ucMONHOC monhoc = new ucMONHOC(pq);
            panelMain.Controls.Add(monhoc);
            monhoc.Dock = DockStyle.Fill;
        }

        private void barbtnHOCPHAN_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            panelMain.Controls.Clear();
            ucHOCPHAN hocphan = new ucHOCPHAN(pq);
            panelMain.Controls.Add(hocphan);
            hocphan.Dock = DockStyle.Fill;
        }

        private void barHH_CV_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            panelMain.Controls.Clear();
            ucHH_CV hh_cv = new ucHH_CV(pq);
            panelMain.Controls.Add(hh_cv);
            hh_cv.Dock = DockStyle.Fill;
        }

        private void barLopHP_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            panelMain.Controls.Clear();
            ucLOPHP lop = new ucLOPHP(pq);
            panelMain.Controls.Add(lop);
            lop.Dock = DockStyle.Fill;
        }

        private void barTD_HDT_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            panelMain.Controls.Clear();
            ucTD_HEDT TD_HE = new ucTD_HEDT(pq);
            panelMain.Controls.Add(TD_HE);
            TD_HE.Dock = DockStyle.Fill;
        }

        private void barButtonItem14_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            panelMain.Controls.Clear();
            ucTKB tkb = new ucTKB(pq);
            panelMain.Controls.Add(tkb);
            tkb.Dock = DockStyle.Fill;
        }

        private void barCNM_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            panelMain.Controls.Clear();
            ucImportCNM CNM = new ucImportCNM();
            panelMain.Controls.Add(CNM);
            CNM.Dock = DockStyle.Fill;
        }

        private void barATTT_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            panelMain.Controls.Clear();
            ucImportATTT ATTT = new ucImportATTT();
            panelMain.Controls.Add(ATTT);
            ATTT.Dock = DockStyle.Fill;
        }

        private void barHTTT_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            panelMain.Controls.Clear();
            ucImportHTTT HTTT = new ucImportHTTT();
            panelMain.Controls.Add(HTTT);
            HTTT.Dock = DockStyle.Fill;
        }

        private void barKHMT_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            panelMain.Controls.Clear();
            ucImportKHMT KHMT = new ucImportKHMT();
            panelMain.Controls.Add(KHMT);
            KHMT.Dock = DockStyle.Fill;
        }

        private void barCNPM_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            panelMain.Controls.Clear();
            ucImportCNPM CNPM = new ucImportCNPM();
            panelMain.Controls.Add(CNPM);
            CNPM.Dock = DockStyle.Fill;
        }

        private void barTOAN_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            panelMain.Controls.Clear();
            ucImportTOAN TOAN = new ucImportTOAN();
            panelMain.Controls.Add(TOAN);
            TOAN.Dock = DockStyle.Fill;
        }

        private void barTTMT_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            panelMain.Controls.Clear();
            ucImportTTMT TTMT = new ucImportTTMT();
            panelMain.Controls.Add(TTMT);
            TTMT.Dock = DockStyle.Fill;
        }

        private void barKYHOC_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            panelMain.Controls.Clear();
            ucKYHOC KH = new ucKYHOC(pq);
            panelMain.Controls.Add(KH);
            KH.Dock = DockStyle.Fill;
        }

        private void barPC_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            panelMain.Controls.Clear();
            ucPHANCONG PC = new ucPHANCONG(pq);
            panelMain.Controls.Add(PC);
            PC.Dock = DockStyle.Fill;
        }

        private void barChangepass_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            panelMain.Controls.Clear();
            Changepass CP = new Changepass(MAGV);
            panelMain.Controls.Add(CP);
            CP.Dock = DockStyle.Fill;
        }

        private void barButtonItem4_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            panelMain.Controls.Clear();
            Changepass CP = new Changepass(MAGV);
            panelMain.Controls.Add(CP);
            CP.Dock = DockStyle.Fill;
        }

        private void barInfo_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            panelMain.Controls.Clear();
            Info If = new Info(MAGV);
            panelMain.Controls.Add(If);
            If.Dock = DockStyle.Fill;
        }

        private void barLogout_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            this.Close();
        }

        private void FormMain_Load(object sender, EventArgs e)
        {
            timer1.Start();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            labeltime.Text = DateTime.Now.ToLongTimeString();
            labeldate.Text = DateTime.Now.ToLongDateString();
        }
    }
}
