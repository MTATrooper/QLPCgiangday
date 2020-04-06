using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.OleDb;
using System.Data;
using System.Windows.Forms;
using System.Text.RegularExpressions;
using Excel = Microsoft.Office.Interop.Excel;
//using DocumentFormat.OpenXml.Packaging;
using System.Data.SqlClient;

namespace QLPCgiangday
{
    class ConnectionExcell
    {
        public DataTable ImportExcel(string pathfile, string sheet)
        {
            DataTable dt = new DataTable();
            try
            {
                OleDbConnection cnn = new OleDbConnection();
                cnn.ConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + pathfile +
                     @"; Extended Properties=""Excel 8.0; HDR=Yes; IMEX=1; ImportMixedTypes=Text; TypeGuessRows=1""";
                OleDbCommand cmd = new OleDbCommand
                (
                    "SELECT * FROM [" + sheet + "$]", cnn
                );
                OleDbDataAdapter adt = new OleDbDataAdapter(cmd);
                adt.Fill(dt);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error!" + ex.Message);
            }
            return dt;
        }
        public void ExportExcel(DevExpress.XtraGrid.Views.Grid.GridView gridView3)
        {
            string filename = "";

            using (SaveFileDialog sfd = new SaveFileDialog() { Filter = "Excel Workbook|*.xlsx" })
            {
                if (sfd.ShowDialog() == DialogResult.OK)
                {
                    filename = sfd.FileName;
                }
            }

            try
            {
                Microsoft.Office.Interop.Excel.Application ExcelApp = new Microsoft.Office.Interop.Excel.Application();
                ExcelApp.Application.Workbooks.Add(Type.Missing);
                for (int i = 1; i < gridView3.Columns.Count + 1; i++)
                {
                    ExcelApp.Cells[1, i] = gridView3.Columns[i].Caption;

                }
                for (int i = 0; i < gridView3.RowCount - 1; i++)
                {
                    for (int j = 0; j < gridView3.Columns.Count; j++)
                    {
                        ExcelApp.Cells[i + 2, j + 1] = gridView3.Columns[j].ToString();
                    }
                }
                ExcelApp.ActiveWorkbook.SaveCopyAs(filename);
                ExcelApp.ActiveWorkbook.Saved = true;
                ExcelApp.Quit();
                MessageBox.Show("Ghi file thành công tại thư mục chạy ứng dụng");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        public void Xuat(DevExpress.XtraGrid.Views.Grid.GridView gridView3)
        {
            string filename = "";
            using (SaveFileDialog sfd = new SaveFileDialog() { Filter = "Excel Workbook|*.xls" })
            {
                if (sfd.ShowDialog() == DialogResult.OK)
                {
                    filename = sfd.FileName;
                }
            }
            Excel.Application xlApp;
            Excel.Workbook xlWorkBook;
            Excel.Worksheet xlWorkSheet;
            object misValue = System.Reflection.Missing.Value;
            //xlApp = (Excel.Application)System.Runtime.InteropServices.Marshal.GetActiveObject("Excel.Application");
            xlApp = new Excel.Application();
            xlWorkBook = xlApp.Workbooks.Add(misValue);
            xlWorkSheet = (Excel.Worksheet)xlWorkBook.Worksheets.get_Item(1);
            string data = "";
            for (int i = 0; i <= gridView3.RowCount - 1; i++)

            {

                for (int j = 1; j <= gridView3.Columns.Count; j++)

                {

                    if(j != 4) data = gridView3.GetRowCellValue(i, "F" + j.ToString()).ToString();
                    else data = gridView3.GetRowCellValue(i, "BẢNG PHÂN CÔNG GIẢNG DẠY").ToString();

                    xlWorkSheet.Cells[i + 1, j] = data;

                }

            }

            xlWorkBook.SaveAs(filename, Excel.XlFileFormat.xlWorkbookNormal, misValue, misValue, misValue, misValue, Excel.XlSaveAsAccessMode.xlExclusive, misValue, misValue, misValue, misValue, misValue);
            xlWorkBook.Close(true, misValue, misValue);
            xlApp.Quit();
            releaseObject(xlWorkSheet);
            releaseObject(xlWorkBook);
            releaseObject(xlApp);
            MessageBox.Show(filename);
        }
        private void releaseObject(object obj)

        {

            try

            {

                System.Runtime.InteropServices.Marshal.ReleaseComObject(obj);

                obj = null;

            }

            catch (Exception ex)

            {

                obj = null;

                MessageBox.Show("Exception Occured while releasing object " + ex.ToString());

            }

            finally

            {

                GC.Collect();

            }

        }
    }
}
