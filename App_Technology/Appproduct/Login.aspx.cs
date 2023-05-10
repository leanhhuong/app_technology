using App_Technology.AppCode;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App_Technology.Appproduct
{
    public partial class Login : System.Web.UI.Page
    {
        ConnectData db = new ConnectData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            int userid = 0;
            string ten = txtFullname.Text;
            string email = txtEmail.Text;
            string user = txtUserRegis.Text;
            string pass = txtPassRegis.Text;
            int role = 0;
            nguoidung ng = new nguoidung(userid ,ten, email,user, pass, role);
            if (db.ThemNguoidung(ng) == true)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Thêm thành công','','success')", true);
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Trùng mã Sản Phẩm','','warning')", true);
            }
        }

        //luu thong tin vao bien session khi login succsec
        void save()
        {
            Session["username"] = txtUser.Text;
            Session["password"] = txtPass.Text;
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            {
                string connectionString = @"Data Source=3E0\SQLEXPRESS;Initial Catalog=quanlyhanghoa;Integrated Security=True"; ;
                string query = "SELECT RoleId FROM nguoidung WHERE Account = @TenDangNhap AND Password = @MatKhau";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@TenDangNhap", txtUser.Text);
                    command.Parameters.AddWithValue("@MatKhau", txtPass.Text);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.HasRows)
                    {
                        reader.Read();
                        string RoleName = reader.GetString(0);
                        string username = txtUser.Text;
                        // Lưu tên người dùng vào biến
                        string name = username;
                        if (RoleName == "admin")
                        {
                            save();
                            Response.Redirect("../Appproduct/Product.aspx?name=" + name);
                        }
                        else
                        {
                            save();
                            Response.Redirect("../Appproduct/HomePage.aspx?name=" + name);
                        }
                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Sai Mật khẩu rùi','','error')", true);
                    }
                }
            }
        }

    }
}