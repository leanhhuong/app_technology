<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CartDetails.aspx.cs" Inherits="App_Technology.Appproduct.CartDetails" %>
<%@ Register Src="~/StyleHtml/Header.ascx" TagName="Header" TagPrefix="Layout"%>
<%@ Register Src="~/StyleHtml/Footer.ascx" TagName="Footer" TagPrefix="Layout"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<body>
        <Layout:Header ID="Header" runat="server" />
    <form id="form1" runat="server" style="background-color:#fff">
        <div style="margin:auto; max-width:1200px">
            <div align="center">
                <asp:GridView ID="grCart" runat="server" AutoGenerateColumns="False" DataKeyNames="MaSP" OnRowEditing="grCart_RowEditing" OnRowUpdating="grCart_RowUpdating" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnRowDataBound="grCart_RowDataBound" OnRowDeleting="grCart_RowDeleting" Width="1200px" HorizontalAlign="Center">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:TemplateField HeaderText="STT">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Mã SP">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("MaSP") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tên SP">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("TenSP") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Hình Ảnh">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="138px" ImageUrl='<%# "~/image/"+Eval("Hinhanh") %>' Width="172px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Số Lượng">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtSoLuong" runat="server" Text='<%# Bind("SoLuong") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("SoLuong") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Đơn Giá">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Convert.ToDecimal(Eval("DonGia")).ToString("N0") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Thành Tiền">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("ThanhTien") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField HeaderText="Chức Năng" ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
            </div>
            <div style="text-align: end; padding: 10px 0px 30px 0px">
                <asp:Label ID="lbTong" runat="server" Text="Label"></asp:Label>
                <asp:Button ID="Button1" runat="server" Text="Đặt hàng" OnClick="Button1_Click" 
                    style="background: #21ea0d;
                            box-sizing: border-box;
                            border: 1px solid;
                            border-radius: 3px;
                            padding: 5px;
                            cursor:pointer"
                    />
                <asp:Label ID="show" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </form>
        <Layout:Footer ID="Footer" runat="server" />
</body>
</html>
