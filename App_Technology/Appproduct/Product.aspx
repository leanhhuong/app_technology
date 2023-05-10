<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="App_Technology.Appproduct.Product" %>
<%@ Register Src="~/StyleHtml/Header.ascx" TagName="Header" TagPrefix="Layout"%>
<%@ Register Src="~/StyleHtml/Footer.ascx" TagName="Footer" TagPrefix="Layout"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">  
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
    <Layout:Header ID="Header" runat="server" />
    <form id="form1" runat="server">
        <table align="center">
            <tr>
                <td>Mã sản phẩm</td>
                <td><asp:TextBox ID="txtMaSP" runat="server" Width="275px"></asp:TextBox></td>
            </tr>

             <tr>
                <td>Tên sản phẩm</td>
                <td><asp:TextBox ID="txtTenSP" runat="server" Width="276px"></asp:TextBox></td>
            </tr>

              <tr>
                <td>Mã danh mục</td>
                <td><asp:DropDownList ID="cbMaDM" runat="server" Width="281px">
                    <asp:ListItem>Samsung</asp:ListItem>
                    <asp:ListItem>Iphone</asp:ListItem>
                    <asp:ListItem>Laptop</asp:ListItem>
                    <asp:ListItem>PC</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:danhsachhanghoaConnectionString %>" SelectCommand="SELECT [MaDM] FROM [hanghoa]"></asp:SqlDataSource>
                  </td>
            </tr>

             <tr>
                <td>Ngày sản xuất</td>
                <td>
                    <asp:TextBox ID="txtNgaySX" runat="server"></asp:TextBox>
                    <asp:ImageButton ID="imgBtNgaysx" runat="server" Height="20px" OnClick="imgBtNgaysx_Click" Width="20px" />
                    <asp:Calendar ID="cldNgaySX" runat="server" OnSelectionChanged="cldNgaySX_SelectionChanged"></asp:Calendar>
                </td>
            </tr>

             <tr>
                <td>Hình ảnh</td>
                <td><asp:FileUpload ID="flHinhanh" runat="server" Width="283px" /></td>
            </tr>

            <tr>
                <td>Mô tả</td>
                <td><asp:TextBox ID="txtMota" runat="server" Height="137px" Width="275px" TextMode="MultiLine"></asp:TextBox></td>
            </tr>

              <tr>
                <td>Đơn vị tính</td>
                <td><asp:DropDownList ID="cbDonvi" runat="server" Width="274px">
                    <asp:ListItem>Chiếc</asp:ListItem>
                    <asp:ListItem>Con</asp:ListItem>
                    <asp:ListItem>Cái</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:danhsachhanghoaConnectionString %>" SelectCommand="SELECT [Donvi] FROM [hanghoa]"></asp:SqlDataSource>
                  </td>
            </tr>

            <tr>
                <td>Số lượng</td>
                <td><asp:TextBox ID="txtSoluong" runat="server" Height="16px" Width="275px"></asp:TextBox></td>
            </tr>

            <tr>
                <td>Đơn giá</td>
                <td><asp:TextBox ID="txtDongia" runat="server" Height="16px" Width="275px"></asp:TextBox></td>
            </tr>

            <tr>
                <td>Thể loại</td>
                <td><asp:DropDownList ID="cbTheloai" runat="server" Width="276px">
                    <asp:ListItem>PC</asp:ListItem>
                    <asp:ListItem>TABLET</asp:ListItem>
                    <asp:ListItem>LAPTOP</asp:ListItem>
                    <asp:ListItem>OTHER</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:quanlyhanghoaConnectionString %>" SelectCommand="SELECT [Theloai] FROM [hanghoa]"></asp:SqlDataSource>
                  </td>
            </tr>
            <tr>
                <td>Hãng sản xuất</td>
                <td><asp:TextBox ID="txtHang" runat="server" Height="16px" Width="275px"></asp:TextBox></td>
            </tr>
            <tr style="margin-top:20px">
                <td><asp:Button ID="btAdd" runat="server" Text="Add" Width="115px" OnClick="btAdd_Click" /></td>
                <td><asp:Button ID="btXuat" runat="server" Text="Xuất Excel" /></td>
                <td><asp:Button ID="btUpdate" runat="server" Text="Update" Width="115px" OnClick="btUpdate_Click" /></td>
                <td><asp:Button ID="btDelete" runat="server" Text="Delete" Width="115px" OnClick="btDelete_Click"/></td>
            </tr>
        </table>
        <br />
        <div>
            <asp:Label ID="lbtbao" runat="server" Text=""></asp:Label>
        </div>
        <div align="right" style="margin-bottom:6px">
            <asp:TextBox ID="txtSearch" runat="server" BorderColor="#00CCFF" Width="286px" style="margin-right:5px"></asp:TextBox>
            <asp:Button ID="btSearch" runat="server" Height="26px" Text="Search" Width="115px" style="margin-right:128px;"/>
        </div>       
        <asp:GridView ID="GvHanghoa" runat="server" AutoGenerateColumns="False" align="center" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="1200px">
            <Columns>
                <asp:TemplateField HeaderText="Chọn">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox" runat="server" OnCheckedChanged="CheckBox_CheckedChanged" AutoPostBack="True" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Stt">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" />
                <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm" />
                <asp:BoundField DataField="MaDM" HeaderText="Mã danh mục" />
                <asp:BoundField DataField="NgaySX" HeaderText="Ngày sản xuất" />
                <asp:BoundField DataField="Mota" HeaderText="Mô tả" />
                <asp:BoundField DataField="Donvi" HeaderText="Đơn vị" />
                <asp:TemplateField HeaderText="Hình ảnh">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Height="89px" ImageUrl='<%# "~/image/"+Eval("Hinhanh") %>' Width="174px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Soluong" HeaderText="Số lượng" />
                <asp:BoundField DataField="Dongia" HeaderText="Đơn giá" />
                <asp:BoundField DataField="Theloai" HeaderText="Thể loại" />
                <asp:BoundField DataField="HangSX" HeaderText="Hãng sản xuất" />
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
    </form>
    <Layout:Footer ID="Footer" runat="server" />
</body>
</html>
