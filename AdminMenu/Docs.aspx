<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false"
    CodeFile="Docs.aspx.vb" Inherits="AdminMenu_Docs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            font-size: xx-small;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td valign="top">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
                    ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" DeleteCommand="DELETE FROM [Docs] WHERE [DocID] = @original_DocID AND [DocName] = @original_DocName AND [Active] = @original_Active"
                    InsertCommand="INSERT INTO [Docs] ([DocName], [Active]) VALUES (@DocName, @Active)"
                    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Docs] ORDER BY [Active], [DocID]"
                    UpdateCommand="UPDATE [Docs] SET [DocName] = @DocName, [Active] = @Active WHERE [DocID] = @original_DocID AND [DocName] = @original_DocName AND [Active] = @original_Active">
                    <DeleteParameters>
                        <asp:Parameter Name="original_DocID" Type="Int32" />
                        <asp:Parameter Name="original_DocName" Type="String" />
                        <asp:Parameter Name="original_Active" Type="Boolean" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="DocName" Type="String" />
                        <asp:Parameter Name="Active" Type="Boolean" />
                        <asp:Parameter Name="original_DocID" Type="Int32" />
                        <asp:Parameter Name="original_DocName" Type="String" />
                        <asp:Parameter Name="original_Active" Type="Boolean" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="DocName" Type="String" />
                        <asp:Parameter Name="Active" Type="Boolean" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues"
                    ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" DeleteCommand="DELETE FROM [Docs] WHERE [DocID] = @original_DocID AND [DocName] = @original_DocName AND [Active] = @original_Active"
                    InsertCommand="INSERT INTO [Docs] ([DocName], [Active]) VALUES (@DocName, @Active)"
                    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT DocID, DocName, Active FROM Docs WHERE (DocID = @DocID)"
                    
                    UpdateCommand="UPDATE [Docs] SET [DocName] = @DocName, [Active] = @Active WHERE [DocID] = @original_DocID AND [DocName] = @original_DocName AND [Active] = @original_Active">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="DocID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="original_DocID" Type="Int32" />
                        <asp:Parameter Name="original_DocName" Type="String" />
                        <asp:Parameter Name="original_Active" Type="Boolean" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="DocName" Type="String" />
                        <asp:Parameter Name="Active" Type="Boolean" />
                        <asp:Parameter Name="original_DocID" Type="Int32" />
                        <asp:Parameter Name="original_DocName" Type="String" />
                        <asp:Parameter Name="original_Active" Type="Boolean" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="DocName" Type="String" />
                        <asp:Parameter Name="Active" Type="Boolean" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:Button ID="Button1" runat="server" Text="Reload" />
                <asp:Button ID="Button2" runat="server" Text="Go To Order Doc Screen" />
            </td>
        </tr>
        <tr>
            <td>
                Document List</td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td valign="top">
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                CellPadding="1" CellSpacing="1" DataKeyNames="DocID" DataSourceID="SqlDataSource1"
                                Width="100%">
                                <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <Columns>
                                    <asp:BoundField DataField="DocID" HeaderText="DocID" InsertVisible="False" ReadOnly="True"
                                        SortExpression="DocID" />
                                    <asp:BoundField DataField="DocName" HeaderText="DocName" SortExpression="DocName" />
                                    <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
                                    <asp:CommandField ShowSelectButton="True" />
                                </Columns>
                                <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <AlternatingRowStyle BackColor="#CCCCCC" />
                            </asp:GridView>
                        </td>
                        <td valign="top">
                            <asp:FormView ID="FormView1" runat="server" CellPadding="1" CellSpacing="1" DataKeyNames="DocID"
                                DataSourceID="SqlDataSource2" HorizontalAlign="Left" Width="100%">
                                <EditItemTemplate>
                                    DocID:
                                    <asp:Label ID="DocIDLabel1" runat="server" Text='<%# Eval("DocID") %>' />
                                    <br />
                                    DocName:
                                    <asp:TextBox ID="DocNameTextBox" runat="server" Text='<%# Bind("DocName") %>' />
                                    <br />
                                    Active:
                                    <asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Bind("Active") %>' />
                                    <br />
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                        Text="Update" />
                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                                        CommandName="Cancel" Text="Cancel" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    DocName:
                                    <asp:TextBox ID="DocNameTextBox" runat="server" Text='<%# Bind("DocName") %>' />
                                    <br />
                                    Active:
                                    <asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Bind("Active") %>' />
                                    <br />
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                        Text="Insert" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                        CommandName="Cancel" Text="Cancel" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    DocID:
                                    <asp:Label ID="DocIDLabel" runat="server" Text='<%# Eval("DocID") %>' />
                                    <br />
                                    DocName:
                                    <asp:Label ID="DocNameLabel" runat="server" Text='<%# Bind("DocName") %>' />
                                    <br />
                                    Active:
                                    <asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Bind("Active") %>'
                                        Enabled="false" />
                                    <br />
                                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                                        Text="Edit" />
                                    &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                                        Text="New" />
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                                        Text="New" />
                                </EmptyDataTemplate>
                            </asp:FormView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                Document Details
                <table class="style1">
                    <tr>
                        <td valign="top">
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="1"
                                CellSpacing="1" DataKeyNames="DocDetailsID" DataSourceID="SqlDataSource3" 
                                Width="100%">
                                <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <Columns>
                                    <asp:BoundField DataField="DocDetailsID" HeaderText="DocDetailsID" 
                                        ReadOnly="True" SortExpression="DocDetailsID" InsertVisible="False" />
                                    <asp:BoundField DataField="Font" HeaderText="Font" SortExpression="Font" />
                                    <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:HyperLinkField DataNavigateUrlFields="DocDetailsID,DocID" 
                                        DataNavigateUrlFormatString="~\AdminMenu\Docs\{1}-{0}.txt" Text="View" 
                                        Target="_blank" />
                                    <asp:HyperLinkField DataNavigateUrlFields="DocDetailsID,DocID" 
                                        DataNavigateUrlFormatString="~\AdminMenu\EditDocs.aspx?DocID=\AdminMenu\Docs\{1}-{0}.txt" 
                                        Text="Edit" />
                                </Columns>
                                <AlternatingRowStyle BackColor="#CCCCCC" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
                                OldValuesParameterFormatString="original_{0}" 
                                
                                SelectCommand="SELECT [DocDetailsID], [Font], [Size], [DocID] FROM [DocsDetails] WHERE ([DocID] = @DocID) ORDER BY [DocDetailsID]">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridView1" Name="DocID" PropertyName="SelectedValue"
                                        Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td valign="top">
                            <asp:FormView ID="FormView2" runat="server" DataKeyNames="DocID,DocDetailsID" 
                                DataSourceID="SqlDataSource4">
                                <EditItemTemplate>
                                    DocID:
                                    <asp:Label ID="DocIDLabel1" runat="server" Text='<%# Eval("DocID") %>' />
                                    <br />
                                    DocDetailsID:
                                    <asp:Label ID="DocDetailsIDLabel1" runat="server" 
                                        Text='<%# Eval("DocDetailsID") %>' />
                                    <br />
                                    Font:
                                    <asp:TextBox ID="SizeTextBox0" runat="server" Text='<%# Bind("Font") %>' />
                                    <br />
                                    Size:
                                    <asp:TextBox ID="SizeTextBox" runat="server" Text='<%# Bind("Size") %>' />
                                    <br />
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                        Text="Update" />
                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                                        CommandName="Cancel" Text="Cancel" />
                                    <br />
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                    &nbsp;<asp:Button ID="Button3" runat="server" Height="22px" onclick="Button3_Click1" 
                                        Text="Upload" />
                                    <br />
                                    <asp:Label ID="Alert" runat="server"></asp:Label>
                                    <br />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    DocID:
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                        DataSourceID="SqlDataSource2" DataTextField="DocID" DataValueField="DocID" 
                                        SelectedValue='<%# Bind("DocID") %>'>
                                    </asp:RadioButtonList>
                                    Font:
                                    <asp:TextBox ID="SizeTextBox0" runat="server" Text='<%# Bind("Font") %>' />
                                    <br />
                                    Size:
                                    <asp:TextBox ID="SizeTextBox" runat="server" Text='<%# Bind("Size") %>' />
                                    <br />
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                        Text="Insert" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                        CommandName="Cancel" Text="Cancel" />
                                    <br />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    DocID:
                                    <asp:Label ID="DocIDLabel" runat="server" Text='<%# Eval("DocID") %>' />
                                    <br />
                                    DocDetailsID:
                                    <asp:Label ID="DocDetailsIDLabel" runat="server" 
                                        Text='<%# Eval("DocDetailsID") %>' />
                                    <br />
                                    Font:
                                    <asp:Label ID="FontLabel" runat="server" Text='<%# Bind("Font") %>' />
                                    <br />
                                    Size:
                                    <asp:Label ID="SizeLabel" runat="server" Text='<%# Bind("Size") %>' />
                                    <br />
                                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                                        Text="Edit" />
                                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                                        Text="Delete" />
                                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                                        Text="New" />
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                        CommandName="New" Text="New" />
                                </EmptyDataTemplate>
                            </asp:FormView>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConflictDetection="CompareAllValues"
                                ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" DeleteCommand="DELETE FROM [DocsDetails] WHERE [DocID] = @original_DocID AND [DocDetailsID] = @original_DocDetailsID AND (([Font] = @original_Font) OR ([Font] IS NULL AND @original_Font IS NULL)) AND [Size] = @original_Size"
                                InsertCommand="INSERT INTO [DocsDetails] ([DocID], [Font], [Size]) VALUES (@DocID, @Font, @Size)"
                                OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [DocID], [DocDetailsID], [Font], [Size] FROM [DocsDetails] WHERE (([DocID] = @DocID) AND ([DocDetailsID] = @DocDetailsID))"
                                
                                
                                
                                UpdateCommand="UPDATE [DocsDetails] SET [Font] = @Font, [Size] = @Size WHERE [DocID] = @original_DocID AND [DocDetailsID] = @original_DocDetailsID AND (([Font] = @original_Font) OR ([Font] IS NULL AND @original_Font IS NULL)) AND [Size] = @original_Size">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridView1" Name="DocID" PropertyName="SelectedValue"
                                        Type="Int32" />
                                    <asp:ControlParameter ControlID="GridView2" Name="DocDetailsID" PropertyName="SelectedValue"
                                        Type="Int32" />
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="original_DocID" Type="Int32" />
                                    <asp:Parameter Name="original_DocDetailsID" Type="Int32" />
                                    <asp:Parameter Name="original_Font" Type="String" />
                                    <asp:Parameter Name="original_Size" Type="String" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Font" Type="String" />
                                    <asp:Parameter Name="Size" Type="String" />
                                    <asp:Parameter Name="original_DocID" Type="Int32" />
                                    <asp:Parameter Name="original_DocDetailsID" Type="Int32" />
                                    <asp:Parameter Name="original_Font" Type="String" />
                                    <asp:Parameter Name="original_Size" Type="String" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="DocID" Type="Int32" />
                                    <asp:Parameter Name="Font" Type="String" />
                                    <asp:Parameter Name="Size" Type="String" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                            <table>
                                <tr>
                                    <td class="style2">
                                        ID</td>
                                    <td class="style2">
                                        FONT</td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        0</td>
                                    <td class="style2">
                                        COURIER
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        1</td>
                                    <td class="style2">
                                        HELVETICA
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        2</td>
                                    <td class="style2">
                                        SYMBOL
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        3</td>
                                    <td class="style2">
                                        TIMES_ROMAN
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        4</td>
                                    <td class="style2">
                                        ZAPFDINGBATS</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;Document Lines</td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td valign="top">
                            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="1"
                                CellSpacing="1" DataKeyNames="DocLine" DataSourceID="SqlDataSource5" 
                                Width="100%">
                                <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <Columns>
                                    <asp:BoundField DataField="DocLine" HeaderText="DocLine" ReadOnly="True" 
                                        SortExpression="DocLine" InsertVisible="False" />
                                    <asp:BoundField DataField="Swap" HeaderText="Swap" SortExpression="Swap" />
                                    <asp:BoundField DataField="SwapDesc" HeaderText="SwapDesc" 
                                        SortExpression="SwapDesc" />
                                    <asp:BoundField DataField="SwapType" HeaderText="SwapType" 
                                        SortExpression="SwapType" />
                                    <asp:BoundField DataField="SwapValues" HeaderText="SwapValues" 
                                        SortExpression="SwapValues" />
                                    <asp:CommandField ShowSelectButton="True" />
                                </Columns>
                                <AlternatingRowStyle BackColor="#CCCCCC" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
                                OldValuesParameterFormatString="original_{0}" 
                                SelectCommand="SELECT [DocLine], [Swap], [SwapDesc], [SwapType], [SwapValues] FROM [DocsLines] WHERE (([DocID] = @DocID) AND ([DocDetailsID] = @DocDetailsID)) ORDER BY [DocLine]">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridView1" Name="DocID" PropertyName="SelectedValue"
                                        Type="Int32" />
                                    <asp:ControlParameter ControlID="GridView2" Name="DocDetailsID" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <br />
                            <asp:ListBox ID="ListBox1" runat="server" Visible="False"></asp:ListBox>
                        </td>
                        <td valign="top">
                            <asp:Button ID="Button4" runat="server" Text="Auto Add Fields" />
                            <asp:FormView ID="FormView3" runat="server" 
                                DataKeyNames="DocID,DocDetailsID,DocLine" DataSourceID="SqlDataSource6">
                                <EditItemTemplate>
                                    DocID:
                                    <asp:Label ID="DocIDLabel1" runat="server" Text='<%# Eval("DocID") %>' />
                                    <br />
                                    DocDetailsID:
                                    <asp:Label ID="DocDetailsIDLabel1" runat="server" 
                                        Text='<%# Eval("DocDetailsID") %>' />
                                    <br />
                                    DocLine:
                                    <asp:Label ID="DocLineLabel1" runat="server" Text='<%# Eval("DocLine") %>' />
                                    <br />
                                    Swap:
                                    <asp:TextBox ID="SwapTextBox" runat="server" Text='<%# Bind("Swap") %>' />
                                    <br />
                                    SwapDesc:
                                    <asp:TextBox ID="SwapDescTextBox" runat="server" Text='<%# Bind("SwapDesc") %>' />
                                    <br />
                                    SwapType:
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        SelectedValue='<%# Bind("SwapType") %>'>
                                        <asp:ListItem>Textbox</asp:ListItem>
                                        <asp:ListItem>DropDown</asp:ListItem>
                                        <asp:ListItem>System</asp:ListItem>
                                        <asp:ListItem>Close</asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                    SwapValues:
                                    <asp:TextBox ID="SwapValuesTextBox" runat="server" 
                                        Text='<%# Bind("SwapValues") %>' />
                                    <br />
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                        Text="Update" />
                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                                        CommandName="Cancel" Text="Cancel" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    DocID:
                                    <asp:TextBox ID="DocIDTextBox" runat="server" Text='<%# Bind("DocID") %>' />
                                    <br />
                                    DocDetailsID:
                                    <asp:TextBox ID="DocDetailsIDTextBox" runat="server" 
                                        Text='<%# Bind("DocDetailsID") %>' />
                                    <br />
                                    Swap:
                                    <asp:TextBox ID="SwapTextBox" runat="server" Text='<%# Bind("Swap") %>' />
                                    <br />
                                    SwapDesc:
                                    <asp:TextBox ID="SwapDescTextBox" runat="server" Text='<%# Bind("SwapDesc") %>' />
                                    <br />
                                    SwapType:
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        SelectedValue='<%# Bind("SwapType") %>'>
                                        <asp:ListItem>Textbox</asp:ListItem>
                                        <asp:ListItem>DropDown</asp:ListItem>
                                        <asp:ListItem>System</asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                    SwapValues:
                                    <asp:TextBox ID="SwapValuesTextBox" runat="server" Text='<%# Bind("SwapValues") %>' />
                                    <br />
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                        Text="Insert" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                        CommandName="Cancel" Text="Cancel" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    DocID:
                                    <asp:Label ID="DocIDLabel" runat="server" Text='<%# Eval("DocID") %>' />
                                    <br />
                                    DocDetailsID:
                                    <asp:Label ID="DocDetailsIDLabel" runat="server" 
                                        Text='<%# Eval("DocDetailsID") %>' />
                                    <br />
                                    DocLine:
                                    <asp:Label ID="DocLineLabel" runat="server" Text='<%# Eval("DocLine") %>' />
                                    <br />
                                    Swap:
                                    <asp:Label ID="SwapLabel" runat="server" Text='<%# Bind("Swap") %>' />
                                    <br />
                                    SwapDesc:
                                    <asp:Label ID="SwapDescLabel" runat="server" Text='<%# Bind("SwapDesc") %>' />
                                    <br />
                                    SwapType:
                                    <asp:Label ID="SwapTypeLabel" runat="server" Text='<%# Bind("SwapType") %>' />
                                    <br />
                                    SwapValues:
                                    <asp:Label ID="SwapValuesLabel" runat="server" 
                                        Text='<%# Bind("SwapValues") %>' />
                                    <br />
                                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                                        Text="Edit" />
                                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                                        Text="Delete" />
                                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                                        Text="New" />
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                        CommandName="New" Text="New" />
                                </EmptyDataTemplate>
                            </asp:FormView>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConflictDetection="CompareAllValues"
                                ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" DeleteCommand="DELETE FROM DocsLines WHERE (DocLine = @original_DocLine)"
                                InsertCommand="INSERT INTO [DocsLines] ([DocID], [DocDetailsID], [Swap], [SwapDesc], [SwapType], [SwapValues]) VALUES (@DocID, @DocDetailsID, @Swap, @SwapDesc, @SwapType, @SwapValues)"
                                OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [DocsLines] WHERE (([DocID] = @DocID) AND ([DocDetailsID] = @DocDetailsID) AND ([DocLine] = @DocLine))"
                                
                                
                                UpdateCommand="UPDATE DocsLines SET Swap = @Swap, SwapDesc = @SwapDesc, SwapType = @SwapType, SwapValues = @SwapValues WHERE (DocLine = @original_DocLine) AND (Swap = @original_Swap) AND (SwapDesc = @original_SwapDesc) AND (SwapType = @original_SwapType) AND (SwapValues = @original_SwapValues) OR (DocLine = @original_DocLine) AND (Swap = @original_Swap) AND (SwapDesc IS NULL) AND (SwapType = @original_SwapType) AND (SwapValues = @original_SwapValues) AND (@original_SwapDesc IS NULL) OR (DocLine = @original_DocLine) AND (Swap = @original_Swap) AND (SwapDesc = @original_SwapDesc) AND (SwapType = @original_SwapType) AND (SwapValues IS NULL) AND (@original_SwapValues IS NULL) OR (DocLine = @original_DocLine) AND (Swap = @original_Swap) AND (SwapDesc IS NULL) AND (SwapType = @original_SwapType) AND (SwapValues IS NULL) AND (@original_SwapDesc IS NULL) AND (@original_SwapValues IS NULL)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridView1" Name="DocID" PropertyName="SelectedValue"
                                        Type="Int32" />
                                    <asp:ControlParameter ControlID="GridView2" Name="DocDetailsID" PropertyName="SelectedValue"
                                        Type="Int32" />
                                    <asp:ControlParameter ControlID="GridView3" Name="DocLine" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="original_DocLine" Type="Int32" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Swap" Type="String" />
                                    <asp:Parameter Name="SwapDesc" Type="String" />
                                    <asp:Parameter Name="SwapType" Type="String" />
                                    <asp:Parameter Name="SwapValues" Type="String" />
                                    <asp:Parameter Name="original_DocLine" Type="Int32" />
                                    <asp:Parameter Name="original_Swap" Type="String" />
                                    <asp:Parameter Name="original_SwapDesc" Type="String" />
                                    <asp:Parameter Name="original_SwapType" Type="String" />
                                    <asp:Parameter Name="original_SwapValues" Type="String" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="DocID" Type="Int32" />
                                    <asp:Parameter Name="DocDetailsID" Type="Int32" />
                                    <asp:Parameter Name="Swap" Type="String" />
                                    <asp:Parameter Name="SwapDesc" Type="String" />
                                    <asp:Parameter Name="SwapType" Type="String" />
                                    <asp:Parameter Name="SwapValues" Type="String" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
