<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="MainMenu.aspx.vb" Inherits="MainMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 964px;
        }
        .style2
        {
            height: 44px;
        }
        .style3
        {
            width: 450px;
        }
        .style4
        {
            width: 313px;
        }
        .style8
        {
            font-weight: bold;
            text-decoration: underline;
            font-size: xx-large;
            font-family: "Cordia New";
        }
        .style11
        {
            width: 170px;
        }
        .style12
        {
            width: 160px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p>
        <table class="style1">
            <tr>
                <td class="style2" colspan="2">
                    &nbsp;<span class="style8">! Main Menu !</span>
                </td>
            </tr>
            <tr valign="top">
                <td class="style3">
                    <table style="width: 360px">
                        <tr>
                            <td class="style12">
                                <asp:LoginStatus ID="LoginStatus1" runat="server" />
                                &nbsp;-
                                <asp:LoginName ID="LoginName1" runat="server" />
                            </td>
                            <td class="style11">
                                <asp:Label ID="Label1" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style12">
                                Systems
                            </td>
                            <td class="style11">
                                Options
                            </td>
                        </tr>
                        <tr>
                            <td class="style12" style="margin-left: 40px">
                                <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/Cars/Default.aspx">Go To Cars System</asp:LinkButton>
                            </td>
                            <td class="style11">
                                <asp:LinkButton ID="LinkButton6" runat="server" PostBackUrl="~/AdminMenu/Default.aspx">Admin</asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td class="style12" style="margin-left: 40px">
                                <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/Shop/Default.aspx">Go To Shop System</asp:LinkButton>
                            </td>
                            <td class="style11">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style12" style="margin-left: 40px">
                                <asp:LinkButton ID="LinkButton5" runat="server" PostBackUrl="~/Loan/Default.aspx">Go To Loan System</asp:LinkButton>
                            </td>
                            <td class="style11" valign="top">
                                <asp:LinkButton ID="LinkButton7" runat="server">Options Menu</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="style4">
                    <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1" ImageSet="XPFileExplorer"
                        NodeIndent="30" Style="text-align: left" ExpandDepth="2" ShowLines="True">
                        <ParentNodeStyle Font-Bold="False" />
                        <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                        <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                            VerticalPadding="0px" />
                        <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                            NodeSpacing="0px" VerticalPadding="2px" />
                    </asp:TreeView>
                    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
                </td>
            </tr>
        </table>
    </p>
    &nbsp;
</asp:Content>
