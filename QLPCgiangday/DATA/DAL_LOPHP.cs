using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace QLPCgiangday.DATA
{
    class DAL_LOPHP
    {
        private string _MALOP;
        private string _TENLOP;
        private int _QUANSO;
        private string _NNGD;
        private string _MAHP;
        private string _MATD;
        private string _MAHEDT;

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

        public string TENLOP
        {
            get
            {
                return _TENLOP;
            }

            set
            {
                _TENLOP = value;
            }
        }

        public int QUANSO
        {
            get
            {
                return _QUANSO;
            }

            set
            {
                _QUANSO = value;
            }
        }

        public string NNGD
        {
            get
            {
                return _NNGD;
            }

            set
            {
                _NNGD = value;
            }
        }

        public string MAHP
        {
            get
            {
                return _MAHP;
            }

            set
            {
                _MAHP = value;
            }
        }

        public string MATD
        {
            get
            {
                return _MATD;
            }

            set
            {
                _MATD = value;
            }
        }

        public string MAHEDT
        {
            get
            {
                return _MAHEDT;
            }

            set
            {
                _MAHEDT = value;
            }
        }

        public DAL_LOPHP(string malop, string tenlop, int qs, string nngd, string mahp, string matd, string mahe)
        {
            MALOP = malop;
            TENLOP = tenlop;
            QUANSO = qs;
            NNGD = nngd;
            MAHP = mahp;
            MATD = matd;
            MAHEDT = mahe;
        }
        public DAL_LOPHP(DataRow row)
        {
            MALOP = row["MALOP"].ToString();
            TENLOP = row["TENLOP"].ToString();
            QUANSO = Convert.ToInt32(row["QUANSO"]);
            NNGD = row["NGONNGUGD"].ToString();
            MAHP = row["MAHP"].ToString();
            MATD = row["MATD"].ToString();
            MAHEDT = row["MAHEDT"].ToString();
        }
    }
}
