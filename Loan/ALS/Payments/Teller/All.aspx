<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false"
    CodeFile="All.aspx.vb" Inherits="Loan_ALS_Payments_Teller_All" %>

<%@ Register Src="PaymentControlStrip.ascx" TagName="PaymentControlStrip" TagPrefix="uc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:PaymentControlStrip ID="PaymentControlStrip1" runat="server" />
    <asp:Panel ID="Panel1" runat="server" BackColor="#CCCCCC" Font-Bold="True" Font-Size="Large"
        Style="text-align: center">
        <br />
        <br />
        Please open a cash box to process a payment.<br />
        <br />
        <br />
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Visible="False">
        <table class="style1">
            <tr>
                <td>
                    Loan Number
                </td>
                <td colspan="2">
                    <asp:TextBox ID="LoanNumber" runat="server" AutoPostBack="True"></asp:TextBox>
                    <asp:Label ID="Label2" runat="server" BackColor="Black" Font-Bold="True" ForeColor="Red"
                        Text="Loan Number Not Valid." Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Date Effective
                </td>
                <td>
                    <asp:TextBox ID="TextBox7" runat="server" AutoPostBack="True"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Total
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server">0.00</asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Principal
                </td>
                <td>
                    Interest
                </td>
                <td>
                    Fees
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server">0.00</asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server">0.00</asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server">0.00</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Description
                </td>
                <td>
                    Unpl Code<asp:Panel ID="Panel3" runat="server" BackColor="Yellow">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UplnFundsCode"
                            DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="UplnFundsCode" HeaderText="Code" ReadOnly="True" SortExpression="UplnFundsCode" />
                                <asp:BoundField DataField="UplnFundsDesp" HeaderText="Description" SortExpression="UplnFundsDesp" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
                            SelectCommand="SELECT [UplnFundsCode], [UplnFundsDesp] FROM [UnplFundCodes] WHERE ([PostingSig] = @PostingSig) ORDER BY [UplnFundsDesp]">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="True" Name="PostingSig" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:Panel>
                </td>
                <td>
                    Unpl Amount
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    
                    <asp:HoverMenuExtender ID="TextBox5_HoverMenuExtender" runat="server" 
                        DynamicServicePath="" Enabled="True" PopupControlID="Panel3" 
                        TargetControlID="TextBox5" PopupPosition="Bottom">
                    </asp:HoverMenuExtender>
                    
                </td>
                <td>
                    <asp:TextBox ID="TextBox6" runat="server">0.00</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" AccessKey="S" Text="Submit" />
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="PostingAlert" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
