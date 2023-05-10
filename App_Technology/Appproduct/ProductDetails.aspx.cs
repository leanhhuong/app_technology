using App_Technology.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using static System.Net.Mime.MediaTypeNames;

namespace App_Technology.Appproduct
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        ConnectData db = new ConnectData();
        Cart cart = new Cart();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = db.TraDSHH();
                String MaSP = Request.QueryString["MaSP"];
                dt = db.TraChitet(MaSP);
                if (dt.Rows.Count > 0)
                {
                    Image1.ImageUrl = "~/image/" + dt.Rows[0][6].ToString();
                    lbTensp.Text = dt.Rows[0][1].ToString();
                    Double Dongia = double.Parse(dt.Rows[0][8].ToString());
                    lbDongia.Text = String.Format("{0:N0} VND", Dongia);
                    lbMota.Text = dt.Rows[0][4].ToString();
                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string masp = Request.QueryString["MaSP"];
            if (cart.Check(masp) == true)
            {
                cart.TangSL(masp);
            }
            else
            {
                DataTable dt = db.TraDetail(masp);
                DataRow dr = dt.Rows[0];
                string ten = dr["TenSP"].ToString();
                string hinhanh = dr["HinhAnh"].ToString();
                int dongia = int.Parse(dr["DonGia"].ToString());
                string mota = dr["Mota"].ToString();
                cart.addCart(masp, ten, hinhanh, 1, dongia);
                Response.Redirect(Request.Url.ToString());
            }
        }
    }
}