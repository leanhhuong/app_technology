<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="App_Technology.Appproduct.HomePage" %>

<%@ Register Src="~/StyleHtml/Header.ascx" TagName="Header" TagPrefix="Layout" %>
<%@ Register Src="~/StyleHtml/Footer.ascx" TagName="Footer" TagPrefix="Layout" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../CSS/HomePage.css" rel="stylesheet" type="text/css" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Content/bootstrap.min.js"></script>
</head>
<body>
    <Layout:Header ID="Header" runat="server" />
    <form id="form1" runat="server" style="background-color: #fff">
        <div class="wapper-vex">           
            <div class="container-wapper">
                <div class="image">
                    <h1 class="title">BỘ SƯU TẬP</h1>
                    <div class="list-img">
                        <div class="image-wrapper">
                            <a href="Home.aspx?theloai=PC">
                                <img src="https://product.hstatic.net/1000026716/product/gearvn-man-hinh-lenovo-l24q-35-24-ips-2k-75hz-loa-kep-2w-1_ed4ba87c3f714d189339fc5245dc1994.jpg" />
                            </a>
                            <p>PC</p>
                        </div>
                        <div class="image-wrapper">
                            <a href="Home.aspx?theloai=LAPTOP">
                                <img src="https://product.hstatic.net/1000026716/product/gearvn-laptop-gaming-asus-rog-strix-scar-18-g834jy-n6039w-1_63f6e9fd33a44afb9727255ba205c195.jpg" />
                            </a>
                            <p>LAPTOP</p>
                        </div>
                        <div class="image-wrapper">
                            <a href="Home.aspx?theloai=TABLET">
                                <img src="https://images.samsung.com/is/image/samsung/p6pim/vn/sm-x906bzaaxxv/gallery/vn-galaxy-tab-s8-ultra-5g-x906-sm-x906bzaaxxv-thumb-534181708?$240_240_PNG$" />
                            </a>
                            <p>TAPLET</p>
                        </div>
                        <div class="image-wrapper">
                            <a href="Home.aspx?theloai=OTHER">
                                <img src="https://upload.wikimedia.org/wikipedia/commons/0/06/Tr%C3%BAc_Anh_%E2%80%93_M%E1%BA%AFt_bi%E1%BA%BFc_BTS_%282%29.png" />
                            </a>
                            <p>OTHER</p>
                        </div>
                    </div>
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
                                                <h3><%# Eval("TenSP")%></h3>
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
    <Layout:Footer ID="Footer" runat="server" />
</body>
</html>
