<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Username :
    <asp:TextBox ID="Username" runat="server"></asp:TextBox>
    <br />
    Password :
    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
    <br />
    <asp:Label ID="Alert" runat="server" 
        style="color: #FF0000; font-weight: 700; text-decoration: underline; font-size: large"></asp:Label>
<br />
    <asp:Button ID="Button1" runat="server" Text="Login" />
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" 
        NavigateUrl="~/Request/Default.aspx">~</asp:HyperLink>
</asp:Content>

