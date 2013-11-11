<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false" CodeFile="DepartmentManager.aspx.vb" Inherits="AdminMenu_DepartmentManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Username">
    </asp:ListBox>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
        DeleteCommand="DELETE FROM [Users] WHERE [Username] = @original_Username AND (([TellerID] = @original_TellerID) OR ([TellerID] IS NULL AND @original_TellerID IS NULL)) AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND [Password] = @original_Password AND (([LastUsed] = @original_LastUsed) OR ([LastUsed] IS NULL AND @original_LastUsed IS NULL)) AND (([LastUpdated] = @original_LastUpdated) OR ([LastUpdated] IS NULL AND @original_LastUpdated IS NULL)) AND [Created] = @original_Created AND (([Active] = @original_Active) OR ([Active] IS NULL AND @original_Active IS NULL)) AND (([AuthLevel] = @original_AuthLevel) OR ([AuthLevel] IS NULL AND @original_AuthLevel IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))" 
        InsertCommand="INSERT INTO [Users] ([Username], [TellerID], [Name], [Password], [LastUsed], [LastUpdated], [Created], [Active], [AuthLevel], [Email]) VALUES (@Username, @TellerID, @Name, @Password, @LastUsed, @LastUpdated, @Created, @Active, @AuthLevel, @Email)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [Users] ORDER BY [Name]" 
        
        UpdateCommand="UPDATE [Users] SET [TellerID] = @TellerID, [Name] = @Name, [Password] = @Password, [LastUsed] = @LastUsed, [LastUpdated] = @LastUpdated, [Created] = @Created, [Active] = @Active, [AuthLevel] = @AuthLevel, [Email] = @Email WHERE [Username] = @original_Username AND (([TellerID] = @original_TellerID) OR ([TellerID] IS NULL AND @original_TellerID IS NULL)) AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND [Password] = @original_Password AND (([LastUsed] = @original_LastUsed) OR ([LastUsed] IS NULL AND @original_LastUsed IS NULL)) AND (([LastUpdated] = @original_LastUpdated) OR ([LastUpdated] IS NULL AND @original_LastUpdated IS NULL)) AND [Created] = @original_Created AND (([Active] = @original_Active) OR ([Active] IS NULL AND @original_Active IS NULL)) AND (([AuthLevel] = @original_AuthLevel) OR ([AuthLevel] IS NULL AND @original_AuthLevel IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_Username" Type="String" />
            <asp:Parameter Name="original_TellerID" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Password" Type="String" />
            <asp:Parameter Name="original_LastUsed" Type="DateTime" />
            <asp:Parameter Name="original_LastUpdated" Type="DateTime" />
            <asp:Parameter Name="original_Created" Type="DateTime" />
            <asp:Parameter Name="original_Active" Type="String" />
            <asp:Parameter Name="original_AuthLevel" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="TellerID" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="LastUsed" Type="DateTime" />
            <asp:Parameter Name="LastUpdated" Type="DateTime" />
            <asp:Parameter Name="Created" Type="DateTime" />
            <asp:Parameter Name="Active" Type="String" />
            <asp:Parameter Name="AuthLevel" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="original_Username" Type="String" />
            <asp:Parameter Name="original_TellerID" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Password" Type="String" />
            <asp:Parameter Name="original_LastUsed" Type="DateTime" />
            <asp:Parameter Name="original_LastUpdated" Type="DateTime" />
            <asp:Parameter Name="original_Created" Type="DateTime" />
            <asp:Parameter Name="original_Active" Type="String" />
            <asp:Parameter Name="original_AuthLevel" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="TellerID" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="LastUsed" Type="DateTime" />
            <asp:Parameter Name="LastUpdated" Type="DateTime" />
            <asp:Parameter Name="Created" Type="DateTime" />
            <asp:Parameter Name="Active" Type="String" />
            <asp:Parameter Name="AuthLevel" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br />
    <asp:MultiView ID="MultiView2" runat="server">
        <asp:View ID="View3" runat="server">
            This user does not have a teller ID,<br />
            Please create one.<br />
            <asp:TextBox ID="TextBox2" runat="server" MaxLength="5"></asp:TextBox>
            <asp:Button ID="Button2" runat="server" Text="Button" />
            <br />
            <asp:Label ID="Alert1" runat="server" ForeColor="Red"></asp:Label>
        </asp:View>
        <asp:View ID="View4" runat="server">
            Pick Depts<table>
                <tr>
                    <td>
                        Non-Selected Dept</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        Current Depts</td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:ListBox ID="ListBox3" runat="server" DataSourceID="SqlDataSource3" 
                            DataTextField="Name" DataValueField="DeptID" Rows="10">
                        </asp:ListBox>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
                            
                            
                            SelectCommand="SELECT DeptID, CONVERT (Char, DeptID) + N' ' + DepartmentName AS Name FROM Case_Dept AS B WHERE ((SELECT COUNT(*) AS Expr1 FROM Teller_Depts WHERE (B.DeptID = DeptID) AND (TellerID = @Teller)) = 0)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label1" Name="Teller" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td class="style1">
                        <asp:Button ID="Button3" runat="server" Text="&gt;" /><br />
                        <asp:Button ID="Button4" runat="server" Text="&lt;" />
                    </td>
                    <td class="style1">
                        <asp:ListBox ID="ListBox2" runat="server" DataSourceID="SqlDataSource2" 
                            DataTextField="Name" DataValueField="DeptID" Rows="10">
                        </asp:ListBox>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
                            
                            SelectCommand="SELECT Teller_Depts.DeptID, CONVERT (Char, Teller_Depts.DeptID) + N' ' + Case_Dept.DepartmentName AS Name, Teller_Depts.TellerID FROM Teller_Depts INNER JOIN Case_Dept ON Teller_Depts.DeptID = Case_Dept.DeptID WHERE (Teller_Depts.TellerID = @Teller)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label1" Name="Teller" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>

