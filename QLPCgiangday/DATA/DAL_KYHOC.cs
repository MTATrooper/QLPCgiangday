using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace QLPCgiangday.DATA
{
    class DAL_KYHOC
    {
        private string _MAGV;
        private string _MAHH;
        private string _MACV;
        private string _TENKY;

        public string MAGV
        {
            get
            {
                return _MAGV;
            }

            set
            {
                _MAGV = value;
            }
        }

        public string MAHH
        {
            get
            {
                return _MAHH;
            }

            set
            {
                _MAHH = value;
            }
        }

        public string MACV
        {
            get
            {
                return _MACV;
            }

            set
            {
                _MACV = value;
            }
        }

        public string TENKY
        {
            get
            {
                return _TENKY;
            }

            set
            {
                _TENKY = value;
            }
        }
        public DAL_KYHOC(string magv, string mahh, string macv, string tenky)
        {
            MAGV = magv;
            MAHH = mahh;
            MACV = macv;
            TENKY = tenky;
        }
        public DAL_KYHOC(DataRow row)
        {
            MAGV = row["MAGV"].ToString();
            MAHH = row["MACD"].ToString();
            MACV = row["MACV"].ToString();
            TENKY = row["TENKY"].ToString();
        }
    }
}
