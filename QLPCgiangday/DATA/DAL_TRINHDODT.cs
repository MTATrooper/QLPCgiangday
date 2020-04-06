using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace QLPCgiangday.DATA
{
    class DAL_TRINHDODT
    {
        private string _MATD;
        private string _TENTD;

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

        public string TENTD
        {
            get
            {
                return _TENTD;
            }

            set
            {
                _TENTD = value;
            }
        }
        public DAL_TRINHDODT(string ma, string ten)
        {
            MATD = ma;
            TENTD = ten;
        } 
        public DAL_TRINHDODT(DataRow row)
        {
            MATD = row["MATD"].ToString();
            TENTD = row["TENTD"].ToString();
        }
    }
}
