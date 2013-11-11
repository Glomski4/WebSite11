<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false" CodeFile="RestoreLoanPmtAudit.aspx.vb" Inherits="AdminMenu_RestoreLoanPmtAudit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="1" cellpadding="2" cellspacing="2" class="style1">
        <tr>
            <td class="style2">
                Loan No</td>
            <td class="style2">
                Curr Balance</td>
            <td class="style2">
                Cur Pmt Due</td>
            <td class="style2">
                Last Pmt Posted</td>
            <td class="style2">
                NoPmtsLeft</td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
            <td style="text-align: center">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
            <td style="text-align: center">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
            <td style="text-align: center">
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
            <td style="text-align: center">
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="style2">
                <asp:Label ID="Alert1" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td style="text-align: center">
                <asp:Button ID="Button1" runat="server" Text="Update" />
            </td>
        </tr>
        <tr>
            <td colspan="5" class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Post Date</td>
            <td style="text-align: center">
                <asp:TextBox ID="TextBox6" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td style="text-align: center">
                <asp:Button ID="Button2" runat="server" Enabled="False" Text="Show" 
                    style="text-align: center" />
            </td>
            <td class="style2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="5">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="PmtID" DataSourceID="SqlDataSource1" CellPadding="2" 
        CellSpacing="2" style="text-align: center">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="PmtID" HeaderText="PmtID" InsertVisible="False" 
                ReadOnly="True" SortExpression="PmtID" />
            <asp:BoundField DataField="EffDate" HeaderText="EffDate" 
                SortExpression="EffDate" />
            <asp:BoundField DataField="IntDate" HeaderText="IntDate" 
                SortExpression="IntDate" />
            <asp:BoundField DataField="Type" HeaderText="Type" 
                SortExpression="Type" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
            <asp:BoundField DataField="ToPrincipal" HeaderText="ToPrincipal" 
                SortExpression="ToPrincipal" ApplyFormatInEditMode="True" />
            <asp:BoundField DataField="ToInterest" HeaderText="ToInterest" 
                SortExpression="ToInterest" />
            <asp:BoundField DataField="ToUnpl" HeaderText="ToUnpl" 
                SortExpression="ToUnpl" />
            <asp:BoundField DataField="ToFees" HeaderText="ToFees" 
                SortExpression="ToFees" />
            <asp:BoundField DataField="EnteredBy" HeaderText="EnteredBy" 
                SortExpression="EnteredBy" />
        </Columns>
    </asp:GridView>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
        DeleteCommand="DELETE FROM [Payments] WHERE [PmtID] = @original_PmtID AND [EffDate] = @original_EffDate AND [IntDate] = @original_IntDate AND [Type] = @original_Type AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([ToPrincipal] = @original_ToPrincipal) OR ([ToPrincipal] IS NULL AND @original_ToPrincipal IS NULL)) AND (([ToInterest] = @original_ToInterest) OR ([ToInterest] IS NULL AND @original_ToInterest IS NULL)) AND (([ToUnpl] = @original_ToUnpl) OR ([ToUnpl] IS NULL AND @original_ToUnpl IS NULL)) AND (([ToFees] = @original_ToFees) OR ([ToFees] IS NULL AND @original_ToFees IS NULL)) AND [EnteredBy] = @original_EnteredBy" 
        InsertCommand="INSERT INTO [Payments] ([EffDate], [IntDate], [Type], [Description], [ToPrincipal], [ToInterest], [ToUnpl], [ToFees], [EnteredBy]) VALUES (@EffDate, @IntDate, @Type, @Description, @ToPrincipal, @ToInterest, @ToUnpl, @ToFees, @EnteredBy)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT [PmtID], [EffDate], [IntDate], [Type], [Description], [ToPrincipal], [ToInterest], [ToUnpl], [ToFees], [EnteredBy] FROM [Payments] WHERE (([LoanID] = @LoanID) AND ([PostedDate] = @PostedDate))" 
        
        UpdateCommand="UPDATE [Payments] SET [EffDate] = @EffDate, [IntDate] = @IntDate, [Type] = @Type, [Description] = @Description, [ToPrincipal] = @ToPrincipal, [ToInterest] = @ToInterest, [ToUnpl] = @ToUnpl, [ToFees] = @ToFees, [EnteredBy] = @EnteredBy WHERE [PmtID] = @original_PmtID AND [EffDate] = @original_EffDate AND [IntDate] = @original_IntDate AND [Type] = @original_Type AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([ToPrincipal] = @original_ToPrincipal) OR ([ToPrincipal] IS NULL AND @original_ToPrincipal IS NULL)) AND (([ToInterest] = @original_ToInterest) OR ([ToInterest] IS NULL AND @original_ToInterest IS NULL)) AND (([ToUnpl] = @original_ToUnpl) OR ([ToUnpl] IS NULL AND @original_ToUnpl IS NULL)) AND (([ToFees] = @original_ToFees) OR ([ToFees] IS NULL AND @original_ToFees IS NULL)) AND [EnteredBy] = @original_EnteredBy">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="LoanID" PropertyName="Text" 
                Type="Int32" />
            <asp:ControlParameter ControlID="TextBox6" Name="PostedDate" 
                PropertyName="Text" Type="DateTime" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="original_PmtID" Type="Int32" />
            <asp:Parameter Name="original_EffDate" DbType="Date" />
            <asp:Parameter DbType="Date" Name="original_IntDate" />
            <asp:Parameter Name="original_Type" Type="Int32" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_ToPrincipal" Type="Decimal" />
            <asp:Parameter Name="original_ToInterest" Type="Decimal" />
            <asp:Parameter Name="original_ToUnpl" Type="Decimal" />
            <asp:Parameter Name="original_ToFees" Type="Decimal" />
            <asp:Parameter Name="original_EnteredBy" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="EffDate" DbType="Date" />
            <asp:Parameter DbType="Date" Name="IntDate" />
            <asp:Parameter Name="Type" Type="Int32" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="ToPrincipal" Type="Decimal" />
            <asp:Parameter Name="ToInterest" Type="Decimal" />
            <asp:Parameter Name="ToUnpl" Type="Decimal" />
            <asp:Parameter Name="ToFees" Type="Decimal" />
            <asp:Parameter Name="EnteredBy" Type="String" />
            <asp:Parameter Name="original_PmtID" Type="Int32" />
            <asp:Parameter Name="original_EffDate" DbType="Date" />
            <asp:Parameter Name="original_IntDate" DbType="Date" />
            <asp:Parameter Name="original_Type" Type="Int32" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_ToPrincipal" Type="Decimal" />
            <asp:Parameter Name="original_ToInterest" Type="Decimal" />
            <asp:Parameter Name="original_ToUnpl" Type="Decimal" />
            <asp:Parameter Name="original_ToFees" Type="Decimal" />
            <asp:Parameter Name="original_EnteredBy" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="EffDate" DbType="Date" />
            <asp:Parameter DbType="Date" Name="IntDate" />
            <asp:Parameter Name="Type" Type="Int32" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="ToPrincipal" Type="Decimal" />
            <asp:Parameter Name="ToInterest" Type="Decimal" />
            <asp:Parameter Name="ToUnpl" Type="Decimal" />
            <asp:Parameter Name="ToFees" Type="Decimal" />
            <asp:Parameter Name="EnteredBy" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

