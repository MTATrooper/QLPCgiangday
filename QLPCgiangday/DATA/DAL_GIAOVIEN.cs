using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace QLPCgiangday.DATA
{
    class DAL_GIAOVIEN
    {
        private string _magv;
        private string _tengv;
        private DateTime _ngaysinh;
        private string _SDT;
        private string _diachi;
        private string _maBM;

        public string Magv
        {
            get
            {
                return _magv;
            }

            set
            {
                _magv = value;
            }
        }

        public string Tengv
        {
            get
            {
                return _tengv;
            }

            set
            {
                _tengv = value;
            }
        }

        public DateTime Ngaysinh
        {
            get
            {
                return _ngaysinh;
            }

            set
            {
                _ngaysinh = value;
            }
        }

        public string SDT
        {
            get
            {
                return _SDT;
            }

            set
            {
                _SDT = value;
            }
        }

        public string Diachi
        {
            get
            {
                return _diachi;
            }

            set
            {
                _diachi = value;
            }
        }

        public string MaBM
        {
            get
            {
                return _maBM;
            }

            set
            {
                _maBM = value;
            }
        }
        public DAL_GIAOVIEN(DataRow row)
        {
            Magv = row["MAGV"].ToString();
            Tengv = row["TENGV"].ToString();
            Ngaysinh = Convert.ToDateTime(row["NGAYSINH"]);
            SDT = row["SDT"].ToString();
            Diachi = row["DIACHI"].ToString();
            MaBM = row["MABM"].ToString();
        }
        public DAL_GIAOVIEN(string ma, string ten, DateTime ns, string sdt, string diachi, string mabm)
        {
            Magv = ma;
            Tengv = ten;
            Ngaysinh = ns;
            SDT = sdt;
            Diachi = diachi;
            MaBM = mabm;
        }
    }
}
