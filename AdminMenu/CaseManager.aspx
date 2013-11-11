<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false" CodeFile="CaseManager.aspx.vb" Inherits="AdminMenu_CaseManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                <asp:LinkButton ID="LinkButton3" runat="server" 
                    PostBackUrl="~/AdminMenu/CaseManagement.aspx">[Go Back To Case Managment]</asp:LinkButton>
            </td>
            <td>
                <table>
                    <tr>
                        <td class="style2">
                            Line Types
                        </td>
                        <td class="style2">
                            &nbsp;
                        </td>
                        <td class="style2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Textbox
                        </td>
                        <td class="style2">
                            DropDown
                        </td>
                        <td class="style2">
                            Notice
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Details
                        </td>
                        <td class="style2">
                            &nbsp;
                        </td>
                        <td class="style2">
                            &nbsp;
                        </td>
                    </tr>
                </table>
                &nbsp;
            </td>
        </tr>
    </table>
    <asp:ListView ID="ListView3" runat="server" DataKeyNames="CaseLineID,CaseID" DataSourceID="SqlDataSource4"
        InsertItemPosition="LastItem">
        <ItemTemplate>
            <tr style="background-color: #DCDCDC; color: #000000;">
                <td rowspan="2">
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="CaseLineIDLabel" runat="server" Text='<%# Eval("CaseLineID") %>' />
                </td>
                <td>
                    <asp:Label ID="CaseIDLabel" runat="server" Text='<%# Eval("CaseID") %>' />
                </td>
                <td>
                    <asp:Label ID="LineTypeLabel" runat="server" Text='<%# Eval("LineType") %>' />
                </td>
                <td>
                    <asp:Label ID="LineDetailsLabel" runat="server" Text='<%# Eval("LineDetails") %>' />
                </td>
                <td>
                    <asp:Label ID="LineLimitLabel" runat="server" Text='<%# Eval("LineLimit") %>' />
                </td>
            </tr>
            <tr style="background-color: #DCDCDC; color: #000000;">
                <td>
                    <asp:Label ID="LineValuesLabel" runat="server" Text='<%# Eval("LineValues") %>' />
                </td>
                <td>
                    <asp:Label ID="LineRowLabel" runat="server" Text='<%# Eval("LineRow") %>' />
                </td>
                <td>
                    <asp:Label ID="LineColumnLabel" runat="server" Text='<%# Eval("LineColumn") %>' />
                </td>
                <td>
                    <asp:Label ID="LineColSpanLabel" runat="server" Text='<%# Eval("LineColSpan") %>' />
                </td>
                <td>
                    <asp:Label ID="LineRowSpanLabel" runat="server" Text='<%# Eval("LineRowSpan") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr style="background-color: #FFF8DC;">
                <td rowspan="2">
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="CaseLineIDLabel" runat="server" Text='<%# Eval("CaseLineID") %>' />
                </td>
                <td>
                    <asp:Label ID="CaseIDLabel" runat="server" Text='<%# Eval("CaseID") %>' />
                </td>
                <td>
                    <asp:Label ID="LineTypeLabel" runat="server" Text='<%# Eval("LineType") %>' />
                </td>
                <td>
                    <asp:Label ID="LineDetailsLabel" runat="server" Text='<%# Eval("LineDetails") %>' />
                </td>
                <td>
                    <asp:Label ID="LineLimitLabel" runat="server" Text='<%# Eval("LineLimit") %>' />
                </td>
            </tr>
            <tr style="background-color: #FFF8DC;">
                <td>
                    <asp:Label ID="LineValuesLabel" runat="server" Text='<%# Eval("LineValues") %>' />
                </td>
                <td>
                    <asp:Label ID="LineRowLabel" runat="server" Text='<%# Eval("LineRow") %>' />
                </td>
                <td>
                    <asp:Label ID="LineColumnLabel" runat="server" Text='<%# Eval("LineColumn") %>' />
                </td>
                <td>
                    <asp:Label ID="LineColSpanLabel" runat="server" Text='<%# Eval("LineColSpan") %>' />
                </td>
                <td>
                    <asp:Label ID="LineRowSpanLabel" runat="server" Text='<%# Eval("LineRowSpan") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <table id="Table1" runat="server" style="background-color: #FFFFFF; border-collapse: collapse;
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
                <td rowspan="2">
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    Auto Created
                </td>
                <td>
                    <asp:TextBox ID="CaseIDTextBox" runat="server" Text='<%# Bind("CaseID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LineTypeTextBox" runat="server" Text='<%# Bind("LineType") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LineDetailsTextBox" runat="server" Text='<%# Bind("LineDetails") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LineLimitTextBox" runat="server" Text='<%# Bind("LineLimit") %>' />
                </td>
            </tr>
            <tr style="">
                <td>
                    <asp:TextBox ID="LineValuesTextBox" runat="server" Text='<%# Bind("LineValues") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LineRowTextBox" runat="server" Text='<%# Bind("LineRow") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LineColumnTextBox" runat="server" Text='<%# Bind("LineColumn") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LineColSpanTextBox" runat="server" Text='<%# Bind("LineColSpan") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LineRowSpanTextBox" runat="server" Text='<%# Bind("LineRowSpan") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <LayoutTemplate>
            <table id="Table2" runat="server">
                <tr id="Tr1" runat="server">
                    <td id="Td1" runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;
                            border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;
                            font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr id="Tr2" runat="server" style="background-color: #DCDCDC; color: #000000;">
                                <th id="Th1" runat="server" rowspan="2">
                                </th>
                                <th id="Th2" runat="server">
                                    CaseLineID
                                </th>
                                <th id="Th3" runat="server">
                                    CaseID
                                </th>
                                <th id="Th4" runat="server">
                                    LineType
                                </th>
                                <th id="Th5" runat="server">
                                    LineDetails
                                </th>
                                <th id="Th6" runat="server">
                                    LineLimit
                                </th>
                            </tr>
                            <tr id="Tr3" runat="server" style="background-color: #DCDCDC; color: #000000;">
                                <th id="Th7" runat="server">
                                    LineValues
                                </th>
                                <th id="Th8" runat="server">
                                    LineRow
                                </th>
                                <th id="Th9" runat="server">
                                    LineColumn
                                </th>
                                <th id="Th10" runat="server">
                                    LineColSpan
                                </th>
                                <th id="Th11" runat="server">
                                    LineRowSpan
                                </th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="Tr4" runat="server">
                    <td id="Td2" runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;
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
                <td rowspan="2">
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="CaseLineIDLabel1" runat="server" Text='<%# Eval("CaseLineID") %>' />
                </td>
                <td>
                    <asp:Label ID="CaseIDLabel1" runat="server" Text='<%# Eval("CaseID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LineTypeTextBox" runat="server" Text='<%# Bind("LineType") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LineDetailsTextBox" runat="server" Text='<%# Bind("LineDetails") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LineLimitTextBox" runat="server" Text='<%# Bind("LineLimit") %>' />
                </td>
            </tr>
            <tr style="background-color: #008A8C; color: #FFFFFF;">
                <td>
                    <asp:TextBox ID="LineValuesTextBox" runat="server" Text='<%# Bind("LineValues") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LineRowTextBox" runat="server" Text='<%# Bind("LineRow") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LineColumnTextBox" runat="server" Text='<%# Bind("LineColumn") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LineColSpanTextBox" runat="server" Text='<%# Bind("LineColSpan") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LineRowSpanTextBox" runat="server" Text='<%# Bind("LineRowSpan") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">
                <td rowspan="2">
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="CaseLineIDLabel" runat="server" Text='<%# Eval("CaseLineID") %>' />
                </td>
                <td>
                    <asp:Label ID="CaseIDLabel" runat="server" Text='<%# Eval("CaseID") %>' />
                </td>
                <td>
                    <asp:Label ID="LineTypeLabel" runat="server" Text='<%# Eval("LineType") %>' />
                </td>
                <td>
                    <asp:Label ID="LineDetailsLabel" runat="server" Text='<%# Eval("LineDetails") %>' />
                </td>
                <td>
                    <asp:Label ID="LineLimitLabel" runat="server" Text='<%# Eval("LineLimit") %>' />
                </td>
            </tr>
            <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">
                <td>
                    <asp:Label ID="LineValuesLabel" runat="server" Text='<%# Eval("LineValues") %>' />
                </td>
                <td>
                    <asp:Label ID="LineRowLabel" runat="server" Text='<%# Eval("LineRow") %>' />
                </td>
                <td>
                    <asp:Label ID="LineColumnLabel" runat="server" Text='<%# Eval("LineColumn") %>' />
                </td>
                <td>
                    <asp:Label ID="LineColSpanLabel" runat="server" Text='<%# Eval("LineColSpan") %>' />
                </td>
                <td>
                    <asp:Label ID="LineRowSpanLabel" runat="server" Text='<%# Eval("LineRowSpan") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server"
        ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" DeleteCommand="DELETE FROM [Case_Details] WHERE [CaseLineID] = @original_CaseLineID"
        InsertCommand="INSERT INTO [Case_Details] ([CaseID], [LineType], [LineDetails], [LineLimit], [LineValues], [LineRow], [LineColumn], [LineColSpan], [LineRowSpan]) VALUES (@CaseID, @LineType, @LineDetails, @LineLimit, @LineValues, @LineRow, @LineColumn, @LineColSpan, @LineRowSpan)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Case_Details] WHERE ([CaseID] = @CaseID) ORDER BY [LineRow], [LineColumn]"
        
        UpdateCommand="UPDATE [Case_Details] SET [LineType] = @LineType, [LineDetails] = @LineDetails, [LineLimit] = @LineLimit, [LineValues] = @LineValues, [LineRow] = @LineRow, [LineColumn] = @LineColumn, [LineColSpan] = @LineColSpan, [LineRowSpan] = @LineRowSpan WHERE [CaseLineID] = @original_CaseLineID">
        <SelectParameters>
            <asp:QueryStringParameter Name="CaseID" QueryStringField="CaseNumber" 
                Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="original_CaseLineID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="LineType" Type="String" />
            <asp:Parameter Name="LineDetails" Type="String" />
            <asp:Parameter Name="LineLimit" Type="Int32" />
            <asp:Parameter Name="LineValues" Type="String" />
            <asp:Parameter Name="LineRow" Type="Int32" />
            <asp:Parameter Name="LineColumn" Type="Int32" />
            <asp:Parameter Name="LineColSpan" Type="Int32" />
            <asp:Parameter Name="LineRowSpan" Type="Int32" />
            <asp:Parameter Name="original_CaseLineID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="CaseID" Type="Int32" />
            <asp:Parameter Name="LineType" Type="String" />
            <asp:Parameter Name="LineDetails" Type="String" />
            <asp:Parameter Name="LineLimit" Type="Int32" />
            <asp:Parameter Name="LineValues" Type="String" />
            <asp:Parameter Name="LineRow" Type="Int32" />
            <asp:Parameter Name="LineColumn" Type="Int32" />
            <asp:Parameter Name="LineColSpan" Type="Int32" />
            <asp:Parameter Name="LineRowSpan" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

