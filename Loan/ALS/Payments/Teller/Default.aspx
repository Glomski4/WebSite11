<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="Loan_ALS_Payments_Teller_Default" %>

<%@ Register Src="PaymentControlStrip.ascx" TagName="PaymentControlStrip" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:PaymentControlStrip ID="PaymentControlStrip1" runat="server" />
    <table class="style1">
        <tr>
            <td>
                <asp:Button ID="Button8" runat="server" Text="Open Cash Box" />
            </td>
            <td>
                <asp:Button ID="Button9" runat="server" Text="Close Cash Box" />
                <asp:HiddenField ID="OutOfBalance" runat="server" Value="True" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Label ID="Label3" runat="server" Text="Cash Box Closed." Visible="False"></asp:Label>
                <asp:LinkButton ID="Label2" runat="server" BackColor="Black" Font-Bold="True" ForeColor="Red"
                    Visible="False">Your box is out of balance are you sure you want to close it? Click Here to confirm.</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table class="style1">
                    <tr>
                        <td>
                            Balance
                        </td>
                        <td>
                            &nbsp;Principal
                        </td>
                        <td>
                            Interest
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label5" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label6" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Box ID</td>
                        <td>
                            Unpl Funds
                        </td>
                        <td>
                            Fees
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label9" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label7" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label8" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="PmtID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="PmtID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="PmtID" />
                        <asp:BoundField DataField="LoanID" HeaderText="Loan" SortExpression="LoanID" />
                        <asp:BoundField DataField="PostedDate" HeaderText="Posted" 
                            SortExpression="PostedDate" />
                        <asp:BoundField DataField="EffDate" DataFormatString="{0:d}" 
                            HeaderText="EffDate" SortExpression="EffDate" />
                        <asp:BoundField DataField="IntDate" DataFormatString="{0:d}" 
                            HeaderText="IntDate" SortExpression="IntDate" />
                        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                        <asp:BoundField DataField="Description" HeaderText="Description" 
                            SortExpression="Description" />
                        <asp:BoundField DataField="ToPrincipal" DataFormatString="{0:c}" 
                            HeaderText="Principal" SortExpression="ToPrincipal" />
                        <asp:BoundField DataField="ToInterest" DataFormatString="{0:c}" 
                            HeaderText="Interest" SortExpression="ToInterest" />
                        <asp:BoundField DataField="UplnFundsCode" HeaderText="UplnCode" 
                            SortExpression="UplnFundsCode" />
                        <asp:BoundField DataField="ToUnpl" DataFormatString="{0:c}" HeaderText="Unpl" 
                            SortExpression="ToUnpl" />
                        <asp:BoundField DataField="ToFees" DataFormatString="{0:c}" HeaderText="Fees" 
                            SortExpression="ToFees" />
                        <asp:BoundField DataField="EnteredBy" HeaderText="By" 
                            SortExpression="EnteredBy" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
                    SelectCommand="SELECT [PmtID], [LoanID], [PostedDate], [EffDate], [IntDate], [Type], [Description], [ToPrincipal], [ToInterest], [UplnFundsCode], [ToUnpl], [ToFees], [EnteredBy] FROM [Payments] WHERE ([BoxNumber] = @BoxNumber) ORDER BY [PostedDate] DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label9" Name="BoxNumber" PropertyName="Text" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
