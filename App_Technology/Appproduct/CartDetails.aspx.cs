using App_Technology.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App_Technology.Appproduct
{
    public partial class CartDetails : System.Web.UI.Page
    {
        ConnectData db = new ConnectData();
        Cart cart = new Cart();
        protected void Page_Load(object sender, EventArgs e)
        {
            decimal price = 123456.78m;
            string formattedPrice = price.ToString("N0");
            // Gán giá trị đã format vào control hiển thị giá bán trên trang
            if (!IsPostBack)
            {
                ShowCart();
            }
        }

        void ShowCart()
        {
            grCart.DataSource = (DataTable)HttpContext.Current.Session["Cart"];
            grCart.DataBind();
            if (cart.Sum() != 0)
            {
                lbTong.Text = cart.Sum().ToString("0,0") + "VNĐ";
            }
            else
            {
                lbTong.Text = "";
                Response.Redirect("Home.aspx");
            }


        }

        protected void grCart_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string MaSP = grCart.DataKeys[e.RowIndex].Value.ToString().Trim();
            int Soluong = int.Parse(((TextBox)grCart.Rows[e.RowIndex].Cells[4].Controls[0].FindControl("txtSoLuong")).Text);
            cart.updateNumber(MaSP, Soluong);
            grCart.EditIndex = -1;
            ShowCart();

        }

        protected void grCart_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grCart.EditIndex = e.NewEditIndex;
            ShowCart();
        }

        protected void grCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string MaSP = grCart.DataKeys[e.RowIndex].Value.ToString().Trim();
            cart.DeleteCart(MaSP);
            ShowCart();
        }

        protected void grCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && grCart.EditIndex == -1)
            {
                ((LinkButton)e.Row.Cells[7].Controls[2]).OnClientClick = "return confirm('Bạn có chắc chắn muốn xóa không?')";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["username"] != null && Session["password"] != null)
            {
                show.Text = "dat hang thanh cong";
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}