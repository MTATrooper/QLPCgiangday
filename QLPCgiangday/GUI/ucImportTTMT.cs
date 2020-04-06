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
    public partial class ucImportTTMT : DevExpress.XtraEditors.XtraUserControl
    {
        public ucImportTTMT()
        {
            InitializeComponent();
        }

        private void ucImportTTMT_Load(object sender, EventArgs e)
        {
            ConnectionExcell cne = new ConnectionExcell();
            dataPC_TTMT.DataSource = cne.ImportExcel(@"E:\C#\Hoc C#\Winform\QLPCgiangday\K12_Bao day_Khoa K12_rr.xls", "BM_74");
        }
    }
}
