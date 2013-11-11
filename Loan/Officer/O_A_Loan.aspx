<%@ Page Title="" Language="VB" MasterPageFile="~/Loan/Officer/LoanOfficer.master"
    AutoEventWireup="false" CodeFile="O_A_Loan.aspx.vb" Inherits="Loan_Officer_O_A_Loan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <table class="style1">
        <tr>
            <td>
                Loan App ID :
                <asp:Label ID="LoanID" runat="server"></asp:Label>
                &nbsp;| Current Step :
                <asp:Label ID="W_C_Step" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" BackColor="#FFFBD6" BorderColor="#FFDFAD"
                    BorderWidth="1px" CancelDestinationPageUrl="~/Loan/Officer/Default.aspx" DisplaySideBar="False"
                    Font-Names="Verdana" Font-Size="0.8em" Height="100%" Style="font-size: small"
                    Width="100%">
                    <WizardSteps>
                        <asp:WizardStep runat="server" AllowReturn="False" StepType="Complete" Title="Step 1 | Pick Client">
                            Locate the loan to create.<br />
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
                                SelectCommand="SELECT LoanApps.LAppID, LoanApps.AppID, LoanApps.Created, LoanApps.Income, LoanApps.CarPrice, LoanApps.DownPmt, LoanApps.LoanAmt, LoanApps.NoOfPmts, LoanApps.PmtAmt, LoanApps.SubmittedBy, LoanApps.ReviewedBy, Car.Year, Car.Make, Car.Model, Clients.FirstName, Clients.MiddleName, Clients.LastName, Clients.SSN, LoanApps.Notes FROM PendingApps INNER JOIN Car ON PendingApps.CarID = Car.CarID INNER JOIN Clients ON PendingApps.ClientID = Clients.ClientID LEFT OUTER JOIN LoanApps ON PendingApps.AppID = LoanApps.AppID WHERE (PendingApps.AppStatus = N'A') ORDER BY LoanApps.Created">
                            </asp:SqlDataSource>
                            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                DataKeyNames="LAppID" DataMember="DefaultView" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:BoundField DataField="Created" HeaderText="Created" SortExpression="Created" />
                                    <asp:BoundField DataField="SubmittedBy" HeaderText="SubmittedBy" SortExpression="SubmittedBy" />
                                    <asp:BoundField DataField="ReviewedBy" HeaderText="ReviewedBy" SortExpression="ReviewedBy" />
                                    <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                                    <asp:BoundField DataField="Make" HeaderText="Make" SortExpression="Make" />
                                    <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                                    <asp:BoundField DataField="SSN" HeaderText="SSN" SortExpression="SSN" />
                                    <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                                    <asp:BoundField DataField="AppID" HeaderText="AppID" SortExpression="AppID" />
                                </Columns>
                            </asp:GridView>
                        </asp:WizardStep>
                        <asp:WizardStep runat="server" Title="Step 2 | Loan Detail Review">
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
                                
                                SelectCommand="SELECT LoanApps.LAppID, LoanApps.AppID, LoanApps.Created, LoanApps.Income, LoanApps.CarPrice, LoanApps.DownPmt, LoanApps.LoanAmt, LoanApps.NoOfPmts, LoanApps.PmtAmt, LoanApps.SubmittedBy, LoanApps.ReviewedBy, Car.Year, Car.Make, Car.Model, Clients.FirstName, Clients.MiddleName, Clients.LastName, Clients.SSN, Car.Active, Clients.Address1, Clients.Address2, Clients.City, Clients.State, Clients.Zip, Clients.Phone, Car.CarID FROM PendingApps INNER JOIN Car ON PendingApps.CarID = Car.CarID INNER JOIN Clients ON PendingApps.ClientID = Clients.ClientID LEFT OUTER JOIN LoanApps ON PendingApps.AppID = LoanApps.AppID WHERE (PendingApps.AppStatus = N'A') AND (LoanApps.LAppID = @LAppID) ORDER BY LoanApps.Created">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="LoanID" Name="LAppID" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataSourceID="SqlDataSource2"
                                DefaultMode="Edit" ForeColor="#333333" Width="100%">
                                <EditItemTemplate>
                                    <table class="style1">
                                        <tr>
                                            <td colspan="4" style="font-size: small; text-align: left; background-color: #FFCCCC;">
                                                <b>* <span style="text-decoration: underline">Borrower</span> <span style="text-decoration: underline">
                                                    Info</span></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                First Name
                                            </td>
                                            <td>
                                                Middle Name
                                            </td>
                                            <td>
                                                Last Name
                                            </td>
                                            <td>
                                                Sufix
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>'
                                                    Width="100%" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="MiddleNameTextBox" runat="server" Text='<%# Bind("MiddleName") %>'
                                                    Width="100%" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' Width="100%" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="SuffixTextBox" runat="server" CausesValidation="True" Width="100%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                SSN
                                            </td>
                                            <td>
                                                <asp:TextBox ID="SSNTextBox" runat="server" Text='<%# Bind("SSN") %>' Width="100%" />
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" style="font-size: small; text-align: left; background-color: #FFCCCC;">
                                                <b>* <span style="text-decoration: underline">Co-Borrower</span> <span style="text-decoration: underline">
                                                    Info</span></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                First Name
                                            </td>
                                            <td>
                                                Middle Name
                                            </td>
                                            <td>
                                                &nbsp;Last Name
                                            </td>
                                            <td>
                                                Sufix
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="COFirstNameTextBox" runat="server" Width="100%" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="COMiddleNameTextBox" runat="server" Width="100%" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="COLastNameTextBox" runat="server" Width="100%" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="COSuffixTextBox" runat="server" CausesValidation="True" Width="100%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                SSN
                                            </td>
                                            <td>
                                                <asp:TextBox ID="COSSNTextBox" runat="server" Width="100%" />
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" style="font-size: small; text-align: left; background-color: #FFCCCC;">
                                                <b>* <span style="text-decoration: underline">Mailing</span> <span style="text-decoration: underline">
                                                    Address</span>/<span style="text-decoration: underline">Phone</span> <span style="text-decoration: underline">
                                                        Info</span></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Address 1
                                            </td>
                                            <td colspan="3">
                                                <asp:TextBox ID="Address1TextBox" runat="server" Text='<%# Bind("Address1") %>' Width="100%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Address 2
                                            </td>
                                            <td colspan="3">
                                                <asp:TextBox ID="Address2TextBox" runat="server" Text='<%# Bind("Address2") %>' Width="100%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                City
                                            </td>
                                            <td>
                                                State
                                            </td>
                                            <td>
                                                Zip
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' Width="100%" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' Width="100%" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="ZipTextBox" runat="server" Text='<%# Bind("Zip") %>' Width="100%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Home Phone
                                            </td>
                                            <td>
                                                <asp:TextBox ID="HomePhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' Width="100%" />
                                            </td>
                                            <td>
                                                Work Phone
                                            </td>
                                            <td>
                                                <asp:TextBox ID="WorkPhoneTextBox" runat="server" Width="100%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" style="font-size: small; text-align: left; background-color: #FFCCCC;">
                                                <b>* <span style="text-decoration: underline">Loan</span> <span style="text-decoration: underline">
                                                    Details</span></b>
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
                                                No. of Payments
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="OpenDateTextBox" runat="server" ReadOnly="True" Style="background-color: #CCCCCC"
                                                    Text='<%# Bind("NoOfPmts") %>' Width="100%" />
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="FirstPmtDate" runat="server" Width="100%">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="NoOfPmtsTextBox" runat="server" ReadOnly="True" Style="background-color: #CCCCCC"
                                                    Text='<%# Bind("NoOfPmts") %>' Width="100%" />
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Late Charge Date
                                            </td>
                                            <td>
                                                Late Charge %
                                            </td>
                                            <td>
                                                Late Charge Amount
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:DropDownList ID="LCDate" runat="server" Width="100%">
                                                    <asp:ListItem>5</asp:ListItem>
                                                    <asp:ListItem>8</asp:ListItem>
                                                    <asp:ListItem Selected="True">10</asp:ListItem>
                                                    <asp:ListItem>12</asp:ListItem>
                                                    <asp:ListItem>15</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="LCPerc" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                                                    Width="100%">
                                                    <asp:ListItem Value="0.05">5%</asp:ListItem>
                                                    <asp:ListItem Selected="True" Value="0.10">10%</asp:ListItem>
                                                    <asp:ListItem Value="0.15">15%</asp:ListItem>
                                                    <asp:ListItem Value="0.20">20%</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="LCAmountTextBox" runat="server" ReadOnly="True" Style="background-color: #CCCCCC"
                                                    Text='<%# Bind("PmtAmt") %>' Width="100%" />
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
                                                Interest Rate
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
                                                <asp:TextBox ID="PmtAmtTextBox" runat="server" ReadOnly="True" Style="background-color: #CCCCCC"
                                                    Text='<%# Bind("PmtAmt") %>' Width="100%" />
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="IntRate" runat="server" AutoPostBack="True" OnSelectedIndexChanged="IntRate_SelectedIndexChanged"
                                                    Width="100%">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="LoanAmtTextBox" runat="server" ReadOnly="True" Style="background-color: #CCCCCC"
                                                    Text='<%# Bind("LoanAmt") %>' Width="100%" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="DownPmtTextBox" runat="server" ReadOnly="True" Style="background-color: #CCCCCC"
                                                    Text='<%# Bind("DownPmt") %>' Width="100%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Year
                                            </td>
                                            <td>
                                                Make
                                            </td>
                                            <td>
                                                Model
                                            </td>
                                            <td>
                                                Car ID</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="YearTextBox" runat="server" ReadOnly="True" Style="background-color: #CCCCCC"
                                                    Text='<%# Bind("Year") %>' Width="100%" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="MakeTextBox" runat="server" ReadOnly="True" Style="background-color: #CCCCCC"
                                                    Text='<%# Bind("Make") %>' Width="100%" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="ModelTextBox" runat="server" ReadOnly="True" Style="background-color: #CCCCCC"
                                                    Text='<%# Bind("Model") %>' Width="100%" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="CarIDTextBox" runat="server" ReadOnly="True" 
                                                    Style="background-color: #CCCCCC" Text='<%# Bind("CarID") %>' Width="100%" />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                        Text="Update" />
                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                                        CommandName="Cancel" Text="Cancel" />
                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton0" runat="server" 
                                        CausesValidation="False" CommandName="Cancel" 
                                        onclick="UpdateCancelButton0_Click" Text="Send Back To Officer for Changes." />
                                </EditItemTemplate>
                                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
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
                                    <asp:TextBox ID="CarPriceTextBox" runat="server" Text='<%# Bind("CarPrice") %>' />
                                    <br />
                                    DownPmt:
                                    <asp:TextBox ID="DownPmtTextBox" runat="server" Text='<%# Bind("DownPmt") %>' />
                                    <br />
                                    LoanAmt:
                                    <asp:TextBox ID="LoanAmtTextBox" runat="server" Text='<%# Bind("LoanAmt") %>' />
                                    <br />
                                    NoOfPmts:
                                    <asp:TextBox ID="NoOfPmtsTextBox" runat="server" Text='<%# Bind("NoOfPmts") %>' />
                                    <br />
                                    PmtAmt:
                                    <asp:TextBox ID="PmtAmtTextBox" runat="server" Text='<%# Bind("PmtAmt") %>' />
                                    <br />
                                    SubmittedBy:
                                    <asp:TextBox ID="SubmittedByTextBox" runat="server" Text='<%# Bind("SubmittedBy") %>' />
                                    <br />
                                    ReviewedBy:
                                    <asp:TextBox ID="ReviewedByTextBox" runat="server" Text='<%# Bind("ReviewedBy") %>' />
                                    <br />
                                    Year:
                                    <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
                                    <br />
                                    Make:
                                    <asp:TextBox ID="MakeTextBox" runat="server" Text='<%# Bind("Make") %>' />
                                    <br />
                                    Model:
                                    <asp:TextBox ID="ModelTextBox" runat="server" Text='<%# Bind("Model") %>' />
                                    <br />
                                    FirstName:
                                    <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                                    <br />
                                    MiddleName:
                                    <asp:TextBox ID="MiddleNameTextBox" runat="server" Text='<%# Bind("MiddleName") %>' />
                                    <br />
                                    LastName:
                                    <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                                    <br />
                                    SSN:
                                    <asp:TextBox ID="SSNTextBox" runat="server" Text='<%# Bind("SSN") %>' />
                                    <br />
                                    Active:
                                    <asp:TextBox ID="ActiveTextBox" runat="server" Text='<%# Bind("Active") %>' />
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
                                    Phone:
                                    <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                                    <br />
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                        Text="Insert" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                        CommandName="Cancel" Text="Cancel" />
                                </InsertItemTemplate>
                                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            </asp:FormView>
                        </asp:WizardStep>
                        <asp:WizardStep runat="server" Title="Step 3 | Down Payment">
                            Down Payment Details<br />
                            <asp:PlaceHolder ID="Place_DownPayment" runat="server"></asp:PlaceHolder>
                            <asp:MultiView ID="DPType" runat="server" ActiveViewIndex="0">
                                <asp:View ID="View3" runat="server">
                                    <asp:RadioButtonList ID="DPTypeList" runat="server" AutoPostBack="True" CellPadding="4"
                                        CellSpacing="4" RepeatDirection="Horizontal">
                                        <asp:ListItem>Visa</asp:ListItem>
                                        <asp:ListItem>Check</asp:ListItem>
                                        <asp:ListItem>Cash</asp:ListItem>
                                    </asp:RadioButtonList>
                                </asp:View>
                            </asp:MultiView>
                            <asp:MultiView ID="DPResponce" runat="server">
                                <asp:View ID="Visa" runat="server">
                                    Please run card for the down payment amount of
                                    <asp:Label ID="DPAmt1" runat="server"></asp:Label>
                                    , Then click Next.
                                </asp:View>
                                <asp:View ID="Check" runat="server">
                                    Please have client make check out for the down payment of
                                    <asp:Label ID="DPAmt2" runat="server"></asp:Label>
                                    with todays date, Then click Next.
                                </asp:View>
                                <asp:View ID="Cash" runat="server">
                                    Please collect the down payment of
                                    <asp:Label ID="DPAmt3" runat="server"></asp:Label>
                                    from the client, Then click Next.
                                </asp:View>
                            </asp:MultiView>
                        </asp:WizardStep>
                        <asp:WizardStep runat="server" Title="Step 4 | Loan Agreement" StepType="Step">
                            <textarea id="TextArea1" name="S1" runat="server" 
                                style="font-family: 'Courier New'; font-size: small" Visible="False"></textarea>
                            <br />
                            <asp:HyperLink ID="HyperLink1" runat="server" 
                                NavigateUrl="~/Loan/Officer/PDFs/Doc1.pdf" Target="_blank">Loan Agreement</asp:HyperLink>
                        </asp:WizardStep>
                        <asp:WizardStep runat="server" StepType="Complete" 
                            Title="Setp 5 | Complete Loan" AllowReturn="False">
                            <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True">
                                <asp:ListItem Selected="True" Value="0">Loan Terms Reviewed</asp:ListItem>
                                <asp:ListItem Selected="True" Value="1">Client Data Reviewed</asp:ListItem>
                                <asp:ListItem Value="2">Loan Agreement Printed</asp:ListItem>
                                <asp:ListItem Value="3">Loan Agreement Signed</asp:ListItem>
                                <asp:ListItem Value="4">Down Payment Collected</asp:ListItem>
                                <asp:ListItem Value="5">* Ready to create loan ?</asp:ListItem>
                            </asp:CheckBoxList>
                        </asp:WizardStep>
                        <asp:WizardStep runat="server" Title="Step 6 | Loan Created" 
                            AllowReturn="False" StepType="Complete">
                            The Loan has been created.
                            <br />
                            Loan ID :
                            <asp:Label ID="NewLoanID" runat="server"></asp:Label>
                        </asp:WizardStep>
                    </WizardSteps>
                    <SideBarButtonStyle ForeColor="White" />
                    <NavigationButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid"
                        BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" />
                    <SideBarStyle BackColor="#990000" Font-Size="0.9em" VerticalAlign="Top" />
                    <HeaderStyle BackColor="#FFCC66" BorderColor="#FFFBD6" BorderStyle="Solid" BorderWidth="2px"
                        Font-Bold="True" Font-Size="0.9em" ForeColor="#333333" HorizontalAlign="Center" />
                </asp:Wizard>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder4" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder5" runat="Server">
</asp:Content>
