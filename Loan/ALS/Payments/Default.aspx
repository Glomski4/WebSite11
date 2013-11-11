<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Loan_ALS_Payments_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AutoGenerateColumns="False" DataKeyNames="Username" 
    DataSourceID="SqlDataSource1" AllowSorting="True">
    <Columns>
        <asp:CommandField ShowEditButton="True" />
        <asp:HyperLinkField DataNavigateUrlFields="TellerID" 
            DataNavigateUrlFormatString="~\Loan\ALS\Payments\Default.aspx?TellerID={0}" 
            Text="View" />
        <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" 
            SortExpression="Username" />
        <asp:BoundField DataField="TellerID" HeaderText="TellerID" 
            SortExpression="TellerID" />
        <asp:BoundField DataField="Name" HeaderText="Name" 
            ReadOnly="True" SortExpression="Name" />
        <asp:BoundField DataField="LastUsed" HeaderText="LastUsed" ReadOnly="True" 
            SortExpression="LastUsed" />
        <asp:BoundField DataField="LastUpdated" HeaderText="LastUpdated" ReadOnly="True" 
            SortExpression="LastUpdated" />
        <asp:BoundField DataField="Active" HeaderText="Active" ReadOnly="True" 
            SortExpression="Active" />
        <asp:BoundField DataField="AuthLevel" HeaderText="AuthLevel" ReadOnly="True" 
            SortExpression="AuthLevel" />
        <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" 
            SortExpression="Email" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConflictDetection="CompareAllValues" 
    ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
    DeleteCommand="DELETE FROM [Users] WHERE [Username] = @original_Username AND (([TellerID] = @original_TellerID) OR ([TellerID] IS NULL AND @original_TellerID IS NULL)) AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([LastUsed] = @original_LastUsed) OR ([LastUsed] IS NULL AND @original_LastUsed IS NULL)) AND (([LastUpdated] = @original_LastUpdated) OR ([LastUpdated] IS NULL AND @original_LastUpdated IS NULL)) AND (([Active] = @original_Active) OR ([Active] IS NULL AND @original_Active IS NULL)) AND (([AuthLevel] = @original_AuthLevel) OR ([AuthLevel] IS NULL AND @original_AuthLevel IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))" 
    InsertCommand="INSERT INTO [Users] ([Username], [TellerID], [Name], [LastUsed], [LastUpdated], [Active], [AuthLevel], [Email]) VALUES (@Username, @TellerID, @Name, @LastUsed, @LastUpdated, @Active, @AuthLevel, @Email)" 
    OldValuesParameterFormatString="original_{0}" 
    SelectCommand="SELECT [Username], [TellerID], [Name], [LastUsed], [LastUpdated], [Active], [AuthLevel], [Email] FROM [Users]" 
    
        UpdateCommand="UPDATE [Users] SET [TellerID] = @TellerID WHERE [Username] = @original_Username AND (([TellerID] = @original_TellerID) OR ([TellerID] IS NULL AND @original_TellerID IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_Username" Type="String" />
        <asp:Parameter Name="original_TellerID" Type="Int32" />
        <asp:Parameter Name="original_Name" Type="String" />
        <asp:Parameter Name="original_LastUsed" Type="DateTime" />
        <asp:Parameter Name="original_LastUpdated" Type="DateTime" />
        <asp:Parameter Name="original_Active" Type="String" />
        <asp:Parameter Name="original_AuthLevel" Type="String" />
        <asp:Parameter Name="original_Email" Type="String" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="TellerID" Type="Int32" />
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="LastUsed" Type="DateTime" />
        <asp:Parameter Name="LastUpdated" Type="DateTime" />
        <asp:Parameter Name="Active" Type="String" />
        <asp:Parameter Name="AuthLevel" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="original_Username" Type="String" />
        <asp:Parameter Name="original_TellerID" Type="Int32" />
        <asp:Parameter Name="original_Name" Type="String" />
        <asp:Parameter Name="original_LastUsed" Type="DateTime" />
        <asp:Parameter Name="original_LastUpdated" Type="DateTime" />
        <asp:Parameter Name="original_Active" Type="String" />
        <asp:Parameter Name="original_AuthLevel" Type="String" />
        <asp:Parameter Name="original_Email" Type="String" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="Username" Type="String" />
        <asp:Parameter Name="TellerID" Type="Int32" />
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="LastUsed" Type="DateTime" />
        <asp:Parameter Name="LastUpdated" Type="DateTime" />
        <asp:Parameter Name="Active" Type="String" />
        <asp:Parameter Name="AuthLevel" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>
<br />
<asp:FormView ID="FormView1" runat="server" DataKeyNames="TellerID" 
    DataSourceID="SqlDataSource2">
    <EditItemTemplate>
        TellerID:
        <asp:Label ID="TellerIDLabel1" runat="server" Text='<%# Eval("TellerID") %>' />
        <br />
        Fee_A:
        <asp:CheckBox ID="Fee_ACheckBox" runat="server" 
            Checked='<%# Bind("Fee_A") %>' />
        <br />
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
            CommandName="Update" Text="Update" />
        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </EditItemTemplate>
    <InsertItemTemplate>
        TellerID:
        <asp:TextBox ID="TellerIDTextBox" runat="server" 
            Text='<%# Bind("TellerID") %>' />
        <br />
        Fee_A:
        <asp:CheckBox ID="Fee_ACheckBox" runat="server" 
            Checked='<%# Bind("Fee_A") %>' />
        <br />
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
            CommandName="Insert" Text="Insert" />
        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </InsertItemTemplate>
    <ItemTemplate>
        TellerID:
        <asp:Label ID="TellerIDLabel" runat="server" Text='<%# Eval("TellerID") %>' />
        <br />
        Fee_A:
        <asp:CheckBox ID="Fee_ACheckBox" runat="server" Checked='<%# Bind("Fee_A") %>' 
            Enabled="false" />
        <br />
        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
            CommandName="Edit" Text="Edit" />
        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
            CommandName="New" Text="New" />
    </ItemTemplate>
</asp:FormView>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConflictDetection="CompareAllValues" 
    ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
    DeleteCommand="DELETE FROM [Teller] WHERE [TellerID] = @original_TellerID AND (([Fee_A] = @original_Fee_A) OR ([Fee_A] IS NULL AND @original_Fee_A IS NULL))" 
    InsertCommand="INSERT INTO [Teller] ([TellerID], [Fee_A]) VALUES (@TellerID, @Fee_A)" 
    OldValuesParameterFormatString="original_{0}" 
    SelectCommand="SELECT * FROM [Teller] WHERE ([TellerID] = @TellerID)" 
    UpdateCommand="UPDATE [Teller] SET [Fee_A] = @Fee_A WHERE [TellerID] = @original_TellerID AND (([Fee_A] = @original_Fee_A) OR ([Fee_A] IS NULL AND @original_Fee_A IS NULL))">
    <SelectParameters>
        <asp:QueryStringParameter Name="TellerID" QueryStringField="TellerID" 
            Type="Int32" />
    </SelectParameters>
    <DeleteParameters>
        <asp:Parameter Name="original_TellerID" Type="Int32" />
        <asp:Parameter Name="original_Fee_A" Type="Boolean" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="Fee_A" Type="Boolean" />
        <asp:Parameter Name="original_TellerID" Type="Int32" />
        <asp:Parameter Name="original_Fee_A" Type="Boolean" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="TellerID" Type="Int32" />
        <asp:Parameter Name="Fee_A" Type="Boolean" />
    </InsertParameters>
</asp:SqlDataSource>
</asp:Content>

