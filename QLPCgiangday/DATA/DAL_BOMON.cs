using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace QLPCgiangday.DATA
{
    class DAL_BOMON
    {
        private string _MaBM;
        private string _TenBM;
        private int _Sogv;
        private string _MaCnBM;

        public string MaBM
        {
            get
            {
                return _MaBM;
            }

            set
            {
                _MaBM = value;
            }
        }

        public string TenBM
        {
            get
            {
                return _TenBM;
            }

            set
            {
                _TenBM = value;
            }
        }

        public int Sogv
        {
            get
            {
                return _Sogv;
            }

            set
            {
                _Sogv = value;
            }
        }

        public string MaCnBM
        {
            get
            {
                return _MaCnBM;
            }

            set
            {
                _MaCnBM = value;
            }
        }
        public DAL_BOMON(string ma, string ten, int sogv, string macn)
        {
            MaBM = ma;
            TenBM = ten;
            Sogv = sogv;
            MaCnBM = macn;
        }
        public DAL_BOMON(DataRow row)
        {
            MaBM = row["MABM"].ToString();
            TenBM = row["TENBM"].ToString();
            Sogv = Convert.ToInt32(row["SOGV"]);
            MaCnBM = row["MAChunhiem"].ToString();
        }
    }
}
