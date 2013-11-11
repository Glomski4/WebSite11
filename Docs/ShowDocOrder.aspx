<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false" CodeFile="ShowDocOrder.aspx.vb" Inherits="Docs_ShowDocOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="1" DataKeyNames="DocID,LoanNo,OrderedOn" 
        DataSourceID="SqlDataSource1" Width="100%">
        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        <Columns>
            <asp:BoundField DataField="DocID" HeaderText="DocID" SortExpression="DocID" />
            <asp:BoundField DataField="LoanNo" HeaderText="LoanNo" 
                SortExpression="LoanNo" />
            <asp:BoundField DataField="OrderedOn" HeaderText="OrderedOn" 
                SortExpression="OrderedOn" />
            <asp:BoundField DataField="OrderedBy" HeaderText="OrderedBy" 
                SortExpression="OrderedBy" />
            <asp:CommandField ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
    <asp:Label ID="Label1" runat="server"></asp:Label>
    &nbsp;-
    <asp:Label ID="Label2" runat="server"></asp:Label>
    &nbsp;-
    <asp:Label ID="Label3" runat="server"></asp:Label>
    <br />
    Click To Order
    <asp:Button ID="Button1" runat="server" Text="Order" Enabled="False" />
&nbsp;<asp:Button ID="Button2" runat="server" Enabled="False" Text="View" />
&nbsp;<asp:Button ID="Button3" runat="server" Text="Reload" />
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
        SelectCommand="SELECT DISTINCT [DocID], [LoanNo], [OrderedOn], [OrderedBy] FROM [DocsOrdered] WHERE ([PrintedOn] IS NULL)">
    </asp:SqlDataSource>
    <br />
    <br />
    </asp:Content>

