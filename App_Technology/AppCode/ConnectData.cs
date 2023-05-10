using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace App_Technology.AppCode
{
    public class ConnectData
    {
        SqlConnection conn;
        public void MoDB()
        {
            string dc = @"Data Source=3E0\SQLEXPRESS;Initial Catalog=quanlyhanghoa;Integrated Security=True";
            conn = new SqlConnection(dc);
            conn.Open();

        }
        public void closeDB()
        {
            conn.Close();
        }
        //phuong thuc tra ve list khach hang
        public DataTable TraDSHH()
        {
            MoDB();
            String sql = "Select * from hanghoa";
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            closeDB();
            return dt;
        }

        public DataTable TraDSHH(string theloai)
        {
            MoDB();
            String sql = "Select * from hanghoa where Theloai='" + theloai + "'";
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            closeDB();
            return dt;
        }

        public DataTable TraDSH(string theloai, string hangsx)
        {
            MoDB();
            String sql = "Select * from hanghoa where Theloai='" + theloai + "' AND HangSX='" + hangsx + "'";
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            closeDB();
            return dt;
        }

        public DataTable TraDetail(String masp)
        {
            MoDB();
            String sql = "Select * from hanghoa where MaSP='" + masp + "'";
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            closeDB();
            return dt;
        }
        public Boolean KiemtraMa(String MaSP)
        {
            MoDB();
            String sql = "select * from hanghoa where MaSP = '" + MaSP + "'";
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            closeDB();
            if (dt.Rows.Count > 0) { return false; }
            else { return true; }
        }
        // kiem tra  dang nhap
        public Boolean KiemtraDN(String tk, String mk)
        {
            MoDB();
            String sql = "Select * from nguoidung where Account='" + tk + "' AND Password='" + mk + "'";
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            closeDB();
            if (dt.Rows.Count > 0) { return false; }
            else { return true; }
        }
        public Boolean ThemHH(hanghoa hh)
        {
            if (KiemtraMa(hh.Masp) == false)
            {
                return false;
            }
            else
            {
                MoDB();
                String sql = "Insert into hanghoa values(@MaSP,@TenSP,@MaDM,@NgaySX,@Mota,@Donvi,@Hinhanh, @Soluong, @Dongia, @Theloai, @HangSX)";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("MaSP", hh.Masp);
                cmd.Parameters.AddWithValue("TenSP", hh.Tensp);
                cmd.Parameters.AddWithValue("MaDM", hh.Madm);
                cmd.Parameters.AddWithValue("NgaySX", hh.Ngaysx);
                cmd.Parameters.AddWithValue("Mota", hh.Mota);
                cmd.Parameters.AddWithValue("Donvi", hh.Donvi);
                cmd.Parameters.AddWithValue("Hinhanh", hh.Hinhanh);
                cmd.Parameters.AddWithValue("Soluong", hh.Soluong);
                cmd.Parameters.AddWithValue("Dongia", hh.Dongia);
                cmd.Parameters.AddWithValue("Theloai", hh.Theloai);
                cmd.Parameters.AddWithValue("Hangsx", hh.Hangsx);
                cmd.ExecuteNonQuery();
                closeDB();
                return true;
            }
        }

        public Boolean SuaHH(hanghoa hh)
        {
            MoDB();
            String sql = "UPDATE hanghoa SET TenSP=@tenSP, MaDM=@maDM, NgaySX=@ngaySX, Mota=@mota, Donvi=@donvi, Hinhanh=@hinhanh, Soluong=@soluong, Dongia=@dongia, Theloai=@theloai, HangSX=@hangsx WHERE MaSP=@maSP";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("maSP", hh.Masp);
            cmd.Parameters.AddWithValue("tenSP", hh.Tensp);
            cmd.Parameters.AddWithValue("maDM", hh.Madm);
            cmd.Parameters.AddWithValue("ngaySX", hh.Ngaysx);
            cmd.Parameters.AddWithValue("mota", hh.Mota);
            cmd.Parameters.AddWithValue("donvi", hh.Donvi);
            cmd.Parameters.AddWithValue("hinhanh", hh.Hinhanh);
            cmd.Parameters.AddWithValue("soluong", hh.Soluong);
            cmd.Parameters.AddWithValue("dongia", hh.Dongia);
            cmd.Parameters.AddWithValue("theloai", hh.Theloai);
            cmd.Parameters.AddWithValue("hangsx", hh.Hangsx);
            cmd.ExecuteNonQuery();
            closeDB();
            return true;
        }

        public Boolean XoaHH(hanghoa MaSP)
        {
            MoDB();
            string sql = "delete from hanghoa where MaSP=@manv";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("manv", MaSP);
            cmd.ExecuteNonQuery();
            closeDB();
            return true;
        }

        public DataTable timkiem(String TenSp)
        {
            MoDB();
            String sql = "Select * from hanghoa where TenSP like'%" + TenSp + "%'";
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            closeDB();
            return dt;

        }

        //tra chi tiet san phan khi biet ma san pham

        public DataTable TraChitet(String MaSP)
        {
            MoDB();
            string sql = "select * from hanghoa where MaSP = '" + MaSP + "'";
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            closeDB();
            return dt;
        }

        //nguoi dung

        public Boolean KiemTaikhoan(String tk)
        {
            MoDB();
            String sql = "select * from nguoidung where Account = '" + tk + "'";
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            closeDB();
            if (dt.Rows.Count > 0) { return false; }
            else { return true; }
        }

        public Boolean ThemNguoidung(nguoidung user)
        {
            if (KiemTaikhoan(user.Taikhoan) == false)
            {
                return false;
            }
            else
            {
                MoDB();
                String sql = "Insert into nguoidung values(@UserId, @FullName, @Email ,@Account,@Password,@RoleId)";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("UserId", user.Userid);
                cmd.Parameters.AddWithValue("FullName", user.Hoten);
                cmd.Parameters.AddWithValue("Email", user.Email);
                cmd.Parameters.AddWithValue("Account", user.Taikhoan);
                cmd.Parameters.AddWithValue("Password", user.Matkhau);
                cmd.Parameters.AddWithValue("RoleId", user.Role);
                cmd.ExecuteNonQuery();
                closeDB();
                return true;
            }
        }
    }
}