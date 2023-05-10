<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="App_Technology.StyleHtml.Header" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../CSS/Header.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/swiper.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form style="background-color: #fff">
        <div class="background">

            <header class="header-vex">
                <a href="#" class="logo-vex">Logo</a>
                <nav class="navbar-vex">
                    <a href="HomePage.aspx">Home</a>
                    <a href="Home.aspx">Product</a>
                    <a href="#">Services</a>
                    <a href="#">Contact</a>
                </nav>
                <nav class="navicon-vex">
                    <div class="user-icon">
                        <div class="titless">
                            <% if (Request.QueryString["name"] != null) { %>

                                <a><%= Request.QueryString["name"].ToString() %> <i class="fa fa-sign-out" aria-hidden="true"></i></a>
                            <% } else { %>
                                <a><i class="fa fa-user-circle" aria-hidden="true"></i><a/>
                            <% } %>
                        </div>

                        <div class="user-actions">
                            <ul>
                                <li>
                                    <a href="#">Đăng ký</a>
                                </li>
                                <li>
                                    <a href="Login.aspx">Đăng nhập</a>
                                </li>
                            </ul>

                        </div>
                    </div>
                    <div>
                        <a href="../Appproduct/CartDetails.aspx"><i class="fa fa-shopping-cart" aria-hidden="true"></i>
                            <asp:Label ID="lbcart" runat="server" Text="" class="cart-items"></asp:Label>
                        </a>
                    </div>


                </nav>
            </header>

            <swiper-container class="mySwiper" pagination="true" pagination-dynamic-bullets="true" style="margin-top: 85px">
                <swiper-slide>
                    <img src="https://mekongnama.com.vn/wp-content/uploads/2021/07/nuoc-anh-mua-dong-1.jpg" /></swiper-slide>
                <swiper-slide>Slide 2</swiper-slide>
                <swiper-slide>Slide 3</swiper-slide>
                <swiper-slide>Slide 4</swiper-slide>
                <swiper-slide>Slide 5</swiper-slide>
                <swiper-slide>Slide 6</swiper-slide>
                <swiper-slide>Slide 7</swiper-slide>
                <swiper-slide>Slide 8</swiper-slide>
                <swiper-slide>Slide 9</swiper-slide>
            </swiper-container>
        </div>
    </form>
</body>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
</html>
