<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false"
    CodeFile="LoanManagment.aspx.vb" Inherits="AdminMenu_LoanManagment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Load" />
    <br />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="LoanID" 
        DataSourceID="SqlDataSource1" CellPadding="4"
        ForeColor="#333333">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <EditItemTemplate>
            <table class="style1" border="2" cellpadding="2" cellspacing="2">
                <tr>
                    <td>
                        Loan ID
                    </td>
                    <td>
                        <asp:Label ID="LoanIDLabel1" runat="server" Text='<%# Eval("LoanID") %>' />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        Loan Status
                    </td>
                    <td>
                        <asp:TextBox ID="L_StatusTextBox" runat="server" Text='<%# Bind("L_Status") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        CCID
                    </td>
                    <td>
                        <asp:TextBox ID="CCIDTextBox" runat="server" Text='<%# Bind("CCID") %>' />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        Borrower Deatils
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="B1_FirstTextBox" runat="server" Text='<%# Bind("B1_First") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="B1_MiddleTextBox" runat="server" Text='<%# Bind("B1_Middle") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="B1_LastTextBox" runat="server" Text='<%# Bind("B1_Last") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="B1_SufTextBox" runat="server" Text='<%# Bind("B1_Suf") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="B1_SSNTextBox" runat="server" Text='<%# Bind("B1_SSN") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="B2_FirstTextBox" runat="server" Text='<%# Bind("B2_First") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="B2_MiddleTextBox" runat="server" Text='<%# Bind("B2_Middle") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="B2_LastTextBox" runat="server" Text='<%# Bind("B2_Last") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="B2_SufTextBox" runat="server" Text='<%# Bind("B2_Suf") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="B2_SSNTextBox" runat="server" Text='<%# Bind("B2_SSN") %>' />
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        Address
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <asp:TextBox ID="Address1TextBox" runat="server" Text='<%# Bind("Address1") %>' />
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <asp:TextBox ID="Address2TextBox" runat="server" Text='<%# Bind("Address2") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ZipTextBox" runat="server" Text='<%# Bind("Zip") %>' />
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        Home Phone
                    </td>
                    <td>
                        <asp:TextBox ID="HomePhoneTextBox" runat="server" Text='<%# Bind("HomePhone") %>' />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        Work Phone
                    </td>
                    <td>
                        <asp:TextBox ID="WorkPhoneTextBox" runat="server" Text='<%# Bind("WorkPhone") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        Open Date
                    </td>
                    <td>
                        First Payment Date
                    </td>
                    <td>
                        Current Due Date
                    </td>
                    <td>
                        Last Payment Posted
                    </td>
                    <td>
                        Last Statement
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="OpenDateTextBox" runat="server" Text='<%# Bind("OpenDate") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="FirstPmtDateTextBox" runat="server" Text='<%# Bind("FirstPmtDate") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CurrPmtDueTextBox" runat="server" Text='<%# Bind("CurrPmtDue") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="LastPmtPostedTextBox" runat="server" Text='<%# Bind("LastPmtPosted") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="LastStatementTextBox" runat="server" Text='<%# Bind("LastStatement") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        No Payments
                    </td>
                    <td>
                        No Payments Left
                    </td>
                    <td>
                        LC Date
                    </td>
                    <td>
                        LC Amount
                    </td>
                    <td>
                        Down Payment
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="NoPmtsTextBox" runat="server" Text='<%# Bind("NoPmts") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="NoPmtsLeftTextBox" runat="server" Text='<%# Bind("NoPmtsLeft") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="LCDateTextBox" runat="server" Text='<%# Bind("LCDate") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="LCAmountTextBox" runat="server" Text='<%# Bind("LCAmount") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="DownPmtTextBox" runat="server" Text='<%# Bind("DownPmt") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Loan Amount
                    </td>
                    <td>
                        Current Loan Amount
                    </td>
                    <td>
                        Monthly Payment
                    </td>
                    <td>
                        Interest Rate
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="LoanAmountTextBox" runat="server" Text='<%# Bind("LoanAmount") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CurrBalanceTextBox" runat="server" Text='<%# Bind("CurrBalance") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="MonthlyPmtTextBox" runat="server" Text='<%# Bind("MonthlyPmt") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="IntRateTextBox" runat="server" Text='<%# Bind("IntRate") %>' />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        Type
                    </td>
                    <td colspan="4" width="100%">
                        <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Statement Disabled
                    </td>
                    <td>
                        <asp:CheckBox ID="StatementDisabledCheckBox" runat="server" Checked='<%# Bind("StatementDisabled") %>' />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        Force Statement
                    </td>
                    <td>
                        <asp:CheckBox ID="ForceStatementCheckBox" runat="server" Checked='<%# Bind("ForceStatement") %>' />
                    </td>
                </tr>
            </table>
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            L_Status:
            <asp:TextBox ID="L_StatusTextBox" runat="server" Text='<%# Bind("L_Status") %>' />
            <br />
            CCID:
            <asp:TextBox ID="CCIDTextBox" runat="server" Text='<%# Bind("CCID") %>' />
            <br />
            B1_First:
            <asp:TextBox ID="B1_FirstTextBox" runat="server" Text='<%# Bind("B1_First") %>' />
            <br />
            B1_Middle:
            <asp:TextBox ID="B1_MiddleTextBox" runat="server" Text='<%# Bind("B1_Middle") %>' />
            <br />
            B1_Last:
            <asp:TextBox ID="B1_LastTextBox" runat="server" Text='<%# Bind("B1_Last") %>' />
            <br />
            B1_Suf:
            <asp:TextBox ID="B1_SufTextBox" runat="server" Text='<%# Bind("B1_Suf") %>' />
            <br />
            B1_SSN:
            <asp:TextBox ID="B1_SSNTextBox" runat="server" Text='<%# Bind("B1_SSN") %>' />
            <br />
            B2_First:
            <asp:TextBox ID="B2_FirstTextBox" runat="server" Text='<%# Bind("B2_First") %>' />
            <br />
            B2_Middle:
            <asp:TextBox ID="B2_MiddleTextBox" runat="server" Text='<%# Bind("B2_Middle") %>' />
            <br />
            B2_Last:
            <asp:TextBox ID="B2_LastTextBox" runat="server" Text='<%# Bind("B2_Last") %>' />
            <br />
            B2_Suf:
            <asp:TextBox ID="B2_SufTextBox" runat="server" Text='<%# Bind("B2_Suf") %>' />
            <br />
            B2_SSN:
            <asp:TextBox ID="B2_SSNTextBox" runat="server" Text='<%# Bind("B2_SSN") %>' />
            <br />
            Address1:
            <asp:TextBox ID="Address1TextBox" runat="server" Text='<%# Bind("Address1") %>' />
            <br />
            Address2:
            <asp:TextBox ID="Address2TextBox" runat="server" Text='<%# Bind("Address2") %>' />
            <br />
            City:
            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
            <br />
            State:
            <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
            <br />
            Zip:
            <asp:TextBox ID="ZipTextBox" runat="server" Text='<%# Bind("Zip") %>' />
            <br />
            HomePhone:
            <asp:TextBox ID="HomePhoneTextBox" runat="server" Text='<%# Bind("HomePhone") %>' />
            <br />
            WorkPhone:
            <asp:TextBox ID="WorkPhoneTextBox" runat="server" Text='<%# Bind("WorkPhone") %>' />
            <br />
            OpenDate:
            <asp:TextBox ID="OpenDateTextBox" runat="server" Text='<%# Bind("OpenDate") %>' />
            <br />
            FirstPmtDate:
            <asp:TextBox ID="FirstPmtDateTextBox" runat="server" Text='<%# Bind("FirstPmtDate") %>' />
            <br />
            NoPmts:
            <asp:TextBox ID="NoPmtsTextBox" runat="server" Text='<%# Bind("NoPmts") %>' />
            <br />
            CurrPmtDue:
            <asp:TextBox ID="CurrPmtDueTextBox" runat="server" Text='<%# Bind("CurrPmtDue") %>' />
            <br />
            NoPmtsLeft:
            <asp:TextBox ID="NoPmtsLeftTextBox" runat="server" Text='<%# Bind("NoPmtsLeft") %>' />
            <br />
            LCDate:
            <asp:TextBox ID="LCDateTextBox" runat="server" Text='<%# Bind("LCDate") %>' />
            <br />
            LCAmount:
            <asp:TextBox ID="LCAmountTextBox" runat="server" Text='<%# Bind("LCAmount") %>' />
            <br />
            LoanAmount:
            <asp:TextBox ID="LoanAmountTextBox" runat="server" Text='<%# Bind("LoanAmount") %>' />
            <br />
            CurrBalance:
            <asp:TextBox ID="CurrBalanceTextBox" runat="server" Text='<%# Bind("CurrBalance") %>' />
            <br />
            MonthlyPmt:
            <asp:TextBox ID="MonthlyPmtTextBox" runat="server" Text='<%# Bind("MonthlyPmt") %>' />
            <br />
            IntRate:
            <asp:TextBox ID="IntRateTextBox" runat="server" Text='<%# Bind("IntRate") %>' />
            <br />
            DownPmt:
            <asp:TextBox ID="DownPmtTextBox" runat="server" Text='<%# Bind("DownPmt") %>' />
            <br />
            Type:
            <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
            <br />
            LastPmtPosted:
            <asp:TextBox ID="LastPmtPostedTextBox" runat="server" Text='<%# Bind("LastPmtPosted") %>' />
            <br />
            LastStatement:
            <asp:TextBox ID="LastStatementTextBox" runat="server" Text='<%# Bind("LastStatement") %>' />
            <br />
            ForceStatement:
            <asp:CheckBox ID="ForceStatementCheckBox" runat="server" Checked='<%# Bind("ForceStatement") %>' />
            <br />
            StatementDisabled:
            <asp:CheckBox ID="StatementDisabledCheckBox" runat="server" Checked='<%# Bind("StatementDisabled") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <table class="style1" border="2" cellpadding="2" cellspacing="2">
                <tr>
                    <td>
                        Loan ID
                    </td>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# Eval("LoanID","http://theglom.selfip.com:90/WebSite/Loan/ALS/Default.aspx?FORWARD=VALID&LoanNo={0}") %>' 
                            Text='<%# Eval("LoanID") %>'></asp:HyperLink>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        Loan Status
                    </td>
                    <td>
                        <asp:Label ID="L_StatusLabel" runat="server" Text='<%# Bind("L_Status") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        CCID
                    </td>
                    <td>
                        <asp:Label ID="CCIDLabel" runat="server" Text='<%# Bind("CCID") %>' />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        Borrower Deatils
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="B1_FirstLabel" runat="server" Text='<%# Bind("B1_First") %>' />
                    </td>
                    <td>
                        <asp:Label ID="B1_MiddleLabel" runat="server" Text='<%# Bind("B1_Middle") %>' />
                    </td>
                    <td>
                        <asp:Label ID="B1_LastLabel" runat="server" Text='<%# Bind("B1_Last") %>' />
                    </td>
                    <td>
                        <asp:Label ID="B1_SufLabel" runat="server" Text='<%# Bind("B1_Suf") %>' />
                    </td>
                    <td>
                        <asp:Label ID="B1_SSNLabel" runat="server" Text='<%# Bind("B1_SSN") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="B2_FirstLabel" runat="server" Text='<%# Bind("B2_First") %>' />
                    </td>
                    <td>
                        <asp:Label ID="B2_MiddleLabel" runat="server" Text='<%# Bind("B2_Middle") %>' />
                    </td>
                    <td>
                        <asp:Label ID="B2_LastLabel" runat="server" Text='<%# Bind("B2_Last") %>' />
                    </td>
                    <td>
                        <asp:Label ID="B2_SufLabel" runat="server" Text='<%# Bind("B2_Suf") %>' />
                    </td>
                    <td>
                        <asp:Label ID="B2_SSNLabel" runat="server" Text='<%# Bind("B2_SSN") %>' />
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        Address
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <asp:Label ID="Address1Label" runat="server" Text='<%# Bind("Address1") %>' />
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <asp:Label ID="Address2Label" runat="server" Text='<%# Bind("Address2") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
                    </td>
                    <td>
                        <asp:Label ID="StateLabel" runat="server" Text='<%# Bind("State") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ZipLabel" runat="server" Text='<%# Bind("Zip") %>' />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        Home Phone
                    </td>
                    <td>
                        <asp:Label ID="HomePhoneLabel" runat="server" Text='<%# Bind("HomePhone") %>' />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        Work Phone
                    </td>
                    <td>
                        <asp:Label ID="WorkPhoneLabel" runat="server" Text='<%# Bind("WorkPhone") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        Open Date
                    </td>
                    <td>
                        First Payment Date
                    </td>
                    <td>
                        Current Due Date
                    </td>
                    <td>
                        Last Payment Posted
                    </td>
                    <td>
                        Last Statement
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="OpenDateLabel" runat="server" Text='<%# Bind("OpenDate", "{0:D}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FirstPmtDateLabel" runat="server" Text='<%# Bind("FirstPmtDate", "{0:D}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CurrPmtDueLabel" runat="server" Text='<%# Bind("CurrPmtDue", "{0:D}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LastPmtPostedLabel" runat="server" Text='<%# Bind("LastPmtPosted", "{0:D}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LastStatementLabel" runat="server" Text='<%# Bind("LastStatement", "{0:D}") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        No Payments
                    </td>
                    <td>
                        No Payments Left
                    </td>
                    <td>
                        LC Date
                    </td>
                    <td>
                        LC Amount
                    </td>
                    <td>
                        Down Payment
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="NoPmtsLabel" runat="server" Text='<%# Bind("NoPmts") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NoPmtsLeftLabel" runat="server" Text='<%# Bind("NoPmtsLeft") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LCDateLabel" runat="server" Text='<%# Bind("LCDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LCAmountLabel" runat="server" Text='<%# Bind("LCAmount", "{0:C}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DownPmtLabel" runat="server" Text='<%# Bind("DownPmt", "{0:C}") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Loan Amount
                    </td>
                    <td>
                        Current Loan Amount
                    </td>
                    <td>
                        Monthly Payment
                    </td>
                    <td>
                        Interest Rate
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LoanAmountLabel" runat="server" Text='<%# Bind("LoanAmount", "{0:C}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CurrBalanceLabel" runat="server" Text='<%# Bind("CurrBalance", "{0:C}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="MonthlyPmtLabel" runat="server" Text='<%# Bind("MonthlyPmt", "{0:C}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="IntRateLabel" runat="server" Text='<%# Bind("IntRate") %>' />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        Type
                    </td>
                    <td colspan="4">
                        <asp:Label ID="TypeLabel" runat="server" Text='<%# Bind("Type") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Statement Disabled
                    </td>
                    <td>
                        <asp:CheckBox ID="StatementDisabledCheckBox" runat="server" Checked='<%# Bind("StatementDisabled") %>'
                            Enabled="false" />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        Force Statement
                    </td>
                    <td>
                        <asp:CheckBox ID="ForceStatementCheckBox" runat="server" Checked='<%# Bind("ForceStatement") %>'
                            Enabled="false" />
                    </td>
                </tr>
            </table>
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="Edit" />
        </ItemTemplate>
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" DeleteCommand="DELETE FROM [Loans] WHERE [LoanID] = @original_LoanID AND (([L_Status] = @original_L_Status) OR ([L_Status] IS NULL AND @original_L_Status IS NULL)) AND [CCID] = @original_CCID AND [B1_First] = @original_B1_First AND (([B1_Middle] = @original_B1_Middle) OR ([B1_Middle] IS NULL AND @original_B1_Middle IS NULL)) AND [B1_Last] = @original_B1_Last AND (([B1_Suf] = @original_B1_Suf) OR ([B1_Suf] IS NULL AND @original_B1_Suf IS NULL)) AND [B1_SSN] = @original_B1_SSN AND (([B2_First] = @original_B2_First) OR ([B2_First] IS NULL AND @original_B2_First IS NULL)) AND (([B2_Middle] = @original_B2_Middle) OR ([B2_Middle] IS NULL AND @original_B2_Middle IS NULL)) AND (([B2_Last] = @original_B2_Last) OR ([B2_Last] IS NULL AND @original_B2_Last IS NULL)) AND (([B2_Suf] = @original_B2_Suf) OR ([B2_Suf] IS NULL AND @original_B2_Suf IS NULL)) AND (([B2_SSN] = @original_B2_SSN) OR ([B2_SSN] IS NULL AND @original_B2_SSN IS NULL)) AND [Address1] = @original_Address1 AND (([Address2] = @original_Address2) OR ([Address2] IS NULL AND @original_Address2 IS NULL)) AND [City] = @original_City AND [State] = @original_State AND [Zip] = @original_Zip AND (([HomePhone] = @original_HomePhone) OR ([HomePhone] IS NULL AND @original_HomePhone IS NULL)) AND (([WorkPhone] = @original_WorkPhone) OR ([WorkPhone] IS NULL AND @original_WorkPhone IS NULL)) AND [OpenDate] = @original_OpenDate AND [FirstPmtDate] = @original_FirstPmtDate AND [NoPmts] = @original_NoPmts AND [CurrPmtDue] = @original_CurrPmtDue AND [NoPmtsLeft] = @original_NoPmtsLeft AND [LCDate] = @original_LCDate AND [LCAmount] = @original_LCAmount AND [LoanAmount] = @original_LoanAmount AND [CurrBalance] = @original_CurrBalance AND [MonthlyPmt] = @original_MonthlyPmt AND [IntRate] = @original_IntRate AND [DownPmt] = @original_DownPmt AND (([Type] = @original_Type) OR ([Type] IS NULL AND @original_Type IS NULL)) AND (([LastPmtPosted] = @original_LastPmtPosted) OR ([LastPmtPosted] IS NULL AND @original_LastPmtPosted IS NULL)) AND (([LastStatement] = @original_LastStatement) OR ([LastStatement] IS NULL AND @original_LastStatement IS NULL)) AND [ForceStatement] = @original_ForceStatement AND [StatementDisabled] = @original_StatementDisabled"
        InsertCommand="INSERT INTO [Loans] ([L_Status], [CCID], [B1_First], [B1_Middle], [B1_Last], [B1_Suf], [B1_SSN], [B2_First], [B2_Middle], [B2_Last], [B2_Suf], [B2_SSN], [Address1], [Address2], [City], [State], [Zip], [HomePhone], [WorkPhone], [OpenDate], [FirstPmtDate], [NoPmts], [CurrPmtDue], [NoPmtsLeft], [LCDate], [LCAmount], [LoanAmount], [CurrBalance], [MonthlyPmt], [IntRate], [DownPmt], [Type], [LastPmtPosted], [LastStatement], [ForceStatement], [StatementDisabled]) VALUES (@L_Status, @CCID, @B1_First, @B1_Middle, @B1_Last, @B1_Suf, @B1_SSN, @B2_First, @B2_Middle, @B2_Last, @B2_Suf, @B2_SSN, @Address1, @Address2, @City, @State, @Zip, @HomePhone, @WorkPhone, @OpenDate, @FirstPmtDate, @NoPmts, @CurrPmtDue, @NoPmtsLeft, @LCDate, @LCAmount, @LoanAmount, @CurrBalance, @MonthlyPmt, @IntRate, @DownPmt, @Type, @LastPmtPosted, @LastStatement, @ForceStatement, @StatementDisabled)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Loans] WHERE ([LoanID] = @LoanID)"
        UpdateCommand="UPDATE [Loans] SET [L_Status] = @L_Status, [CCID] = @CCID, [B1_First] = @B1_First, [B1_Middle] = @B1_Middle, [B1_Last] = @B1_Last, [B1_Suf] = @B1_Suf, [B1_SSN] = @B1_SSN, [B2_First] = @B2_First, [B2_Middle] = @B2_Middle, [B2_Last] = @B2_Last, [B2_Suf] = @B2_Suf, [B2_SSN] = @B2_SSN, [Address1] = @Address1, [Address2] = @Address2, [City] = @City, [State] = @State, [Zip] = @Zip, [HomePhone] = @HomePhone, [WorkPhone] = @WorkPhone, [OpenDate] = @OpenDate, [FirstPmtDate] = @FirstPmtDate, [NoPmts] = @NoPmts, [CurrPmtDue] = @CurrPmtDue, [NoPmtsLeft] = @NoPmtsLeft, [LCDate] = @LCDate, [LCAmount] = @LCAmount, [LoanAmount] = @LoanAmount, [CurrBalance] = @CurrBalance, [MonthlyPmt] = @MonthlyPmt, [IntRate] = @IntRate, [DownPmt] = @DownPmt, [Type] = @Type, [LastPmtPosted] = @LastPmtPosted, [LastStatement] = @LastStatement, [ForceStatement] = @ForceStatement, [StatementDisabled] = @StatementDisabled WHERE [LoanID] = @original_LoanID AND (([L_Status] = @original_L_Status) OR ([L_Status] IS NULL AND @original_L_Status IS NULL)) AND [CCID] = @original_CCID AND [B1_First] = @original_B1_First AND (([B1_Middle] = @original_B1_Middle) OR ([B1_Middle] IS NULL AND @original_B1_Middle IS NULL)) AND [B1_Last] = @original_B1_Last AND (([B1_Suf] = @original_B1_Suf) OR ([B1_Suf] IS NULL AND @original_B1_Suf IS NULL)) AND [B1_SSN] = @original_B1_SSN AND (([B2_First] = @original_B2_First) OR ([B2_First] IS NULL AND @original_B2_First IS NULL)) AND (([B2_Middle] = @original_B2_Middle) OR ([B2_Middle] IS NULL AND @original_B2_Middle IS NULL)) AND (([B2_Last] = @original_B2_Last) OR ([B2_Last] IS NULL AND @original_B2_Last IS NULL)) AND (([B2_Suf] = @original_B2_Suf) OR ([B2_Suf] IS NULL AND @original_B2_Suf IS NULL)) AND (([B2_SSN] = @original_B2_SSN) OR ([B2_SSN] IS NULL AND @original_B2_SSN IS NULL)) AND [Address1] = @original_Address1 AND (([Address2] = @original_Address2) OR ([Address2] IS NULL AND @original_Address2 IS NULL)) AND [City] = @original_City AND [State] = @original_State AND [Zip] = @original_Zip AND (([HomePhone] = @original_HomePhone) OR ([HomePhone] IS NULL AND @original_HomePhone IS NULL)) AND (([WorkPhone] = @original_WorkPhone) OR ([WorkPhone] IS NULL AND @original_WorkPhone IS NULL)) AND [OpenDate] = @original_OpenDate AND [FirstPmtDate] = @original_FirstPmtDate AND [NoPmts] = @original_NoPmts AND [CurrPmtDue] = @original_CurrPmtDue AND [NoPmtsLeft] = @original_NoPmtsLeft AND [LCDate] = @original_LCDate AND [LCAmount] = @original_LCAmount AND [LoanAmount] = @original_LoanAmount AND [CurrBalance] = @original_CurrBalance AND [MonthlyPmt] = @original_MonthlyPmt AND [IntRate] = @original_IntRate AND [DownPmt] = @original_DownPmt AND (([Type] = @original_Type) OR ([Type] IS NULL AND @original_Type IS NULL)) AND (([LastPmtPosted] = @original_LastPmtPosted) OR ([LastPmtPosted] IS NULL AND @original_LastPmtPosted IS NULL)) AND (([LastStatement] = @original_LastStatement) OR ([LastStatement] IS NULL AND @original_LastStatement IS NULL)) AND [ForceStatement] = @original_ForceStatement AND [StatementDisabled] = @original_StatementDisabled">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="LoanID" PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="original_LoanID" Type="Int32" />
            <asp:Parameter Name="original_L_Status" Type="String" />
            <asp:Parameter Name="original_CCID" Type="Int32" />
            <asp:Parameter Name="original_B1_First" Type="String" />
            <asp:Parameter Name="original_B1_Middle" Type="String" />
            <asp:Parameter Name="original_B1_Last" Type="String" />
            <asp:Parameter Name="original_B1_Suf" Type="String" />
            <asp:Parameter Name="original_B1_SSN" Type="String" />
            <asp:Parameter Name="original_B2_First" Type="String" />
            <asp:Parameter Name="original_B2_Middle" Type="String" />
            <asp:Parameter Name="original_B2_Last" Type="String" />
            <asp:Parameter Name="original_B2_Suf" Type="String" />
            <asp:Parameter Name="original_B2_SSN" Type="String" />
            <asp:Parameter Name="original_Address1" Type="String" />
            <asp:Parameter Name="original_Address2" Type="String" />
            <asp:Parameter Name="original_City" Type="String" />
            <asp:Parameter Name="original_State" Type="String" />
            <asp:Parameter Name="original_Zip" Type="String" />
            <asp:Parameter Name="original_HomePhone" Type="String" />
            <asp:Parameter Name="original_WorkPhone" Type="String" />
            <asp:Parameter DbType="Date" Name="original_OpenDate" />
            <asp:Parameter DbType="Date" Name="original_FirstPmtDate" />
            <asp:Parameter Name="original_NoPmts" Type="String" />
            <asp:Parameter DbType="Date" Name="original_CurrPmtDue" />
            <asp:Parameter Name="original_NoPmtsLeft" Type="String" />
            <asp:Parameter Name="original_LCDate" Type="String" />
            <asp:Parameter Name="original_LCAmount" Type="Decimal" />
            <asp:Parameter Name="original_LoanAmount" Type="Decimal" />
            <asp:Parameter Name="original_CurrBalance" Type="Decimal" />
            <asp:Parameter Name="original_MonthlyPmt" Type="Decimal" />
            <asp:Parameter Name="original_IntRate" Type="Decimal" />
            <asp:Parameter Name="original_DownPmt" Type="Decimal" />
            <asp:Parameter Name="original_Type" Type="String" />
            <asp:Parameter DbType="Date" Name="original_LastPmtPosted" />
            <asp:Parameter DbType="Date" Name="original_LastStatement" />
            <asp:Parameter Name="original_ForceStatement" Type="Boolean" />
            <asp:Parameter Name="original_StatementDisabled" Type="Boolean" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="L_Status" Type="String" />
            <asp:Parameter Name="CCID" Type="Int32" />
            <asp:Parameter Name="B1_First" Type="String" />
            <asp:Parameter Name="B1_Middle" Type="String" />
            <asp:Parameter Name="B1_Last" Type="String" />
            <asp:Parameter Name="B1_Suf" Type="String" />
            <asp:Parameter Name="B1_SSN" Type="String" />
            <asp:Parameter Name="B2_First" Type="String" />
            <asp:Parameter Name="B2_Middle" Type="String" />
            <asp:Parameter Name="B2_Last" Type="String" />
            <asp:Parameter Name="B2_Suf" Type="String" />
            <asp:Parameter Name="B2_SSN" Type="String" />
            <asp:Parameter Name="Address1" Type="String" />
            <asp:Parameter Name="Address2" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="Zip" Type="String" />
            <asp:Parameter Name="HomePhone" Type="String" />
            <asp:Parameter Name="WorkPhone" Type="String" />
            <asp:Parameter DbType="Date" Name="OpenDate" />
            <asp:Parameter DbType="Date" Name="FirstPmtDate" />
            <asp:Parameter Name="NoPmts" Type="String" />
            <asp:Parameter DbType="Date" Name="CurrPmtDue" />
            <asp:Parameter Name="NoPmtsLeft" Type="String" />
            <asp:Parameter Name="LCDate" Type="String" />
            <asp:Parameter Name="LCAmount" Type="Decimal" />
            <asp:Parameter Name="LoanAmount" Type="Decimal" />
            <asp:Parameter Name="CurrBalance" Type="Decimal" />
            <asp:Parameter Name="MonthlyPmt" Type="Decimal" />
            <asp:Parameter Name="IntRate" Type="Decimal" />
            <asp:Parameter Name="DownPmt" Type="Decimal" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter DbType="Date" Name="LastPmtPosted" />
            <asp:Parameter DbType="Date" Name="LastStatement" />
            <asp:Parameter Name="ForceStatement" Type="Boolean" />
            <asp:Parameter Name="StatementDisabled" Type="Boolean" />
            <asp:Parameter Name="original_LoanID" Type="Int32" />
            <asp:Parameter Name="original_L_Status" Type="String" />
            <asp:Parameter Name="original_CCID" Type="Int32" />
            <asp:Parameter Name="original_B1_First" Type="String" />
            <asp:Parameter Name="original_B1_Middle" Type="String" />
            <asp:Parameter Name="original_B1_Last" Type="String" />
            <asp:Parameter Name="original_B1_Suf" Type="String" />
            <asp:Parameter Name="original_B1_SSN" Type="String" />
            <asp:Parameter Name="original_B2_First" Type="String" />
            <asp:Parameter Name="original_B2_Middle" Type="String" />
            <asp:Parameter Name="original_B2_Last" Type="String" />
            <asp:Parameter Name="original_B2_Suf" Type="String" />
            <asp:Parameter Name="original_B2_SSN" Type="String" />
            <asp:Parameter Name="original_Address1" Type="String" />
            <asp:Parameter Name="original_Address2" Type="String" />
            <asp:Parameter Name="original_City" Type="String" />
            <asp:Parameter Name="original_State" Type="String" />
            <asp:Parameter Name="original_Zip" Type="String" />
            <asp:Parameter Name="original_HomePhone" Type="String" />
            <asp:Parameter Name="original_WorkPhone" Type="String" />
            <asp:Parameter DbType="Date" Name="original_OpenDate" />
            <asp:Parameter DbType="Date" Name="original_FirstPmtDate" />
            <asp:Parameter Name="original_NoPmts" Type="String" />
            <asp:Parameter DbType="Date" Name="original_CurrPmtDue" />
            <asp:Parameter Name="original_NoPmtsLeft" Type="String" />
            <asp:Parameter Name="original_LCDate" Type="String" />
            <asp:Parameter Name="original_LCAmount" Type="Decimal" />
            <asp:Parameter Name="original_LoanAmount" Type="Decimal" />
            <asp:Parameter Name="original_CurrBalance" Type="Decimal" />
            <asp:Parameter Name="original_MonthlyPmt" Type="Decimal" />
            <asp:Parameter Name="original_IntRate" Type="Decimal" />
            <asp:Parameter Name="original_DownPmt" Type="Decimal" />
            <asp:Parameter Name="original_Type" Type="String" />
            <asp:Parameter DbType="Date" Name="original_LastPmtPosted" />
            <asp:Parameter DbType="Date" Name="original_LastStatement" />
            <asp:Parameter Name="original_ForceStatement" Type="Boolean" />
            <asp:Parameter Name="original_StatementDisabled" Type="Boolean" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="L_Status" Type="String" />
            <asp:Parameter Name="CCID" Type="Int32" />
            <asp:Parameter Name="B1_First" Type="String" />
            <asp:Parameter Name="B1_Middle" Type="String" />
            <asp:Parameter Name="B1_Last" Type="String" />
            <asp:Parameter Name="B1_Suf" Type="String" />
            <asp:Parameter Name="B1_SSN" Type="String" />
            <asp:Parameter Name="B2_First" Type="String" />
            <asp:Parameter Name="B2_Middle" Type="String" />
            <asp:Parameter Name="B2_Last" Type="String" />
            <asp:Parameter Name="B2_Suf" Type="String" />
            <asp:Parameter Name="B2_SSN" Type="String" />
            <asp:Parameter Name="Address1" Type="String" />
            <asp:Parameter Name="Address2" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="Zip" Type="String" />
            <asp:Parameter Name="HomePhone" Type="String" />
            <asp:Parameter Name="WorkPhone" Type="String" />
            <asp:Parameter DbType="Date" Name="OpenDate" />
            <asp:Parameter DbType="Date" Name="FirstPmtDate" />
            <asp:Parameter Name="NoPmts" Type="String" />
            <asp:Parameter DbType="Date" Name="CurrPmtDue" />
            <asp:Parameter Name="NoPmtsLeft" Type="String" />
            <asp:Parameter Name="LCDate" Type="String" />
            <asp:Parameter Name="LCAmount" Type="Decimal" />
            <asp:Parameter Name="LoanAmount" Type="Decimal" />
            <asp:Parameter Name="CurrBalance" Type="Decimal" />
            <asp:Parameter Name="MonthlyPmt" Type="Decimal" />
            <asp:Parameter Name="IntRate" Type="Decimal" />
            <asp:Parameter Name="DownPmt" Type="Decimal" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter DbType="Date" Name="LastPmtPosted" />
            <asp:Parameter DbType="Date" Name="LastStatement" />
            <asp:Parameter Name="ForceStatement" Type="Boolean" />
            <asp:Parameter Name="StatementDisabled" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="PmtID" DataSourceID="SqlDataSource2"
        InsertItemPosition="LastItem">
        <ItemTemplate>
            <tr style="background-color: #DCDCDC; color: #000000;">
                <td rowspan="3" align="center">
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td align="center">
                    <asp:Label ID="PmtIDLabel" runat="server" Text='<%# Bind("PmtID") %>' />
                </td>
                <td align="center">
                    <asp:Label ID="LoanIDLabel" runat="server" Text='<%# Bind("LoanID") %>' />
                </td>
                <td align="center">
                    <asp:Label ID="PostedDateLabel" runat="server" Text='<%# Bind("PostedDate", "{0:d}") %>' />
                </td>
                <td align="center">
                    <asp:Label ID="EffDateLabel" runat="server" Text='<%# Bind("EffDate", "{0:d}") %>' />
                </td>
                <td align="center">
                    <asp:Label ID="IntDateLabel" runat="server" Text='<%# Bind("IntDate", "{0:d}") %>' />
                </td>
                <td align="center">
                    <asp:Label ID="TypeLabel" runat="server" Text='<%# Bind("Type") %>' />
                </td>
            </tr>
            <tr style="background-color: #DCDCDC; color: #000000;">
                <td align="center">
                    <asp:Label ID="ToPrincipalLabel" runat="server" Text='<%# Bind("ToPrincipal", "{0:C}") %>' />
                </td>
                <td align="center">
                    <asp:Label ID="ToInterestLabel" runat="server" Text='<%# Bind("ToInterest", "{0:C}") %>' />
                </td>
                <td align="center">
                    <asp:Label ID="ToUnplLabel" runat="server" Text='<%# Bind("ToUnpl", "{0:C}") %>' />
                </td>
                <td align="center">
                    <asp:Label ID="ToFeesLabel" runat="server" Text='<%# Bind("ToFees", "{0:C}") %>' />
                </td>
                <td align="center" colspan="2">
                    <asp:Label ID="EnteredByLabel" runat="server" Text='<%# Bind("EnteredBy") %>' />
                </td>
            </tr>
            <tr style="background-color: #DCDCDC; color: #000000;">
                <td align="center" colspan="6">
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr style="background-color: #FFF8DC;">
                <td rowspan="3" align="center">
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td align="center">
                    <asp:Label ID="PmtIDLabel" runat="server" Text='<%# Bind("PmtID") %>' />
                </td>
                <td align="center">
                    <asp:Label ID="LoanIDLabel" runat="server" Text='<%# Bind("LoanID") %>' />
                </td>
                <td align="center">
                    <asp:Label ID="PostedDateLabel" runat="server" Text='<%# Bind("PostedDate", "{0:d}") %>' />
                </td>
                <td align="center">
                    <asp:Label ID="EffDateLabel" runat="server" Text='<%# Bind("EffDate", "{0:d}") %>' />
                </td>
                <td align="center">
                    <asp:Label ID="IntDateLabel" runat="server" Text='<%# Bind("IntDate", "{0:d}") %>' />
                </td>
                <td align="center">
                    <asp:Label ID="TypeLabel" runat="server" Text='<%# Bind("Type") %>' />
                </td>
            </tr>
            <tr style="background-color: #FFF8DC;">
                <td align="center">
                    <asp:Label ID="ToPrincipalLabel" runat="server" Text='<%# Bind("ToPrincipal", "{0:C}") %>' />
                </td>
                <td align="center">
                    <asp:Label ID="ToInterestLabel" runat="server" Text='<%# Bind("ToInterest", "{0:C}") %>' />
                </td>
                <td align="center">
                    <asp:Label ID="ToUnplLabel" runat="server" Text='<%# Bind("ToUnpl", "{0:C}") %>' />
                </td>
                <td align="center">
                    <asp:Label ID="ToFeesLabel" runat="server" Text='<%# Bind("ToFees", "{0:C}") %>' />
                </td>
                <td align="center" colspan="2">
                    <asp:Label ID="EnteredByLabel" runat="server" Text='<%# Bind("EnteredBy") %>' />
                </td>
            </tr>
            <tr style="background-color: #FFF8DC;">
                <td align="center" colspan="6">
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse;
                border-color: #999999; border-style: none; border-width: 1px;">
                <tr>
                    <td>
                        No data was returned.
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td rowspan="3">
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    &nbsp;
                </td>
                <td align="center">
                    <asp:TextBox ID="LoanIDTextBox" runat="server" Text='<%# Bind("LoanID") %>' />
                </td>
                <td align="center">
                    <asp:TextBox ID="PostedDateTextBox" runat="server" Text='<%# Bind("PostedDate") %>' />
                </td>
                <td align="center">
                    <asp:TextBox ID="EffDateTextBox" runat="server" Text='<%# Bind("EffDate") %>' />
                </td>
                <td align="center">
                    <asp:TextBox ID="IntDateTextBox" runat="server" Text='<%# Bind("IntDate") %>' />
                </td>
                <td align="center">
                    <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
                </td>
            </tr>
            <tr style="">
                <td align="center">
                    <asp:TextBox ID="ToPrincipalTextBox" runat="server" Text='<%# Bind("ToPrincipal") %>' />
                </td>
                <td align="center">
                    <asp:TextBox ID="ToInterestTextBox" runat="server" Text='<%# Bind("ToInterest") %>' />
                </td>
                <td align="center">
                    <asp:TextBox ID="ToUnplTextBox" runat="server" Text='<%# Bind("ToUnpl") %>' />
                </td>
                <td align="center">
                    <asp:TextBox ID="ToFeesTextBox" runat="server" Text='<%# Bind("ToFees") %>' />
                </td>
                <td colspan="2" align="center">
                    <asp:TextBox ID="EnteredByTextBox" runat="server" Text='<%# Bind("EnteredBy") %>'
                        Width="95%" />
                </td>
            </tr>
            <tr style="">
                <td colspan="6" align="center">
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>'
                        Width="95%" />
                </td>
            </tr>
        </InsertItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;
                            border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;
                            font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                <th runat="server" rowspan="3">
                                </th>
                                <th runat="server">
                                    Payment ID
                                </th>
                                <th runat="server">
                                    Loan ID
                                </th>
                                <th runat="server">
                                    Posted Date
                                </th>
                                <th runat="server">
                                    Eff Date
                                </th>
                                <th runat="server">
                                    Int Date
                                </th>
                                <th runat="server">
                                    Type
                                </th>
                            </tr>
                            <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                <th runat="server">
                                    To Principal
                                </th>
                                <th runat="server">
                                    To Interest
                                </th>
                                <th runat="server">
                                    To Unpl
                                </th>
                                <th runat="server">
                                    To Fees
                                </th>
                                <th runat="server" colspan="2">
                                    Entered By
                                </th>
                            </tr>
                            <tr id="Tr1" runat="server" style="background-color: #DCDCDC; color: #000000;">
                                <th id="Th1" runat="server" colspan="6">
                                    Description
                                </th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;
                        color: #000000;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <EditItemTemplate>
            <tr style="background-color: #008A8C; color: #FFFFFF;">
                <td rowspan="3">
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td align="center">
                    <asp:Label ID="PmtIDLabel1" runat="server" Text='<%# Eval("PmtID") %>' />
                </td>
                <td align="center">
                    <asp:TextBox ID="LoanIDTextBox" runat="server" Text='<%# Bind("LoanID") %>' />
                </td>
                <td align="center">
                    <asp:TextBox ID="PostedDateTextBox" runat="server" Text='<%# Bind("PostedDate") %>' />
                </td>
                <td align="center">
                    <asp:TextBox ID="EffDateTextBox" runat="server" Text='<%# Bind("EffDate") %>' />
                </td>
                <td align="center">
                    <asp:TextBox ID="IntDateTextBox" runat="server" Text='<%# Bind("IntDate") %>' />
                </td>
                <td align="center">
                    <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
                </td>
            </tr>
            <tr style="background-color: #008A8C; color: #FFFFFF;">
                <td align="center">
                    <asp:TextBox ID="ToPrincipalTextBox" runat="server" Text='<%# Bind("ToPrincipal") %>' />
                </td>
                <td align="center">
                    <asp:TextBox ID="ToInterestTextBox" runat="server" Text='<%# Bind("ToInterest") %>' />
                </td>
                <td align="center">
                    <asp:TextBox ID="ToUnplTextBox" runat="server" Text='<%# Bind("ToUnpl") %>' />
                </td>
                <td align="center">
                    <asp:TextBox ID="ToFeesTextBox" runat="server" Text='<%# Bind("ToFees") %>' />
                </td>
                <td colspan="2" align="center">
                    <asp:TextBox ID="EnteredByTextBox" runat="server" Text='<%# Bind("EnteredBy") %>'
                        Width="95%" />
                </td>
            </tr>
            <tr style="background-color: #008A8C; color: #FFFFFF;">
                <td colspan="6" align="center">
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>'
                        Width="95%" />
                </td>
            </tr>
        </EditItemTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">
                <td rowspan="3">
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="PmtIDLabel" runat="server" Text='<%# Eval("PmtID") %>' />
                </td>
                <td>
                    <asp:Label ID="LoanIDLabel" runat="server" Text='<%# Eval("LoanID") %>' />
                </td>
                <td>
                    <asp:Label ID="PostedDateLabel" runat="server" Text='<%# Eval("PostedDate") %>' />
                </td>
                <td>
                    <asp:Label ID="EffDateLabel" runat="server" Text='<%# Eval("EffDate") %>' />
                </td>
                <td>
                    <asp:Label ID="IntDateLabel" runat="server" Text='<%# Eval("IntDate") %>' />
                </td>
                <td>
                    <asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' />
                </td>
            </tr>
            <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">
                <td>
                    <asp:Label ID="ToPrincipalLabel" runat="server" Text='<%# Eval("ToPrincipal") %>' />
                </td>
                <td>
                    <asp:Label ID="ToInterestLabel" runat="server" Text='<%# Eval("ToInterest") %>' />
                </td>
                <td>
                    <asp:Label ID="ToUnplLabel" runat="server" Text='<%# Eval("ToUnpl") %>' />
                </td>
                <td>
                    <asp:Label ID="ToFeesLabel" runat="server" Text='<%# Eval("ToFees") %>' />
                </td>
                <td colspan="2">
                    <asp:Label ID="EnteredByLabel" runat="server" Text='<%# Eval("EnteredBy") %>' />
                </td>
            </tr>
            <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">
                <td colspan="6">
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" DeleteCommand="DELETE FROM [Payments] WHERE [PmtID] = @original_PmtID AND [LoanID] = @original_LoanID AND [PostedDate] = @original_PostedDate AND [EffDate] = @original_EffDate AND [IntDate] = @original_IntDate AND [Type] = @original_Type AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([ToPrincipal] = @original_ToPrincipal) OR ([ToPrincipal] IS NULL AND @original_ToPrincipal IS NULL)) AND (([ToInterest] = @original_ToInterest) OR ([ToInterest] IS NULL AND @original_ToInterest IS NULL)) AND (([ToUnpl] = @original_ToUnpl) OR ([ToUnpl] IS NULL AND @original_ToUnpl IS NULL)) AND (([ToFees] = @original_ToFees) OR ([ToFees] IS NULL AND @original_ToFees IS NULL)) AND [EnteredBy] = @original_EnteredBy"
        InsertCommand="INSERT INTO [Payments] ([LoanID], [PostedDate], [EffDate], [IntDate], [Type], [Description], [ToPrincipal], [ToInterest], [ToUnpl], [ToFees], [EnteredBy]) VALUES (@LoanID, @PostedDate, @EffDate, @IntDate, @Type, @Description, @ToPrincipal, @ToInterest, @ToUnpl, @ToFees, @EnteredBy)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Payments] WHERE ([LoanID] = @LoanID) ORDER BY [PostedDate] DESC"
        UpdateCommand="UPDATE [Payments] SET [LoanID] = @LoanID, [PostedDate] = @PostedDate, [EffDate] = @EffDate, [IntDate] = @IntDate, [Type] = @Type, [Description] = @Description, [ToPrincipal] = @ToPrincipal, [ToInterest] = @ToInterest, [ToUnpl] = @ToUnpl, [ToFees] = @ToFees, [EnteredBy] = @EnteredBy WHERE [PmtID] = @original_PmtID AND [LoanID] = @original_LoanID AND [PostedDate] = @original_PostedDate AND [EffDate] = @original_EffDate AND [IntDate] = @original_IntDate AND [Type] = @original_Type AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([ToPrincipal] = @original_ToPrincipal) OR ([ToPrincipal] IS NULL AND @original_ToPrincipal IS NULL)) AND (([ToInterest] = @original_ToInterest) OR ([ToInterest] IS NULL AND @original_ToInterest IS NULL)) AND (([ToUnpl] = @original_ToUnpl) OR ([ToUnpl] IS NULL AND @original_ToUnpl IS NULL)) AND (([ToFees] = @original_ToFees) OR ([ToFees] IS NULL AND @original_ToFees IS NULL)) AND [EnteredBy] = @original_EnteredBy">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="LoanID" PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="original_PmtID" Type="Int32" />
            <asp:Parameter Name="original_LoanID" Type="Int32" />
            <asp:Parameter Name="original_PostedDate" Type="DateTime" />
            <asp:Parameter DbType="Date" Name="original_EffDate" />
            <asp:Parameter DbType="Date" Name="original_IntDate" />
            <asp:Parameter Name="original_Type" Type="Int32" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_ToPrincipal" Type="Decimal" />
            <asp:Parameter Name="original_ToInterest" Type="Decimal" />
            <asp:Parameter Name="original_ToUnpl" Type="Decimal" />
            <asp:Parameter Name="original_ToFees" Type="Decimal" />
            <asp:Parameter Name="original_EnteredBy" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="LoanID" Type="Int32" />
            <asp:Parameter Name="PostedDate" Type="DateTime" />
            <asp:Parameter DbType="Date" Name="EffDate" />
            <asp:Parameter DbType="Date" Name="IntDate" />
            <asp:Parameter Name="Type" Type="Int32" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="ToPrincipal" Type="Decimal" />
            <asp:Parameter Name="ToInterest" Type="Decimal" />
            <asp:Parameter Name="ToUnpl" Type="Decimal" />
            <asp:Parameter Name="ToFees" Type="Decimal" />
            <asp:Parameter Name="EnteredBy" Type="String" />
            <asp:Parameter Name="original_PmtID" Type="Int32" />
            <asp:Parameter Name="original_LoanID" Type="Int32" />
            <asp:Parameter Name="original_PostedDate" Type="DateTime" />
            <asp:Parameter DbType="Date" Name="original_EffDate" />
            <asp:Parameter DbType="Date" Name="original_IntDate" />
            <asp:Parameter Name="original_Type" Type="Int32" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_ToPrincipal" Type="Decimal" />
            <asp:Parameter Name="original_ToInterest" Type="Decimal" />
            <asp:Parameter Name="original_ToUnpl" Type="Decimal" />
            <asp:Parameter Name="original_ToFees" Type="Decimal" />
            <asp:Parameter Name="original_EnteredBy" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="LoanID" Type="Int32" />
            <asp:Parameter Name="PostedDate" Type="DateTime" />
            <asp:Parameter DbType="Date" Name="EffDate" />
            <asp:Parameter DbType="Date" Name="IntDate" />
            <asp:Parameter Name="Type" Type="Int32" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="ToPrincipal" Type="Decimal" />
            <asp:Parameter Name="ToInterest" Type="Decimal" />
            <asp:Parameter Name="ToUnpl" Type="Decimal" />
            <asp:Parameter Name="ToFees" Type="Decimal" />
            <asp:Parameter Name="EnteredBy" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
