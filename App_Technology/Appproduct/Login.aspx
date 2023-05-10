<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="App_Technology.Appproduct.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="~/CSS/Login.css" rel="stylesheet" type="text/css" />
    <link href="../Content/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <form runat="server" method="post" action="Login.aspx">
        <header class="header">
            <a href="#" class="logo">Logo</a>
            <nav class="navbar">
                <a href="HomePage.aspx">Home</a>
                <a href="Home.aspx">Product</a>
                <a href="#">Services</a>
                <a href="#">Contact</a>
                <span class="btnLogin-popup">Login</span>
            </nav>
        </header>
        <section class="section">
            <div class="wapper">
                <span><i class="fa fa-times" aria-hidden="true"></i></span>
                <div class="logreg-box">
                    <div class="form-box login">
                        <div class="logreg-title">
                            <h2>Login</h2>
                            <p>Vui lòng nhập email và mật khẩu</p>
                        </div>
                        <div>
                            <div class="input-box">
                                <span class="icon"><i class="fa fa-user" aria-hidden="true"></i></span>
                                <asp:TextBox ID="txtUser" runat="server" placeholder=" " class="input"></asp:TextBox>
                                <label>User</label>
                            </div>
                            <div class="input-box">
                                <span class="icon"><i class="fa fa-unlock-alt" aria-hidden="true"></i></span>
                                <asp:TextBox ID="txtPass" runat="server" placeholder=" " class="input"></asp:TextBox>
                                <label> Password</label>
                            </div>
                            <div class="remember-forgot">
                                <label>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />Remember me</label>
                                <a href="#">Forgot password?</a>
                            </div>
                            <div class="butn">
                                <asp:LinkButton ID="btn" runat="server" class="btn" OnClick="btn_Click">Login</asp:LinkButton>
                            </div>
                            <div class="logreg-link">
                                <p>
                                    Don't have an account?
                                    <a href="#" class="register-link">Register</a>
                                </p>
                            </div>
                        </div>
                    </div>
                        <%--form register--%>
                    <div class="form-box register">
                        <div class="logreg-title">
                            <h2>Registrantion</h2>
                            <p>Điền các thông tin dưới đây để đăng ký account</p>
                        </div>
                        <div>
                            <div class="input-box">
                                <span class="icon"><i class="fa fa-address-card" aria-hidden="true"></i></span>
                                <asp:TextBox ID="txtFullname" runat="server" placeholder=" " class="input"></asp:TextBox>
                                <label>Full Name</label>
                            </div>
                            <div class="input-box">
                                <span class="icon"><i class="fa fa-address-card" aria-hidden="true"></i></span>
                                <asp:TextBox ID="txtEmail" runat="server" placeholder=" " class="input"></asp:TextBox>
                                <label>Email</label>
                            </div>
                            <div class="input-box">
                                <span class="icon"><i class="fa fa-user" aria-hidden="true"></i></span>
                                <asp:TextBox ID="txtUserRegis" runat="server" placeholder=" " class="input"></asp:TextBox>
                                <label>User</label>
                            </div>
                            <div class="input-box">
                                <span class="icon"><i class="fa fa-unlock-alt" aria-hidden="true"></i></span>
                                <asp:TextBox ID="txtPassRegis" runat="server" type="password" placeholder=" " class="input"></asp:TextBox>
                                <label>Password</label>
                            </div>
                            
                            <div class="remember-forgot">
                                <label>
                                    <asp:CheckBox ID="CheckBox2" runat="server" />I agree to the terms & conditions</label>
                            </div>
                            <div class="butn">
                                <asp:LinkButton ID="btnRegister" runat="server" class="btn" OnClick="btnRegister_Click">Register</asp:LinkButton>
                            </div>
                            <div class="logreg-link">
                                <p>
                                    Already have an account?
                                    <a href="#" class="login-link">Login</a>
                                </p>
                            </div>
                            <div />
                        </div>
                    </div>
                </div>
                <div class="media-options">
                    <a href="#">
                        <i class="fa fa-google" aria-hidden="true"></i>
                        <span>Login with Google</span>
                    </a>
                    <a href="#">
                        <i class="fa fa-facebook-square" aria-hidden="true"></i>
                        <span>Login with Facebook</span>
                    </a>
                </div>
            </div>
        </section>
        <script src='<%=ResolveClientUrl("~/JavaScript/LoginScript.js") %>' type="text/javascript"></script>
    </form>
</body>
</html>
