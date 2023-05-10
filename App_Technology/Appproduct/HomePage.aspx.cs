using App_Technology.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace App_Technology.Appproduct
{
    public partial class HomePage : System.Web.UI.Page
    {
        ConnectData db = new ConnectData();
        Cart cart = new Cart();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
           
                hienthi();
            }

            //lbCart.Text = cart.DemSP().ToString();
        }        
        //cart cart = new cart();
        public void hienthi()
        {
            string theloai = Request.QueryString["Theloai"];
            string hangsx = Request.QueryString["HangSX"];
            dt.Columns.Add();
            if (hangsx != null || theloai != null)
            {
                Repeater1.DataSource = db.TraDSH(theloai, hangsx);
            }
            else
            {

                Repeater1.DataSource = db.TraDSHH();
            }
            Repeater1.DataBind();
            //dt.Columns.Add();
            //Repeater1.DataSource = db.TraDSHH();
            //Repeater1.DataBind();
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