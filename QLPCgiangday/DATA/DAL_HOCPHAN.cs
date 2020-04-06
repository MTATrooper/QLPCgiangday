using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace QLPCgiangday.DATA
{
    class DAL_HOCPHAN
    {
        private string _maHP;
        private string _tenHP;
        private int _SOTC;
        private int _soTiet;
        private string _maMH;

        public string MaHP
        {
            get
            {
                return _maHP;
            }

            set
            {
                _maHP = value;
            }
        }

        public string TenHP
        {
            get
            {
                return _tenHP;
            }

            set
            {
                _tenHP = value;
            }
        }

        public int SoTiet
        {
            get
            {
                return _soTiet;
            }

            set
            {
                _soTiet = value;
            }
        }

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

        public int SOTC
        {
            get
            {
                return _SOTC;
            }

            set
            {
                _SOTC = value;
            }
        }

        public DAL_HOCPHAN() { }
        public DAL_HOCPHAN(string ma, string ten, int sotc, int sotiet, string mamh)
        {
            MaHP = ma;
            TenHP = ten;
            SOTC = sotc;
            SoTiet = sotiet;
            MaMH = mamh;
        }
        public DAL_HOCPHAN(DataRow row)
        {
            MaHP = row["MAHP"].ToString();
            TenHP = row["TENHP"].ToString();
            SOTC = Convert.ToInt32(row["SOTC"]);
            SoTiet = Convert.ToInt32(row["SOTIET"]);
            MaMH = row["MAMH"].ToString();
        }
    }
}
