<%@ Page Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <title>Search Page.</title>
    <style type="text/css">
        .style2
        {
            text-align: center;
        }
        .style3
        {
            width: 89px;
            text-align: center;
        }
        .style4
        {
            border: thick groove #C0C0C0;
            text-align: center;
            height: 23px;
        }
        .style5
        {
            width: 100%;
        }
        .style6
        {}
        </style>

    <div>
    
        <table class="style5">
            <tr>
                <td style="text-align: right">
                    <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/MainMenu.aspx">Go To Main Menu</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td>
                    <hr />
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
        <table class="style4">
            <tr>
                <td class="style4">
                    Year</td>
                <td class="style4">
                    Make</td>
                <td class="style4">
                    Model</td>
                <td class="style4">
                    ID</td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:ListBox ID="Year" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="Year" DataValueField="Year" 
                        Height="150px" Width="150px"></asp:ListBox>
                </td>
                <td class="style3">
                    <asp:ListBox ID="Make" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource2" DataTextField="Make" DataValueField="Make" 
                        Height="150px" Width="150px"></asp:ListBox>
                </td>
                <td class="style3">
                    <asp:ListBox ID="Model" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource3" DataTextField="Model" DataValueField="Model" 
                        Height="150px" Width="150px"></asp:ListBox>
                </td>
                <td class="style2">
                    <asp:ListBox ID="ID" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource4" DataTextField="CarID" DataValueField="CarID" 
                        Height="150px" Width="150px"></asp:ListBox>
                </td>
            </tr>
        </table>
                </td>
            </tr>
            <tr>
                <td>
                    <hr />
                </td>
            </tr>
            <tr>
                <td style="text-align: center; background-color: #C0C0C0">
                    <table>
                        <tr>
                            <td class="style6" colspan="2">
                                Search By Car ID</td>
                        </tr>
                        <tr>
                            <td class="style6" style="margin-left: 40px">
                                <asp:TextBox ID="CarSearchID_Text" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="CarIDSearch" runat="server" Text="Search" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <hr />
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <hr />
                </td>
            </tr>
            <tr>
                <td style="text-align: center; background-color: #C0C0C0">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <hr />
                </td>
            </tr>
        </table>
    
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
            
            SelectCommand="SELECT DISTINCT [Year] FROM [Car] WHERE ([Active] = @Active) ORDER BY [Year] DESC">
            <SelectParameters>
                <asp:Parameter DefaultValue="Y" Name="Active" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
            
            SelectCommand="SELECT DISTINCT [Make] FROM [Car] WHERE (([Active] = @Active) AND ([Year] = @Year)) ORDER BY [Make]">
            <SelectParameters>
                <asp:Parameter DefaultValue="Y" Name="Active" Type="String" />
                <asp:ControlParameter ControlID="Year" Name="Year" PropertyName="SelectedValue" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
            
            SelectCommand="SELECT DISTINCT [Model] FROM [Car] WHERE (([Active] = @Active) AND ([Year] = @Year) AND ([Make] = @Make)) ORDER BY [Model]">
            <SelectParameters>
                <asp:Parameter DefaultValue="Y" Name="Active" Type="String" />
                <asp:ControlParameter ControlID="Year" Name="Year" PropertyName="SelectedValue" 
                    Type="String" />
                <asp:ControlParameter ControlID="Make" Name="Make" PropertyName="SelectedValue" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
            
            SelectCommand="SELECT [CarID] FROM [Car] WHERE (([Active] = @Active) AND ([Year] = @Year) AND ([Make] = @Make) AND ([Model] = @Model)) ORDER BY [CarID]">
            <SelectParameters>
                <asp:Parameter DefaultValue="Y" Name="Active" Type="String" />
                <asp:ControlParameter ControlID="Year" Name="Year" PropertyName="SelectedValue" 
                    Type="String" />
                <asp:ControlParameter ControlID="Make" Name="Make" PropertyName="SelectedValue" 
                    Type="String" />
                <asp:ControlParameter ControlID="Model" Name="Model" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>
