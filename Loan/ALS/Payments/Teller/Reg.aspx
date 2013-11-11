<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false" CodeFile="Reg.aspx.vb" Inherits="Loan_ALS_Payments_Teller_Reg" %>

<%@ Register src="PaymentControlStrip.ascx" tagname="PaymentControlStrip" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:PaymentControlStrip ID="PaymentControlStrip1" runat="server" />
    <asp:Panel ID="Panel1" runat="server" BackColor="#CCCCCC" Font-Bold="True" 
        Font-Size="Large" style="text-align: center">
        <br />
        <br />
        Please open a cash box to process a payment.<br />
        <br />
        <br />
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Visible="False">
    </asp:Panel>
</asp:Content>

