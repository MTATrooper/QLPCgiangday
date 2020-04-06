using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace QLPCgiangday.DATA
{
    class DAL_CHUCDANH
    {
        private string _MaCD;
        private string _TenCD;
        private int _dmgd;

        public int Dmgd
        {
            get
            {
                return _dmgd;
            }

            set
            {
                _dmgd = value;
            }
        }

        public string MaCD
        {
            get
            {
                return _MaCD;
            }

            set
            {
                _MaCD = value;
            }
        }

        public string TenCD
        {
            get
            {
                return _TenCD;
            }

            set
            {
                _TenCD = value;
            }
        }

        public DAL_CHUCDANH() { }
        public DAL_CHUCDANH(string ma, string ten, int dmgd)
        {
            MaCD = ma;
            TenCD = ten;
            Dmgd = dmgd;
        }
        public DAL_CHUCDANH(DataRow row)
        {
            MaCD = row["MAHH"].ToString();
            TenCD = row["TENHH"].ToString();
            Dmgd = Convert.ToInt32(row["DMGIANGDAY"]);
        }
    }
}
