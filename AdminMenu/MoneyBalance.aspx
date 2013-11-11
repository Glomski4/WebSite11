<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false" CodeFile="MoneyBalance.aspx.vb" Inherits="AdminMenu_MoneyBalance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" style="text-align: center" Width="100%">
        <Columns>
            <asp:BoundField DataField="Year" HeaderText="Year" ReadOnly="True" 
                SortExpression="Year" />
            <asp:BoundField DataField="Month" HeaderText="Month" ReadOnly="True" 
                SortExpression="Month" />
            <asp:BoundField DataField="Prin" DataFormatString="{0:c}" HeaderText="Prin" 
                ReadOnly="True" SortExpression="Prin" />
            <asp:BoundField DataField="Int" DataFormatString="{0:c}" HeaderText="Int" 
                ReadOnly="True" SortExpression="Int" />
            <asp:BoundField DataField="Unpl" DataFormatString="{0:c}" HeaderText="Unpl" 
                ReadOnly="True" SortExpression="Unpl" />
            <asp:BoundField DataField="Fees" DataFormatString="{0:c}" HeaderText="Fees" 
                ReadOnly="True" SortExpression="Fees" />
            <asp:BoundField DataField="Total Trans" HeaderText="Total Trans" 
                ReadOnly="True" SortExpression="Total Trans" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
        SelectCommand="SELECT YEAR(PostedDate) AS Year, MONTH(PostedDate) AS Month, SUM(ToPrincipal) AS Prin, SUM(ToInterest) AS Int, SUM(ToUnpl) AS Unpl, SUM(ToFees) AS Fees, COUNT(PmtID) AS [Total Trans] FROM Payments WHERE (ToFees &gt;= 0) GROUP BY YEAR(PostedDate), MONTH(PostedDate) ORDER BY Year DESC, Month DESC"></asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource2" Width="100%">
        <Columns>
            <asp:BoundField DataField="L_Status" HeaderText="L_Status" 
                SortExpression="L_Status">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="OpenDate" DataFormatString="{0:d}" 
                HeaderText="OpenDate" SortExpression="OpenDate">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="LoanID" HeaderText="LoanID" InsertVisible="False" 
                ReadOnly="True" SortExpression="LoanID">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="LoanAmount" DataFormatString="{0:c}" 
                HeaderText="LoanAmount" SortExpression="LoanAmount">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
        
        SelectCommand="SELECT L_Status, OpenDate, LoanID, LoanAmount FROM Loans WHERE (OpenDate &gt; DATEADD(D, - 120, { fn NOW() })) ORDER BY OpenDate DESC">
    </asp:SqlDataSource>
</asp:Content>

