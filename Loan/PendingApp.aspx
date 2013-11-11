<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false"
    CodeFile="PendingApp.aspx.vb" Inherits="Loan_PendingApp" %>

<%@ Register src="../CarView.ascx" tagname="CarView" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            color: #000000;
        }
        .style3
        {
            border: 1px solid #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        No Application Selected to View.
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <asp:MultiView ID="MultiView2" runat="server">
                            <asp:View ID="View3" runat="server">
                                <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" BackColor="#FFFBD6" 
                                    BorderColor="#FFDFAD" BorderStyle="Groove" BorderWidth="1px" 
                                    DisplaySideBar="False" Font-Names="Verdana" Font-Size="0.8em" Height="300px" 
                                    Width="900px">
                                    <StepStyle VerticalAlign="Top" />
                                    <WizardSteps>
                                        <asp:WizardStep ID="A" runat="server" Title="Step 1">
                                            <table class="style1">
                                                <tr>
                                                    <td class="style3">
                                                        Monthly Income
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="MonthlyIncome" runat="server" AutoPostBack="True" 
                                                            Font-Names="Verdana" Font-Size="0.8em">0</asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style3">
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style3">
                                                        Car Price
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="CarPrice" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style3">
                                                        Down Payment
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="DownPmt" runat="server" AutoPostBack="True" 
                                                            Font-Names="Verdana" Font-Size="0.8em">0</asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style3">
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style3">
                                                        Loan Amount
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="LoanAmt" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style3">
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style4">
                                                        Interets Rate
                                                    </td>
                                                    <td class="style2">
                                                        <asp:Label ID="LoanRate" runat="server" Text="0.00%"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style4">
                                                        &nbsp;
                                                    </td>
                                                    <td class="style2">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style4">
                                                        Number of Payments
                                                    </td>
                                                    <td class="style2">
                                                        <asp:DropDownList ID="NoOfPmts" runat="server" AutoPostBack="True" 
                                                            Font-Size="0.8em" Style="font-family: Verdana">
                                                            <asp:ListItem Selected="True">12</asp:ListItem>
                                                            <asp:ListItem>24</asp:ListItem>
                                                            <asp:ListItem>36</asp:ListItem>
                                                            <asp:ListItem>48</asp:ListItem>
                                                            <asp:ListItem>60</asp:ListItem>
                                                            <asp:ListItem>72</asp:ListItem>
                                                        </asp:DropDownList>
                                                        &nbsp;(Months)
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style4">
                                                        &nbsp;
                                                    </td>
                                                    <td class="style2">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style4">
                                                        Monthly Payment
                                                    </td>
                                                    <td class="style2">
                                                        <asp:Label ID="MonthlyPmt" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style4">
                                                        &nbsp;
                                                    </td>
                                                    <td class="style2">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:WizardStep>
                                        <asp:WizardStep ID="B" runat="server" Title="Step 2">
                                            Amortzation Schedule.<br />
                                            <asp:TextBox ID="A1" runat="server" ReadOnly="True" 
                                                Style="font-family: 'Courier New'" TextMode="MultiLine" Width="834px" 
                                                Wrap="False"></asp:TextBox>
                                            <br />
                                        </asp:WizardStep>
                                    </WizardSteps>
                                    <SideBarButtonStyle ForeColor="White" />
                                    <NavigationButtonStyle BackColor="White" BorderColor="#CC9966" 
                                        BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
                                        ForeColor="#990000" />
                                    <SideBarStyle BackColor="#990000" Font-Size="0.9em" VerticalAlign="Top" />
                                    <HeaderStyle BackColor="#FFCC66" BorderColor="#FFFBD6" BorderStyle="Solid" 
                                        BorderWidth="2px" Font-Bold="True" Font-Size="0.9em" ForeColor="#333333" 
                                        HorizontalAlign="Center" />
                                </asp:Wizard>
                            </asp:View>
                            <asp:View ID="View4" runat="server">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConflictDetection="CompareAllValues" 
                                    ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
                                    DeleteCommand="DELETE FROM [LoanApps] WHERE [LAppID] = @original_LAppID AND [AppID] = @original_AppID AND [Created] = @original_Created AND (([Income] = @original_Income) OR ([Income] IS NULL AND @original_Income IS NULL)) AND (([CarPrice] = @original_CarPrice) OR ([CarPrice] IS NULL AND @original_CarPrice IS NULL)) AND (([DownPmt] = @original_DownPmt) OR ([DownPmt] IS NULL AND @original_DownPmt IS NULL)) AND (([LoanAmt] = @original_LoanAmt) OR ([LoanAmt] IS NULL AND @original_LoanAmt IS NULL)) AND (([NoOfPmts] = @original_NoOfPmts) OR ([NoOfPmts] IS NULL AND @original_NoOfPmts IS NULL)) AND (([PmtAmt] = @original_PmtAmt) OR ([PmtAmt] IS NULL AND @original_PmtAmt IS NULL)) AND (([ReviewedBy] = @original_ReviewedBy) OR ([ReviewedBy] IS NULL AND @original_ReviewedBy IS NULL)) AND (([Notes] = @original_Notes) OR ([Notes] IS NULL AND @original_Notes IS NULL))" 
                                    InsertCommand="INSERT INTO [LoanApps] ([AppID], [Created], [Income], [CarPrice], [DownPmt], [LoanAmt], [NoOfPmts], [PmtAmt], [ReviewedBy], [Notes]) VALUES (@AppID, @Created, @Income, @CarPrice, @DownPmt, @LoanAmt, @NoOfPmts, @PmtAmt, @ReviewedBy, @Notes)" 
                                    OldValuesParameterFormatString="original_{0}" 
                                    SelectCommand="SELECT * FROM [LoanApps] WHERE ([AppID] = @AppID)" 
                                    UpdateCommand="UPDATE [LoanApps] SET [AppID] = @AppID, [Created] = @Created, [Income] = @Income, [CarPrice] = @CarPrice, [DownPmt] = @DownPmt, [LoanAmt] = @LoanAmt, [NoOfPmts] = @NoOfPmts, [PmtAmt] = @PmtAmt, [ReviewedBy] = @ReviewedBy, [Notes] = @Notes WHERE [LAppID] = @original_LAppID AND [AppID] = @original_AppID AND [Created] = @original_Created AND (([Income] = @original_Income) OR ([Income] IS NULL AND @original_Income IS NULL)) AND (([CarPrice] = @original_CarPrice) OR ([CarPrice] IS NULL AND @original_CarPrice IS NULL)) AND (([DownPmt] = @original_DownPmt) OR ([DownPmt] IS NULL AND @original_DownPmt IS NULL)) AND (([LoanAmt] = @original_LoanAmt) OR ([LoanAmt] IS NULL AND @original_LoanAmt IS NULL)) AND (([NoOfPmts] = @original_NoOfPmts) OR ([NoOfPmts] IS NULL AND @original_NoOfPmts IS NULL)) AND (([PmtAmt] = @original_PmtAmt) OR ([PmtAmt] IS NULL AND @original_PmtAmt IS NULL)) AND (([ReviewedBy] = @original_ReviewedBy) OR ([ReviewedBy] IS NULL AND @original_ReviewedBy IS NULL)) AND (([Notes] = @original_Notes) OR ([Notes] IS NULL AND @original_Notes IS NULL))">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="AppID" QueryStringField="AppID" Type="Int32" />
                                    </SelectParameters>
                                    <DeleteParameters>
                                        <asp:Parameter Name="original_LAppID" Type="Int32" />
                                        <asp:Parameter Name="original_AppID" Type="Int32" />
                                        <asp:Parameter Name="original_Created" Type="DateTime" />
                                        <asp:Parameter Name="original_Income" Type="String" />
                                        <asp:Parameter Name="original_CarPrice" Type="String" />
                                        <asp:Parameter Name="original_DownPmt" Type="String" />
                                        <asp:Parameter Name="original_LoanAmt" Type="String" />
                                        <asp:Parameter Name="original_NoOfPmts" Type="String" />
                                        <asp:Parameter Name="original_PmtAmt" Type="String" />
                                        <asp:Parameter Name="original_ReviewedBy" Type="String" />
                                        <asp:Parameter Name="original_Notes" Type="String" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="AppID" Type="Int32" />
                                        <asp:Parameter Name="Created" Type="DateTime" />
                                        <asp:Parameter Name="Income" Type="String" />
                                        <asp:Parameter Name="CarPrice" Type="String" />
                                        <asp:Parameter Name="DownPmt" Type="String" />
                                        <asp:Parameter Name="LoanAmt" Type="String" />
                                        <asp:Parameter Name="NoOfPmts" Type="String" />
                                        <asp:Parameter Name="PmtAmt" Type="String" />
                                        <asp:Parameter Name="ReviewedBy" Type="String" />
                                        <asp:Parameter Name="Notes" Type="String" />
                                        <asp:Parameter Name="original_LAppID" Type="Int32" />
                                        <asp:Parameter Name="original_AppID" Type="Int32" />
                                        <asp:Parameter Name="original_Created" Type="DateTime" />
                                        <asp:Parameter Name="original_Income" Type="String" />
                                        <asp:Parameter Name="original_CarPrice" Type="String" />
                                        <asp:Parameter Name="original_DownPmt" Type="String" />
                                        <asp:Parameter Name="original_LoanAmt" Type="String" />
                                        <asp:Parameter Name="original_NoOfPmts" Type="String" />
                                        <asp:Parameter Name="original_PmtAmt" Type="String" />
                                        <asp:Parameter Name="original_ReviewedBy" Type="String" />
                                        <asp:Parameter Name="original_Notes" Type="String" />
                                    </UpdateParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="AppID" Type="Int32" />
                                        <asp:Parameter Name="Created" Type="DateTime" />
                                        <asp:Parameter Name="Income" Type="String" />
                                        <asp:Parameter Name="CarPrice" Type="String" />
                                        <asp:Parameter Name="DownPmt" Type="String" />
                                        <asp:Parameter Name="LoanAmt" Type="String" />
                                        <asp:Parameter Name="NoOfPmts" Type="String" />
                                        <asp:Parameter Name="PmtAmt" Type="String" />
                                        <asp:Parameter Name="ReviewedBy" Type="String" />
                                        <asp:Parameter Name="Notes" Type="String" />
                                    </InsertParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
                                    SelectCommand="SELECT * FROM [PendingApps] WHERE ([AppID] = @AppID)">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="AppID" QueryStringField="AppID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <table class="style3">
                                    <tr>
                                        <td>
                                            <asp:FormView ID="FormView1" runat="server" CellPadding="4" 
                                                DataKeyNames="LAppID" DataSourceID="SqlDataSource1" ForeColor="#333333">
                                                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                                <EditItemTemplate>
                                                    LAppID:
                                                    <asp:Label ID="LAppIDLabel1" runat="server" Text='<%# Eval("LAppID") %>' />
                                                    &nbsp;<br />
                                                    AppID:
                                                    <asp:TextBox ID="AppIDTextBox" runat="server" Enabled="False" 
                                                        Text='<%# Bind("AppID") %>' />
                                                    <br />
                                                    Created:
                                                    <asp:TextBox ID="CreatedTextBox" runat="server" Enabled="False" 
                                                        Text='<%# Bind("Created") %>' />
                                                    <br />
                                                    Income:
                                                    <asp:TextBox ID="IncomeTextBox" runat="server" Text='<%# Bind("Income") %>' />
                                                    <br />
                                                    CarPrice:
                                                    <asp:TextBox ID="CarPriceTextBox" runat="server" 
                                                        Text='<%# Bind("CarPrice") %>' />
                                                    <br />
                                                    DownPmt:
                                                    <asp:TextBox ID="DownPmtTextBox" runat="server" Text='<%# Bind("DownPmt") %>' />
                                                    <br />
                                                    LoanAmt:
                                                    <asp:TextBox ID="LoanAmtTextBox" runat="server" Text='<%# Bind("LoanAmt") %>' />
                                                    <br />
                                                    NoOfPmts:
                                                    <asp:TextBox ID="NoOfPmtsTextBox" runat="server" 
                                                        Text='<%# Bind("NoOfPmts") %>' />
                                                    <br />
                                                    PmtAmt:
                                                    <asp:TextBox ID="PmtAmtTextBox" runat="server" Text='<%# Bind("PmtAmt") %>' />
                                                    <br />
                                                    ReviewedBy:
                                                    <asp:TextBox ID="ReviewedBy" runat="server" Enabled="False" 
                                                        Text='<%# Bind("ReviewedBy") %>' />
                                                    &nbsp;<br />
                                                    Notes:
                                                    <asp:TextBox ID="NotesTextBox" runat="server" Text='<%# Bind("Notes") %>' />
                                                    <br />
                                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                                        CommandName="Update" Text="Update" />
                                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                                </EditItemTemplate>
                                                <InsertItemTemplate>
                                                    AppID:
                                                    <asp:TextBox ID="AppIDTextBox" runat="server" Text='<%# Bind("AppID") %>' />
                                                    <br />
                                                    Created:
                                                    <asp:TextBox ID="CreatedTextBox" runat="server" Text='<%# Bind("Created") %>' />
                                                    <br />
                                                    Income:
                                                    <asp:TextBox ID="IncomeTextBox" runat="server" Text='<%# Bind("Income") %>' />
                                                    <br />
                                                    CarPrice:
                                                    <asp:TextBox ID="CarPriceTextBox" runat="server" 
                                                        Text='<%# Bind("CarPrice") %>' />
                                                    <br />
                                                    DownPmt:
                                                    <asp:TextBox ID="DownPmtTextBox" runat="server" Text='<%# Bind("DownPmt") %>' />
                                                    <br />
                                                    LoanAmt:
                                                    <asp:TextBox ID="LoanAmtTextBox" runat="server" Text='<%# Bind("LoanAmt") %>' />
                                                    <br />
                                                    NoOfPmts:
                                                    <asp:TextBox ID="NoOfPmtsTextBox" runat="server" 
                                                        Text='<%# Bind("NoOfPmts") %>' />
                                                    <br />
                                                    PmtAmt:
                                                    <asp:TextBox ID="PmtAmtTextBox" runat="server" Text='<%# Bind("PmtAmt") %>' />
                                                    <br />
                                                    ReviewedBy:
                                                    <asp:TextBox ID="ReviewedByTextBox" runat="server" 
                                                        Text='<%# Bind("ReviewedBy") %>' />
                                                    <br />
                                                    Notes:
                                                    <asp:TextBox ID="NotesTextBox" runat="server" Text='<%# Bind("Notes") %>' />
                                                    <br />
                                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                                        CommandName="Insert" Text="Insert" />
                                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                                </InsertItemTemplate>
                                                <ItemTemplate>
                                                    LAppID:
                                                    <asp:Label ID="LAppIDLabel" runat="server" Text='<%# Eval("LAppID") %>' />
                                                    <br />
                                                    AppID:
                                                    <asp:Label ID="AppIDLabel" runat="server" Text='<%# Bind("AppID") %>' />
                                                    <br />
                                                    Created:
                                                    <asp:Label ID="CreatedLabel" runat="server" Text='<%# Bind("Created") %>' />
                                                    <br />
                                                    Income:
                                                    <asp:Label ID="IncomeLabel" runat="server" Text='<%# Bind("Income") %>' />
                                                    <br />
                                                    CarPrice:
                                                    <asp:Label ID="CarPriceLabel" runat="server" Text='<%# Bind("CarPrice") %>' />
                                                    <br />
                                                    DownPmt:
                                                    <asp:Label ID="DownPmtLabel" runat="server" Text='<%# Bind("DownPmt") %>' />
                                                    <br />
                                                    LoanAmt:
                                                    <asp:Label ID="LoanAmtLabel" runat="server" Text='<%# Bind("LoanAmt") %>' />
                                                    <br />
                                                    NoOfPmts:
                                                    <asp:Label ID="NoOfPmtsLabel" runat="server" Text='<%# Bind("NoOfPmts") %>' />
                                                    <br />
                                                    PmtAmt:
                                                    <asp:Label ID="PmtAmtLabel" runat="server" Text='<%# Bind("PmtAmt") %>' />
                                                    <br />
                                                    ReviewedBy:
                                                    <asp:Label ID="ReviewedByLabel" runat="server" 
                                                        Text='<%# Bind("ReviewedBy") %>' />
                                                    <br />
                                                    Notes:
                                                    <asp:Label ID="NotesLabel" runat="server" Text='<%# Bind("Notes") %>' />
                                                    <br />
                                                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                                        CommandName="Edit" OnClick="EditButton_Click" Text="Edit" />
                                                    &nbsp;|
                                                    <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click">Approve</asp:LinkButton>
                                                    &nbsp;|
                                                    <asp:LinkButton ID="LinkButton4" runat="server" onclick="LinkButton4_Click">Deny</asp:LinkButton>
                                                </ItemTemplate>
                                                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                            </asp:FormView>
                                        </td>
                                        <td>
                                            <asp:FormView ID="FormView2" runat="server" DataKeyNames="AppID" 
                                                DataSourceID="SqlDataSource2">
                                                <EditItemTemplate>
                                                    AppID:
                                                    <asp:Label ID="AppIDLabel1" runat="server" Text='<%# Eval("AppID") %>' />
                                                    <br />
                                                    CarID:
                                                    <asp:TextBox ID="CarIDTextBox" runat="server" Text='<%# Bind("CarID") %>' />
                                                    <br />
                                                    ClientID:
                                                    <asp:TextBox ID="ClientIDTextBox" runat="server" 
                                                        Text='<%# Bind("ClientID") %>' />
                                                    <br />
                                                    Created:
                                                    <asp:TextBox ID="CreatedTextBox" runat="server" Text='<%# Bind("Created") %>' />
                                                    <br />
                                                    AppStatus:
                                                    <asp:TextBox ID="AppStatusTextBox" runat="server" 
                                                        Text='<%# Bind("AppStatus") %>' />
                                                    <br />
                                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                                        CommandName="Update" Text="Update" />
                                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                                </EditItemTemplate>
                                                <InsertItemTemplate>
                                                    CarID:
                                                    <asp:TextBox ID="CarIDTextBox" runat="server" Text='<%# Bind("CarID") %>' />
                                                    <br />
                                                    ClientID:
                                                    <asp:TextBox ID="ClientIDTextBox" runat="server" 
                                                        Text='<%# Bind("ClientID") %>' />
                                                    <br />
                                                    Created:
                                                    <asp:TextBox ID="CreatedTextBox" runat="server" Text='<%# Bind("Created") %>' />
                                                    <br />
                                                    AppStatus:
                                                    <asp:TextBox ID="AppStatusTextBox" runat="server" 
                                                        Text='<%# Bind("AppStatus") %>' />
                                                    <br />
                                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                                        CommandName="Insert" Text="Insert" />
                                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                                </InsertItemTemplate>
                                                <ItemTemplate>
                                                    AppID:
                                                    <asp:Label ID="AppIDLabel" runat="server" Text='<%# Eval("AppID") %>' />
                                                    <br />
                                                    CarID:
                                                    <asp:Label ID="CarIDLabel" runat="server" Text='<%# Bind("CarID") %>' />
                                                    <br />
                                                    ClientID:
                                                    <asp:Label ID="ClientIDLabel" runat="server" Text='<%# Bind("ClientID") %>' />
                                                    <br />
                                                    Created:
                                                    <asp:Label ID="CreatedLabel" runat="server" Text='<%# Bind("Created") %>' />
                                                    <br />
                                                    AppStatus:
                                                    <asp:Label ID="AppStatusLabel" runat="server" Text='<%# Bind("AppStatus") %>' />
                                                    <br />
                                                </ItemTemplate>
                                            </asp:FormView>
                                        </td>
                                        <td>
                                            <uc1:CarView ID="CarView1" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:View>
                            <asp:View ID="View5" runat="server">
                                ~ Loan Approved.... Please go to loan office to finsh your loan. Thanks
                            </asp:View>
                            <asp:View ID="View6" runat="server">
                                ~ We are sorry, But your loan request has been denied.
                                <br />
                                ~~~ A letter is being sent to you that you will get in 7-10 days to advise why 
                                your loan was denied.
                            </asp:View>
                        </asp:MultiView>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
