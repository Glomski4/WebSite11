<%@ Page Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Admin_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            font-family: "Old English Text MT";
            font-size: xx-large;
        }
    </style>
        <table class="style1">
            <tr>
                <td class="style2" colspan="2" style="text-align: center">
                    Admin Menu</td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:LinkButton ID="LinkButton1" runat="server" 
                        PostBackUrl="~/AdminMenu/ListAllCars.aspx">Show All Cars</asp:LinkButton>
                </td>
                <td style="text-align: center">
                    <asp:LinkButton ID="LinkButton2" runat="server" 
                        PostBackUrl="~/AdminMenu/RestoreLoanPmtAudit.aspx">Edit Loan Data for Audit</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:LinkButton ID="LinkButton3" runat="server" 
                        PostBackUrl="~/AdminMenu/Docs.aspx">Show Docs</asp:LinkButton>
                </td>
                <td style="text-align: center">
                    <asp:LinkButton ID="LinkButton4" runat="server" 
                        PostBackUrl="~/Docs/ShowDocOrder.aspx">Show Docs Orders</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:LinkButton ID="LinkButton5" runat="server" 
                        PostBackUrl="~/AdminMenu/MoneyBalance.aspx">Show Money Balance</asp:LinkButton>
                </td>
                <td style="text-align: center">
                    <asp:LinkButton ID="LinkButton8" runat="server" 
                        PostBackUrl="~/AdminMenu/UploadDocument.aspx">Upload Documents</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    &nbsp;</td>
                <td style="text-align: center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:LinkButton ID="LinkButton6" runat="server" 
                        PostBackUrl="~/AdminMenu/MainFrameSetup.aspx">Mainframe Setup</asp:LinkButton>
                </td>
                <td style="text-align: center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: center">
                    &nbsp;</td>
                <td style="text-align: center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:LinkButton ID="LinkButton7" runat="server" 
                        PostBackUrl="~/AdminMenu/CaseManagement.aspx">Case Management</asp:LinkButton>
                </td>
                <td style="text-align: center">
                    <asp:LinkButton ID="LinkButton9" runat="server" 
                        PostBackUrl="~/AdminMenu/CaseStatus.aspx">Case Status</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    &nbsp;</td>
                <td style="text-align: center">
                    <asp:LinkButton ID="LinkButton10" runat="server" 
                        PostBackUrl="~/AdminMenu/DepartmentManager.aspx">Dept Manager</asp:LinkButton>
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
