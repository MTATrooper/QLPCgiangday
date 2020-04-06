using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace QLPCgiangday.DATA
{
    class DAL_MONHOC
    {
        private string _maMH;
        private string _tenMH;
        private string _maBM;

        public string MaMH
        {
            get
            {
                return _maMH;
            }

            set
            {
                _maMH = value;
            }
        }

        public string TenMH
        {
            get
            {
                return _tenMH;
            }

            set
            {
                _tenMH = value;
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
        public DAL_MONHOC(DataRow row)
        {
            MaMH = row["MAMH"].ToString();
            TenMH = row["TENMH"].ToString();
            MaBM = row["MABM"].ToString();
        }
        public DAL_MONHOC(string ma, string ten, string mabm)
        {
            MaMH = ma;
            TenMH = ten;
            MaBM = mabm;
        }
    }
}
