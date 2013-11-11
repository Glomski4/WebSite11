<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false" CodeFile="MyCaseWork.aspx.vb" Inherits="AdminMenu_MyCaseWork" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    Teller : 
    <asp:Label ID="Label1" runat="server"></asp:Label><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="CaseNumber" DataSourceID="SqlDataSource1" AllowPaging="True" 
        AllowSorting="True" HorizontalAlign="Center" style="text-align: center" 
        Width="100%">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="CaseNumber" HeaderText="CaseNumber" 
                InsertVisible="False" ReadOnly="True" SortExpression="CaseNumber" />
            <asp:BoundField DataField="CaseID" HeaderText="CaseID" 
                SortExpression="CaseID" />
            <asp:HyperLinkField DataNavigateUrlFields="LoanNo" 
                DataNavigateUrlFormatString="http://theglom.selfip.com:90/WebSite/Loan/ALS/Default.aspx?FORWARD=VALID&amp;LoanNo={0}" 
                DataTextField="LoanNo" DataTextFormatString="{0}" HeaderText="LoanNo" />
            <asp:BoundField DataField="OpenDate" HeaderText="OpenDate" 
                SortExpression="OpenDate" DataFormatString="{0:d}" />
                
            
            <asp:BoundField DataField="PromiseDate" HeaderText="PromiseDate" 
                SortExpression="PromiseDate" DataFormatString="{0:d}" />
            <asp:BoundField DataField="FollowUpDate" HeaderText="FollowUpDate" 
                SortExpression="FollowUpDate" DataFormatString="{0:d}" />
            <asp:CheckBoxField DataField="OutOfStandard" HeaderText="OutOfStandard" 
                ReadOnly="True" SortExpression="OutOfStandard" />
        </Columns>
        <EmptyDataTemplate>
            You have no cases in your queue.
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
        SelectCommand="SELECT CaseNumber, CaseID, LoanNo, OpenDate, PromiseDate, FollowUpDate, CAST(CASE WHEN PromiseDate &lt; DATEADD(day , - 1 , GETDATE()) THEN 1 ELSE 0 END AS bit) AS OutOfStandard FROM Case_Status WHERE (AssignedTeller = @Teller) AND (Status = N'O') ORDER BY OutOfStandard DESC, PromiseDate, FollowUpDate">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" Name="Teller" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" 
        Enabled="True" TargetControlID="TextBox1">
    </asp:CalendarExtender>
    <asp:Button ID="Button1" runat="server" Text="Change FollowUp Date" />
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource2" Width="100%">
        <Columns>
            <asp:BoundField DataField="Added" HeaderText="Added" ReadOnly="True" 
                SortExpression="Added">
            <ItemStyle Width="150px" Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="NoteDesc" HeaderText="NoteDesc" ReadOnly="True" 
                SortExpression="NoteDesc">
            <ItemStyle Width="450px" Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note">
            <ItemStyle Width="450px" Wrap="False" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
        SelectCommand="SELECT CASE WHEN Case_Notes_1.NoteID = (SELECT TOP (1) Case_Notes.NoteID FROM Case_Notes WHERE (Case_Notes.LineID &lt; Case_Notes_1.LineID) ORDER BY Case_Notes.LineID DESC) THEN N' ' ELSE Case_Notes_Entrys_1.NoteAdded END AS Added, CASE WHEN Case_Notes_1.NoteID = (SELECT TOP (1) Case_Notes.NoteID FROM Case_Notes WHERE (Case_Notes.LineID &lt; Case_Notes_1.LineID) ORDER BY Case_Notes.LineID DESC) THEN N' ' ELSE Case_Notes_Entrys_1.Description END AS NoteDesc, Case_Notes_1.Note FROM Case_Notes AS Case_Notes_1 RIGHT OUTER JOIN Case_Notes_Entrys AS Case_Notes_Entrys_1 ON Case_Notes_1.NoteID = Case_Notes_Entrys_1.NoteID WHERE (Case_Notes_Entrys_1.CaseID = @CaseID) ORDER BY Case_Notes_Entrys_1.NoteAdded">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="CaseID" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

