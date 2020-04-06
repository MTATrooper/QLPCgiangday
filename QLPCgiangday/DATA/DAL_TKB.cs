using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace QLPCgiangday.DATA
{
    class DAL_TKB
    {
        private string _MALOP;
        private string _THU;
        private string _TUAN;
        private string _KIPHOC;
        private string _TIET;

        public string MALOP
        {
            get
            {
                return _MALOP;
            }

            set
            {
                _MALOP = value;
            }
        }

        public string THU
        {
            get
            {
                return _THU;
            }

            set
            {
                _THU = value;
            }
        }

        public string TUAN
        {
            get
            {
                return _TUAN;
            }

            set
            {
                _TUAN = value;
            }
        }

        public string KIPHOC
        {
            get
            {
                return _KIPHOC;
            }

            set
            {
                _KIPHOC = value;
            }
        }

        public string TIET
        {
            get
            {
                return _TIET;
            }

            set
            {
                _TIET = value;
            }
        }

        public DAL_TKB(string malop, string thu, string tuan, string kip, string tiet)
        {
            MALOP = malop;
            THU = thu;
            TUAN = tuan;
            KIPHOC = kip;
            TIET = tiet;
        }
        public DAL_TKB(DataRow row, int i, string thu, string kip)
        {
            MALOP = row["Tuần " + i.ToString()].ToString();
            THU = thu;
            TUAN = "Tuần " + i.ToString();
            KIPHOC = kip;
            TIET = row["Tiết"].ToString();
        }
    }
}
