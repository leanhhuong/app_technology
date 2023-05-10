<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="App_Technology.Appproduct.Home" %>

<%@ Register Src="~/StyleHtml/Header.ascx" TagName="Header" TagPrefix="Layout" %>
<%@ Register Src="~/StyleHtml/Footer.ascx" TagName="Footer" TagPrefix="Layout" %>
<!DOCTYPE html>
<link href="../Content/font-awesome.min.css" rel="stylesheet" />

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
    <link href="../CSS/sidebar.css" rel="stylesheet" type="text/css" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Content/bootstrap.min.js"></script>
     <script src='<%=ResolveClientUrl("~/JavaScript/sidebar.js") %>' type="text/javascript"></script>
</head>
<body style="margin: 0px">
    <Layout:Header ID="Header" runat="server" />

    <form id="form1" runat="server" style="background-color: #fff">
        <div class="wapper-vex">
            <div class="side-bar-vex">
                <header class="img-vex">
                    <h1>Danh Mục</h1>
                </header>
                <div class="menu-vex">
                    <div class="item-vex"><a href="Home.aspx?theloai=PC"><i class="fas fa-desktop"></i>PC</a></div>
                    <div class="item-vex">
                        <a class="sub-btn-vex"><i class="fa fa-tablet" aria-hidden="true"></i>Tablet<i class="fas fa-angle-right dropdown"></i></a>
                        <div class="sub-menu-vex">                           
                            <a href="Home.aspx?theloai=TABLET&hangsx=SAMSUNG" class="sub-item-vex">Samsung</a>
                            <a href="Home.aspx?theloai=TABLET&hangsx=LENOVO" class="sub-item-vex">Lenovo</a>
                            <a href="Home.aspx?theloai=TABLET&hangsx=APPLE" class="sub-item-vex">Apple</a>
                        </div>
                    </div>
                    <div class="item-vex">
                        <a class="sub-btn-vex"><i class="fa fa-laptop" aria-hidden="true"></i>Laptop<i class="fas fa-angle-right dropdown"></i></a>
                        <div class="sub-menu-vex">
                            <a href="Home.aspx?theloai=LAPTOP&hangsx=Dell" class="sub-item-vex">Dell</a>
                            <a href="Home.aspx?theloai=LAPTOP&hangsx=HP" class="sub-item-vex">HP</a>
                            <a href="Home.aspx?theloai=LAPTOP&hangsx=ASUS" class="sub-item-vex">Asus</a>
                            <a href="Home.aspx?theloai=LAPTOP&hangsx=MSI" class="sub-item-vex">MSI</a>
                        </div>
                    </div>
                    <div class="item-vex"><a href="Home.aspx?theloai=OTHER"><i class="fas fa-table"></i>Other</a></div>
                </div>
            </div>
            <div>
                <div align="center" style="margin-top: 50px">
                    <asp:TextBox ID="txtSearch" runat="server" Width="701px" CssClass="auto-style1" Height="35px"></asp:TextBox>
                    <asp:LinkButton ID="bttimkiem" runat="server" OnClick="bttimkiem_Click" Style="position: relative; padding: 9px 25px 9px 25px; right: 73px; top: 2px;"><i class="bt_search fa fa-search" aria-hidden="true"></i></asp:LinkButton>
                </div>

                <div class="products-wapper">
                    <h1 class="title">SẢN PHẨM</h1>
                    <div class="container">
                        <div class="row">
                            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                <ItemTemplate>
                                    <div class="col-md-4">
                                        <div class="card">
                                            <a href='../Appproduct/ProductDetails.aspx?MaSP=<%# Eval("MaSP") %>'>
                                                <asp:Image ID="imgAnh" runat="server" ImageUrl='<%#"~/image/"+Eval("Hinhanh")%>' Height="288px" CssClass="img" />
                                            </a>
                                            <div class="card-body">
                                                <h3>
                                                    <asp:Label ID="lblTenSP" runat="server" Text='<%# Eval("TenSP")%>'></asp:Label></h3>

                                                <span class="price"><%# Eval("Dongia", "{0:0,000}")%>VND</span>
                                                <p>
                                                    <asp:Button ID="Button1" CommandArgument='<%#Eval("MaSP") %>' CommandName="addsp" runat="server" Text="Add to cart" CssClass="btn btn-success" />
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
<Layout:Footer ID="Footer" runat="server" />

</html>
