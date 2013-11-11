<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false" CodeFile="EditDocs.aspx.vb" Inherits="AdminMenu_EditDocs" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:Panel ID="Panel1" runat="server">
        <asp:Button ID="Button3" runat="server" Text="Tab Key" />
        &nbsp;&lt; The tab key will not work in the box below, so when you need to enter a &#39;Tab&#39; 
        just click this button.<br />
        <asp:TextBox ID="TextBox1" runat="server" Rows="20" TextMode="MultiLine" 
            Width="8.5in"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="View" />
        <asp:Button ID="Button2" runat="server" Text="Save" />
    </asp:Panel>
</asp:Content>

