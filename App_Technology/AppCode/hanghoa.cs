using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace App_Technology.AppCode
{
    public class hanghoa
    {
        private string masp;
        private string tensp;
        private string madm;
        private DateTime ngaysx;
        private string mota;
        private string donvi;
        private string hinhanh;
        private int soluong;
        private float dongia;
        private string theloai;
        private string hangsx;

        public hanghoa(string masp, string tensp, string madm, DateTime ngaysx, string mota, string donvi, string hinhanh, int soluong, float dongia, string theloai, string hangsx)
        {
            this.masp = masp;
            this.tensp = tensp;
            this.madm = madm;
            this.ngaysx = ngaysx;
            this.mota = mota;
            this.donvi = donvi;
            this.hinhanh = hinhanh;
            this.soluong = soluong;
            this.dongia = dongia;
            this.theloai = theloai;
            this.hangsx = hangsx;
        }

        public string Masp { get => masp; set => masp = value; }
        public string Tensp { get => tensp; set => tensp = value; }
        public string Madm { get => madm; set => madm = value; }
        public DateTime Ngaysx { get => ngaysx; set => ngaysx = value; }
        public string Mota { get => mota; set => mota = value; }
        public string Donvi { get => donvi; set => donvi = value; }
        public string Hinhanh { get => hinhanh; set => hinhanh = value; }
        public int Soluong { get => soluong; set => soluong = value; }
        public float Dongia { get => dongia; set => dongia = value; }
        public string Theloai { get => theloai; set => theloai = value; }
        public string Hangsx { get => hangsx; set => hangsx = value; }
    }
}