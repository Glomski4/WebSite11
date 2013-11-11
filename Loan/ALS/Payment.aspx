<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false" CodeFile="Payment.aspx.vb" Inherits="Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        &nbsp;</p>
    <p>
        <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" 
            DisplaySideBar="False" Width="100%">
            <WizardSteps>
                <asp:WizardStep runat="server" StepType="Complete" title="Step 1">
                    Start By Looking Up Loan.<br />
                    <table>
                        <tr>
                            <td>
                                Loan Number :
                            </td>
                            <td>
                                <asp:TextBox ID="LoanNo" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="Search1" runat="server" Text="Search" />
                                <asp:Label ID="Alert1" runat="server" style="color: #CC0000" Text="*" 
                                    Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <hr />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                SSN :
                            </td>
                            <td>
                                <asp:TextBox ID="SSN" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="Search2" runat="server" Text="Search" />
                                <asp:Label ID="Alert2" runat="server" style="color: #CC0000" Text="*" 
                                    Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <hr />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                First Name :
                            </td>
                            <td>
                                <asp:TextBox ID="FirstName" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                Last Name :
                            </td>
                            <td>
                                <asp:TextBox ID="LastName" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="Search3" runat="server" Text="Search" />
                                <asp:Label ID="Alert3" runat="server" style="color: #CC0000" Text="*" 
                                    Visible="False"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:WizardStep>
                <asp:WizardStep runat="server" title="Step 2" StepType="Complete">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        CellPadding="1" CellSpacing="1" DataKeyNames="LoanID" 
                        DataSourceID="SqlDataSource1" Width="100%">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:HyperLinkField DataNavigateUrlFields="LoanID" 
                                DataNavigateUrlFormatString="Default.aspx?FORWARD=VALID&amp;LoanNo={0}" 
                                Text="Go To LRS" />
                            <asp:BoundField DataField="LoanID" HeaderText="LoanID" InsertVisible="False" 
                                ReadOnly="True" SortExpression="LoanID" />
                            <asp:BoundField DataField="B1_First" HeaderText="B1_First" 
                                SortExpression="B1_First" />
                            <asp:BoundField DataField="B1_Last" HeaderText="B1_Last" 
                                SortExpression="B1_Last" />
                            <asp:BoundField DataField="B1_SSN" HeaderText="B1_SSN" 
                                SortExpression="B1_SSN" />
                            <asp:BoundField DataField="B2_First" HeaderText="B2_First" 
                                SortExpression="B2_First" />
                            <asp:BoundField DataField="B2_Last" HeaderText="B2_Last" 
                                SortExpression="B2_Last" />
                            <asp:BoundField DataField="B2_SSN" HeaderText="B2_SSN" 
                                SortExpression="B2_SSN" />
                            <asp:BoundField DataField="MonthlyPmt" DataFormatString="{0:c}" 
                                HeaderText="MonthlyPmt" SortExpression="MonthlyPmt" />
                            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                        </Columns>
                        <EmptyDataTemplate>
                            No Loans Found,
                            <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click">Search Again?</asp:LinkButton>
                        </EmptyDataTemplate>
                        <RowStyle HorizontalAlign="Center" VerticalAlign="Top" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
                        SelectCommand="SELECT LoanID, B1_First, B1_Last, B1_SSN, B2_First, B2_Last, B2_SSN, MonthlyPmt, Type FROM Loans">
                    </asp:SqlDataSource>
                </asp:WizardStep>
                <asp:WizardStep runat="server" Title="Step 3" StepType="Start">
                    Payment Details<br />
                    <table class="style1">
                        <tr>
                            <td valign="top">
                                <asp:CheckBoxList ID="CheckBoxList1" runat="server">
                                </asp:CheckBoxList>
                            </td>
                            <td valign="top">
                                Auto Post Amount
                                <br />
                                <asp:TextBox ID="APA" runat="server"></asp:TextBox>
                            </td>
                            <td valign="top">
                                Eff Date
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ControlToValidate="EffDate" ErrorMessage="* MM/DD/YYYY" SetFocusOnError="True" 
                                    ValidationExpression="(0[1-9]|1[012])[/](0[1-9]|[12][0-9]|3[01])[/](\d{4})"></asp:RegularExpressionValidator>
                                <br />
                                <asp:TextBox ID="EffDate" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <b><span class="style2">Total Due : </span>
                                <asp:Label ID="T_Due" runat="server" CssClass="style2"></asp:Label>
                                </b>
                            </td>
                            <td valign="top">
                                &nbsp;</td>
                            <td valign="top">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:WizardStep>
                <asp:WizardStep runat="server" Title="Step 4" StepType="Complete">
                    Select Payment Type<br />
                    <asp:CheckBoxList ID="CheckBoxList2" runat="server" AutoPostBack="True">
                        <asp:ListItem Value="4">Check</asp:ListItem>
                        <asp:ListItem Value="5">Cash</asp:ListItem>
                    </asp:CheckBoxList>
                </asp:WizardStep>
                <asp:WizardStep runat="server" StepType="Complete" Title="P - Check">
                    <table>
                        <tr>
                            <td>
                                Check From
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="P_Check_From" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                Check Number
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="P_Check_From" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="P_Check_From" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="P_Check_Number" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                Date
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="P_Check_Date" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                Check Amount</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="P_Check_Date" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="P_Check_Amount" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="Post Payment" />
                            </td>
                        </tr>
                    </table>
                </asp:WizardStep>
                <asp:WizardStep runat="server" StepType="Complete" Title="P- Cash">
                    <table>
                        <tr>
                            <td>
                                Date</td>
                            <td>
                                Amount</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="P_Cash_Date" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="P_Cash_Amount" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                <asp:Button ID="Button2" runat="server" Text="Post Payment" />
                            </td>
                        </tr>
                    </table>
                </asp:WizardStep>
                <asp:WizardStep runat="server" AllowReturn="False" StepType="Complete" 
                    Title="Payment Posted">
                    The Payment Has Been Posted.<br />
                    <br />
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl="~/Loan/Officer/PDFs/ErrorOutText.pdf">View</asp:HyperLink>
                    &nbsp;Payment Posting Audit Report.<br />
                    <br />
                    <asp:HyperLink ID="HyperLink2" runat="server" 
                        NavigateUrl="~/Loan/ALS/Default.aspx">Go To</asp:HyperLink>
                    &nbsp;Loans System<br />
                </asp:WizardStep>
            </WizardSteps>
        </asp:Wizard>
    </p>
</asp:Content>

