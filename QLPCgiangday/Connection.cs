using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace QLPCgiangday
{
    class Connection
    {
        private string strconn = @"Server = .; Database = QL_PCvaTDgiangday; Integrated Security=true";
        private SqlConnection conn;

        public SqlConnection Conn
        {
            get { return conn;}
            set { conn = value;}
        }
        public string Strconn
        {
            get { return strconn; }
            set { strconn = value; }
        }
        public Connection()
        {
            this.Conn = new SqlConnection(this.Strconn);
            this.Conn.Open();
        }

        public DataTable LoadTable(string sql)
        {
            SqlDataAdapter da = new SqlDataAdapter(sql, Conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        // Tạo mã tự sinh
        #region mã tự sinh
        private string GetLastID(string nametable, string namecollumn)
        {
            string sql = "Select TOP 1 " + namecollumn + " from " + nametable + " order by " + namecollumn + " Desc";
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(sql, Conn);
            try
            {
                da.Fill(dt);
                return dt.Rows[0][0].ToString();
            }
            catch
            {
                return "0000      ";
            }
        }
        public string NextID(string nametable, string namecollumn, string header)
        {
            string lastID = GetLastID(nametable,namecollumn);
            int nextID = int.Parse(lastID.Remove(0, header.Length)) + 1;
            int lengthnumber = lastID.Length;
            for (int i = 9; i >= 0; i--)
            {
                if (lastID[i] == ' ') lengthnumber--;
                else
                {
                    lengthnumber -= header.Length;
                    break;
                }
            }
            string kq = header;
            if (nextID < Math.Pow(10, lengthnumber))
            {
                int lengthnextID = nextID.ToString().Length;
                for (int i = 1; i <= lengthnumber - lengthnextID; i++)
                {
                    kq += "0";
                }
            }
            return kq + nextID.ToString();
        }
        #endregion  mã tự sinh
        public bool Execute(string query)
        {
            SqlCommand cmd = new SqlCommand(query, Conn);
            try
            {
                cmd.ExecuteNonQuery();
                return true;
            }
            catch { return false; }
        }
        public int Excute_Sql(string strQuery, CommandType cmdtype, string[] para, object[] values)
        {
            int efftectRecord = 0;
            SqlCommand sqlcmd = new SqlCommand();
            sqlcmd.CommandText = strQuery;
            sqlcmd.Connection = Conn;
            sqlcmd.CommandType = cmdtype;
            SqlParameter sqlpara;
            for (int i = 0; i < para.Length; i++)
            {
                sqlpara = new SqlParameter(para[i],values[i]);
                sqlcmd.Parameters.Add(sqlpara);
            }
            try
            {
                efftectRecord = sqlcmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error:" + ex.Message);
            }
            return efftectRecord;
        }
        public DataTable FillDataTable(string strQuery, CommandType cmdtype)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = strQuery;
                cmd.CommandType = cmdtype;
                cmd.Connection = Conn;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                da.Dispose();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
            return dt;
        }
        public DataTable FillDataTable(string strQuery, CommandType cmdtype, string[] para, object[] values)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = strQuery;
                cmd.CommandType = cmdtype;
                cmd.Connection = Conn;
                SqlParameter sqlpara;
                for (int i = 0; i < para.Length; i++)
                {
                    sqlpara = new SqlParameter();
                    sqlpara.ParameterName = para[i];
                    sqlpara.SqlValue = values[i];
                    cmd.Parameters.Add(sqlpara);
                }
                SqlDataAdapter sqlda = new SqlDataAdapter(cmd);
                sqlda.Fill(dt);
                sqlda.Dispose();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
            return dt;
        }
    }
}
