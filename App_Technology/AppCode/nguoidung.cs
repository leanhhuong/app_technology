using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace App_Technology.AppCode
{
    public class nguoidung
    {
        private int userid;
        private string hoten;
        private string email;
        private string taikhoan;
        private string matkhau;
        private int role;

        public nguoidung(int userid,string hoten, string email, string taikhoan, string matkhau, int role)
        {
            this.userid = userid;
            this.hoten = hoten;
            this.taikhoan = taikhoan;
            this.matkhau = matkhau;
            this.role = role;
            this.email = email;
        }

        public int Userid { get => userid; set => userid = value; }
        public string Hoten { get => hoten; set => hoten = value; }
        public string Email { get => email; set => email = value; }
        public string Taikhoan { get => taikhoan; set => taikhoan = value; }
        public string Matkhau { get => matkhau; set => matkhau = value; }
        public int Role { get => role; set => role = value; }
    }
}