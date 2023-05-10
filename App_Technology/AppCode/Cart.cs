using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace App_Technology.AppCode
{
    public class Cart
    {
        public void addCart(string masp, string tensp, string hinhanh, int soluong, int dongia)
        {
            DataTable dt = new DataTable();
            if (HttpContext.Current.Session["Cart"] == null)
            {
                //tao bang gom cac cot
                dt.Columns.Add("MaSP");
                dt.Columns.Add("TenSP");
                dt.Columns.Add("HinhAnh");
                dt.Columns.Add("SoLuong");
                dt.Columns.Add("DonGia");
                dt.Columns.Add("ThanhTien");
            }
            else
            {
                dt = (DataTable)HttpContext.Current.Session["Cart"];
                DataRow dr = dt.NewRow(); //tao moi hang
                ///gan gia tri co hang
                dr["MaSP"] = masp;
                dr["TenSp"] = tensp;
                dr["HinhAnh"] = hinhanh;
                dr["SoLuong"] = soluong;
                dr["DonGia"] = dongia;
                dr["ThanhTien"] = soluong * dongia;
                dt.Rows.Add(dr);
                //cap nhap lai hang
                HttpContext.Current.Session["Cart"] = dt;
            }
        }

        //kiem tra ma
        public Boolean Check(string masp)
        {
            Boolean kt = false;
            if (HttpContext.Current.Session["Cart"] != null)
            {
                DataTable dt = new DataTable();
                dt = (DataTable)HttpContext.Current.Session["Cart"];
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["MaSP"].ToString() == masp)
                    {
                        kt = true;
                        break;
                    }
                }
            }
            return kt;

        }

        //tang so luong
        public void TangSL(string masp)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)HttpContext.Current.Session["Cart"];
            foreach (DataRow dr in dt.Rows)
            {
                if (dr["MaSP"].ToString() == masp)
                {
                    dr["SoLuong"] = int.Parse(dr["SoLuong"].ToString()) + 1;
                    dr["ThanhTien"] = int.Parse(dr["SoLuong"].ToString()) * int.Parse(dr["DonGia"].ToString());
                }
                //update cart
                HttpContext.Current.Session["Cart"] = dt;
            }
        }
        //dem so SP

        public int DemSP()
        {
            DataTable dt = (DataTable)HttpContext.Current.Session["Cart"];
            return dt.Rows.Count;

        }

        //tinhtong

        public int Sum()
        {
            DataTable dt = (DataTable)HttpContext.Current.Session["Cart"];
            int Sum = 0;
            foreach (DataRow dr in dt.Rows)
            {
                Sum += int.Parse(dr["SoLuong"].ToString()) * int.Parse(dr["DonGia"].ToString());
            }
            return Sum;
        }

        //cap nhai so luong

        public void updateNumber(String masp, int soluong)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)HttpContext.Current.Session["Cart"];
            foreach (DataRow dr in dt.Rows)
            {
                if (dr["MaSP"].ToString() == masp)
                {
                    dr["SoLuong"] = soluong;
                    dr["ThanhTien"] = int.Parse(dr["SoLuong"].ToString()) * int.Parse(dr["DonGia"].ToString());
                }
                //update cart
                HttpContext.Current.Session["Cart"] = dt;
            }

        }

        public void DeleteCart(string masp)
        {
            DataTable dt = (DataTable)HttpContext.Current.Session["Cart"];
            DataRow removedRow = null;

            foreach (DataRow dr in dt.Rows)
            {
                if (dr["MaSP"].ToString() == masp)
                {
                    removedRow = dr;
                    break;
                }
            }

            if (removedRow != null)
            {
                dt.Rows.Remove(removedRow);
                HttpContext.Current.Session["Cart"] = dt;
            }
        }
    }
}