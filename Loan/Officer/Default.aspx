<%@ Page Title="" Language="VB" MasterPageFile="~/Loan/Officer/LoanOfficer.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Loan_Officer_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table style="text-align: center">
    <tr>
        <td colspan="2">
            <p class="MsoNormal">
                Officer Loan System<o:p></o:p></p>
        </td>
    </tr>
    <tr>
        <td>
            <p class="MsoNormal">
                Approved Loans<o:p></o:p></p>
        </td>
        <td>
            <p class="MsoNormal">
                Denied Loans<o:p></o:p></p>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="Button1" runat="server" Text="Go To Page &gt;" />
        </td>
        <td>
            <asp:Button ID="Button2" runat="server" Text="Go To Page &gt;" />
        </td>
    </tr>
</table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder4" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder5" Runat="Server">
</asp:Content>

