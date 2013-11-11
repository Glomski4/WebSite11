<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false"
    CodeFile="UploadDocument.aspx.vb" Inherits="AdminMenu_UploadDocument" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />Select Document<br />
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <br /><br />
    Documet Type<br />
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
        DataTextField="DocName" DataValueField="DocID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
        
        SelectCommand="SELECT [DocID], [DocName], [Active] FROM [Docs] ORDER BY [DocName]"></asp:SqlDataSource>
    <br /><br />
    Loan Number
    <br />
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br /><br />
    <asp:Button ID="Button1" runat="server" Text="Upload" /><br /><br />
    <asp:Label ID="Alert" runat="server" ForeColor="Red"></asp:Label><asp:Label ID="Processed"
        runat="server"></asp:Label>
</asp:Content>
