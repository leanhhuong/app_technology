using App_Technology.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App_Technology.StyleHtml
{
    public partial class Header : System.Web.UI.UserControl
    {
        ConnectData db = new ConnectData();
        Cart cart = new Cart();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbcart.Text = cart.DemSP().ToString();
            }
        }
    }
}