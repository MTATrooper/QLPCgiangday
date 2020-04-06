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
    public partial class ucImportHTTT : DevExpress.XtraEditors.XtraUserControl
    {
        public ucImportHTTT()
        {
            InitializeComponent();
        }

        private void ucImportHTTT_Load(object sender, EventArgs e)
        {
            ConnectionExcell cne = new ConnectionExcell();
            dataPC_HTTT.DataSource = cne.ImportExcel(@"E:\C#\Hoc C#\Winform\QLPCgiangday\K12_Bao day_Khoa K12_rr.xls", "BM_03");
        }
    }
}
