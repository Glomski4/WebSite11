<%@ Page Title="" Language="VB" MasterPageFile="~/Modification/Modification.master"
    AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Modification_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            &nbsp;<asp:Label ID="Step" runat="server" Text=""></asp:Label>
            &nbsp;|
            <asp:Label ID="ActiveLoan" runat="server" Text=""></asp:Label>
            <br />
            <asp:Wizard ID="Wizard1" runat="server" Height="100%" Width="100%" ActiveStepIndex="5"
                DisplaySideBar="False" StepNextButtonText="Next / Save">
                <WizardSteps>
                    <asp:WizardStep runat="server" Title="Search For Loan" StepType="Complete">
                        <asp:TextBox ID="TextBox1" runat="server" MaxLength="10"></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" Text="Search" />
                        <br />
                        <br />
                        <asp:FormView ID="FormView1" runat="server" DataKeyNames="LoanID" DataSourceID="SqlDataSource1"
                            AllowPaging="True">
                            <EditItemTemplate>
                                LoanID:
                                <asp:Label ID="LoanIDLabel1" runat="server" Text='<%# Eval("LoanID") %>' />
                                <br />
                                L_Status:
                                <asp:TextBox ID="L_StatusTextBox" runat="server" Text='<%# Bind("L_Status") %>' />
                                <br />
                                B1_First:
                                <asp:TextBox ID="B1_FirstTextBox" runat="server" Text='<%# Bind("B1_First") %>' />
                                <br />
                                B1_Last:
                                <asp:TextBox ID="B1_LastTextBox" runat="server" Text='<%# Bind("B1_Last") %>' />
                                <br />
                                B2_First:
                                <asp:TextBox ID="B2_FirstTextBox" runat="server" Text='<%# Bind("B2_First") %>' />
                                <br />
                                B2_Last:
                                <asp:TextBox ID="B2_LastTextBox" runat="server" Text='<%# Bind("B2_Last") %>' />
                                <br />
                                CurrPmtDue:
                                <asp:TextBox ID="CurrPmtDueTextBox" runat="server" Text='<%# Bind("CurrPmtDue") %>' />
                                <br />
                                Type:
                                <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
                                <br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Update" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                                    CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                L_Status:
                                <asp:TextBox ID="L_StatusTextBox" runat="server" Text='<%# Bind("L_Status") %>' />
                                <br />
                                B1_First:
                                <asp:TextBox ID="B1_FirstTextBox" runat="server" Text='<%# Bind("B1_First") %>' />
                                <br />
                                B1_Last:
                                <asp:TextBox ID="B1_LastTextBox" runat="server" Text='<%# Bind("B1_Last") %>' />
                                <br />
                                B2_First:
                                <asp:TextBox ID="B2_FirstTextBox" runat="server" Text='<%# Bind("B2_First") %>' />
                                <br />
                                B2_Last:
                                <asp:TextBox ID="B2_LastTextBox" runat="server" Text='<%# Bind("B2_Last") %>' />
                                <br />
                                CurrPmtDue:
                                <asp:TextBox ID="CurrPmtDueTextBox" runat="server" Text='<%# Bind("CurrPmtDue") %>' />
                                <br />
                                Type:
                                <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                    Text="Insert" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                    CommandName="Cancel" Text="Cancel" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                LoanID:
                                <asp:Label ID="LoanIDLabel" runat="server" Text='<%# Eval("LoanID") %>' />
                                <br />
                                L_Status:
                                <asp:Label ID="L_StatusLabel" runat="server" Text='<%# Bind("L_Status") %>' />
                                <br />
                                B1_First:
                                <asp:Label ID="B1_FirstLabel" runat="server" Text='<%# Bind("B1_First") %>' />
                                <br />
                                B1_Last:
                                <asp:Label ID="B1_LastLabel" runat="server" Text='<%# Bind("B1_Last") %>' />
                                <br />
                                B2_First:
                                <asp:Label ID="B2_FirstLabel" runat="server" Text='<%# Bind("B2_First") %>' />
                                <br />
                                B2_Last:
                                <asp:Label ID="B2_LastLabel" runat="server" Text='<%# Bind("B2_Last") %>' />
                                <br />
                                CurrPmtDue:
                                <asp:Label ID="CurrPmtDueLabel" runat="server" Text='<%# Bind("CurrPmtDue") %>' />
                                <br />
                                Type:
                                <asp:Label ID="TypeLabel" runat="server" Text='<%# Bind("Type") %>' />
                                <br />
                                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" Text="Select Loan"></asp:LinkButton>
                                <br />
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
                            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [LoanID], [L_Status], [B1_First], [B1_Last], [B2_First], [B2_Last], [CurrPmtDue], [Type] FROM [Loans] WHERE ([LoanID] = @LoanID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="TextBox1" Name="LoanID" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:WizardStep>
                    <asp:WizardStep runat="server" Title="Locate Mod">
                        &nbsp;<asp:FormView ID="FormView2" runat="server" DataKeyNames="Mod ID" DataSourceID="SqlDataSource2"
                            AllowPaging="True">
                            <EditItemTemplate>
                                Mod ID:
                                <asp:Label ID="Mod_IDLabel1" runat="server" Text='<%# Eval("[Mod ID]") %>' />
                                <br />
                                Loan Number:
                                <asp:TextBox ID="Loan_NumberTextBox" runat="server" Text='<%# Bind("[Loan Number]") %>' />
                                <br />
                                Status:
                                <asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>' />
                                <br />
                                Added On:
                                <asp:TextBox ID="Added_OnTextBox" runat="server" Text='<%# Bind("[Added On]") %>' />
                                <br />
                                Added By:
                                <asp:TextBox ID="Added_ByTextBox" runat="server" Text='<%# Bind("[Added By]") %>' />
                                <br />
                                Last Edit On:
                                <asp:TextBox ID="Last_Edit_OnTextBox" runat="server" Text='<%# Bind("[Last Edit On]") %>' />
                                <br />
                                Last Edit By:
                                <asp:TextBox ID="Last_Edit_ByTextBox" runat="server" Text='<%# Bind("[Last Edit By]") %>' />
                                <br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Update" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                                    CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                No Mods On File.<br />
                                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Add Loan To Mod System" />
                            </EmptyDataTemplate>
                            <InsertItemTemplate>
                                Loan Number:
                                <asp:TextBox ID="Loan_NumberTextBox" runat="server" Text='<%# Bind("[Loan Number]") %>' />
                                <br />
                                Status:
                                <asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>' />
                                <br />
                                Added On:
                                <asp:TextBox ID="Added_OnTextBox" runat="server" Text='<%# Bind("[Added On]") %>' />
                                <br />
                                Added By:
                                <asp:TextBox ID="Added_ByTextBox" runat="server" Text='<%# Bind("[Added By]") %>' />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                    Text="Insert" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                    CommandName="Cancel" Text="Cancel" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                Mod ID:
                                <asp:Label ID="Mod_IDLabel" runat="server" Text='<%# Eval("[Mod ID]") %>' />
                                <br />
                                Loan Number:
                                <asp:Label ID="Loan_NumberLabel" runat="server" Text='<%# Bind("[Loan Number]") %>' />
                                <br />
                                Status:
                                <asp:Label ID="StatusLabel" runat="server" Text='<%# Bind("Status") %>' />
                                <br />
                                Added On:
                                <asp:Label ID="Added_OnLabel" runat="server" Text='<%# Bind("[Added On]") %>' />
                                <br />
                                Added By:
                                <asp:Label ID="Added_ByLabel" runat="server" Text='<%# Bind("[Added By]") %>' />
                                <br />
                                Last Edit On:
                                <asp:Label ID="Last_Edit_OnLabel" runat="server" Text='<%# Bind("[Last Edit On]") %>' />
                                <br />
                                Last Edit By:
                                <asp:Label ID="Last_Edit_ByLabel" runat="server" Text='<%# Bind("[Last Edit By]") %>' />
                                <br />
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
                            SelectCommand="SELECT Modification.ModID AS [Mod ID], Modification.LoanNo AS [Loan Number], Modification_Status.StatusDesc AS Status, Modification.DateTimeAdded AS [Added On], Users.Name AS [Added By], Modification.DateTimeEdit AS [Last Edit On], Users_1.Name AS [Last Edit By] FROM Modification_Status RIGHT OUTER JOIN Users RIGHT OUTER JOIN Users AS Users_1 RIGHT OUTER JOIN Modification ON Users_1.Username = Modification.EditBy ON Users.Username = Modification.AddedBy ON Modification_Status.StatusID = Modification.Status WHERE (Modification.LoanNo = @LoanNo)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ActiveLoan" Name="LoanNo" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:WizardStep>
                    <asp:WizardStep runat="server" Title="View Current Loan Info">
                        <asp:FormView ID="FormView3" runat="server" DataKeyNames="LoanID" DataSourceID="SqlDataSource3">
                            <EditItemTemplate>
                                LoanID:
                                <asp:Label ID="LoanIDLabel1" runat="server" Text='<%# Eval("LoanID") %>' />
                                <br />
                                L_Status:
                                <asp:TextBox ID="L_StatusTextBox" runat="server" Text='<%# Bind("L_Status") %>' />
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
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Update" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                                    CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                L_Status:
                                <asp:TextBox ID="L_StatusTextBox" runat="server" Text='<%# Bind("L_Status") %>' />
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
                                <table class="style1">
                                    <tr>
                                        <td>
                                            Loan ID
                                        </td>
                                        <td>
                                            <asp:Label ID="LoanIDLabel" runat="server" Text='<%# Eval("LoanID") %>' />
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
                                        <td colspan="5">
                                            Borrower Details
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            First
                                        </td>
                                        <td>
                                            Middle
                                        </td>
                                        <td>
                                            Last
                                        </td>
                                        <td>
                                            Suffix
                                        </td>
                                        <td>
                                            SSN
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
                                        <td colspan="5">
                                            Co-Borrower Details
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            First
                                        </td>
                                        <td>
                                            Middle
                                        </td>
                                        <td>
                                            Last
                                        </td>
                                        <td>
                                            Suffix
                                        </td>
                                        <td>
                                            SSN
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
                                        <td rowspan="3">
                                            Address
                                        </td>
                                        <td colspan="4">
                                            <asp:Label ID="Address1Label" runat="server" Text='<%# Bind("Address1") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <asp:Label ID="Address2Label" runat="server" Text='<%# Bind("Address2") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
                                            ,
                                            <asp:Label ID="StateLabel" runat="server" Text='<%# Bind("State") %>' />
                                            &nbsp;<asp:Label ID="ZipLabel" runat="server" Text='<%# Bind("Zip") %>' />
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
                                            No. Payments
                                        </td>
                                        <td>
                                            Loan Amount
                                        </td>
                                        <td>
                                            Down Payment
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="OpenDateLabel" runat="server" Text='<%# Bind("OpenDate", "{0:d}") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="FirstPmtDateLabel" runat="server" Text='<%# Bind("FirstPmtDate", "{0:d}") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="NoPmtsLabel" runat="server" Text='<%# Bind("NoPmts") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="LoanAmountLabel" runat="server" Text='<%# Bind("LoanAmount", "{0:C}") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="DownPmtLabel" runat="server" Text='<%# Bind("DownPmt", "{0:C}") %>' />
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
                                            Last Payment Posted
                                        </td>
                                        <td>
                                            Due Date
                                        </td>
                                        <td>
                                            No. Payments Left
                                        </td>
                                        <td>
                                            Current Balance
                                        </td>
                                        <td>
                                            Interest Rate
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="LastPmtPostedLabel" runat="server" Text='<%# Bind("LastPmtPosted", "{0:d}") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="CurrPmtDueLabel" runat="server" Text='<%# Bind("CurrPmtDue", "{0:d}") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="NoPmtsLeftLabel" runat="server" Text='<%# Bind("NoPmtsLeft") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="CurrBalanceLabel" runat="server" Text='<%# Bind("CurrBalance", "{0:C}") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="IntRateLabel" runat="server" Text='<%# Bind("IntRate") %>' />
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
                                            Monthly Payment
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            LC Date
                                        </td>
                                        <td>
                                            LC Amount
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="MonthlyPmtLabel" runat="server" Text='<%# Bind("MonthlyPmt", "{0:C}") %>' />
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="LCDateLabel" runat="server" Text='<%# Bind("LCDate") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="LCAmountLabel" runat="server" Text='<%# Bind("LCAmount", "{0:C}") %>' />
                                        </td>
                                        <td>
                                            &nbsp;
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
                                            Type
                                        </td>
                                        <td colspan="4">
                                            <asp:Label ID="TypeLabel" runat="server" Text='<%# Bind("Type") %>' />
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
                                            Last Statement
                                        </td>
                                        <td>
                                            <asp:Label ID="LastStatementLabel" runat="server" Text='<%# Bind("LastStatement", "{0:d}") %>' />
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            Force Statment
                                            <asp:CheckBox ID="ForceStatementCheckBox" runat="server" Checked='<%# Bind("ForceStatement") %>'
                                                Enabled="false" />
                                        </td>
                                        <td>
                                            Statement Disabled
                                            <asp:CheckBox ID="StatementDisabledCheckBox" runat="server" Checked='<%# Bind("StatementDisabled") %>'
                                                Enabled="false" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
                            SelectCommand="SELECT * FROM [Loans] WHERE ([LoanID] = @LoanID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ActiveLoan" Name="LoanID" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:WizardStep>
                    <asp:WizardStep runat="server" Title="Monthly Income">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            Monthly Gross Income
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TB_MHI_1" runat="server">$0.00</asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;
                                            <asp:HiddenField ID="HF_MHI" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Overtime
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TB_MHI_2" runat="server">$0.00</asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Child Support / Alimony / Separation *
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TB_MHI_3" runat="server">$0.00</asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Social Security
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TB_MHI_4" runat="server">$0.00</asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Tips, Commissions, Bonus
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TB_MHI_5" runat="server">$0.00</asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Rent Received
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TB_MHI_6" runat="server">$0.00</asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Unemployment Income
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TB_MHI_7" runat="server">$0.00</asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Other
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TB_MHI_8" runat="server">$0.00</asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Total (Gross Income)
                                        </td>
                                        <td>
                                            <asp:Label ID="L_MHI_Total" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Button ID="Button3" runat="server" Text="Update" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            *You are not disclose Child Support, Alimony or Separation
                                            <br />
                                            Maintenance Income, unless you choose to have it considered by your servicer.
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="TB_MHI_1" EventName="TextChanged" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </asp:WizardStep>
                    <asp:WizardStep runat="server" Title="Monthly Expenses">
                        <table>
                            <tr>
                                <td>
                                    1st Mortgage Payment&nbsp;</td>
                                <td>
                                    <asp:TextBox ID="TB_MHE_1" runat="server">$0.00</asp:TextBox>
                                </td>
                                <td>
                                    <asp:Button ID="Button5" runat="server" TabIndex="99" Text="Add Loan Payment" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    2nd Mortgage Payment</td>
                                <td>
                                    <asp:TextBox ID="TB_MHE_2" runat="server">$0.00</asp:TextBox>
                                </td>
                                <td>
                                    <asp:Button ID="Button6" runat="server" TabIndex="99" Text="Add Loan Payment" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Insurance</td>
                                <td>
                                    <asp:TextBox ID="TB_MHE_3" runat="server">$0.00</asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    Property Taxes</td>
                                <td>
                                    <asp:TextBox ID="TB_MHE_4" runat="server">$0.00</asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    CC / Installment Loan<br />
                                    (total min payment per Month)</td>
                                <td>
                                    <asp:TextBox ID="TB_MHE_5" runat="server">$0.00</asp:TextBox>
                                </td>
                                <td>
                                    <asp:HiddenField ID="HF_MHE" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Alimony / Child Support Payments</td>
                                <td>
                                    <asp:TextBox ID="TB_MHE_6" runat="server">$0.00</asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    Net Rental Expenses</td>
                                <td>
                                    <asp:TextBox ID="TB_MHE_7" runat="server">$0.00</asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    HOA / Property Maintenance</td>
                                <td>
                                    <asp:TextBox ID="TB_MHE_8" runat="server">$0.00</asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    Car Payment</td>
                                <td>
                                    <asp:TextBox ID="TB_MHE_9" runat="server">$0.00</asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    Other Expenses</td>
                                <td>
                                    <asp:TextBox ID="TB_MHE_10" runat="server">$0.00</asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    Total Monthly Expenses</td>
                                <td>
                                    <asp:Label ID="L_MHE_Total" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:Button ID="Button4" runat="server" Text="Update" />
                                </td>
                            </tr>
                        </table>
                    </asp:WizardStep>
                    <asp:WizardStep runat="server" Title="Road Map">
                        <asp:Button ID="Button7" runat="server" 
                            Text="Collections Rep - I&amp;E Update Only" />
                    </asp:WizardStep>
                </WizardSteps>
            </asp:Wizard>
        </ContentTemplate>
    </asp:UpdatePanel>
    &nbsp;
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
    </asp:UpdateProgress>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder4" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder5" runat="Server">
</asp:Content>
