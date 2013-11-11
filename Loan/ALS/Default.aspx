<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="Loan_ALS_Default" Theme="Main" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style6
        {
            width: 100%;
        }
        .style15
        {
            width: 850px;
        }
        .style16
        {
            width: 100%;
        }
    </style>

    <script language="javascript" type="text/javascript">
// <!CDATA[

// ]]>
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
        <ContentTemplate>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
                SelectCommand="SELECT PmtMain.PostedDate, PmtMain.IntDate, PaymentTypes.Type, PmtMain.ToPrincipal + PmtMain.ToInterest + PmtMain.ToFees + PmtMain.ToUnpl AS PmtTotal, PmtMain.ToPrincipal, PmtMain.ToInterest, PmtMain.ToFees, (SELECT LoanAmount FROM Loans WHERE (LoanID = @LoanID)) - (SELECT SUM(ToPrincipal) AS Expr1 FROM Payments WHERE (LoanID = @LoanID) AND (PmtID &lt;= PmtMain.PmtID)) AS Balance, PmtMain.PmtID, PmtMain.LoanID FROM Payments AS PmtMain LEFT OUTER JOIN PaymentTypes ON PmtMain.Type = PaymentTypes.TypeID WHERE (PmtMain.LoanID = @LoanID) ORDER BY PmtMain.PmtID DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="LoanID" SessionField="LoanNo" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
                SelectCommand="SELECT OpenDate, FirstPmtDate, NoPmts, CurrPmtDue, NoPmtsLeft, LCDate, LCAmount, LoanAmount, CurrBalance, MonthlyPmt, IntRate, DownPmt, Type, DATEADD(month, CAST(NoPmtsLeft AS int), FirstPmtDate) AS SchMatDate FROM Loans WHERE (LoanID = @LoanID)">
                <SelectParameters>
                    <asp:SessionParameter Name="LoanID" SessionField="LoanNo" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" DeleteCommand="DELETE FROM [Loans] WHERE [LoanID] = @original_LoanID AND [B1_First] = @original_B1_First AND (([B1_Middle] = @original_B1_Middle) OR ([B1_Middle] IS NULL AND @original_B1_Middle IS NULL)) AND [B1_Last] = @original_B1_Last AND (([B1_Suf] = @original_B1_Suf) OR ([B1_Suf] IS NULL AND @original_B1_Suf IS NULL)) AND [B1_SSN] = @original_B1_SSN AND (([B2_First] = @original_B2_First) OR ([B2_First] IS NULL AND @original_B2_First IS NULL)) AND (([B2_Middle] = @original_B2_Middle) OR ([B2_Middle] IS NULL AND @original_B2_Middle IS NULL)) AND (([B2_Last] = @original_B2_Last) OR ([B2_Last] IS NULL AND @original_B2_Last IS NULL)) AND (([B2_Suf] = @original_B2_Suf) OR ([B2_Suf] IS NULL AND @original_B2_Suf IS NULL)) AND (([B2_SSN] = @original_B2_SSN) OR ([B2_SSN] IS NULL AND @original_B2_SSN IS NULL)) AND [Address1] = @original_Address1 AND (([Address2] = @original_Address2) OR ([Address2] IS NULL AND @original_Address2 IS NULL)) AND [City] = @original_City AND [State] = @original_State AND [Zip] = @original_Zip AND (([HomePhone] = @original_HomePhone) OR ([HomePhone] IS NULL AND @original_HomePhone IS NULL)) AND (([WorkPhone] = @original_WorkPhone) OR ([WorkPhone] IS NULL AND @original_WorkPhone IS NULL))"
                InsertCommand="INSERT INTO [Loans] ([B1_First], [B1_Middle], [B1_Last], [B1_Suf], [B1_SSN], [B2_First], [B2_Middle], [B2_Last], [B2_Suf], [B2_SSN], [Address1], [Address2], [City], [State], [Zip], [HomePhone], [WorkPhone]) VALUES (@B1_First, @B1_Middle, @B1_Last, @B1_Suf, @B1_SSN, @B2_First, @B2_Middle, @B2_Last, @B2_Suf, @B2_SSN, @Address1, @Address2, @City, @State, @Zip, @HomePhone, @WorkPhone)"
                OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [LoanID], [B1_First], [B1_Middle], [B1_Last], [B1_Suf], [B1_SSN], [B2_First], [B2_Middle], [B2_Last], [B2_Suf], [B2_SSN], [Address1], [Address2], [City], [State], [Zip], [HomePhone], [WorkPhone] FROM [Loans] WHERE ([LoanID] = @LoanID)"
                UpdateCommand="UPDATE [Loans] SET [B1_First] = @B1_First, [B1_Middle] = @B1_Middle, [B1_Last] = @B1_Last, [B1_Suf] = @B1_Suf, [B1_SSN] = @B1_SSN, [B2_First] = @B2_First, [B2_Middle] = @B2_Middle, [B2_Last] = @B2_Last, [B2_Suf] = @B2_Suf, [B2_SSN] = @B2_SSN, [Address1] = @Address1, [Address2] = @Address2, [City] = @City, [State] = @State, [Zip] = @Zip, [HomePhone] = @HomePhone, [WorkPhone] = @WorkPhone WHERE [LoanID] = @original_LoanID AND [B1_First] = @original_B1_First AND (([B1_Middle] = @original_B1_Middle) OR ([B1_Middle] IS NULL AND @original_B1_Middle IS NULL)) AND [B1_Last] = @original_B1_Last AND (([B1_Suf] = @original_B1_Suf) OR ([B1_Suf] IS NULL AND @original_B1_Suf IS NULL)) AND [B1_SSN] = @original_B1_SSN AND (([B2_First] = @original_B2_First) OR ([B2_First] IS NULL AND @original_B2_First IS NULL)) AND (([B2_Middle] = @original_B2_Middle) OR ([B2_Middle] IS NULL AND @original_B2_Middle IS NULL)) AND (([B2_Last] = @original_B2_Last) OR ([B2_Last] IS NULL AND @original_B2_Last IS NULL)) AND (([B2_Suf] = @original_B2_Suf) OR ([B2_Suf] IS NULL AND @original_B2_Suf IS NULL)) AND (([B2_SSN] = @original_B2_SSN) OR ([B2_SSN] IS NULL AND @original_B2_SSN IS NULL)) AND [Address1] = @original_Address1 AND (([Address2] = @original_Address2) OR ([Address2] IS NULL AND @original_Address2 IS NULL)) AND [City] = @original_City AND [State] = @original_State AND [Zip] = @original_Zip AND (([HomePhone] = @original_HomePhone) OR ([HomePhone] IS NULL AND @original_HomePhone IS NULL)) AND (([WorkPhone] = @original_WorkPhone) OR ([WorkPhone] IS NULL AND @original_WorkPhone IS NULL))">
                <SelectParameters>
                    <asp:SessionParameter Name="LoanID" SessionField="LoanNo" Type="Int32" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="original_LoanID" Type="Int32" />
                    <asp:Parameter Name="original_B1_First" Type="String" />
                    <asp:Parameter Name="original_B1_Middle" Type="String" />
                    <asp:Parameter Name="original_B1_Last" Type="String" />
                    <asp:Parameter Name="original_B1_Suf" Type="String" />
                    <asp:Parameter Name="original_B1_SSN" Type="String" />
                    <asp:Parameter Name="original_B2_First" Type="String" />
                    <asp:Parameter Name="original_B2_Middle" Type="String" />
                    <asp:Parameter Name="original_B2_Last" Type="String" />
                    <asp:Parameter Name="original_B2_Suf" Type="String" />
                    <asp:Parameter Name="original_B2_SSN" Type="String" />
                    <asp:Parameter Name="original_Address1" Type="String" />
                    <asp:Parameter Name="original_Address2" Type="String" />
                    <asp:Parameter Name="original_City" Type="String" />
                    <asp:Parameter Name="original_State" Type="String" />
                    <asp:Parameter Name="original_Zip" Type="String" />
                    <asp:Parameter Name="original_HomePhone" Type="String" />
                    <asp:Parameter Name="original_WorkPhone" Type="String" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="B1_First" Type="String" />
                    <asp:Parameter Name="B1_Middle" Type="String" />
                    <asp:Parameter Name="B1_Last" Type="String" />
                    <asp:Parameter Name="B1_Suf" Type="String" />
                    <asp:Parameter Name="B1_SSN" Type="String" />
                    <asp:Parameter Name="B2_First" Type="String" />
                    <asp:Parameter Name="B2_Middle" Type="String" />
                    <asp:Parameter Name="B2_Last" Type="String" />
                    <asp:Parameter Name="B2_Suf" Type="String" />
                    <asp:Parameter Name="B2_SSN" Type="String" />
                    <asp:Parameter Name="Address1" Type="String" />
                    <asp:Parameter Name="Address2" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Zip" Type="String" />
                    <asp:Parameter Name="HomePhone" Type="String" />
                    <asp:Parameter Name="WorkPhone" Type="String" />
                    <asp:Parameter Name="original_LoanID" Type="Int32" />
                    <asp:Parameter Name="original_B1_First" Type="String" />
                    <asp:Parameter Name="original_B1_Middle" Type="String" />
                    <asp:Parameter Name="original_B1_Last" Type="String" />
                    <asp:Parameter Name="original_B1_Suf" Type="String" />
                    <asp:Parameter Name="original_B1_SSN" Type="String" />
                    <asp:Parameter Name="original_B2_First" Type="String" />
                    <asp:Parameter Name="original_B2_Middle" Type="String" />
                    <asp:Parameter Name="original_B2_Last" Type="String" />
                    <asp:Parameter Name="original_B2_Suf" Type="String" />
                    <asp:Parameter Name="original_B2_SSN" Type="String" />
                    <asp:Parameter Name="original_Address1" Type="String" />
                    <asp:Parameter Name="original_Address2" Type="String" />
                    <asp:Parameter Name="original_City" Type="String" />
                    <asp:Parameter Name="original_State" Type="String" />
                    <asp:Parameter Name="original_Zip" Type="String" />
                    <asp:Parameter Name="original_HomePhone" Type="String" />
                    <asp:Parameter Name="original_WorkPhone" Type="String" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="B1_First" Type="String" />
                    <asp:Parameter Name="B1_Middle" Type="String" />
                    <asp:Parameter Name="B1_Last" Type="String" />
                    <asp:Parameter Name="B1_Suf" Type="String" />
                    <asp:Parameter Name="B1_SSN" Type="String" />
                    <asp:Parameter Name="B2_First" Type="String" />
                    <asp:Parameter Name="B2_Middle" Type="String" />
                    <asp:Parameter Name="B2_Last" Type="String" />
                    <asp:Parameter Name="B2_Suf" Type="String" />
                    <asp:Parameter Name="B2_SSN" Type="String" />
                    <asp:Parameter Name="Address1" Type="String" />
                    <asp:Parameter Name="Address2" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Zip" Type="String" />
                    <asp:Parameter Name="HomePhone" Type="String" />
                    <asp:Parameter Name="WorkPhone" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
                SelectCommand="SELECT Dept, DeptName, System FROM Dept WHERE (System = 0) ORDER BY DeptName"
                ID="SqlDataSource4"></asp:SqlDataSource>
            <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
                SelectCommand="SELECT CASE WHEN Notes.Priority = N'Y' THEN N'** ' + Dept.DeptName + N'**' ELSE Dept.DeptName END AS Expr1, Notes.NoteDateTime, Users.Name, Notes.Note FROM Notes LEFT OUTER JOIN Users ON Notes.EnteredBy = Users.Username LEFT OUTER JOIN Dept ON Notes.Dept = Dept.Dept WHERE (Notes.LoanID = @LoanID) ORDER BY Notes.Priority DESC, CAST(Notes.NoteDateTime AS date) DESC, CAST(Notes.NoteDateTime AS time), Notes.NoteID"
                ID="SqlDataSource5">
                <SelectParameters>
                    <asp:SessionParameter SessionField="LoanNo" DefaultValue="" Name="LoanID" Type="Int32">
                    </asp:SessionParameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
                SelectCommand="SELECT DocsOrdered.PrintedOn, Docs.DocName, DocsOrdered.DocLink FROM DocsOrdered INNER JOIN Docs ON DocsOrdered.DocID = Docs.DocID WHERE (DocsOrdered.LoanNo = @LoanNo) GROUP BY DocsOrdered.PrintedOn, Docs.DocName, DocsOrdered.DocLink HAVING (DocsOrdered.PrintedOn IS NOT NULL) AND (DocsOrdered.DocLink IS NOT NULL) ORDER BY DocsOrdered.PrintedOn DESC">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="LoanNo" SessionField="LoanNo" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </asp:ToolkitScriptManager>
            <br />
            <table id="table2">
                <tr>
                    <td rowspan="2" valign="top" width="250px">
                        Loan Number<br />
                        <asp:TextBox ID="T_LoanNumber" runat="server" AccessKey="L" CssClass="Txt" MaxLength="10"
                            ToolTip="Alt+L" Wrap="False"></asp:TextBox>
                        <asp:Button ID="Search" runat="server" AccessKey="S" CssClass="But" Height="22px"
                            Text="Search" ToolTip="Alt+S" />
                        <br />
                        <asp:MultiView ID="View_LSearchAlert" runat="server">
                            <asp:View ID="Alert_NumberNotVaild" runat="server">
                                <img alt="" src="../../Images/Alert_NumbersInvaild.bmp" />
                            </asp:View>
                            <asp:View ID="Alert_NumberOnly" runat="server">
                                <img alt="" src="../../Images/Alert_NumbersOnly.bmp" />
                            </asp:View>
                        </asp:MultiView>
                        &nbsp;<asp:MultiView ID="View_LeftTab" runat="server">
                            <asp:View ID="LeftTab_Verify" runat="server">
                                <asp:TabContainer ID="TabContainer4" runat="server" ActiveTabIndex="0" Height="300px"
                                    Width="250px">
                                    <asp:TabPanel ID="TabPanel41" runat="server" HeaderText="Account Verification">
                                        <HeaderTemplate>
                                            Account Verification
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <asp:Panel ID="Panel41" runat="server">
                                                <table class="style6">
                                                    <tr>
                                                        <td style="text-align: left">
                                                            Type:
                                                            <asp:Label ID="Ver_A_Type" runat="server" Style="color: #FF0000" Text="*" Visible="False"></asp:Label>
                                                            <asp:RadioButtonList ID="Ver_Type" runat="server" AutoPostBack="True" CellPadding="1"
                                                                CellSpacing="1" RepeatColumns="2">
                                                                <asp:ListItem Value="0">Mail</asp:ListItem>
                                                                <asp:ListItem Value="1">Phone</asp:ListItem>
                                                                <asp:ListItem Value="2">In-Person</asp:ListItem>
                                                                <asp:ListItem Value="3">Research</asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" style="text-align: left">
                                                            <hr />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" style="text-align: left">
                                                            Person:
                                                            <asp:Label ID="Ver_A_Person" runat="server" Style="color: #FF0000" Text="*" Visible="False"></asp:Label>
                                                            <asp:RadioButtonList ID="Ver_Person" runat="server" Style="text-align: left" Visible="False">
                                                            </asp:RadioButtonList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" style="text-align: left">
                                                            <hr />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            <asp:ImageButton ID="B_V_Continue" runat="server" ImageUrl="~/Images/B_Continue.bmp" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </ContentTemplate>
                                    </asp:TabPanel>
                                </asp:TabContainer>
                            </asp:View>
                            <asp:View ID="LeftTab_Sales_A" runat="server">
                                <asp:TabContainer ID="TabContainer5" runat="server" ActiveTabIndex="0" Height="300px"
                                    Width="250px">
                                    <asp:TabPanel ID="TabPanel51" runat="server" HeaderText="Sales">
                                        <HeaderTemplate>
                                            Sales
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <asp:Panel ID="Panel51" runat="server">
                                                Sales Systems Coming Soon.</asp:Panel>
                                        </ContentTemplate>
                                    </asp:TabPanel>
                                    <asp:TabPanel ID="TabPanel52" runat="server" HeaderText="CBR Tool">
                                        <ContentTemplate>
                                            <asp:Panel ID="Panel52" runat="server">
                                                CBR Not Used on Loan at this time.</asp:Panel>
                                        </ContentTemplate>
                                    </asp:TabPanel>
                                </asp:TabContainer>
                            </asp:View>
                        </asp:MultiView>
                    </td>
                    <td valign="top" width="850px">
                        <table id="table3" class="style16" style="border: thin solid #000000; background-color: #00FFFF;">
                            <tr>
                                <td>
                                    Borrower
                                </td>
                                <td style="border-right-style: solid; border-right-width: thin; border-right-color: #000000">
                                    SSN
                                </td>
                                <td>
                                    Loan Number
                                </td>
                                <td>
                                    Program
                                </td>
                                <td>
                                    Status
                                </td>
                            </tr>
                            <tr style="border-bottom-style: solid; border-bottom-width: thin; border-color: #000000">
                                <td style="border-bottom-style: solid; border-bottom-width: thin; border-color: #000000">
                                    <asp:Label ID="BorrName" runat="server"></asp:Label>
                                </td>
                                <td style="border-color: #000000; border-right-style: solid; border-right-width: thin;
                                    border-bottom-style: solid; border-bottom-width: thin;">
                                    <asp:Label ID="BorrSSN" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="LoanNumber" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Program" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Status" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Co-Borrower
                                </td>
                                <td style="border-right-style: solid; border-right-width: thin; border-right-color: #000000">
                                    SSN
                                </td>
                                <td colspan="3" style="border-color: #000000; border-top-style: solid; border-top-width: thin;">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="border-color: #000000; border-bottom-width: thin; border-bottom-style: solid">
                                    <asp:Label ID="CoBorrName" runat="server"></asp:Label>
                                </td>
                                <td style="border-right-style: solid; border-right-width: thin; border-right-color: #000000;
                                    border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #000000;">
                                    <asp:Label ID="CoBorrSSN" runat="server"></asp:Label>
                                </td>
                                <td>
                                    Type
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    Days Past Due
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Home Phone
                                </td>
                                <td style="border-right-style: solid; border-right-width: thin; border-right-color: #000000">
                                    Work Phone
                                </td>
                                <td colspan="2">
                                    <asp:Label ID="LoanType" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="DPD" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="HomePhone" runat="server"></asp:Label>
                                </td>
                                <td style="border-right-style: solid; border-right-width: thin; border-right-color: #000000">
                                    <asp:Label ID="WorkPhone" runat="server"></asp:Label>
                                </td>
                                <td colspan="3" style="border-color: #000000; border-top-style: solid; border-top-width: thin;">
                                    <asp:Label ID="CC" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td style="border-right-style: solid; border-right-width: thin; border-right-color: #000000">
                                    &nbsp;
                                </td>
                                <td colspan="3">
                                    <asp:Image ID="Active_Loan_Mod" runat="server" ImageUrl="~/Loan/ALS/Images/Active_Loan_Mod.bmp"
                                        Visible="False" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="4" AutoPostBack="True"
                            Height="850px" ScrollBars="Auto" Visible="False" Width="850px">
                            <asp:TabPanel ID="TabPanel11" runat="server" HeaderText="Recent Activity">
                                <ContentTemplate>
                                    <asp:Panel ID="Panel11" runat="server">
                                        <table class="style6">
                                            <tr>
                                                <td>
                                                    Recent Notes
                                                </td>
                                                <td style="text-align: right">
                                                    <asp:LinkButton ID="LinkButton4" runat="server">Go To Notes</asp:LinkButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:GridView ID="Notes_Grid0" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                        DataSourceID="SqlDataSource5" PageSize="8" Style="font-size: 9pt" Width="100%">
                                                        <PagerSettings FirstPageText="" LastPageText="" Mode="NextPreviousFirstLast" NextPageText=""
                                                            Position="Top" PreviousPageText="" />
                                                        <Columns>
                                                            <asp:BoundField DataField="Expr1" HeaderText="Dept" ReadOnly="True" SortExpression="Expr1">
                                                                <HeaderStyle HorizontalAlign="Left" />
                                                                <ItemStyle Wrap="False" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="NoteDateTime" DataFormatString="{0:MM/dd/yyyy HH:mm}"
                                                                HeaderText="Date" SortExpression="NoteDateTime">
                                                                <HeaderStyle HorizontalAlign="Left" />
                                                                <ItemStyle Wrap="False" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                                                                <HeaderStyle HorizontalAlign="Left" />
                                                                <ItemStyle Wrap="False" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note">
                                                                <HeaderStyle HorizontalAlign="Left" />
                                                                <ItemStyle Wrap="False" />
                                                            </asp:BoundField>
                                                        </Columns>
                                                        <RowStyle Font-Size="9pt" Wrap="False" />
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <hr />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Recent Payments
                                                </td>
                                                <td style="text-align: right">
                                                    <asp:LinkButton ID="LinkButton5" runat="server">Go To Payments</asp:LinkButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:GridView ID="PaymentHistory_Grid0" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                        DataSourceID="SqlDataSource1" PageSize="8" Style="text-align: center" Width="100%">
                                                        <PagerSettings FirstPageText="" LastPageText="" Mode="NextPreviousFirstLast" NextPageText=""
                                                            Position="TopAndBottom" PreviousPageText="" />
                                                        <Columns>
                                                            <asp:BoundField DataField="PostedDate" DataFormatString="{0:d}" HeaderText="PostedDate"
                                                                SortExpression="PostedDate" />
                                                            <asp:BoundField DataField="IntDate" DataFormatString="{0:d}" HeaderText="IntDate"
                                                                SortExpression="IntDate" />
                                                            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                                                            <asp:BoundField DataField="PmtTotal" DataFormatString="{0:&lt;FONT color=green&gt;$#,##0.00&lt;/FONT&gt;;&lt;FONT color=red&gt;(-$#,##0.00)&lt;/FONT&gt;}"
                                                                HeaderText="PmtTotal" HtmlEncode="False" ReadOnly="True" SortExpression="PmtTotal" />
                                                            <asp:BoundField DataField="ToPrincipal" DataFormatString="{0:&lt;FONT color=green&gt;$#,##0.00&lt;/FONT&gt;;&lt;FONT color=red&gt;(-$#,##0.00)&lt;/FONT&gt;}"
                                                                HeaderText="ToPrincipal" HtmlEncode="False" SortExpression="ToPrincipal" />
                                                            <asp:BoundField DataField="ToInterest" DataFormatString="{0:&lt;FONT color=green&gt;$#,##0.00&lt;/FONT&gt;;&lt;FONT color=red&gt;(-$#,##0.00)&lt;/FONT&gt;}"
                                                                HeaderText="ToInterest" HtmlEncode="False" SortExpression="ToInterest" />
                                                            <asp:BoundField DataField="ToFees" DataFormatString="{0:&lt;FONT color=green&gt;$#,##0.00&lt;/FONT&gt;;&lt;FONT color=red&gt;(-$#,##0.00)&lt;/FONT&gt;}"
                                                                HeaderText="ToFees" HtmlEncode="False" SortExpression="ToFees" />
                                                            <asp:BoundField DataField="Balance" DataFormatString="{0:&lt;FONT color=green&gt;$#,##0.00&lt;/FONT&gt;;&lt;FONT color=red&gt;(-$#,##0.00)&lt;/FONT&gt;}"
                                                                HeaderText="Balance" HtmlEncode="False" ReadOnly="True" SortExpression="Balance" />
                                                            <asp:HyperLinkField DataNavigateUrlFields="PmtID" DataNavigateUrlFormatString="~\Loan\ALS\PmtInfo.aspx?PmtID={0}"
                                                                Target="_blank" Text="View" />
                                                        </Columns>
                                                        <EmptyDataTemplate>
                                                            No Payments To Show.
                                                        </EmptyDataTemplate>
                                                        <PagerStyle Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False"
                                                            HorizontalAlign="Right" />
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:TabPanel>
                            <asp:TabPanel ID="TabPanel12" runat="server" HeaderText="Payment Details">
                                <HeaderTemplate>
                                    Payment Details
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:Panel ID="Panel2" runat="server">
                                        <asp:TabContainer ID="TabContainer2" runat="server" ActiveTabIndex="2" AutoPostBack="True"
                                            ScrollBars="Auto" Width="830px">
                                            <asp:TabPanel ID="TabPanel21" runat="server" HeaderText="Payment History">
                                                <ContentTemplate>
                                                    <asp:Panel ID="Panel21" runat="server">
                                                        <asp:GridView ID="PaymentHistory_Grid" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                            DataSourceID="SqlDataSource1" PageSize="20" Style="text-align: center" Width="100%">
                                                            <PagerSettings FirstPageText="&amp;lt;&amp;lt;First&amp;emsp;&amp;emsp;" LastPageText="&amp;gt;&amp;gt;Last&amp;emsp;&amp;emsp;"
                                                                Mode="NextPreviousFirstLast" NextPageText="&amp;gt;Next&amp;emsp;&amp;emsp;"
                                                                Position="TopAndBottom" PreviousPageText="&amp;lt;Previous&amp;ensp;&amp;ensp;" />
                                                            <Columns>
                                                                <asp:BoundField DataField="PostedDate" DataFormatString="{0:d}" HeaderText="PostedDate"
                                                                    SortExpression="PostedDate" />
                                                                <asp:BoundField DataField="IntDate" DataFormatString="{0:d}" HeaderText="IntDate"
                                                                    SortExpression="IntDate" />
                                                                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                                                                <asp:BoundField DataField="PmtTotal" DataFormatString="{0:&lt;FONT color=green&gt;$#,##0.00&lt;/FONT&gt;;&lt;FONT color=red&gt;(-$#,##0.00)&lt;/FONT&gt;}"
                                                                    HeaderText="PmtTotal" HtmlEncode="False" ReadOnly="True" SortExpression="PmtTotal" />
                                                                <asp:BoundField DataField="ToPrincipal" DataFormatString="{0:&lt;FONT color=green&gt;$#,##0.00&lt;/FONT&gt;;&lt;FONT color=red&gt;(-$#,##0.00)&lt;/FONT&gt;}"
                                                                    HeaderText="ToPrincipal" HtmlEncode="False" SortExpression="ToPrincipal" />
                                                                <asp:BoundField DataField="ToInterest" DataFormatString="{0:&lt;FONT color=green&gt;$#,##0.00&lt;/FONT&gt;;&lt;FONT color=red&gt;(-$#,##0.00)&lt;/FONT&gt;}"
                                                                    HeaderText="ToInterest" HtmlEncode="False" SortExpression="ToInterest" />
                                                                <asp:BoundField DataField="ToFees" DataFormatString="{0:&lt;FONT color=green&gt;$#,##0.00&lt;/FONT&gt;;&lt;FONT color=red&gt;(-$#,##0.00)&lt;/FONT&gt;}"
                                                                    HeaderText="ToFees" HtmlEncode="False" SortExpression="ToFees" />
                                                                <asp:BoundField DataField="Balance" DataFormatString="{0:&lt;FONT color=green&gt;$#,##0.00&lt;/FONT&gt;;&lt;FONT color=red&gt;(-$#,##0.00)&lt;/FONT&gt;}"
                                                                    HeaderText="Balance" HtmlEncode="False" ReadOnly="True" SortExpression="Balance" />
                                                                <asp:HyperLinkField DataNavigateUrlFields="PmtID" DataNavigateUrlFormatString="~\Loan\ALS\PmtInfo.aspx?PmtID={0}"
                                                                    Text="View" Target="_blank" />
                                                            </Columns>
                                                            <EmptyDataTemplate>
                                                                No Payments To Show.
                                                            </EmptyDataTemplate>
                                                            <PagerStyle Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False"
                                                                HorizontalAlign="Right" />
                                                        </asp:GridView>
                                                        <br />
                                                        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">Send Pmt History To PDF View</asp:LinkButton>
                                                    </asp:Panel>
                                                </ContentTemplate>
                                            </asp:TabPanel>
                                            <asp:TabPanel ID="TabPanel22" runat="server" HeaderText="Payment Breakdown">
                                                <HeaderTemplate>
                                                    Payment Breakdown
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <asp:Panel ID="Panel22" runat="server">
                                                        <table class="style6">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="A_CP_MonthlyPmt" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="A_CP_DueDate" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="A_CP_PastDueAmt" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="A_CP_DPD" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    <hr />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="A_CP_PastDueFee" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    Late Charge
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="A_CP_CurrLC" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="A_CP_LCDate" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <hr />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="A_CP_MonthlyLC" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="empty-cells: hide">
                                                                    <asp:Label ID="A_CP_TotalDue" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    <hr />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="UplnFunds" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </ContentTemplate>
                                            </asp:TabPanel>
                                            <asp:TabPanel ID="TabPanel23" runat="server" HeaderText="Payoff">
                                                <ContentTemplate>
                                                    <asp:Panel ID="Panel23" runat="server">
                                                        <table id="table1" class="style6">
                                                            <tr>
                                                                <td style="empty-cells: hide">
                                                                    <asp:Image ID="Payoff_Error" runat="server" ImageUrl="~/Loan/ALS/Images/Payoff_Error.jpg"
                                                                        Visible="False" />
                                                                </td>
                                                                <td colspan="2" style="empty-cells: hide">
                                                                    <asp:Image ID="Payoff_PerSent" runat="server" ImageUrl="~/Loan/ALS/Images/Payoff_AlreadyOrdered.jpg"
                                                                        Visible="False" />
                                                                </td>
                                                                <td style="empty-cells: hide">
                                                                    <asp:Image ID="Payoff_Ordered" runat="server" ImageUrl="~/Loan/ALS/Images/Payoff_Ordered.jpg"
                                                                        Visible="False" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    Payoff Date
                                                                </td>
                                                                <td colspan="2">
                                                                    <asp:TextBox ID="PayoffDate" runat="server"></asp:TextBox>
                                                                    <asp:CalendarExtender ID="PayoffDate_CalendarExtender" runat="server" Enabled="True"
                                                                        TargetControlID="PayoffDate">
                                                                    </asp:CalendarExtender>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    Last Payoff Ordered
                                                                </td>
                                                                <td colspan="2">
                                                                    <asp:Label ID="Payoff_LastOrder" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    &nbsp;
                                                                </td>
                                                                <td colspan="2">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    Next Payment Due
                                                                </td>
                                                                <td style="margin-left: 40px" colspan="2">
                                                                    <asp:Label ID="Payoff_NextPmtDue" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    &nbsp;
                                                                </td>
                                                                <td colspan="2">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    Principal Balance
                                                                </td>
                                                                <td colspan="2">
                                                                    <asp:Label ID="Payoff_PrinBal" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    Interest Due
                                                                </td>
                                                                <td colspan="2">
                                                                    <asp:Label ID="Payoff_InterestDue" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    Per Diem
                                                                </td>
                                                                <td colspan="2">
                                                                    <asp:Label ID="Payoff_PerDiem" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    &nbsp;
                                                                </td>
                                                                <td colspan="2">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    Unpaid Fees
                                                                </td>
                                                                <td colspan="2">
                                                                    <asp:Label ID="Payoff_UnpaidFees" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    Current Late Charges
                                                                </td>
                                                                <td colspan="2">
                                                                    <asp:Label ID="Payoff_LCDue" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    Neg Escrow Balance
                                                                </td>
                                                                <td colspan="2">
                                                                    <asp:Label ID="Payoff_NegEscrow" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    &nbsp;
                                                                </td>
                                                                <td colspan="2">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    Total Payoff
                                                                </td>
                                                                <td colspan="2">
                                                                    <asp:Label ID="Payoff_TotalPayoff" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" colspan="2">
                                                                    &nbsp;
                                                                </td>
                                                                <td colspan="2">
                                                                    <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/Loan/ALS/Images/MailPayoff.jpg" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="4">
                                                                    <asp:Label ID="Payoff_Alert" runat="server" ForeColor="Red"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    &nbsp;
                                                                </td>
                                                                <td colspan="2">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </ContentTemplate>
                                            </asp:TabPanel>
                                        </asp:TabContainer>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:TabPanel>
                            <asp:TabPanel ID="TabPanel13" runat="server" HeaderText="Borrower Details">
                                <ContentTemplate>
                                    <asp:Panel ID="Panel13" runat="server">
                                        <asp:FormView ID="FormView2" runat="server" DataKeyNames="LoanID" DataSourceID="SqlDataSource3">
                                            <EditItemTemplate>
                                                <table id="table1" class="style6">
                                                    <tr>
                                                        <td>
                                                            1st Borrower
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:TextBox ID="B1_FirstTextBox" runat="server" Text='<%# Bind("B1_First") %>' />
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="B1_MiddleTextBox" runat="server" Text='<%# Bind("B1_Middle") %>' />
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="B1_LastTextBox" runat="server" Text='<%# Bind("B1_Last") %>' />
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="B1_SufTextBox" runat="server" Text='<%# Bind("B1_Suf") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            SSN
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="B1_SSNTextBox" runat="server" Text='<%# Bind("B1_SSN") %>' />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            2nd Borrower
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:TextBox ID="B2_FirstTextBox" runat="server" Text='<%# Bind("B2_First") %>' />
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="B2_MiddleTextBox" runat="server" Text='<%# Bind("B2_Middle") %>' />
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="B2_LastTextBox" runat="server" Text='<%# Bind("B2_Last") %>' />
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="B2_SufTextBox" runat="server" Text='<%# Bind("B2_Suf") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            SSN
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="B2_SSNTextBox" runat="server" Text='<%# Bind("B2_SSN") %>' />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Mailing Address
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4">
                                                            <asp:TextBox ID="Address1TextBox" runat="server" Text='<%# Bind("Address1") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4">
                                                            <asp:TextBox ID="Address2TextBox" runat="server" Text='<%# Bind("Address2") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="ZipTextBox" runat="server" Text='<%# Bind("Zip") %>' />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Home Phone
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="HomePhoneTextBox" runat="server" Text='<%# Bind("HomePhone") %>' />
                                                        </td>
                                                        <td>
                                                            Work Phone
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="WorkPhoneTextBox" runat="server" Text='<%# Bind("WorkPhone") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Update" ImageUrl="~/Loan/ALS/Images/Save.jpg" />
                                                        </td>
                                                        <td>
                                                            <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" CommandName="Cancel"
                                                                ImageUrl="~/Loan/ALS/Images/Cancel.jpg" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                B1_First:
                                                <asp:TextBox ID="B1_FirstTextBox0" runat="server" Text='<%# Bind("B1_First") %>' />
                                                <br />
                                                B1_Middle:
                                                <asp:TextBox ID="B1_MiddleTextBox0" runat="server" Text='<%# Bind("B1_Middle") %>' />
                                                <br />
                                                B1_Last:
                                                <asp:TextBox ID="B1_LastTextBox0" runat="server" Text='<%# Bind("B1_Last") %>' />
                                                <br />
                                                B1_Suf:
                                                <asp:TextBox ID="B1_SufTextBox0" runat="server" Text='<%# Bind("B1_Suf") %>' />
                                                <br />
                                                B1_SSN:
                                                <asp:TextBox ID="B1_SSNTextBox0" runat="server" Text='<%# Bind("B1_SSN") %>' />
                                                <br />
                                                B2_First:
                                                <asp:TextBox ID="B2_FirstTextBox0" runat="server" Text='<%# Bind("B2_First") %>' />
                                                <br />
                                                B2_Middle:
                                                <asp:TextBox ID="B2_MiddleTextBox0" runat="server" Text='<%# Bind("B2_Middle") %>' />
                                                <br />
                                                B2_Last:
                                                <asp:TextBox ID="B2_LastTextBox0" runat="server" Text='<%# Bind("B2_Last") %>' />
                                                <br />
                                                B2_Suf:
                                                <asp:TextBox ID="B2_SufTextBox0" runat="server" Text='<%# Bind("B2_Suf") %>' />
                                                <br />
                                                B2_SSN:
                                                <asp:TextBox ID="B2_SSNTextBox0" runat="server" Text='<%# Bind("B2_SSN") %>' />
                                                <br />
                                                Address1:
                                                <asp:TextBox ID="Address1TextBox0" runat="server" Text='<%# Bind("Address1") %>' />
                                                <br />
                                                Address2:
                                                <asp:TextBox ID="Address2TextBox0" runat="server" Text='<%# Bind("Address2") %>' />
                                                <br />
                                                City:
                                                <asp:TextBox ID="CityTextBox0" runat="server" Text='<%# Bind("City") %>' />
                                                <br />
                                                State:
                                                <asp:TextBox ID="StateTextBox0" runat="server" Text='<%# Bind("State") %>' />
                                                <br />
                                                Zip:
                                                <asp:TextBox ID="ZipTextBox0" runat="server" Text='<%# Bind("Zip") %>' />
                                                <br />
                                                HomePhone:
                                                <asp:TextBox ID="HomePhoneTextBox0" runat="server" Text='<%# Bind("HomePhone") %>' />
                                                <br />
                                                WorkPhone:
                                                <asp:TextBox ID="WorkPhoneTextBox0" runat="server" Text='<%# Bind("WorkPhone") %>' />
                                                <br />
                                                <asp:LinkButton ID="InsertButton0" runat="server" CausesValidation="True" CommandName="Insert"
                                                    Text="Insert" />
                                                &nbsp;<asp:LinkButton ID="InsertCancelButton0" runat="server" CausesValidation="False"
                                                    CommandName="Cancel" Text="Cancel" />
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Edit" ImageUrl="~/Loan/ALS/Images/EditBorr.jpg" />
                                                <br />
                                                <table id="table1" class="style6">
                                                    <tr>
                                                        <td>
                                                            1st Borrower
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="B1_FirstLabel" runat="server" Text='<%# Bind("B1_First") %>' />
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="B1_MiddleLabel" runat="server" Text='<%# Bind("B1_Middle") %>' />
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="B1_LastLabel" runat="server" Text='<%# Bind("B1_Last") %>' />
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="B1_SufLabel" runat="server" Text='<%# Bind("B1_Suf") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            SSN
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="B1_SSNLabel" runat="server" Text='<%# Bind("B1_SSN") %>' />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            2nd Borrower
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="B2_FirstLabel" runat="server" Text='<%# Bind("B2_First") %>' />
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="B2_MiddleLabel" runat="server" Text='<%# Bind("B2_Middle") %>' />
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="B2_LastLabel" runat="server" Text='<%# Bind("B2_Last") %>' />
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="B2_SufLabel" runat="server" Text='<%# Bind("B2_Suf") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            SSN
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="B2_SSNLabel" runat="server" Text='<%# Bind("B2_SSN") %>' />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Mailing Address
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4">
                                                            <asp:Label ID="Address1Label" runat="server" Text='<%# Bind("Address1") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4">
                                                            <asp:Label ID="Address2Label" runat="server" Text='<%# Bind("Address2") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="StateLabel" runat="server" Text='<%# Bind("State") %>' />
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="ZipLabel" runat="server" Text='<%# Bind("Zip") %>' />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Home Phone
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="HomePhoneLabel" runat="server" Text='<%# Bind("HomePhone") %>' />
                                                        </td>
                                                        <td>
                                                            Work Phone
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="WorkPhoneLabel" runat="server" Text='<%# Bind("WorkPhone") %>' />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:FormView>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:TabPanel>
                            <asp:TabPanel ID="TabPanel14" runat="server" HeaderText="Loan Details">
                                <ContentTemplate>
                                    <asp:Panel ID="Panel14" runat="server">
                                        <asp:TabContainer ID="TabContainer3" runat="server" ActiveTabIndex="1" AutoPostBack="True"
                                            ScrollBars="Auto" CssClass="" Width="830px">
                                            <asp:TabPanel ID="TabPanel31" runat="server" HeaderText="Overview">
                                                <ContentTemplate>
                                                    <br />
                                                    <asp:Panel ID="Panel31" runat="server">
                                                        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2" HorizontalAlign="Left"
                                                            Width="100%">
                                                            <EditItemTemplate>
                                                                OpenDate:
                                                                <asp:TextBox ID="OpenDateTextBox" runat="server" Text='<%# Bind("OpenDate") %>' />
                                                                <br />
                                                                FirstPmtDate:
                                                                <asp:TextBox ID="FirstPmtDateTextBox" runat="server" Text='<%# Bind("FirstPmtDate") %>' />
                                                                <br />
                                                                NoPmts:
                                                                <asp:TextBox ID="NoPmtsTextBox" runat="server" Text='<%# Bind("NoPmts") %>' />
                                                                <br />
                                                                CurrPmtDue:
                                                                <asp:TextBox ID="CurrPmtDueTextBox" runat="server" Text='<%# Bind("CurrPmtDue") %>' />
                                                                <br />
                                                                NoPmtsLeft:
                                                                <asp:TextBox ID="NoPmtsLeftTextBox" runat="server" Text='<%# Bind("NoPmtsLeft") %>' />
                                                                <br />
                                                                LCDate:
                                                                <asp:TextBox ID="LCDateTextBox" runat="server" Text='<%# Bind("LCDate") %>' />
                                                                <br />
                                                                LCAmount:
                                                                <asp:TextBox ID="LCAmountTextBox" runat="server" Text='<%# Bind("LCAmount") %>' />
                                                                <br />
                                                                LoanAmount:
                                                                <asp:TextBox ID="LoanAmountTextBox" runat="server" Text='<%# Bind("LoanAmount") %>' />
                                                                <br />
                                                                CurrBalance:
                                                                <asp:TextBox ID="CurrBalanceTextBox" runat="server" Text='<%# Bind("CurrBalance") %>' />
                                                                <br />
                                                                MonthlyPmt:
                                                                <asp:TextBox ID="MonthlyPmtTextBox" runat="server" Text='<%# Bind("MonthlyPmt") %>' />
                                                                <br />
                                                                IntRate:
                                                                <asp:TextBox ID="IntRateTextBox" runat="server" Text='<%# Bind("IntRate") %>' />
                                                                <br />
                                                                DownPmt:
                                                                <asp:TextBox ID="DownPmtTextBox" runat="server" Text='<%# Bind("DownPmt") %>' />
                                                                <br />
                                                                Type:
                                                                <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
                                                                <br />
                                                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                                                    Text="Update" />
                                                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                                                                    CommandName="Cancel" Text="Cancel" />
                                                            </EditItemTemplate>
                                                            <InsertItemTemplate>
                                                                OpenDate:
                                                                <asp:TextBox ID="OpenDateTextBox0" runat="server" Text='<%# Bind("OpenDate") %>' />
                                                                <br />
                                                                FirstPmtDate:
                                                                <asp:TextBox ID="FirstPmtDateTextBox0" runat="server" Text='<%# Bind("FirstPmtDate") %>' />
                                                                <br />
                                                                NoPmts:
                                                                <asp:TextBox ID="NoPmtsTextBox0" runat="server" Text='<%# Bind("NoPmts") %>' />
                                                                <br />
                                                                CurrPmtDue:
                                                                <asp:TextBox ID="CurrPmtDueTextBox0" runat="server" Text='<%# Bind("CurrPmtDue") %>' />
                                                                <br />
                                                                NoPmtsLeft:
                                                                <asp:TextBox ID="NoPmtsLeftTextBox0" runat="server" Text='<%# Bind("NoPmtsLeft") %>' />
                                                                <br />
                                                                LCDate:
                                                                <asp:TextBox ID="LCDateTextBox0" runat="server" Text='<%# Bind("LCDate") %>' />
                                                                <br />
                                                                LCAmount:
                                                                <asp:TextBox ID="LCAmountTextBox0" runat="server" Text='<%# Bind("LCAmount") %>' />
                                                                <br />
                                                                LoanAmount:
                                                                <asp:TextBox ID="LoanAmountTextBox0" runat="server" Text='<%# Bind("LoanAmount") %>' />
                                                                <br />
                                                                CurrBalance:
                                                                <asp:TextBox ID="CurrBalanceTextBox0" runat="server" Text='<%# Bind("CurrBalance") %>' />
                                                                <br />
                                                                MonthlyPmt:
                                                                <asp:TextBox ID="MonthlyPmtTextBox0" runat="server" Text='<%# Bind("MonthlyPmt") %>' />
                                                                <br />
                                                                IntRate:
                                                                <asp:TextBox ID="IntRateTextBox0" runat="server" Text='<%# Bind("IntRate") %>' />
                                                                <br />
                                                                DownPmt:
                                                                <asp:TextBox ID="DownPmtTextBox0" runat="server" Text='<%# Bind("DownPmt") %>' />
                                                                <br />
                                                                Type:
                                                                <asp:TextBox ID="TypeTextBox0" runat="server" Text='<%# Bind("Type") %>' />
                                                                <br />
                                                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                                                    Text="Insert" />
                                                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                                                    CommandName="Cancel" Text="Cancel" />
                                                            </InsertItemTemplate>
                                                            <ItemTemplate>
                                                                <table class="style6">
                                                                    <tr>
                                                                        <td>
                                                                            Open Date
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="OpenDateLabel" runat="server" Text='<%# Bind("OpenDate", "{0:d}") %>' />
                                                                        </td>
                                                                        <td>
                                                                            Due Date
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="CurrPmtDueLabel" runat="server" Text='<%# Bind("CurrPmtDue", "{0:d}") %>' />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            First Payment
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="FirstPmtDateLabel" runat="server" Text='<%# Bind("FirstPmtDate", "{0:d}") %>' />
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="4">
                                                                            <hr />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            Number of Payments
                                                                        </td>
                                                                        <td style="margin-left: 80px">
                                                                            <asp:Label ID="NoPmtsLabel" runat="server" Text='<%# Bind("NoPmts") %>' />
                                                                        </td>
                                                                        <td>
                                                                            Payments Left
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="NoPmtsLeftLabel" runat="server" Text='<%# Bind("NoPmtsLeft") %>' />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="4">
                                                                            <hr />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            Late Charge Date
                                                                        </td>
                                                                        <td style="margin-left: 80px">
                                                                            <asp:Label ID="LCDateLabel" runat="server" Text='<%# Bind("LCDate") %>' />
                                                                        </td>
                                                                        <td>
                                                                            Late Charge Amount
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="LCAmountLabel" runat="server" Text='<%# Bind("LCAmount", "{0:C}") %>' />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="4">
                                                                            <hr />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            Loan Amount
                                                                        </td>
                                                                        <td style="margin-left: 80px">
                                                                            <asp:Label ID="LoanAmountLabel" runat="server" Text='<%# Bind("LoanAmount", "{0:C}") %>' />
                                                                        </td>
                                                                        <td>
                                                                            Monthly Payment
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="MonthlyPmtLabel" runat="server" Text='<%# Bind("MonthlyPmt", "{0:C}") %>' />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            Current Balance
                                                                        </td>
                                                                        <td style="margin-left: 80px">
                                                                            <asp:Label ID="CurrBalanceLabel" runat="server" Text='<%# Bind("CurrBalance", "{0:C}") %>' />
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="4">
                                                                            <hr />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            Interest Rate
                                                                        </td>
                                                                        <td style="margin-left: 80px">
                                                                            <asp:Label ID="IntRateLabel" runat="server" Text='<%# Bind("IntRate") %>' />
                                                                        </td>
                                                                        <td>
                                                                            Down Payment
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="DownPmtLabel" runat="server" Text='<%# Bind("DownPmt", "{0:C}") %>' />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="4">
                                                                            <hr />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            Type
                                                                        </td>
                                                                        <td colspan="3" style="margin-left: 80px">
                                                                            <asp:Label ID="TypeLabel" runat="server" Text='<%# Bind("Type") %>' />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            &nbsp;
                                                                        </td>
                                                                        <td style="margin-left: 80px">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td style="margin-left: 80px">
                                                                            Sched Mat Date
                                                                        </td>
                                                                        <td style="margin-left: 80px">
                                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("SchMatDate", "{0:d}") %>'></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                            </ItemTemplate>
                                                        </asp:FormView>
                                                    </asp:Panel>
                                                </ContentTemplate>
                                            </asp:TabPanel>
                                            <asp:TabPanel ID="TabPanel32" runat="server" HeaderText="Notes">
                                                <ContentTemplate>
                                                    <asp:Panel ID="Panel32" runat="server">
                                                        <asp:MultiView ID="View_Notes" runat="server" ActiveViewIndex="0">
                                                            <asp:View ID="Notes_View" runat="server">
                                                                <table class="style6">
                                                                    <tr>
                                                                        <td>
                                                                            &nbsp;
                                                                        </td>
                                                                        <td style="text-align: right">
                                                                            <asp:Button ID="Button1" runat="server" Text="Add Note" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <asp:GridView ID="Notes_Grid" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                                DataSourceID="SqlDataSource5" PageSize="20" Style="font-size: 9pt" Width="100%">
                                                                                <PagerSettings Mode="NextPreviousFirstLast" Position="Top" />
                                                                                <Columns>
                                                                                    <asp:BoundField DataField="Expr1" HeaderText="Dept" ReadOnly="True" SortExpression="Expr1">
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                        <ItemStyle Wrap="False" />
                                                                                    </asp:BoundField>
                                                                                    <asp:BoundField DataField="NoteDateTime" DataFormatString="{0:MM/dd/yyyy HH:mm}"
                                                                                        HeaderText="Date" SortExpression="NoteDateTime">
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                        <ItemStyle Wrap="False" />
                                                                                    </asp:BoundField>
                                                                                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                        <ItemStyle Wrap="False" />
                                                                                    </asp:BoundField>
                                                                                    <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note">
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                        <ItemStyle Wrap="False" />
                                                                                    </asp:BoundField>
                                                                                </Columns>
                                                                                <RowStyle Font-Size="9pt" Wrap="False" />
                                                                            </asp:GridView>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:View>
                                                            <asp:View ID="Notes_Add" runat="server">
                                                                <table class="style6" style="vertical-align: text-top">
                                                                    <tr>
                                                                        <td colspan="2" valign="top">
                                                                            Dept |
                                                                            <asp:DropDownList ID="Notes_Add_Dept" runat="server" DataSourceID="SqlDataSource4"
                                                                                DataTextField="DeptName" DataValueField="Dept" Width="75%">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2" valign="top">
                                                                            Note |
                                                                            <asp:TextBox ID="Notes_Add_Note" runat="server" Rows="5" TextMode="MultiLine" Width="75%"></asp:TextBox>
                                                                            <br />
                                                                            <asp:Label ID="Notes_Alert" runat="server" Style="color: #FF0000" Text="******** Please Enter Notes Above. ********"
                                                                                Visible="False"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            High Priority
                                                                            <asp:RadioButtonList ID="Notes_Add_Level" runat="server" RepeatDirection="Horizontal">
                                                                                <asp:ListItem Selected="True" Value="N">No</asp:ListItem>
                                                                                <asp:ListItem Value="Y">Yes</asp:ListItem>
                                                                            </asp:RadioButtonList>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Button ID="Button3" runat="server" Text="Save" />
                                                                            &nbsp;<asp:Button ID="Button2" runat="server" Text="Cancel" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:View>
                                                        </asp:MultiView>
                                                    </asp:Panel>
                                                </ContentTemplate>
                                            </asp:TabPanel>
                                        </asp:TabContainer>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:TabPanel>
                            <asp:TabPanel ID="TabPanel15" runat="server" HeaderText="Research Cases">
                                <ContentTemplate>
                                    <asp:Panel ID="Panel15" runat="server">
                                        <asp:MultiView ID="View_Research" runat="server" ActiveViewIndex="0">
                                            <asp:View ID="Research_Show" runat="server">
                                                <table width="100%">
                                                    <tr>
                                                        <td>
                                                            <h3>
                                                                Research Cases</h3>
                                                        </td>
                                                        <td style="text-align: right">
                                                            <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Loan/ALS/Images/AddNewCase.jpg"
                                                                ImageAlign="Right" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <asp:GridView ID="CaseGrid" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                DataKeyNames="CaseNumber,Name" Width="100%" DataSourceID="SqlDataSource7" AllowSorting="True">
                                                                <Columns>
                                                                    <asp:ButtonField CommandName="Select" DataTextField="CaseNumber" HeaderText="Case"
                                                                        Text="CaseNumber" SortExpression="CaseNumber">
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:ButtonField>
                                                                    <asp:BoundField DataField="Name" HeaderText="Description" ReadOnly="True" SortExpression="Name" />
                                                                    <asp:BoundField DataField="OpenDate" DataFormatString="{0:d}" HeaderText="Open Date"
                                                                        SortExpression="OpenDate">
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="PromiseDate" DataFormatString="{0:d}" HeaderText="Promise Date"
                                                                        SortExpression="PromiseDate">
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="CStatus" HeaderText="Status" ReadOnly="True" SortExpression="CStatus">
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:BoundField>
                                                                </Columns>
                                                            </asp:GridView>
                                                            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
                                                                SelectCommand="SELECT Case_Status.CaseNumber, CONVERT (char, Case_Types.CaseID) + N' | ' + Case_Types.CaseName AS Name, Case_Status.OpenDate, Case_Status.PromiseDate, CASE WHEN Case_Status.Status = 'O' THEN 'Opened' ELSE 'Closed' END AS CStatus FROM Case_Status INNER JOIN Case_Types ON Case_Status.CaseID = Case_Types.CaseID WHERE (Case_Status.LoanNo = @LoanNo) ORDER BY Case_Status.OpenDate DESC">
                                                                <SelectParameters>
                                                                    <asp:SessionParameter Name="LoanNo" SessionField="LoanNo" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:View>
                                            <asp:View ID="Research_View" runat="server">
                                                <table width="100%">
                                                    <tr>
                                                        <td>
                                                            <asp:ImageButton ID="GoBackToResearchCases" runat="server" ImageUrl="~/Loan/ALS/Images/GoBackToResearchCases.jpg" />
                                                        </td>
                                                        <td align="right" style="text-align: right">
                                                            <table align="right">
                                                                <tr>
                                                                    <td colspan="2" align="center">
                                                                        <asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="~/Loan/ALS/Images/AddNewCaseNote.jpg"
                                                                            ImageAlign="Right" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">
                                                                        <asp:ImageButton ID="IB_SelfAssign" runat="server" ImageUrl="~/Loan/ALS/Images/SelfAssign.jpg"
                                                                            ImageAlign="Right" /><asp:ImageButton ID="IB_SelfReAssign" runat="server" ImageUrl="~/Loan/ALS/Images/SelfReAssign.jpg"
                                                                                ImageAlign="Right" />
                                                                    </td>
                                                                    <td align="center">
                                                                        <asp:ImageButton ID="IB_CloseCasae" runat="server" ImageUrl="~/Loan/ALS/Images/CloseCase.jpg"
                                                                            ImageAlign="Right" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <tr>
                                                            <td colspan="2">
                                                                <h3>
                                                                    Case View (<asp:Label ID="CaseViewID" runat="server"></asp:Label>)</h3>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <asp:Label ID="CurrentCaseDetails" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <asp:GridView ID="CaseNotesGrid" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                    DataKeyNames="NoteID" DataSourceID="SqlDataSource9" Width="100%">
                                                                    <Columns>
                                                                        <asp:ButtonField CommandName="Select" DataTextField="NoteAdded" HeaderText="Added On"
                                                                            Text="NoteAdded" SortExpression="NoteAdded">
                                                                            <ItemStyle HorizontalAlign="Center" Width="125px" />
                                                                        </asp:ButtonField>
                                                                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                                                                            <ItemStyle HorizontalAlign="Center" Width="175px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description">
                                                                            <ItemStyle Width="225px" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                                <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
                                                                    SelectCommand="SELECT Case_Notes_Entrys.NoteID, Case_Notes_Entrys.NoteAdded, Users.Name, Case_Notes_Entrys.Description FROM Case_Notes_Entrys LEFT OUTER JOIN Users ON Case_Notes_Entrys.AddedBy = Users.Username WHERE (Case_Notes_Entrys.CaseID = @CaseID) ORDER BY Case_Notes_Entrys.NoteAdded DESC">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="CaseGrid" Name="CaseID" PropertyName="SelectedValue" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </td>
                                                        </tr>
                                                </table>
                                            </asp:View>
                                            <asp:View ID="Research_View_Notes" runat="server">
                                                <table width="100%">
                                                    <tr>
                                                        <td>
                                                            <asp:ImageButton ID="GoBackToCaseNotes" runat="server" ImageUrl="~/Loan/ALS/Images/GoBackToCaseNotes.jpg" />
                                                        </td>
                                                        <td style="text-align: right">
                                                            <asp:ImageButton ID="ImageButton7" runat="server" ImageUrl="~/Loan/ALS/Images/AddNewCaseNote.jpg"
                                                                ImageAlign="Right" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <h3>
                                                                Case View (<asp:Label ID="CaseViewID1" runat="server"></asp:Label>)</h3>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource8"
                                                                GridLines="None" ShowHeader="False" Width="100%">
                                                                <Columns>
                                                                    <asp:BoundField DataField="Note" HeaderText="Note" ShowHeader="False" SortExpression="Note" />
                                                                </Columns>
                                                            </asp:GridView>
                                                            <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
                                                                SelectCommand="SELECT [Note] FROM [Case_Notes] WHERE ([NoteID] = @NoteID) ORDER BY [LineID]">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="CaseNotesGrid" Name="NoteID" PropertyName="SelectedValue"
                                                                        Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:View>
                                        </asp:MultiView>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:TabPanel>
                            <asp:TabPanel ID="TabPanel6" runat="server" HeaderText="Loan Documents">
                                <ContentTemplate>
                                    <asp:Panel ID="Panel16" runat="server" Style="text-align: center">
                                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                            CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSource6" Width="75%">
                                            <Columns>
                                                <asp:BoundField DataField="PrintedOn" DataFormatString="{0:D}" HeaderText="PrintedOn"
                                                    SortExpression="PrintedOn" />
                                                <asp:BoundField DataField="DocName" HeaderText="DocName" SortExpression="DocName" />
                                                <asp:BoundField DataField="DocLink" HeaderText="DocLink" SortExpression="DocLink"
                                                    Visible="False" />
                                                <asp:HyperLinkField DataNavigateUrlFields="DocLink" DataNavigateUrlFormatString="~\Loan\Officer\PDFs\{0}"
                                                    Target="_blank" Text="View" />
                                            </Columns>
                                            <AlternatingRowStyle BackColor="#CCCCCC" />
                                            <EmptyDataTemplate>
                                                No Docuemnts To Show.
                                            </EmptyDataTemplate>
                                            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:GridView>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:TabPanel>
                            <asp:TabPanel ID="TabPanel17" runat="server" HeaderText="System Controls">
                                <ContentTemplate>
                                    <asp:Panel ID="Panel17" runat="server" Style="text-align: left">
                                        <table class="style6">
                                            <tr>
                                                <td>
                                                    <asp:LinkButton ID="LinkButton6" runat="server">Order Documents</asp:LinkButton>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        Now Available....<br />
                                        &nbsp;&nbsp;&nbsp;&nbsp; -Payoff Order/View - 01/24/2012<br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -Auto-Payoff Letter - 03/24/2012
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp; -Research Cases - 07/24/2013<br />
                                        <br />
                                        Options Comming Soon....
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp; -Posting Adjustments
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp; - ... And More.</asp:Panel>
                                </ContentTemplate>
                            </asp:TabPanel>
                        </asp:TabContainer>
                    </td>
                </tr>
            </table>
            <table class="style15">
                <tr>
                    <td valign="top">
                        <br />
                    </td>
                    <td valign="top">
                        <br />
                        <table>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        &nbsp;
                    </td>
                    <td valign="top">
                        &nbsp;
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
