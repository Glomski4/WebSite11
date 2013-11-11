<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false"
    CodeFile="CaseStatus.aspx.vb" Inherits="AdminMenu_CaseStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 25%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CaseID,DeptID"
        DataSourceID="SqlDataSource1" Style="text-align: center" Width="100%">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="CaseID" HeaderText="Case" SortExpression="CaseID" />
            <asp:BoundField DataField="CaseName" HeaderText="Name" SortExpression="CaseName" />
            <asp:BoundField DataField="DeptID" HeaderText="Dept" SortExpression="DeptID" />
            <asp:BoundField DataField="DepartmentName" HeaderText="Name" SortExpression="DepartmentName" />
            <asp:BoundField DataField="CaseTime" HeaderText="TAT" SortExpression="CaseTime" />
            <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" />
            <asp:BoundField DataField="Oldest" DataFormatString="{0:d}" HeaderText="Oldest" ReadOnly="True"
                SortExpression="Oldest" />
            <asp:BoundField DataField="Newest" DataFormatString="{0:d}" HeaderText="Newest" ReadOnly="True"
                SortExpression="Newest" />
            <asp:BoundField DataField="OOS" HeaderText="OOS" ReadOnly="True" SortExpression="OOS" />
            <asp:BoundField DataField="Unassigned" HeaderText="Unassigned" ReadOnly="True" SortExpression="Unassigned" />
            <asp:BoundField DataField="OOS_Unassigned" HeaderText="OOS_Unassigned" ReadOnly="True"
                SortExpression="OOS_Unassigned" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
        SelectCommand="SELECT B.CaseID, Case_Types.CaseName, Case_Types.DeptID, Case_Dept.DepartmentName, Case_Types.CaseTime, COUNT(B.CaseNumber) AS Total, MIN(B.OpenDate) AS Oldest, MAX(B.OpenDate) AS Newest, (SELECT COUNT(*) AS Expr1 FROM Case_Status WHERE (Status = N'O') AND (B.CaseID = CaseID) AND (PromiseDate &lt; DATEADD(day, - 1, GETDATE()))) AS OOS, (SELECT COUNT(*) AS Expr1 FROM Case_Status AS Case_Status_1 WHERE (Status = N'O') AND (B.CaseID = CaseID) AND (AssignedTeller = 0)) AS Unassigned, (SELECT COUNT(*) AS Expr1 FROM Case_Status AS Case_Status_1 WHERE (Status = N'O') AND (B.CaseID = CaseID) AND (AssignedTeller = 0) AND (PromiseDate &lt; DATEADD(day, - 1, GETDATE()))) AS OOS_Unassigned FROM Case_Status AS B LEFT OUTER JOIN Case_Types ON B.CaseID = Case_Types.CaseID LEFT OUTER JOIN Case_Dept ON Case_Types.DeptID = Case_Dept.DeptID GROUP BY B.Status, B.CaseID, Case_Types.CaseName, Case_Types.CaseTime, Case_Types.DeptID, Case_Dept.DepartmentName HAVING (B.Status = N'O') ORDER BY B.Status DESC">
    </asp:SqlDataSource>
    <br />
    <table class="style1">
        <tr>
            <td class="style2">
                Unassigned Cases
            </td>
            <td class="style2">
                Assigned Opened
            </td>
            <td class="style2">
                Current Tellers (No Active Cases)<br />
                <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" CausesValidation="True"
                    Text="Limit To Case Dept" Checked="True" />
            </td>
            <td class="style2">
                OOS
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:ListBox ID="ListBox2" runat="server" DataSourceID="SqlDataSource3" DataTextField="Loan"
                    DataValueField="CaseNumber" Rows="10" SelectionMode="Multiple"></asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
                    SelectCommand="SELECT CaseNumber, CaseID, CONVERT (char, LoanNo) + N'(' + CONVERT (VARCHAR, PromiseDate, 101) + N')' AS Loan, AssignedTeller, Status FROM Case_Status WHERE (Status = N'O') AND (CaseID = @SelectedCase) AND (AssignedTeller = 0) ORDER BY PromiseDate">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="SelectedCase" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td class="style2">
                <asp:ListBox ID="ListBox3" runat="server" DataSourceID="SqlDataSource4" DataTextField="Loan"
                    DataValueField="CaseNumber" Rows="10" SelectionMode="Multiple"></asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
                    SelectCommand="SELECT CaseNumber, CaseID, CONVERT (char, LoanNo) + N'(' + CONVERT (VARCHAR, PromiseDate, 101) + N')' AS Loan, AssignedTeller, Status FROM Case_Status WHERE (Status = N'O') AND (CaseID = @SelectedCase) AND (AssignedTeller &lt;&gt; 0) ORDER BY PromiseDate">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="SelectedCase" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td class="style2">
                <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource2" DataTextField="OutStanding"
                    DataValueField="TellerID" Rows="10" AutoPostBack="True"></asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
                    SelectCommand="SELECT DISTINCT TellerID, Name + N'(' + CONVERT (Varchar, (SELECT COUNT(*) AS Expr1 FROM Case_Status WHERE (AssignedTeller = Users.TellerID) AND (Status &lt;&gt; N'C'))) + N')' AS OutStanding FROM Users WHERE (TellerID IS NOT NULL)">
                </asp:SqlDataSource>
            </td>
            <td class="style2">
                <asp:ListBox ID="ListBox4" runat="server" DataSourceID="SqlDataSource5" DataTextField="Loan"
                    DataValueField="CaseNumber" Rows="10" SelectionMode="Multiple" AutoPostBack="True">
                </asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
                    SelectCommand="SELECT CaseNumber, CaseID, CONVERT (char, LoanNo) + N'(' + CONVERT (VARCHAR, PromiseDate, 101) + N')' AS Loan, AssignedTeller, Status FROM Case_Status WHERE (Status = N'O') AND (CaseID = @SelectedCase) AND (PromiseDate &lt; DATEADD(day, - 1, GETDATE())) ORDER BY PromiseDate">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="SelectedCase" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td valign="top" class="style2">
                <asp:Button ID="Button1" runat="server" Text="Process" />
            </td>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style2" valign="top">
                <asp:Label ID="Label2" runat="server"></asp:Label>
            </td>
            <td class="style2">
                <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource6">
                    <EditItemTemplate>
                        LoanNo:
                        <asp:TextBox ID="LoanNoTextBox" runat="server" Text='<%# Bind("LoanNo") %>' />
                        <br />
                        OpenTeller:
                        <asp:TextBox ID="OpenTellerTextBox" runat="server" Text='<%# Bind("OpenTeller") %>' />
                        <br />
                        OpenDate:
                        <asp:TextBox ID="OpenDateTextBox" runat="server" Text='<%# Bind("OpenDate") %>' />
                        <br />
                        PromiseDate:
                        <asp:TextBox ID="PromiseDateTextBox" runat="server" Text='<%# Bind("PromiseDate") %>' />
                        <br />
                        FollowUpDate:
                        <asp:TextBox ID="FollowUpDateTextBox" runat="server" Text='<%# Bind("FollowUpDate") %>' />
                        <br />
                        AssignedTo:
                        <asp:TextBox ID="AssignedToTextBox" runat="server" Text='<%# Bind("AssignedTo") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        LoanNo:
                        <asp:TextBox ID="LoanNoTextBox" runat="server" Text='<%# Bind("LoanNo") %>' />
                        <br />
                        OpenTeller:
                        <asp:TextBox ID="OpenTellerTextBox" runat="server" Text='<%# Bind("OpenTeller") %>' />
                        <br />
                        OpenDate:
                        <asp:TextBox ID="OpenDateTextBox" runat="server" Text='<%# Bind("OpenDate") %>' />
                        <br />
                        PromiseDate:
                        <asp:TextBox ID="PromiseDateTextBox" runat="server" Text='<%# Bind("PromiseDate") %>' />
                        <br />
                        FollowUpDate:
                        <asp:TextBox ID="FollowUpDateTextBox" runat="server" Text='<%# Bind("FollowUpDate") %>' />
                        <br />
                        AssignedTo:
                        <asp:TextBox ID="AssignedToTextBox" runat="server" Text='<%# Bind("AssignedTo") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        LoanNo:
                        <asp:Label ID="LoanNoLabel" runat="server" Text='<%# Bind("LoanNo") %>' />
                        <br />
                        OpenTeller:
                        <asp:Label ID="OpenTellerLabel" runat="server" Text='<%# Bind("OpenTeller") %>' />
                        <br />
                        OpenDate:
                        <asp:Label ID="OpenDateLabel" runat="server" Text='<%# Bind("OpenDate", "{0:d}") %>' />
                        <br />
                        PromiseDate:
                        <asp:Label ID="PromiseDateLabel" runat="server" Text='<%# Bind("PromiseDate", "{0:d}") %>' />
                        <br />
                        FollowUpDate:
                        <asp:Label ID="FollowUpDateLabel" runat="server" Text='<%# Bind("FollowUpDate", "{0:d}") %>' />
                        <br />
                        AssignedTo:
                        <asp:Label ID="AssignedToLabel" runat="server" Text='<%# Bind("AssignedTo") %>' />
                        <br />
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
                    SelectCommand="SELECT LoanNo, OpenTeller, OpenDate, PromiseDate, FollowUpDate, CONVERT (Varchar, AssignedTeller) + N' ' + (SELECT TOP (1) Name FROM Users WHERE (TellerID = B.AssignedTeller)) + N'(' + CONVERT (Varchar, (SELECT COUNT(*) AS Expr1 FROM Case_Status WHERE (AssignedTeller = B.AssignedTeller) AND (Status &lt;&gt; N'C'))) + N')' AS AssignedTo FROM Case_Status AS B WHERE (CaseNumber = @CaseID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBox4" Name="CaseID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="4">
                Selected Agents Queue</td>
        </tr>
        <tr>
            <td valign="top" colspan="4">
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="CaseNumber" DataSourceID="SqlDataSource7" AllowPaging="True" 
        AllowSorting="True" HorizontalAlign="Center" style="text-align: center" 
        Width="100%">
        <Columns>
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
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
        
                    SelectCommand="SELECT CaseNumber, CaseID, LoanNo, OpenDate, PromiseDate, FollowUpDate, CAST(CASE WHEN PromiseDate &lt; DATEADD(day , - 1 , GETDATE()) THEN 1 ELSE 0 END AS bit) AS OutOfStandard FROM Case_Status WHERE (AssignedTeller = @Teller) AND (Status = N'O') ORDER BY OutOfStandard DESC, PromiseDate, FollowUpDate">
        <SelectParameters>
            <asp:ControlParameter ControlID="ListBox1" Name="Teller" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
