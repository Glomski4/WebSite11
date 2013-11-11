<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PaymentControlStrip.ascx.vb" Inherits="Loan_ALS_Payments_Teller_PaymentControlStrip" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
</style>
<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
</asp:ToolkitScriptManager>
<table class="style1">
    <tr>
        <td>
            <asp:Button ID="Button1" runat="server" Text="Teller" AccessKey="T" 
                Width="100%" />
        </td>
        <td>
            <asp:Button ID="Button2" runat="server" Text="Allocate" Width="100%" 
                AccessKey="A" />
        </td>
        <td>
            <asp:Button ID="Button3" runat="server" Text="Regular" Width="100%" 
                AccessKey="R" />
        </td>
        <td>
            <asp:Button ID="Button4" runat="server" Text="Reverse" Width="100%" 
                AccessKey="V" />
        </td>
        <td>
            <asp:Button ID="Button5" runat="server" Text="Single" Width="100%" 
                AccessKey="E" />
        </td>
        <td>
            <asp:Button ID="Button6" runat="server" Text="Fees" Width="100%" 
                AccessKey="F" />
        </td>
        <td>
            <asp:Button ID="Button7" runat="server" Text="Box" Width="100%" AccessKey="B" />
        </td>
    </tr>
</table>
<table class="style1">
    <tr>
        <td>
            Box Status</td>
        <td>
            <asp:Label ID="Status" runat="server"></asp:Label>
        </td>
        <td>
            Current Balance</td>
        <td>
            <asp:Label ID="Balance" runat="server"></asp:Label>
        </td>
        <td>
            No Of
            <asp:Label ID="Label1" runat="server" Text="Trans"></asp:Label>
            <asp:HoverMenuExtender ID="Label1_HoverMenuExtender" runat="server" 
                DynamicServicePath="" Enabled="True" TargetControlID="Label1" 
                PopupControlID="Panel1">
            </asp:HoverMenuExtender>
        </td>
        <td>
            <asp:Label ID="Trans" runat="server"></asp:Label>
        </td>
    </tr>
</table>
<asp:Panel ID="Panel1" runat="server" BackColor="Yellow">
    <asp:GridView ID="GridView1" runat="server" 
    AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="TypeID" HeaderText="TypeID" InsertVisible="False" 
            ReadOnly="True" SortExpression="TypeID" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
    SelectCommand="SELECT * FROM [PaymentTypes] ORDER BY [Type]">
    </asp:SqlDataSource>
</asp:Panel>




