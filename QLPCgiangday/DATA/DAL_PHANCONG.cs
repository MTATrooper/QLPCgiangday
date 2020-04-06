using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace QLPCgiangday.DATA
{
    class DAL_PHANCONG
    {
        private string _MALOP;
        private string _MAGV1;
        private string _MAGV2;
        private string _DIADIEM;
        private string _KIPHOC;
        private int _sotiet;
        private string kyhoc;
        private string namhoc;

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

        public string MAGV1
        {
            get
            {
                return _MAGV1;
            }

            set
            {
                _MAGV1 = value;
            }
        }

        public string MAGV2
        {
            get
            {
                return _MAGV2;
            }

            set
            {
                _MAGV2 = value;
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

        public string DIADIEM
        {
            get
            {
                return _DIADIEM;
            }

            set
            {
                _DIADIEM = value;
            }
        }

        public int Sotiet
        {
            get
            {
                return _sotiet;
            }

            set
            {
                _sotiet = value;
            }
        }

        public string Kyhoc
        {
            get
            {
                return kyhoc;
            }

            set
            {
                kyhoc = value;
            }
        }

        public string Namhoc
        {
            get
            {
                return namhoc;
            }

            set
            {
                namhoc = value;
            }
        }

        public DAL_PHANCONG(string malop, string magv1, string magv2, string kip, string diadiem, int sotiet, string ky, string nam)
        {
            MALOP = malop;
            MAGV1 = magv1;
            MAGV2 = magv2;
            DIADIEM = diadiem;
            KIPHOC = kip;
            Sotiet = sotiet;
            Kyhoc = ky;
            Namhoc = nam;
        }
        public DAL_PHANCONG(DataRow row)
        {
            MALOP = row["Lớp"].ToString();
            MAGV1 = row["Giáo viên"].ToString();
            MAGV2 = row["F13"].ToString();
            DIADIEM = row["Địa điểm"].ToString();
            KIPHOC = row["Kíp học"].ToString();
            Sotiet = Convert.ToInt32(row["Số tiết"]);
        }
    }
}
