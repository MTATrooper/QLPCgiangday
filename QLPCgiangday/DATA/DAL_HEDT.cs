using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace QLPCgiangday.DATA
{
    class DAL_HEDT
    {
        private string _MAHE;
        private string _TENHE;

        public string MAHE
        {
            get
            {
                return _MAHE;
            }

            set
            {
                _MAHE = value;
            }
        }

        public string TENHE
        {
            get
            {
                return _TENHE;
            }

            set
            {
                _TENHE = value;
            }
        }
        public DAL_HEDT(string ma, string ten)
        {
            MAHE = ma;
            TENHE = ten;
        }
        public DAL_HEDT(DataRow row)
        {
            MAHE = row["MAHEDT"].ToString();
            TENHE = row["TENHEDT"].ToString();
        }
    }
}
