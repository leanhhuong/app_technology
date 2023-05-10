using App_Technology.AppCode;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App_Technology.Appproduct
{
    public partial class Product : System.Web.UI.Page
    {
        ConnectData db = new ConnectData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Dua_luoi();
            }
        }

        void Dua_luoi()
        {
            GvHanghoa.DataSource = db.TraDSHH();

            GvHanghoa.DataBind();
        }

        void ClearAll()
        {
            txtMaSP.Text = "";
            txtTenSP.Text = "";
            txtMota.Text = "";
            txtDongia.Text = "";
            txtSoluong.Text = "";
            txtHang.Text = "";
        }
        protected void CheckBox_CheckedChanged(object sender, EventArgs e)
        {
            int i = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            CheckBox ck = (CheckBox)GvHanghoa.Rows[i].FindControl("CheckBox");
            if (ck.Checked == true)
            {
                txtMaSP.Text = GvHanghoa.Rows[i].Cells[2].Text;
                txtTenSP.Text = GvHanghoa.Rows[i].Cells[3].Text;
                cbMaDM.SelectedValue = GvHanghoa.Rows[i].Cells[4].Text;

                txtNgaySX.Text = GvHanghoa.Rows[i].Cells[5].Text;
                //cldNgaySX.SelectedDate = Convert.ToDateTime(GvHanghoa.Rows[i].Cells[5].Text);

                txtMota.Text = GvHanghoa.Rows[i].Cells[6].Text;
                cbDonvi.SelectedValue = GvHanghoa.Rows[i].Cells[7].Text;
                txtSoluong.Text = GvHanghoa.Rows[i].Cells[9].Text;
                txtDongia.Text = GvHanghoa.Rows[i].Cells[10].Text;
                cbTheloai.SelectedValue = GvHanghoa.Rows[i].Cells[11].Text;
                txtHang.Text = GvHanghoa.Rows[i].Cells[12].Text;

            }
            else
            {
                lbtbao.Text = "nhap thong tin can sua";
            }
        }
        protected void btAdd_Click(object sender, EventArgs e)
        {
            string masp = txtMaSP.Text;
            string tensp = txtTenSP.Text;
            string madm = cbMaDM.SelectedValue;

            DateTime ngaysx = cldNgaySX.SelectedDate;
            string mota = txtMota.Text;
            string donvi = cbDonvi.SelectedValue;
            string hinhanh = "";
            try
            {
                hinhanh = flHinhanh.FileName;
                flHinhanh.SaveAs(Server.MapPath("~/image/") + hinhanh);
            }
            catch
            {

            }
            int soluong = int.Parse(txtSoluong.Text);
            float dongia = float.Parse(txtDongia.Text);
            string theloai = cbTheloai.SelectedValue;
            string hangsx = txtHang.Text;
            hanghoa dshanghoa = new hanghoa(masp, tensp, madm, ngaysx, mota, donvi, hinhanh, soluong, dongia, theloai, hangsx);
            if (db.ThemHH(dshanghoa) == true)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Thêm thành công','','success')", true);
                Dua_luoi();
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Trùng mã Sản Phẩm','','warning')", true);
                txtMaSP.Focus();
            }
            ClearAll();
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            string masp = txtMaSP.Text;
            string tensp = txtTenSP.Text;
            string madm = cbMaDM.SelectedValue;
            DateTime ngaysx = cldNgaySX.SelectedDate;
            string mota = txtMota.Text;
            string donvi = cbDonvi.SelectedValue;
            string hinhanh = "";
            int soluong = int.Parse(txtSoluong.Text);
            float dongia = float.Parse(txtDongia.Text);
            string theloai = cbTheloai.SelectedValue;
            string hangsx = txtHang.Text;

            hanghoa dshanghoa = new hanghoa(masp, tensp, madm, ngaysx, mota, donvi, hinhanh, soluong, dongia, theloai, hangsx);
            if (db.SuaHH(dshanghoa) == true)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Thêm thành công','','success')", true);
                Dua_luoi();
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Trùng mã Sản Phẩm','','warning')", true);
                txtMaSP.Focus();
            }
            ClearAll();
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            string masp = txtMaSP.Text;
            string tensp = txtTenSP.Text;
            string madm = cbMaDM.SelectedValue;
            DateTime ngaysx = cldNgaySX.SelectedDate;
            string mota = txtMota.Text;
            string donvi = cbDonvi.SelectedValue;
            string hinhanh = "";
            int soluong = int.Parse(txtSoluong.Text);
            float dongia = float.Parse(txtDongia.Text);
            string theloai = cbTheloai.SelectedValue;
            string hangsx = txtHang.Text;

            hanghoa dshanghoa = new hanghoa(masp, tensp, madm, ngaysx, mota, donvi, hinhanh, soluong, dongia, theloai, hangsx);
            if (db.XoaHH(dshanghoa) == true)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Xoa thành công','','success')", true);
                Dua_luoi();
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Xoa that bai','','warning')", true);
                txtMaSP.Focus();
            }
            ClearAll();
        }

        protected void cldNgaySX_SelectionChanged(object sender, EventArgs e)
        {
            txtNgaySX.Text = cldNgaySX.SelectedDate.ToString("dd-MM-yyyy");
            cldNgaySX.Visible = false;
        }

        protected void imgBtNgaysx_Click(object sender, ImageClickEventArgs e)
        {
            cldNgaySX.Visible = true;
        }
    }
}