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
    public partial class ucImportCNM : DevExpress.XtraEditors.XtraUserControl
    {
        public ucImportCNM()
        {
            InitializeComponent();
        }

        private void ImportCNM_Load(object sender, EventArgs e)
        {
            ConnectionExcell cne = new ConnectionExcell();
            dataPC_CNM.DataSource = cne.ImportExcel(@"E:\C#\Hoc C#\Winform\QLPCgiangday\K12_Bao day_Khoa K12_rr.xls", "BM_73");
        }
    }
}
