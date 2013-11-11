<%@ Page Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false" CodeFile="ListAllCars.aspx.vb" Inherits="Admin_ListAllCars" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>

    <div style="text-align: center">
    
        <table class="style1">
            <tr>
                <td style="text-align: center">
    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CarID" 
            DataSourceID="SqlDataSource1" PageSize="20" CellPadding="3" CellSpacing="2" 
                        style="text-align: left" BackColor="#DEBA84" BorderColor="#DEBA84" 
                        BorderStyle="None" BorderWidth="1px">
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <Columns>
                <asp:BoundField DataField="CarID" HeaderText="CarID" ReadOnly="True" 
                    SortExpression="CarID" />
                <asp:BoundField DataField="Active" HeaderText="Active" 
                    SortExpression="Active" />
                <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                <asp:BoundField DataField="Make" HeaderText="Make" SortExpression="Make" />
                <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                <asp:BoundField DataField="SalePrice" DataFormatString="{0:c}" 
                    HeaderText="SalePrice" SortExpression="SalePrice" />
                <asp:BoundField DataField="MSRP" DataFormatString="{0:c}" HeaderText="MSRP" 
                    SortExpression="MSRP" />
                <asp:BoundField DataField="BlueBook" DataFormatString="{0:c}" 
                    HeaderText="BlueBook" SortExpression="BlueBook" />
                <asp:BoundField DataField="FinalPrice" DataFormatString="{0:c}" 
                    HeaderText="FinalPrice" SortExpression="FinalPrice" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    HeaderText="Commands" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
    
                    <asp:LinkButton ID="LinkButton1" runat="server" 
                        PostBackUrl="~/AdminMenu/Default.aspx">Go Back</asp:LinkButton>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
            DeleteCommand="DELETE FROM [Car] WHERE [CarID] = @original_CarID AND [Active] = @original_Active AND [Year] = @original_Year AND [Make] = @original_Make AND [Model] = @original_Model AND (([SalePrice] = @original_SalePrice) OR ([SalePrice] IS NULL AND @original_SalePrice IS NULL)) AND (([MSRP] = @original_MSRP) OR ([MSRP] IS NULL AND @original_MSRP IS NULL)) AND (([BlueBook] = @original_BlueBook) OR ([BlueBook] IS NULL AND @original_BlueBook IS NULL)) AND (([FinalPrice] = @original_FinalPrice) OR ([FinalPrice] IS NULL AND @original_FinalPrice IS NULL))" 
            InsertCommand="INSERT INTO [Car] ([CarID], [Active], [Year], [Make], [Model], [SalePrice], [MSRP], [BlueBook], [FinalPrice]) VALUES (@CarID, @Active, @Year, @Make, @Model, @SalePrice, @MSRP, @BlueBook, @FinalPrice)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Car] ORDER BY [Active]" 
            UpdateCommand="UPDATE [Car] SET [Active] = @Active, [Year] = @Year, [Make] = @Make, [Model] = @Model, [SalePrice] = @SalePrice, [MSRP] = @MSRP, [BlueBook] = @BlueBook, [FinalPrice] = @FinalPrice WHERE [CarID] = @original_CarID AND [Active] = @original_Active AND [Year] = @original_Year AND [Make] = @original_Make AND [Model] = @original_Model AND (([SalePrice] = @original_SalePrice) OR ([SalePrice] IS NULL AND @original_SalePrice IS NULL)) AND (([MSRP] = @original_MSRP) OR ([MSRP] IS NULL AND @original_MSRP IS NULL)) AND (([BlueBook] = @original_BlueBook) OR ([BlueBook] IS NULL AND @original_BlueBook IS NULL)) AND (([FinalPrice] = @original_FinalPrice) OR ([FinalPrice] IS NULL AND @original_FinalPrice IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_CarID" Type="Int32" />
                <asp:Parameter Name="original_Active" Type="String" />
                <asp:Parameter Name="original_Year" Type="String" />
                <asp:Parameter Name="original_Make" Type="String" />
                <asp:Parameter Name="original_Model" Type="String" />
                <asp:Parameter Name="original_SalePrice" Type="Decimal" />
                <asp:Parameter Name="original_MSRP" Type="Decimal" />
                <asp:Parameter Name="original_BlueBook" Type="Decimal" />
                <asp:Parameter Name="original_FinalPrice" Type="Decimal" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Active" Type="String" />
                <asp:Parameter Name="Year" Type="String" />
                <asp:Parameter Name="Make" Type="String" />
                <asp:Parameter Name="Model" Type="String" />
                <asp:Parameter Name="SalePrice" Type="Decimal" />
                <asp:Parameter Name="MSRP" Type="Decimal" />
                <asp:Parameter Name="BlueBook" Type="Decimal" />
                <asp:Parameter Name="FinalPrice" Type="Decimal" />
                <asp:Parameter Name="original_CarID" Type="Int32" />
                <asp:Parameter Name="original_Active" Type="String" />
                <asp:Parameter Name="original_Year" Type="String" />
                <asp:Parameter Name="original_Make" Type="String" />
                <asp:Parameter Name="original_Model" Type="String" />
                <asp:Parameter Name="original_SalePrice" Type="Decimal" />
                <asp:Parameter Name="original_MSRP" Type="Decimal" />
                <asp:Parameter Name="original_BlueBook" Type="Decimal" />
                <asp:Parameter Name="original_FinalPrice" Type="Decimal" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="CarID" Type="Int32" />
                <asp:Parameter Name="Active" Type="String" />
                <asp:Parameter Name="Year" Type="String" />
                <asp:Parameter Name="Make" Type="String" />
                <asp:Parameter Name="Model" Type="String" />
                <asp:Parameter Name="SalePrice" Type="Decimal" />
                <asp:Parameter Name="MSRP" Type="Decimal" />
                <asp:Parameter Name="BlueBook" Type="Decimal" />
                <asp:Parameter Name="FinalPrice" Type="Decimal" />
            </InsertParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>
