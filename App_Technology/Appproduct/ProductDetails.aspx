<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="App_Technology.Appproduct.ProductDetails" %>

<%@ Register Src="~/StyleHtml/Header.ascx" TagName="Header" TagPrefix="Layout" %>
<%@ Register Src="~/StyleHtml/Footer.ascx" TagName="Footer" TagPrefix="Layout" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Content/bootstrap.min.js"></script>
    <style type="text/css">
        *{
            margin: 0px;
            padding: 0px;
            font-family: 'Cambria Math', sans-serif;
            box-sizing: border-box;
        }
        .container {
            display: flex;
            justify-content: center;
            max-width: 1200px;
                margin: 50px auto 50px auto;
        }

        .column-left, .column-right {
            
            padding: 20px;
            box-sizing: border-box;
        }

            .column-left img {
                height: 315px;
                padding-left: 125px;
            }

        .product-items h1 {
            font-style: normal;
            color: #000;
        }

        .product-items h2 {
            font-style: normal;
            color: #000;
        }

        .product-items h3 {
            font-style: normal;
            color: #000;
            border-bottom: 1px solid #ccc;
            padding-bottom: 30px;
        }

        input[type="radio"] {
            display: none;
        }

        label {
            display: inline-block;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            cursor: pointer;
            padding-left: 60px;
            padding-right: 50px;
        }

        input[type="radio"]:checked + label {
            background-color: burlywood;
        }

        .buttons_added {
            opacity: 1;
            display: inline-block;
            display: -ms-inline-flexbox;
            display: inline-flex;
            white-space: nowrap;
            vertical-align: top;
        }

        .is-form {
            overflow: hidden;
            position: relative;
            background-color: #f9f9f9;
            height: 2.2rem;
            width: 1.9rem;
            padding: 0;
            text-shadow: 1px 1px 1px #fff;
            border: 1px solid #ddd;
        }

            .is-form:hover {
                background-color: #d5d4d4;
            }

            .is-form:focus, .input-text:focus {
                outline: none;
            }

            .is-form.minus {
                border-radius: 4px 0 0 4px;
            }

            .is-form.plus {
                border-radius: 0 4px 4px 0;
            }

        .input-qty {
            background-color: #fff;
            height: 2.1rem;
            width: 36px;
            text-align: center;
            font-size: 1rem;
            display: inline-block;
            vertical-align: top;
            margin: 0;
            border-top: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            border-left: 0;
            border-right: 0;
            padding: 0;
        }

            .input-qty:focus {
                outline: none;
            }

            .input-qty::-webkit-outer-spin-button, .input-qty::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }

        .product-items .addcart {
            padding: 10px;
            width: 100%;
            background: white;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

            .product-items .addcart:hover {
                background-color: #d5d4d4;
            }

        .tabs {
            display: flex;
            justify-content: center;
            font-style: normal;
            color: #000;
        }

        .tablinks {
            border: none;
            outline: none;           
            font-style: normal;
            color: #698269;
            width: 100%;
            height: 40px;
            font-size: 20px;
            padding: 1rem;
            text-transform: uppercase;
            transition: 0.2s ease;
        }

            .tablinks:hover {
                background-color: burlywood;
            }

        .allMota {
            font-style: normal;
            color: #000;
            font-size: 20px;
            padding-left: 100px;
        }

        .tabcontent {
            display: flex;
            font-style: normal;
            color: #000;
        }

            .tabcontent .active {
                display: block;
            }

        .items {
            display: flex;
            justify-content: center;
            font-style: normal;
            color: #000;
        }

        .views {
            max-width: 1200px;
            border-radius: 3px;
            box-shadow: 0px 0px 1px 0px #000;
                margin: 25px auto 50px auto;
        }
    </style>
</head>
<body>
    <Layout:Header ID="Header" runat="server" />
    <form id="form1" runat="server" style="background-color:#fff ">
        <div class="container">
            <div class="column-left">
                <div id="img">
                    <asp:Image ID="Image1" runat="server" />
                </div>
            </div>
            <div class="column-right">
                <div class="product-items">
                    <h1>
                        <asp:Label ID="lbTensp" runat="server"></asp:Label></h1>
                </div>
                <div class="product-items">
                    <h2>
                        <asp:Label ID="lbDongia" runat="server"></asp:Label></h2>
                </div>
                <div class="product-items">
                    <h3>
                        <asp:Label ID="lbThuonghieu" runat="server"></asp:Label></h3>
                </div>
                <br />
                <div class="product-items">
                    <asp:Button ID="Button1" runat="server" Text="Add to cart" CssClass="btn btn-success" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
        <div class="views">
            <div class="tabs">
                <h1>Mô tả</h1>
            </div>
            <div class="wrapper-tabcontent">
                <div class="allMota">
                    <asp:Label ID="lbMota" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
        </div>
    </form>
    <Layout:Footer ID="Footer" runat="server" />
</body>
</html>
