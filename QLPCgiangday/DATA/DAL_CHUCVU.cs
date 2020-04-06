using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace QLPCgiangday.DATA
{
    class DAL_CHUCVU
    {
        private string _maCV;
        private string _tenCV;
        private int _hesogiamtai;

        public string MaCV
        {
            get
            {
                return _maCV;
            }

            set
            {
                _maCV = value;
            }
        }

        public string TenCV
        {
            get
            {
                return _tenCV;
            }

            set
            {
                _tenCV = value;
            }
        }

        public int Hesogiamtai
        {
            get
            {
                return _hesogiamtai;
            }

            set
            {
                _hesogiamtai = value;
            }
        }

        public DAL_CHUCVU(string ma, string ten, int heso)
        {
            MaCV = ma;
            TenCV = ten;
            Hesogiamtai = heso;
        }
        public DAL_CHUCVU(DataRow row)
        {
            MaCV = row["MACV"].ToString();
            TenCV = row["TENCV"].ToString();
            Hesogiamtai = Convert.ToInt16(row["HESOGIAMTAI"]);
        }
    }
}
