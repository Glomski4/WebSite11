<%@ Page Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false" CodeFile="CarDetails.aspx.vb" Inherits="CarDetails"  %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .style2
        {
            font-size: xx-small;
        }
        .style3
        {
            width: 100%;
        }
        .style4
        {
            height: 23px;
        }
        .style5
        {
            width: 354px;
        }
        .style6
        {
            width: 157px;
        }
    </style>
    <div>
    
        <asp:LinkButton ID="LinkButton1" runat="server" 
            PostBackUrl="~/Cars/Default.aspx">Back To Search</asp:LinkButton>
        <br />
        <br />
    
        <br />
        <table class="style3">
            <tr>
                <td class="style5" rowspan="2">
    
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="CarID" 
            DataSourceID="SqlDataSource1" BackColor="#DEBA84" BorderColor="#DEBA84" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" 
            GridLines="Both" Width="327px">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <EditItemTemplate>
                <table class="style1">
                    <tr>
                        <td>
                            Car ID</td>
                        <td>
                            <asp:Label ID="CarIDLabel1" runat="server" Text='<%# Eval("CarID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            In Lot</td>
                        <td>
                            <asp:TextBox ID="ActiveTextBox" runat="server" Text='<%# Bind("Active") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            Y = In Lot | N = Not In Lot | S = In Shop
                            <br />
                            P = Pending Sale | L = Loan/Lease Active | X = No Longer Active</td>
                    </tr>
                    <tr>
                        <td>
                            Year</td>
                        <td>
                            <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Make</td>
                        <td>
                            <asp:TextBox ID="MakeTextBox" runat="server" Text='<%# Bind("Make") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Model</td>
                        <td>
                            <asp:TextBox ID="ModelTextBox" runat="server" Text='<%# Bind("Model") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Sale Price</td>
                        <td>
                            <asp:TextBox ID="SalePriceTextBox" runat="server" 
                                Text='<%# Bind("SalePrice") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            MSRP</td>
                        <td>
                            <asp:TextBox ID="MSRPTextBox" runat="server" Text='<%# Bind("MSRP") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Blue Book</td>
                        <td>
                            <asp:TextBox ID="BlueBookTextBox" runat="server" 
                                Text='<%# Bind("BlueBook") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Final Price</td>
                        <td>
                            <asp:TextBox ID="FinalPriceTextBox" runat="server" 
                                Text='<%# Bind("FinalPrice") %>' />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Active:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="ActiveTextBox" runat="server" Text='<%# Bind("Active") %>' />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Year:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Make:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="MakeTextBox" runat="server" Text='<%# Bind("Make") %>' />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Model:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="ModelTextBox" runat="server" Text='<%# Bind("Model") %>' />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SalePrice:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="SalePriceTextBox" runat="server" 
                    Text='<%# Bind("SalePrice") %>' />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSRP:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="MSRPTextBox" runat="server" Text='<%# Bind("MSRP") %>' />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BlueBook:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="BlueBookTextBox" runat="server" 
                    Text='<%# Bind("BlueBook") %>' />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FinalPrice:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="FinalPriceTextBox" runat="server" 
                    Text='<%# Bind("FinalPrice") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <table class="style3">
                    <tr>
                        <td class="style4">
                            Car ID</td>
                        <td class="style4">
                            <asp:Label ID="CarIDLabel" runat="server" Text='<%# Eval("CarID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Car Status</td>
                        <td>
                            <asp:Label ID="ActiveLabel" runat="server" Text='<%# Bind("Active") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <span class="style2">Y = In Lot | N = Not In Lot | S = In Shop </span>
                            <br class="style2" />
                            <span class="style2">P = Pending Sale | L = Loan/Lease Active </span>
                            <br class="style2" />
                            <span class="style2"> X = No Longer Active | Q = Pending Price Quote</span></td>
                    </tr>
                    <tr>
                        <td>
                            Year</td>
                        <td>
                            <asp:Label ID="YearLabel" runat="server" Text='<%# Bind("Year") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Make</td>
                        <td>
                            <asp:Label ID="MakeLabel" runat="server" Text='<%# Bind("Make") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Model</td>
                        <td>
                            <asp:Label ID="ModelLabel" runat="server" Text='<%# Bind("Model") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Sale Price</td>
                        <td>
                            <asp:Label ID="SalePriceLabel" runat="server" 
                                Text='<%# Bind("SalePrice", "{0:C}") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            MSRP</td>
                        <td>
                            <asp:Label ID="MSRPLabel" runat="server" Text='<%# Bind("MSRP", "{0:C}") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Blue Book</td>
                        <td>
                            <asp:Label ID="BlueBookLabel" runat="server" 
                                Text='<%# Bind("BlueBook", "{0:C}") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Final Price</td>
                        <td>
                            <asp:Label ID="FinalPriceLabel" runat="server" 
                                Text='<%# Bind("FinalPrice", "{0:C}") %>' />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="Delete" />&nbsp;<asp:LinkButton ID="NewButton" 
                    runat="server" CausesValidation="False" 
                    CommandName="New" Text="New" />
                &nbsp;<asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource2">
                    <EditItemTemplate>
                        Active:
                        <asp:TextBox ID="ActiveTextBox" runat="server" Text='<%# Bind("Active") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        Active:
                        <asp:TextBox ID="ActiveTextBox" runat="server" Text='<%# Bind("Active") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click">Sell Car</asp:LinkButton>
                    </ItemTemplate>
                </asp:FormView>
            </ItemTemplate>
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <EmptyDataTemplate>
                No items to show....<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Please
                <asp:LinkButton ID="LinkButton2" runat="server" 
                    PostBackUrl="~/Cars/Default.aspx">Search</asp:LinkButton>
                &nbsp;Again.
            </EmptyDataTemplate>
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        </asp:FormView>
                </td>
                <td class="style6" style="text-align: right; vertical-align: top;" rowspan="2">
        Change Car Status =
                </td>
                <td style="text-align: left; vertical-align: top">
        <asp:DropDownList ID="DropDownList1" runat="server" 
                                AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="CarStatusText" 
                                DataValueField="CarStatusValue"  
            CausesValidation="True" Height="36px" Width="200px">
            <asp:ListItem Value="Y">In Lot</asp:ListItem>
            <asp:ListItem Value="N">Not In Lot</asp:ListItem>
            <asp:ListItem Value="S">In Shop</asp:ListItem>
            <asp:ListItem Value="P">Pending Sale</asp:ListItem>
            <asp:ListItem Value="L">Loan/Lease Active</asp:ListItem>
            <asp:ListItem Value="X">No Longer Active</asp:ListItem>
        </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="text-align: left; vertical-align: top">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="AppID" DataSourceID="SqlDataSource4" 
                        style="text-align: center" CellPadding="4" ForeColor="#333333" GridLines="None" 
                        HorizontalAlign="Left">
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="AppID" HeaderText="App ID" InsertVisible="False" 
                                ReadOnly="True" SortExpression="AppID" />
                            <asp:BoundField DataField="ClientID" HeaderText="Client ID" 
                                SortExpression="ClientID" />
                            <asp:BoundField DataField="Created" HeaderText="Created" 
                                SortExpression="Created" />
                            <asp:BoundField DataField="AppStatusText" HeaderText="Status" 
                                SortExpression="AppStatusText" />
                            <asp:HyperLinkField DataNavigateUrlFields="AppID" 
                                DataNavigateUrlFormatString="~\Loan\PendingApp.aspx?AppID={0}" Text="Go &gt;" />
                        </Columns>
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
                        
                        SelectCommand="SELECT PendingApps.AppID, PendingApps.CarID, PendingApps.ClientID, PendingApps.Created, PendingApps.AppStatus, AppStatus.AppStatusText FROM PendingApps INNER JOIN AppStatus ON PendingApps.AppStatus = AppStatus.AppStatusValue WHERE (PendingApps.CarID = @CarID) ORDER BY PendingApps.Created DESC">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="CarID" QueryStringField="CarID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td colspan="2">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
            DeleteCommand="DELETE FROM [Car] WHERE [CarID] = @original_CarID AND [Active] = @original_Active AND [Year] = @original_Year AND [Make] = @original_Make AND [Model] = @original_Model AND (([SalePrice] = @original_SalePrice) OR ([SalePrice] IS NULL AND @original_SalePrice IS NULL)) AND (([MSRP] = @original_MSRP) OR ([MSRP] IS NULL AND @original_MSRP IS NULL)) AND (([BlueBook] = @original_BlueBook) OR ([BlueBook] IS NULL AND @original_BlueBook IS NULL)) AND (([FinalPrice] = @original_FinalPrice) OR ([FinalPrice] IS NULL AND @original_FinalPrice IS NULL))" 
            InsertCommand="INSERT INTO [Car] ([Active], [Year], [Make], [Model], [SalePrice], [MSRP], [BlueBook], [FinalPrice]) VALUES (@Active, @Year, @Make, @Model, @SalePrice, @MSRP, @BlueBook, @FinalPrice)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Car] WHERE ([CarID] = @CarID)" 
            
            UpdateCommand="UPDATE [Car] SET [Active] = @Active, [Year] = @Year, [Make] = @Make, [Model] = @Model, [SalePrice] = @SalePrice, [MSRP] = @MSRP, [BlueBook] = @BlueBook, [FinalPrice] = @FinalPrice WHERE [CarID] = @original_CarID AND [Active] = @original_Active AND [Year] = @original_Year AND [Make] = @original_Make AND [Model] = @original_Model AND (([SalePrice] = @original_SalePrice) OR ([SalePrice] IS NULL AND @original_SalePrice IS NULL)) AND (([MSRP] = @original_MSRP) OR ([MSRP] IS NULL AND @original_MSRP IS NULL)) AND (([BlueBook] = @original_BlueBook) OR ([BlueBook] IS NULL AND @original_BlueBook IS NULL)) AND (([FinalPrice] = @original_FinalPrice) OR ([FinalPrice] IS NULL AND @original_FinalPrice IS NULL))">
            <SelectParameters>
                <asp:QueryStringParameter Name="CarID" QueryStringField="CarID" Type="Int32" />
            </SelectParameters>
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
    
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
            SelectCommand="SELECT Active FROM Car WHERE (CarID = @CarID) AND (Active = N'Y')">
            <SelectParameters>
                <asp:QueryStringParameter Name="CarID" QueryStringField="CarID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
            
                        SelectCommand="SELECT [CarStatusText], [CarStatusValue] FROM [CarStatus] ORDER BY [Sort]">
        </asp:SqlDataSource>
                </td>
            </tr>
        </table>
&nbsp;</div>
    </form>
</asp:Content>



