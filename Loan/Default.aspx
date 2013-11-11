<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Loan_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Application Status.<asp:RadioButtonList ID="RadioButtonList1" runat="server" 
            AutoPostBack="True" BorderColor="Black" BorderStyle="Groove" BorderWidth="3px" 
            CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSource1" 
            DataTextField="AppStatusText" DataValueField="AppStatusValue" 
            RepeatDirection="Horizontal">
        </asp:RadioButtonList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
            
            SelectCommand="SELECT [AppStatusText], [AppStatusValue] FROM [AppStatus] WHERE ([AppStatusValue] &lt;&gt; @AppStatusValue) ORDER BY [Sort]">
            <SelectParameters>
                <asp:Parameter DefaultValue="L" Name="AppStatusValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BorderColor="Black" 
            BorderStyle="Groove" BorderWidth="3px" CellPadding="1" CellSpacing="1" 
            DataKeyNames="AppID" DataSourceID="SqlDataSource2" Width="800px">
            <RowStyle BorderColor="Black" BorderStyle="Groove" BorderWidth="3px" 
                HorizontalAlign="Center" VerticalAlign="Middle" />
            <Columns>
                <asp:BoundField DataField="Created" DataFormatString="{0:g}" 
                    HeaderText="Created" SortExpression="Created">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="75px" />
                </asp:BoundField>
                <asp:BoundField DataField="AppStatusText" HeaderText="Status" 
                    SortExpression="AppStatusText" />
                <asp:BoundField DataField="FirstName" HeaderText="First Name" 
                    SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" 
                    SortExpression="LastName" />
                <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year">
                </asp:BoundField>
                <asp:BoundField DataField="Make" HeaderText="Make" SortExpression="Make">
                </asp:BoundField>
                <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model">
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="AppID" 
                    DataNavigateUrlFormatString="~\Loan\PendingApp.aspx?AppID={0}" Text="Go &gt;" />
            </Columns>
            <EmptyDataTemplate>
                -No Applications to show with the Status picked.
            </EmptyDataTemplate>
            <AlternatingRowStyle BackColor="#CCCCCC" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
            SelectCommand="SELECT PendingApps.AppID, PendingApps.Created, AppStatus.AppStatusText, Clients.FirstName, Clients.LastName, Car.Year, Car.Make, Car.Model FROM PendingApps INNER JOIN Clients ON PendingApps.ClientID = Clients.ClientID INNER JOIN AppStatus ON PendingApps.AppStatus = AppStatus.AppStatusValue INNER JOIN Car ON PendingApps.CarID = Car.CarID WHERE (PendingApps.AppStatus = @AppStatus)">
            <SelectParameters>
                <asp:ControlParameter ControlID="RadioButtonList1" Name="AppStatus" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

