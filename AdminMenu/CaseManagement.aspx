<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false"
    CodeFile="CaseManagement.aspx.vb" Inherits="AdminMenu_CaseManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 150px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="DeptID" DataSourceID="SqlDataSource1"
        InsertItemPosition="LastItem">
        <ItemTemplate>
            <tr style="background-color: #DCDCDC; color: #000000;">
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="DeptIDLabel" runat="server" Text='<%# Eval("DeptID") %>' />
                </td>
                <td>
                    <asp:Label ID="DepartmentNameLabel" runat="server" Text='<%# Eval("DepartmentName") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="OneStopCheckBox" runat="server" Checked='<%# Eval("OneStop") %>'
                        Enabled="false" />
                </td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr style="background-color: #FFF8DC;">
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="DeptIDLabel" runat="server" Text='<%# Eval("DeptID") %>' />
                </td>
                <td>
                    <asp:Label ID="DepartmentNameLabel" runat="server" Text='<%# Eval("DepartmentName") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="OneStopCheckBox" runat="server" Checked='<%# Eval("OneStop") %>'
                        Enabled="false" />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse;
                border-color: #999999; border-style: none; border-width: 1px;">
                <tr>
                    <td>
                        No data was returned.
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="DeptIDTextBox" runat="server" Text='<%# Bind("DeptID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DepartmentNameTextBox" runat="server" Text='<%# Bind("DepartmentName") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="OneStopCheckBox" runat="server" Checked='<%# Bind("OneStop") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;
                            border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;
                            font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                <th runat="server">
                                </th>
                                <th runat="server">
                                    DeptID
                                </th>
                                <th runat="server">
                                    DepartmentName
                                </th>
                                <th runat="server">
                                    OneStop
                                </th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;
                        color: #000000;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <EditItemTemplate>
            <tr style="background-color: #008A8C; color: #FFFFFF;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="DeptIDLabel1" runat="server" Text='<%# Eval("DeptID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DepartmentNameTextBox" runat="server" Text='<%# Bind("DepartmentName") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="OneStopCheckBox" runat="server" Checked='<%# Bind("OneStop") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="DeptIDLabel" runat="server" Text='<%# Eval("DeptID") %>' />
                </td>
                <td>
                    <asp:Label ID="DepartmentNameLabel" runat="server" Text='<%# Eval("DepartmentName") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="OneStopCheckBox" runat="server" Checked='<%# Eval("OneStop") %>'
                        Enabled="false" />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" DeleteCommand="DELETE FROM [Case_Dept] WHERE [DeptID] = @original_DeptID AND [DepartmentName] = @original_DepartmentName AND [OneStop] = @original_OneStop"
        InsertCommand="INSERT INTO [Case_Dept] ([DeptID], [DepartmentName], [OneStop]) VALUES (@DeptID, @DepartmentName, @OneStop)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Case_Dept] ORDER BY [DeptID]"
        
        UpdateCommand="UPDATE [Case_Dept] SET [DepartmentName] = @DepartmentName, [OneStop] = @OneStop WHERE [DeptID] = @original_DeptID AND [DepartmentName] = @original_DepartmentName AND [OneStop] = @original_OneStop">
        <DeleteParameters>
            <asp:Parameter Name="original_DeptID" Type="Int32" />
            <asp:Parameter Name="original_DepartmentName" Type="String" />
            <asp:Parameter Name="original_OneStop" Type="Boolean" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="DepartmentName" Type="String" />
            <asp:Parameter Name="OneStop" Type="Boolean" />
            <asp:Parameter Name="original_DeptID" Type="Int32" />
            <asp:Parameter Name="original_DepartmentName" Type="String" />
            <asp:Parameter Name="original_OneStop" Type="Boolean" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="DeptID" Type="Int32" />
            <asp:Parameter Name="DepartmentName" Type="String" />
            <asp:Parameter Name="OneStop" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
    <asp:ListView ID="ListView2" runat="server" DataKeyNames="CaseID" DataSourceID="SqlDataSource2"
        InsertItemPosition="LastItem">
        <ItemTemplate>
            <tr style="background-color: #DCDCDC; color: #000000;">
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:LinkButton ID="CaseIDLabel1" runat="server" Text='<%# Eval("CaseID") %>' PostBackUrl='<%# string.Format("CaseManager.aspx?CaseNumber={0}", Eval("CaseID")) %>' />
                </td>
                <td>
                    <asp:Label ID="DeptIDLabel" runat="server" Text='<%# Eval("DeptID") %>' />
                </td>
                <td>
                    <asp:Label ID="CaseNameLabel" runat="server" Text='<%# Eval("CaseName") %>' />
                </td>
                <td>
                    <asp:Label ID="CaseTimeLabel" runat="server" Text='<%# Eval("CaseTime") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Eval("Active") %>'
                        Enabled="false" />
                </td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr style="background-color: #FFF8DC;">
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:LinkButton ID="CaseIDLabel1" runat="server" Text='<%# Eval("CaseID") %>' PostBackUrl='<%# string.Format("CaseManager.aspx?CaseNumber={0}", Eval("CaseID")) %>' />
                </td>
                <td>
                    <asp:Label ID="DeptIDLabel" runat="server" Text='<%# Eval("DeptID") %>' />
                </td>
                <td>
                    <asp:Label ID="CaseNameLabel" runat="server" Text='<%# Eval("CaseName") %>' />
                </td>
                <td>
                    <asp:Label ID="CaseTimeLabel" runat="server" Text='<%# Eval("CaseTime") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Eval("Active") %>'
                        Enabled="false" />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse;
                border-color: #999999; border-style: none; border-width: 1px;">
                <tr>
                    <td>
                        No data was returned.
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="CaseIDTextBox" runat="server" Text='<%# Bind("CaseID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DeptIDTextBox" runat="server" Text='<%# Bind("DeptID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CaseNameTextBox" runat="server" Text='<%# Bind("CaseName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CaseTimeTextBox" runat="server" Text='<%# Bind("CaseTime") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Bind("Active") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;
                            border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;
                            font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                <th runat="server">
                                </th>
                                <th runat="server">
                                    CaseID
                                </th>
                                <th runat="server">
                                    DeptID
                                </th>
                                <th runat="server">
                                    CaseName
                                </th>
                                <th runat="server">
                                    CaseTime
                                </th>
                                <th runat="server">
                                    Active
                                </th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;
                        color: #000000;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <EditItemTemplate>
            <tr style="background-color: #008A8C; color: #FFFFFF;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="CaseIDLabel1" runat="server" Text='<%# Eval("CaseID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DeptIDTextBox" runat="server" Text='<%# Bind("DeptID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CaseNameTextBox" runat="server" Text='<%# Bind("CaseName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CaseTimeTextBox" runat="server" Text='<%# Bind("CaseTime") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Bind("Active") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="CaseIDLabel" runat="server" Text='<%# Eval("CaseID") %>' />
                </td>
                <td>
                    <asp:Label ID="DeptIDLabel" runat="server" Text='<%# Eval("DeptID") %>' />
                </td>
                <td>
                    <asp:Label ID="CaseNameLabel" runat="server" Text='<%# Eval("CaseName") %>' />
                </td>
                <td>
                    <asp:Label ID="CaseTimeLabel" runat="server" Text='<%# Eval("CaseTime") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Eval("Active") %>'
                        Enabled="false" />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" DeleteCommand="DELETE FROM [Case_Types] WHERE [CaseID] = @original_CaseID AND [DeptID] = @original_DeptID AND [CaseName] = @original_CaseName AND [CaseTime] = @original_CaseTime AND [Active] = @original_Active"
        InsertCommand="INSERT INTO [Case_Types] ([CaseID], [DeptID], [CaseName], [CaseTime], [Active]) VALUES (@CaseID, @DeptID, @CaseName, @CaseTime, @Active)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Case_Types] ORDER BY [CaseID]"
        UpdateCommand="UPDATE [Case_Types] SET [DeptID] = @DeptID, [CaseName] = @CaseName, [CaseTime] = @CaseTime, [Active] = @Active WHERE [CaseID] = @original_CaseID AND [DeptID] = @original_DeptID AND [CaseName] = @original_CaseName AND [CaseTime] = @original_CaseTime AND [Active] = @original_Active">
        <DeleteParameters>
            <asp:Parameter Name="original_CaseID" Type="Int32" />
            <asp:Parameter Name="original_DeptID" Type="Int32" />
            <asp:Parameter Name="original_CaseName" Type="String" />
            <asp:Parameter Name="original_CaseTime" Type="Int32" />
            <asp:Parameter Name="original_Active" Type="Boolean" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="DeptID" Type="Int32" />
            <asp:Parameter Name="CaseName" Type="String" />
            <asp:Parameter Name="CaseTime" Type="Int32" />
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="original_CaseID" Type="Int32" />
            <asp:Parameter Name="original_DeptID" Type="Int32" />
            <asp:Parameter Name="original_CaseName" Type="String" />
            <asp:Parameter Name="original_CaseTime" Type="Int32" />
            <asp:Parameter Name="original_Active" Type="Boolean" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="CaseID" Type="Int32" />
            <asp:Parameter Name="DeptID" Type="Int32" />
            <asp:Parameter Name="CaseName" Type="String" />
            <asp:Parameter Name="CaseTime" Type="Int32" />
            <asp:Parameter Name="Active" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
        SelectCommand="SELECT CaseID, CONVERT (varchar, CaseID) + ' | ' + CaseName AS DName FROM Case_Types ORDER BY CaseID">
    </asp:SqlDataSource>
    
</asp:Content>
