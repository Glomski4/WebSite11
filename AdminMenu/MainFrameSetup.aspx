<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false" CodeFile="MainFrameSetup.aspx.vb" Inherits="AdminMenu_MainFrameSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .newStyle1
        {
            font-family: "Courier New";
            font-size: medium;
            width: 98%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Screen ID
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="DesplayText" 
        DataValueField="ScreenID" AutoPostBack="True" Height="25px">
    </asp:DropDownList>
    <asp:Button ID="Button1" runat="server" Height="25px" 
        Text="Refresh Screen List" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
        SelectCommand="SELECT DISTINCT ScreenID, RTRIM(RTRIM(CAST(ScreenID AS char)) + N' | ' + Text) AS DesplayText FROM Screens_Text WHERE (LoadOrder = @LoadOrder) ORDER BY ScreenID">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="LoadOrder" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ScreenID,LoadOrder" 
        DataSourceID="SqlDataSource2" InsertItemPosition="LastItem">
        <ItemTemplate>
            <tr style="background-color:#DCDCDC;color: #000000; font-family:Courier New;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                        Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="ScreenIDLabel" runat="server" Text='<%# Eval("ScreenID") %>' />
                </td>
                <td>
                    <asp:Label ID="LoadOrderLabel" runat="server" Text='<%# Eval("LoadOrder") %>' />
                </td>
                <td>
                    <asp:Label ID="TextLabel" runat="server" Text='<%# Eval("Text") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC; font-family:Courier New;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                        Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="ScreenIDLabel" runat="server" Text='<%# Eval("ScreenID") %>' />
                </td>
                <td>
                    <asp:Label ID="LoadOrderLabel" runat="server" Text='<%# Eval("LoadOrder") %>' />
                </td>
                <td>
                    <asp:Label ID="TextLabel" runat="server" Text='<%# Eval("Text") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" 
                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px; font-family:Courier New;">
                <tr>
                    <td>
                        No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="font-family:Courier New;">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="ScreenIDTextBox" runat="server" CssClass="newStyle1" 
                        Text='<%# Bind("ScreenID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LoadOrderTextBox" runat="server" CssClass="newStyle1" 
                        Text='<%# Bind("LoadOrder") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TextTextBox" CssClass="newStyle1" runat="server" Text='<%# Bind("Text") %>' MaxLength="80" />
                </td>
            </tr>
        </InsertItemTemplate>
        <LayoutTemplate>
            <table runat="server" width="95%">
                <tr runat="server" width="95%">
                    <td runat="server" width="95%">
                        <table ID="itemPlaceholderContainer" runat="server" border="1" width="95%" 
                            style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px; font-family:Courier New;">
                            <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                <th runat="server">
                                </th>
                                <th runat="server">
                                    ScreenID</th>
                                <th runat="server">
                                    LoadOrder</th>
                                <th runat="server">
                                    Text</th>
                            </tr>
                            <tr>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th style="font-family: 'Courier New'; font-size: medium; font-weight: normal; text-align: left;">
                            0123456789 123456789 123456789 123456789 123456789 123456789 123456789 12345678*---</th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" 
                        style="text-align: center;background-color: #CCCCCC; font-family:Courier New;;color: #000000;">
                        
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <EditItemTemplate>
            <tr style="background-color:#008A8C;color: #FFFFFF; font-family:Courier New;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="ScreenIDLabel1" runat="server" Text='<%# Eval("ScreenID") %>' />
                </td>
                <td>
                    <asp:Label ID="LoadOrderLabel1" runat="server" 
                        Text='<%# Eval("LoadOrder") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TextTextBox" CssClass="newStyle1" runat="server" Text='<%# Bind("Text") %>' MaxLength="80" />
                </td>
            </tr>
        </EditItemTemplate>
        <SelectedItemTemplate>
            <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF; font-family:Courier New;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                        Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="ScreenIDLabel" runat="server" Text='<%# Eval("ScreenID") %>' />
                </td>
                <td>
                    <asp:Label ID="LoadOrderLabel" runat="server" Text='<%# Eval("LoadOrder") %>' />
                </td>
                <td>
                    <asp:Label ID="TextLabel" runat="server" Text='<%# Eval("Text") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
        DeleteCommand="DELETE FROM Screens_Text WHERE (ScreenID = @original_ScreenID) AND (LoadOrder = @original_LoadOrder)" 
        InsertCommand="INSERT INTO [Screens_Text] ([ScreenID], [LoadOrder], [Text]) VALUES (@ScreenID, @LoadOrder, @Text)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT [ScreenID], [LoadOrder], [Text] FROM [Screens_Text] WHERE ([ScreenID] = @ScreenID) ORDER BY [ScreenID], [LoadOrder]" 
        
        
        UpdateCommand="UPDATE Screens_Text SET Text = @Text WHERE (ScreenID = @original_ScreenID) AND (LoadOrder = @original_LoadOrder)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="ScreenID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="original_ScreenID" Type="Int32" />
            <asp:Parameter Name="original_LoadOrder" Type="Int32" />
            <asp:Parameter Name="original_Text" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Text" Type="String" />
            <asp:Parameter Name="original_ScreenID" Type="Int32" />
            <asp:Parameter Name="original_LoadOrder" Type="Int32" />
            <asp:Parameter Name="original_Text" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="ScreenID" Type="Int32" />
            <asp:Parameter Name="LoadOrder" Type="Int32" />
            <asp:Parameter Name="Text" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="ListView2" runat="server" DataKeyNames="ScreenID,LoadOrder" 
        DataSourceID="SqlDataSource3" InsertItemPosition="LastItem">
        <ItemTemplate>
            <tr style="background-color:#DCDCDC;color: #000000; ">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                        Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="ScreenIDLabel" runat="server" Text='<%# Eval("ScreenID") %>' />
                </td>
                <td>
                    <asp:Label ID="LoadOrderLabel" runat="server" Text='<%# Eval("LoadOrder") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ReadOnlyCheckBox" runat="server" 
                        Checked='<%# Eval("ReadOnly") %>' Enabled="false" />
                </td>
                <td>
                    <asp:Label ID="DescpLabel" runat="server" Text='<%# Eval("Descp") %>' />
                </td>
                <td>
                    <asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' />
                </td>
                <td>
                    <asp:Label ID="HeightLabel" runat="server" Text='<%# Eval("Height") %>' />
                </td>
                <td>
                    <asp:Label ID="WidthLabel" runat="server" Text='<%# Eval("Width") %>' />
                </td>
                <td>
                    <asp:Label ID="LimitLabel" runat="server" Text='<%# Eval("Limit") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC; ">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                        Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="ScreenIDLabel" runat="server" Text='<%# Eval("ScreenID") %>' />
                </td>
                <td>
                    <asp:Label ID="LoadOrderLabel" runat="server" Text='<%# Eval("LoadOrder") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ReadOnlyCheckBox" runat="server" 
                        Checked='<%# Eval("ReadOnly") %>' Enabled="false" />
                </td>
                <td>
                    <asp:Label ID="DescpLabel" runat="server" Text='<%# Eval("Descp") %>' />
                </td>
                <td>
                    <asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' />
                </td>
                <td>
                    <asp:Label ID="HeightLabel" runat="server" Text='<%# Eval("Height") %>' />
                </td>
                <td>
                    <asp:Label ID="WidthLabel" runat="server" Text='<%# Eval("Width") %>' />
                </td>
                <td>
                    <asp:Label ID="LimitLabel" runat="server" Text='<%# Eval("Limit") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" 
                
                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px; ">
                <tr>
                    <td>
                        No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="ScreenIDTextBox" runat="server" CssClass="newStyle1"
                        Text='<%# Bind("ScreenID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LoadOrderTextBox" runat="server" CssClass="newStyle1"
                        Text='<%# Bind("LoadOrder") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ReadOnlyCheckBox" runat="server"  CssClass="newStyle1"
                        Checked='<%# Bind("ReadOnly") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DescpTextBox" CssClass="newStyle1" runat="server" Text='<%# Bind("Descp") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TypeTextBox" CssClass="newStyle1" runat="server" Text='<%# Bind("Type") %>' />
                </td>
                <td>
                    <asp:TextBox ID="HeightTextBox" CssClass="newStyle1" runat="server" Text='<%# Bind("Height") %>' />
                </td>
                <td>
                    <asp:TextBox ID="WidthTextBox" CssClass="newStyle1" runat="server" Text='<%# Bind("Width") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LimitTextBox" CssClass="newStyle1" runat="server" Text='<%# Bind("Limit") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <LayoutTemplate>
            <table runat="server" width="95%">
                <tr runat="server" width="95%">
                    <td runat="server" width="95%">
                        <table ID="itemPlaceholderContainer" runat="server" border="1" width="95%"
                            
                            style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px; font-family:Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                <th runat="server">
                                </th>
                                <th runat="server">
                                    ScreenID</th>
                                <th runat="server">
                                    LoadOrder</th>
                                <th runat="server">
                                    ReadOnly</th>
                                <th runat="server">
                                    Descp</th>
                                <th runat="server">
                                    Type</th>
                                <th runat="server">
                                    Height</th>
                                <th runat="server">
                                    Width</th>
                                <th runat="server">
                                    Limit</th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" width="95%"
                        
                        style="text-align: center;background-color: #CCCCCC; font-family:Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <EditItemTemplate>
            <tr style="background-color:#008A8C;color: #FFFFFF; ">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="ScreenIDLabel1" runat="server" Text='<%# Eval("ScreenID") %>' />
                </td>
                <td>
                    <asp:Label ID="LoadOrderLabel1" runat="server" CssClass="newStyle1"
                        Text='<%# Eval("LoadOrder") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ReadOnlyCheckBox" runat="server" CssClass="newStyle1"
                        Checked='<%# Bind("ReadOnly") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DescpTextBox" CssClass="newStyle1" runat="server" Text='<%# Bind("Descp") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TypeTextBox" CssClass="newStyle1" runat="server" Text='<%# Bind("Type") %>' />
                </td>
                <td>
                    <asp:TextBox ID="HeightTextBox" CssClass="newStyle1" runat="server" Text='<%# Bind("Height") %>' />
                </td>
                <td>
                    <asp:TextBox ID="WidthTextBox" CssClass="newStyle1" runat="server" Text='<%# Bind("Width") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LimitTextBox" CssClass="newStyle1" runat="server" Text='<%# Bind("Limit") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <SelectedItemTemplate>
            <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF; ">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                        Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="ScreenIDLabel" runat="server" Text='<%# Eval("ScreenID") %>' />
                </td>
                <td>
                    <asp:Label ID="LoadOrderLabel" runat="server" Text='<%# Eval("LoadOrder") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ReadOnlyCheckBox" runat="server" 
                        Checked='<%# Eval("ReadOnly") %>' Enabled="false" />
                </td>
                <td>
                    <asp:Label ID="DescpLabel" runat="server" Text='<%# Eval("Descp") %>' />
                </td>
                <td>
                    <asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' />
                </td>
                <td>
                    <asp:Label ID="HeightLabel" runat="server" Text='<%# Eval("Height") %>' />
                </td>
                <td>
                    <asp:Label ID="WidthLabel" runat="server" Text='<%# Eval("Width") %>' />
                </td>
                <td>
                    <asp:Label ID="LimitLabel" runat="server" Text='<%# Eval("Limit") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
        DeleteCommand="DELETE FROM Screens_Fields WHERE (ScreenID = @original_ScreenID) AND (LoadOrder = @original_LoadOrder)" 
        InsertCommand="INSERT INTO [Screens_Fields] ([ScreenID], [LoadOrder], [ReadOnly], [Descp], [Type], [Height], [Width], [Limit]) VALUES (@ScreenID, @LoadOrder, @ReadOnly, @Descp, @Type, @Height, @Width, @Limit)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT [ScreenID], [LoadOrder], [ReadOnly], [Descp], [Type], [Height], [Width], [Limit] FROM [Screens_Fields] WHERE ([ScreenID] = @ScreenID) ORDER BY [ScreenID], [LoadOrder]" 
        
        
        
        UpdateCommand="UPDATE Screens_Fields SET ReadOnly = @ReadOnly, Descp = @Descp, Type = @Type, Height = @Height, Width = @Width, Limit = @Limit WHERE (ScreenID = @original_ScreenID) AND (LoadOrder = @original_LoadOrder)" 
        ConflictDetection="CompareAllValues">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="ScreenID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="original_ScreenID" Type="Int32" />
            <asp:Parameter Name="original_LoadOrder" Type="Int32" />
            <asp:Parameter Name="original_ReadOnly" Type="Boolean" />
            <asp:Parameter Name="original_Descp" Type="String" />
            <asp:Parameter Name="original_Type" Type="String" />
            <asp:Parameter Name="original_Height" Type="Int32" />
            <asp:Parameter Name="original_Width" Type="Int32" />
            <asp:Parameter Name="original_Limit" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="ReadOnly" Type="Boolean" />
            <asp:Parameter Name="Descp" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="Height" Type="Int32" />
            <asp:Parameter Name="Width" Type="Int32" />
            <asp:Parameter Name="Limit" Type="Int32" />
            <asp:Parameter Name="original_ScreenID" Type="Int32" />
            <asp:Parameter Name="original_LoadOrder" Type="Int32" />
            <asp:Parameter Name="original_ReadOnly" Type="Boolean" />
            <asp:Parameter Name="original_Descp" Type="String" />
            <asp:Parameter Name="original_Type" Type="String" />
            <asp:Parameter Name="original_Height" Type="Int32" />
            <asp:Parameter Name="original_Width" Type="Int32" />
            <asp:Parameter Name="original_Limit" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="ScreenID" Type="Int32" />
            <asp:Parameter Name="LoadOrder" Type="Int32" />
            <asp:Parameter Name="ReadOnly" Type="Boolean" />
            <asp:Parameter Name="Descp" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="Height" Type="Int32" />
            <asp:Parameter Name="Width" Type="Int32" />
            <asp:Parameter Name="Limit" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="ListView3" runat="server" 
        DataKeyNames="ScreenID,ScreenField,CommandKey" DataSourceID="SqlDataSource4" 
        InsertItemPosition="LastItem">
        <ItemTemplate>
            <tr style="background-color:#DCDCDC;color: #000000; font-family:Courier New;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                        Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="ScreenIDLabel" runat="server" Text='<%# Eval("ScreenID") %>' />
                </td>
                <td>
                    <asp:Label ID="ScreenFieldLabel" runat="server" 
                        Text='<%# Eval("ScreenField") %>' />
                </td>
                <td>
                    <asp:Label ID="CommandKeyLabel" runat="server" 
                        Text='<%# Eval("CommandKey") %>' />
                </td>
                <td>
                    <asp:Label ID="FunctionTypeLabel" runat="server" 
                        Text='<%# Eval("FunctionType") %>' />
                </td>
                <td>
                    <asp:Label ID="CommandLabel" runat="server" Text='<%# Eval("Command") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC; font-family:Courier New;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                        Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="ScreenIDLabel" runat="server" Text='<%# Eval("ScreenID") %>' />
                </td>
                <td>
                    <asp:Label ID="ScreenFieldLabel" runat="server" 
                        Text='<%# Eval("ScreenField") %>' />
                </td>
                <td>
                    <asp:Label ID="CommandKeyLabel" runat="server" 
                        Text='<%# Eval("CommandKey") %>' />
                </td>
                <td>
                    <asp:Label ID="FunctionTypeLabel" runat="server" 
                        Text='<%# Eval("FunctionType") %>' />
                </td>
                <td>
                    <asp:Label ID="CommandLabel" runat="server" Text='<%# Eval("Command") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" 
                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px; font-family:Courier New;">
                <tr>
                    <td>
                        No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style=" font-family:Courier New;">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="ScreenIDTextBox" CssClass="newStyle1" runat="server" 
                        Text='<%# Bind("ScreenID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ScreenFieldTextBox" CssClass="newStyle1" runat="server" 
                        Text='<%# Bind("ScreenField") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CommandKeyTextBox" CssClass="newStyle1" runat="server" 
                        Text='<%# Bind("CommandKey") %>' />
                </td>
                <td>
                    <asp:TextBox ID="FunctionTypeTextBox" CssClass="newStyle1" runat="server" 
                        Text='<%# Bind("FunctionType") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CommandTextBox" CssClass="newStyle1" runat="server" Text='<%# Bind("Command") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <LayoutTemplate>
            <table runat="server" width="95%">
                <tr runat="server" width="95%">
                    <td runat="server" width="95%">
                        <table ID="itemPlaceholderContainer" runat="server" border="1" width="95%" 
                            style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px; font-family:Courier New;">
                            <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                <th runat="server">
                                </th>
                                <th runat="server">
                                    ScreenID</th>
                                <th runat="server">
                                    ScreenField</th>
                                <th runat="server">
                                    CommandKey</th>
                                <th runat="server">
                                    FunctionType</th>
                                <th runat="server">
                                    Command</th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" width="95%"
                        style="text-align: center;background-color: #CCCCCC; font-family:Courier New;color: #000000;">
                        <asp:DataPager ID="DataPager1" runat="server" width="95%">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <EditItemTemplate>
            <tr style="background-color:#008A8C;color: #FFFFFF; font-family:Courier New;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="ScreenIDLabel1" runat="server" Text='<%# Eval("ScreenID") %>' />
                </td>
                <td>
                    <asp:Label ID="ScreenFieldLabel1" runat="server" 
                        Text='<%# Eval("ScreenField") %>' />
                </td>
                <td>
                    <asp:Label ID="CommandKeyLabel1" runat="server" 
                        Text='<%# Eval("CommandKey") %>' />
                </td>
                <td>
                    <asp:TextBox ID="FunctionTypeTextBox" CssClass="newStyle1" runat="server" 
                        Text='<%# Bind("FunctionType") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CommandTextBox" CssClass="newStyle1" runat="server" Text='<%# Bind("Command") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <SelectedItemTemplate>
            <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF; font-family:Courier New;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                        Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="ScreenIDLabel" runat="server" Text='<%# Eval("ScreenID") %>' />
                </td>
                <td>
                    <asp:Label ID="ScreenFieldLabel" runat="server" 
                        Text='<%# Eval("ScreenField") %>' />
                </td>
                <td>
                    <asp:Label ID="CommandKeyLabel" runat="server" 
                        Text='<%# Eval("CommandKey") %>' />
                </td>
                <td>
                    <asp:Label ID="FunctionTypeLabel" runat="server" 
                        Text='<%# Eval("FunctionType") %>' />
                </td>
                <td>
                    <asp:Label ID="CommandLabel" runat="server" Text='<%# Eval("Command") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
        DeleteCommand="DELETE FROM Screens_Commands WHERE (ScreenID = @original_ScreenID) AND (ScreenField = @original_ScreenField) AND (CommandKey = @original_CommandKey)" 
        InsertCommand="INSERT INTO [Screens_Commands] ([ScreenID], [ScreenField], [CommandKey], [FunctionType], [Command]) VALUES (@ScreenID, @ScreenField, @CommandKey, @FunctionType, @Command)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT [ScreenID], [ScreenField], [CommandKey], [FunctionType], [Command] FROM [Screens_Commands] WHERE ([ScreenID] = @ScreenID) ORDER BY [ScreenID], [ScreenField], [CommandKey]" 
        
        
        UpdateCommand="UPDATE Screens_Commands SET FunctionType = @FunctionType, Command = @Command WHERE (ScreenID = @original_ScreenID) AND (ScreenField = @original_ScreenField) AND (CommandKey = @original_CommandKey)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="ScreenID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="original_ScreenID" Type="Int32" />
            <asp:Parameter Name="original_ScreenField" Type="Int32" />
            <asp:Parameter Name="original_CommandKey" Type="String" />
            <asp:Parameter Name="original_FunctionType" Type="String" />
            <asp:Parameter Name="original_Command" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="FunctionType" Type="String" />
            <asp:Parameter Name="Command" Type="String" />
            <asp:Parameter Name="original_ScreenID" Type="Int32" />
            <asp:Parameter Name="original_ScreenField" Type="Int32" />
            <asp:Parameter Name="original_CommandKey" Type="String" />
            <asp:Parameter Name="original_FunctionType" Type="String" />
            <asp:Parameter Name="original_Command" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="ScreenID" Type="Int32" />
            <asp:Parameter Name="ScreenField" Type="Int32" />
            <asp:Parameter Name="CommandKey" Type="String" />
            <asp:Parameter Name="FunctionType" Type="String" />
            <asp:Parameter Name="Command" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

