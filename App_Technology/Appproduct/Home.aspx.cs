using App_Technology.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App_Technology.Appproduct
{
    public partial class Home : System.Web.UI.Page
    {
        ConnectData db = new ConnectData();
        Cart cart = new Cart();
        DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hienthi();
                //show();
            }

        }

        //public void show()
        //{
        //    string theloai = Request.QueryString["Theloai"];
        //    if (theloai != null)
        //    {
        //        Repeater1.DataSource = db.TraDSHH(theloai);
        //    }
        //    else
        //    {
        //        Repeater1.DataSource = db.TraDSHH();
        //    }
        //    Repeater1.DataBind();
        //}

        public void hienthi()
        {
            string theloai = Request.QueryString["Theloai"];
            string hangsx = Request.QueryString["HangSX"];
            dt.Columns.Add();
            if (theloai != null)
            {
                Repeater1.DataSource = db.TraDSHH(theloai);
               
                if(hangsx != null )
                {
                    Repeater1.DataSource = db.TraDSH(theloai, hangsx);
                }
            }
            else
            {

                Repeater1.DataSource = db.TraDSHH();
            }
            Repeater1.DataBind();
        }
        protected void bttimkiem_Click(object sender, EventArgs e)
        {
            string tensp = txtSearch.Text.ToLower();
            dt = db.timkiem(tensp);

            // Lặp qua các mục trong Repeater
            foreach (RepeaterItem item in Repeater1.Items)
            {
                // Tìm Label hiển thị tên sản phẩm
                Label lblTenSP = (Label)item.FindControl("lblTenSP");

                // Nếu Label tồn tại và có chứa chuỗi tìm kiếm
                if (lblTenSP != null && lblTenSP.Text.ToLower().Contains(tensp))
                {
                    // Hiển thị mục đó trong Repeater
                    item.Visible = true;
                }
                else
                {
                    // Ẩn mục đó trong Repeater
                    item.Visible = false;
                }
            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "addsp")
            {
                string masp = e.CommandArgument.ToString();
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
}