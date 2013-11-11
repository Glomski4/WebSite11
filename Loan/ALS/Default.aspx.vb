
Partial Class Loan_ALS_Default
    Inherits System.Web.UI.Page

    Protected Sub Search_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Search.Click

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            MaintainScrollPositionOnPostBack = True
            'RefAllItems()
        Else
            T_LoanNumber.Focus()
            If My.Request.QueryString("FORWARD") = "VALID" Then
                Session.Add("LoanNo", My.Request.QueryString("LoanNo"))
                Response.Redirect("~\Loan\ALS\Default.aspx?FORWARD=POP")
            ElseIf My.Request.QueryString("FORWARD") = "POP" Then
                T_LoanNumber.Text = Session("LoanNo")
                LoanVaild()
            End If
        End If
    End Sub

    Protected Sub T_LoanNumber_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles T_LoanNumber.TextChanged
        LoanVaild()
    End Sub
    Protected Sub LoanVaild()
        Session.Add("LoanNo", T_LoanNumber.Text)
        BorrName.Text = ""
        BorrSSN.Text = ""
        CoBorrName.Text = ""
        CoBorrSSN.Text = ""
        HomePhone.Text = ""
        WorkPhone.Text = ""
        LoanType.Text = ""
        Status.Text = ""
        CC.Text = ""
        DPD.Text = ""
        LoanNumber.Text = ""
        T_LoanNumber.Text = ""
        PayoffDate.Text = ""
        'AlertsPlaceHolder.Controls.Clear()
        View_LSearchAlert.ActiveViewIndex = -1
        View_LeftTab.ActiveViewIndex = -1
        TabContainer1.Visible = False
        TabContainer1.ActiveTabIndex = 0
        TabContainer2.ActiveTabIndex = 0
        TabContainer3.ActiveTabIndex = 0
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        Dim intCount As Integer
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.Connection = sqlConn
        sqlComm.CommandText = "Select Count(LoanID) From Loans Where ([LoanID] = '" & Session("LoanNo") & "')"
        intCount = sqlComm.ExecuteScalar
        If intCount = 1 Then
            CreatLinks()
            BorrName.Text = GetDataText("B1_First")
            BorrName.Text = BorrName.Text & " " & GetDataText("B1_Middle")
            BorrName.Text = BorrName.Text & " " & GetDataText("B1_Last")
            BorrName.Text = BorrName.Text & " " & GetDataText("B1_Suf")
            BorrSSN.Text = GetDataText("B1_SSN")
            CoBorrName.Text = GetDataText("B2_First")
            CoBorrName.Text = CoBorrName.Text & " " & GetDataText("B2_Middle")
            CoBorrName.Text = CoBorrName.Text & " " & GetDataText("B2_Last")
            CoBorrName.Text = CoBorrName.Text & " " & GetDataText("B2_Suf")
            CoBorrSSN.Text = GetDataText("B2_SSN")
            HomePhone.Text = GetDataText("HomePhone")
            WorkPhone.Text = GetDataText("WorkPhone")
            LoanType.Text = GetDataText("Type")
            Status.Text = GetDataText("L_Status").Trim
            CC.Text = SQL_Codes.GetData("CounsolerCodes", "CCode", "CCID", GetDataText("CCID").Trim)
            If Status.Text = "G" Then
                Class1.GetAuthLevel(Session("User"), 3)
            End If
            DPD.Text = DateDiff(DateInterval.Day, CDate(GetDataText("CurrPmtDue")), Now())
            If DPD.Text < 0 Then
                DPD.Text = 0
                Dim AImage As New Image
                AImage.ImageUrl = "Images\C01.bmp"
                'AlertsPlaceHolder.Controls.Add(AImage)
            End If
            If Len(HomePhone.Text) = 0 Or Len(WorkPhone.Text) = 0 Then
                Dim AImage As New Image
                AImage.ImageUrl = "Images\UpdateAcct.bmp"
                'AlertsPlaceHolder.Controls.Add(AImage)
            End If
            Dim ModStatus = SQL_Codes.GetDataFiltering("Modification", "Status", "[LoanNo] = '" & Session("LoanNo") & "'")
            If ModStatus = "" Then
                Active_Loan_Mod.Visible = False
            Else
                Dim ModActive = SQL_Codes.GetDataFiltering("Modification_Status", "StatusSysActive", "StatusID = ' " & ModStatus & "'")
                If ModActive = True Then
                    Active_Loan_Mod.Visible = True
                Else
                    Active_Loan_Mod.Visible = False
                End If
            End If
            LoanNumber.Text = Session("LoanNo")
            ShowVer()
            If GetDataText("CurrBalance") = 0 Then ' See if loan PIF
                TabContainer2.Tabs(1).Visible = False ' Remove Payment Breakdown Screen
                TabContainer2.Tabs(2).Visible = False ' Remove Payoff Screen
            Else
                TabContainer2.Tabs(1).Visible = True ' Show Payment Breakdown Screen
                TabContainer2.Tabs(2).Visible = True ' Show Payoff Screen
            End If
        ElseIf Not IsNumeric(Session("LoanNo")) Then
            View_LSearchAlert.SetActiveView(Alert_NumberOnly)
            T_LoanNumber.Focus()
        Else
            View_LSearchAlert.SetActiveView(Alert_NumberNotVaild)
            T_LoanNumber.Focus()
        End If
        sqlConn.Close()
    End Sub

    Protected Sub CreatLinks()
        'Order New Document
        LinkButton6.OnClientClick = "window.open('/WebSite/Docs/OrderDoc.aspx?LoanNo=" & Session("LoanNo") & "',null,'height=500, width=800,status= no, resizable= Yes, scrollbars=yes, toolbar=no,location=no,menubar=no ');myWindow.focus();"
        'Add New Research Case
        ImageButton4.OnClientClick = "window.open('/WebSite/Loan/ALS/Cases/OpenNewCase.aspx?LoanNo=" & Session("LoanNo") & "',null,'height=500, width=800,status= no, resizable= Yes, scrollbars=yes, toolbar=no,location=no,menubar=no ');myWindow.focus();"
        'Add New Case Notes
        ImageButton6.OnClientClick = "window.open('/WebSite/Loan/ALS/Cases/AddNewCaseNotes.aspx?LoanNo=" & Session("LoanNo") & "',null,'height=300, width=300,status= no, resizable= Yes, scrollbars=yes, toolbar=no,location=no,menubar=no ');myWindow.focus();"
        ImageButton7.OnClientClick = "window.open('/WebSite/Loan/ALS/Cases/AddNewCaseNotes.aspx?LoanNo=" & Session("LoanNo") & "',null,'height=300, width=300,status= no, resizable= Yes, scrollbars=yes, toolbar=no,location=no,menubar=no ');myWindow.focus();"
    End Sub

    Protected Sub ShowVer()
        Ver_A_Type.Visible = False
        View_LeftTab.SetActiveView(LeftTab_Verify)
        Ver_Person.Items.Clear()
        If Len(BorrName.Text) > 7 Then
            Ver_Person.Items.Add(BorrName.Text & " (" & Right(BorrSSN.Text, 4) & ")")
        End If
        If Len(CoBorrName.Text) > 7 Then
            Ver_Person.Items.Add(CoBorrName.Text & " (" & Right(CoBorrSSN.Text, 4) & ")")
        End If
        Ver_Person.Items.Add("Third Party")
    End Sub

    Protected Sub B_V_Continue_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles B_V_Continue.Click
        If Ver_Type.SelectedValue = 3 Then
            'Add Ver Submit Database Command
            View_LeftTab.SetActiveView(LeftTab_Sales_A)
            Ver_Type.SelectedIndex = -1
            TabContainer1.Visible = True
            RefAllItems()
        ElseIf Ver_Type.SelectedValue >= 0 And Ver_Type.SelectedValue <= 2 Then
            If Ver_Person.SelectedIndex >= 0 Then
                'Add Ver Submit Database Command
                View_LeftTab.SetActiveView(LeftTab_Sales_A)
                Ver_Type.SelectedIndex = -1
                TabContainer1.Visible = True
                RefAllItems()
            Else
                Ver_A_Person.Visible = True
                TabContainer1.Visible = False
            End If
        Else
            Ver_A_Type.Visible = True
            TabContainer1.Visible = False
        End If
    End Sub

    Public Sub RefAllItems()
        FormView1.DataBind()
        PaymentHistory_Grid.DataBind()
        PaymentHistory_Grid0.DataBind()
        FormView2.DataBind()
        Notes_Grid.DataBind()
        Notes_Grid0.DataBind()
        GridView1.DataBind()
        CaseGrid.DataBind()
        CaseNotesGrid.DataBind()
    End Sub

    Protected Sub Ver_Type_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Ver_Type.SelectedIndexChanged
        If Ver_Type.SelectedValue >= 0 And Ver_Type.SelectedValue <= 2 Then
            Ver_Person.Visible = True
        Else
            Ver_Person.Visible = False
        End If
        If Ver_Type.SelectedValue >= 0 And Ver_Type.SelectedValue <= 2 Then
            Ver_Person.Visible = True
        Else
            Ver_Person.Visible = False
        End If
    End Sub
    Public Function GetDataText(ByVal Item As String) As String
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.Connection = sqlConn
        sqlComm.CommandText = "Select " & Item & " From Loans Where ([LoanID] = '" & Session("LoanNo") & "')"
        If IsDBNull(sqlComm.ExecuteScalar) Then
            GetDataText = ""
        Else
            GetDataText = sqlComm.ExecuteScalar.ToString.Trim
        End If
        sqlConn.Close()
    End Function

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Notes_Add_Dept.SelectedIndex = -1
        Notes_Add_Level.SelectedIndex = 0
        Notes_Add_Note.Text = ""
        Notes_Alert.Visible = False
        View_Notes.SetActiveView(Notes_Add)
        Notes_Add_Note.Focus()
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        View_Notes.SetActiveView(Notes_View)
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        If Len(Notes_Add_Note.Text) = 0 Then
            Notes_Alert.Visible = True
            Notes_Add_Note.Focus()
        Else
            Notes_Alert.Visible = False
            T_LoanNumber.Focus()
            Dim PostNotes As String = UCase(Notes_Add_Note.Text)
            Dim DateTimeStamp As DateTime = Now()
            Dim NoteToPost As String
            Dim sqlConn As New System.Data.SqlClient.SqlConnection
            Dim sqlComm As New System.Data.SqlClient.SqlCommand
            sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
            sqlConn.Open()
            sqlComm.Connection = sqlConn
            Do Until Len(PostNotes) = 0
                If Len(PostNotes) > 50 Then
                    For X = 0 To 49
                        NoteToPost = Left(PostNotes, 50 - X)
                        If Right(NoteToPost, 1) = " " Then
                            sqlComm.CommandText = "INSERT INTO Notes (LoanID, Priority, Dept, NoteDateTime, Note, EnteredBy) VALUES('" & Session("LoanNo") & "','" & Notes_Add_Level.SelectedItem.Value & " ','" & Notes_Add_Dept.SelectedItem.Value & "','" & DateTimeStamp & "','" & NoteToPost & "','" & Session("User") & "')"
                            sqlComm.ExecuteNonQuery()
                            PostNotes = Replace(PostNotes, NoteToPost, "")
                            Exit For
                        End If
                    Next
                Else
                    sqlComm.CommandText = "INSERT INTO Notes (LoanID, Priority, Dept, NoteDateTime, Note, EnteredBy) VALUES('" & Session("LoanNo") & "','" & Notes_Add_Level.SelectedItem.Value & " ','" & Notes_Add_Dept.SelectedItem.Value & "','" & DateTimeStamp & "','" & PostNotes & "','" & Session("User") & "')"
                    sqlComm.ExecuteNonQuery()
                    PostNotes = ""
                End If
            Loop
            sqlConn.Close()
        End If
        Notes_Add_Note.Text = ""
        View_Notes.SetActiveView(Notes_View)
        Notes_Grid.DataBind()
    End Sub

    Protected Sub LinkButton3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton3.Click
        Dim PDF_Text As String
        PDF_Text = "Loan Number : " & Session("LoanNo") & vbNewLine
        PDF_Text = PDF_Text & "Generation Date and Time : " & Now() & " Rep ID : " & Session("User") & vbNewLine & vbNewLine
        'PDF_Text =PDF_Text & "111111111111222222222222**/***** 3333333333333333333344444444444444555555555555556666666666666677777777777777888888888888888" & vbNewLine
        PDF_Text = PDF_Text & "Posted      Effective   Int For  Payment Type        Pmt Amount    To Principal  To Interest   To Fees       Loan Balance" & vbNewLine
        Dim QueryString As String
        QueryString = "SELECT PmtMain.PostedDate, PmtMain.IntDate, PaymentTypes.Type, PmtMain.ToPrincipal + PmtMain.ToInterest + PmtMain.ToFees + PmtMain.ToUnpl AS PmtTotal, PmtMain.ToPrincipal, PmtMain.ToInterest, PmtMain.ToFees, (SELECT LoanAmount FROM Loans WHERE (LoanID = '" & Session("LoanNo") & "')) - (SELECT SUM(ToPrincipal) AS Expr1 FROM Payments WHERE (LoanID = '" & Session("LoanNo") & "') AND (PmtID <= PmtMain.PmtID)) AS Balance,PmtMain.EffDate, PmtMain.PmtID, PmtMain.LoanID FROM Payments AS PmtMain LEFT OUTER JOIN PaymentTypes ON PmtMain.Type = PaymentTypes.TypeID WHERE (PmtMain.LoanID = '" & Session("LoanNo") & "') ORDER BY PmtMain.PmtID DESC"
        Using Connection As New System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString)
            Dim Command As New System.Data.SqlClient.SqlCommand(QueryString, Connection)
            Connection.Open()
            Dim Reader As System.Data.SqlClient.SqlDataReader = Command.ExecuteReader()
            While Reader.Read()
                PDF_Text = PDF_Text & FormatDateTime(Reader(0), DateFormat.ShortDate) & Space(12 - Len(FormatDateTime(Reader(0), DateFormat.ShortDate))) & FormatDateTime(Reader(8), DateFormat.ShortDate) & Space(12 - Len(FormatDateTime(Reader(8), DateFormat.ShortDate))) & Format(Reader(1), "MM/yyyy") & "  " & Reader(2)
                PDF_Text = PDF_Text & FormatCurrency(Reader(3)) & Space(14 - Len(FormatCurrency(Reader(3)))) & FormatCurrency(Reader(4)) & Space(14 - Len(FormatCurrency(Reader(4)))) & FormatCurrency(Reader(5)) & Space(14 - Len(FormatCurrency(Reader(5)))) & FormatCurrency(Reader(6)) & Space(14 - Len(FormatCurrency(Reader(6)))) & FormatCurrency(Reader(7)) & vbNewLine
            End While
            Reader.Close()
            Connection.Close()
            PDF_Text = PDF_Text & vbNewLine & vbNewLine
            PDF.NewPDF(PDF_Text)
        End Using
        Response.Redirect("~\Loan\Officer\PDFs\Doc1.pdf")
    End Sub

    Protected Sub TabContainer_ActiveTabChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles TabContainer3.ActiveTabChanged, TabContainer2.ActiveTabChanged
        Select Case TabContainer1.ActiveTabIndex
            Case 0 ' Recent Activity
            Case 1 ' Payment Details
                Select Case TabContainer2.ActiveTabIndex
                    Case 0 ' Payment History
                    Case 1 ' Payment Breakdown
                        Dim AmtDue As Double
                        Dim MDue As String
                        ''View_Account.SetActiveView(Account_CurrentPayment)
                        Dim CurrPmtDueLabel As Label = FormView1.FindControl("CurrPmtDueLabel")
                        A_CP_DueDate.Text = "Due Date : " & FormatDateTime(CurrPmtDueLabel.Text, DateFormat.ShortDate)
                        A_CP_DPD.Text = "DPD : " & DPD.Text
                        Dim LCDateLabel As Label = FormView1.FindControl("LCDateLabel")
                        A_CP_LCDate.Text = "Date : " & LCDateLabel.Text
                        Dim LCAmountLabel As Label = FormView1.FindControl("LCAmountLabel")
                        A_CP_MonthlyLC.Text = "Amount : " & LCAmountLabel.Text
                        Dim MonthlyPmtLabel As Label = FormView1.FindControl("MonthlyPmtLabel")
                        A_CP_MonthlyPmt.Text = "Current Payment : " & MonthlyPmtLabel.Text
                        AmtDue = AmtDue + CDbl(MonthlyPmtLabel.Text)
                        MDue = DateDiff(DateInterval.Month, CDate(CurrPmtDueLabel.Text), Now())
                        If MDue > 0 Then
                            A_CP_PastDueAmt.Text = "Payments Past Due : " & FormatCurrency(CDbl(MonthlyPmtLabel.Text) * MDue)
                            AmtDue = AmtDue + (CDbl(MonthlyPmtLabel.Text) * MDue)
                            A_CP_CurrLC.Text = "Current Late Charges : " & FormatCurrency(CDbl(LCAmountLabel.Text) * MDue)
                            AmtDue = AmtDue + (CDbl(LCAmountLabel.Text) * MDue)
                        Else
                            A_CP_PastDueAmt.Text = " "
                            A_CP_CurrLC.Text = " "
                        End If
                        Dim sqlConn As New System.Data.SqlClient.SqlConnection
                        Dim sqlComm As New System.Data.SqlClient.SqlCommand
                        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
                        sqlConn.Open()
                        sqlComm.Connection = sqlConn
                        sqlComm.CommandText = "Select Sum(ToFees) From Payments Where ([LoanID] = '" & Session("LoanNo") & "')"
                        If Not IsDBNull(sqlComm.ExecuteScalar) Then
                            Dim FeeBal As Double
                            FeeBal = sqlComm.ExecuteScalar.ToString.Trim
                            If FeeBal < 0 Then
                                A_CP_PastDueFee.Text = "Past Due Fees : " & FormatCurrency(-FeeBal)
                                AmtDue = AmtDue + -FeeBal
                            Else
                                A_CP_PastDueFee.Text = " "
                            End If
                        Else
                            A_CP_PastDueFee.Text = " "
                        End If
                        sqlConn.Close()
                        A_CP_TotalDue.Text = "Grand Total Due : " & FormatCurrency(AmtDue)
                        Dim QueryString As String
                        Dim UplnTotal As Double = 0
                        Dim UplnText As String = ""
                        QueryString = "SELECT Payments.LoanID, Payments.UplnFundsCode, SUM(Payments.ToUnpl) AS Expr1, UnplFundCodes.UplnFundsDesp FROM Payments LEFT OUTER JOIN UnplFundCodes ON Payments.UplnFundsCode = UnplFundCodes.UplnFundsCode GROUP BY Payments.LoanID, Payments.UplnFundsCode, UnplFundCodes.UplnFundsDesp HAVING (SUM(Payments.ToUnpl) <> 0) AND (Payments.LoanID = '" & Session("LoanNo") & "') ORDER BY UnplFundCodes.UplnFundsDesp, Payments.UplnFundsCode"
                        Using Connection As New System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString)
                            Dim Command As New System.Data.SqlClient.SqlCommand(QueryString, Connection)
                            Connection.Open()
                            Dim Reader As System.Data.SqlClient.SqlDataReader = Command.ExecuteReader()
                            While Reader.Read()
                                If IsDBNull(Reader(3)) = True Then
                                    If IsDBNull(Reader(1)) = False Then
                                        UplnText = UplnText & "<tr align=center><td>Miscoded</td><td>" & Reader(1) & "</td><td>" & FormatCurrency(Reader(2)) & "</td></tr>"
                                    Else
                                        UplnText = UplnText & "<tr align=center><td>Uncoded</td><td></td><td>" & FormatCurrency(Reader(2)) & "</td></tr>"
                                    End If
                                Else
                                    UplnText = UplnText & "<tr align=center><td>" & Reader(3) & "</td><td>" & Reader(1) & "</td><td>" & FormatCurrency(Reader(2)) & "</td></tr>"
                                End If
                                UplnTotal = UplnTotal + CDbl(Reader(2))
                            End While
                            Reader.Close()
                            Connection.Close()
                        End Using
                        If UplnTotal <> 0 Then
                            UplnFunds.Text = "Unapplied Funds :<table width=100%><th>Description</th><th>Code</th><th>Balance</th></tr>"
                            UplnFunds.Text = UplnFunds.Text & UplnText
                            UplnFunds.Text = UplnFunds.Text & "<tr><td colspan=2 align=right><b>Grand Total >>></b></td><td align=center>" & FormatCurrency(UplnTotal) & "</td></tr></table>"
                        Else
                            UplnFunds.Text = ""
                        End If
                    Case 2 ' Payoff Screen
                        If PayoffDate.Text = "" Then
                            If Day(Now) > 20 Then
                                PayoffDate.Text = DateSerial(Year(Now()), Month(Now()) + 2, Day(CDate(GetDataText("CurrPmtDue"))))
                            Else
                                PayoffDate.Text = DateSerial(Year(Now()), Month(Now()) + 1, Day(CDate(GetDataText("CurrPmtDue"))))
                            End If
                        End If
                        CalcPayoff()
                End Select
            Case 2 ' Borrower Details
            Case 3 ' Loan Details
                Select Case TabContainer3.ActiveTabIndex
                    Case 0 ' Overview
                    Case 1 ' Notes
                        Notes_Alert.Visible = False
                        Notes_Add_Note.Text = ""
                        View_Notes.SetActiveView(Notes_View)
                        Notes_Grid.DataBind()
                End Select
            Case 4 ' Research Cases

            Case 5 ' Loan Documents
        End Select
    End Sub

    Protected Sub TabContainer1_ActiveTabChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles TabContainer1.ActiveTabChanged
        Select Case TabContainer1.ActiveTabIndex
            Case 0 ' Recent Activity
                RefAllItems()
            Case 1 ' Payment Details
                TabContainer2.ActiveTabIndex = 0
            Case 2 ' Borrower Details
            Case 3 ' Loan Details
                TabContainer3.ActiveTabIndex = 0
                RefAllItems()
            Case 4 ' Research Cases
                View_Research.ActiveViewIndex = 0
                RefAllItems()
            Case 5 ' Loan Documents
        End Select
    End Sub

    Protected Sub LinkButton4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton4.Click
        TabContainer1.ActiveTabIndex = 3
        TabContainer3.ActiveTabIndex = 1
    End Sub

    Protected Sub LinkButton5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton5.Click
        TabContainer1.ActiveTabIndex = 1
        TabContainer2.ActiveTabIndex = 0
    End Sub

    Protected Sub LinkButton6_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton6.Click

    End Sub
   
    Protected Sub PayoffDate_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles PayoffDate.TextChanged
        CalcPayoff()
    End Sub

    Public Sub CalcPayoff()
        Payoff_Error.Visible = False
        Payoff_PerSent.Visible = False
        Payoff_Ordered.Visible = False
        Payoff_Alert.Text = ""
        Payoff_NextPmtDue.Text = ""
        Payoff_PrinBal.Text = ""
        Payoff_NegEscrow.Text = ""
        Payoff_PerDiem.Text = ""
        Payoff_InterestDue.Text = ""
        Payoff_TotalPayoff.Text = ""
        Payoff_UnpaidFees.Text = ""
        Payoff_LastOrder.Text = ""

        If GetDataText("CurrBalance") = 0 Then
            Payoff_Alert.Text = "Loan is at Zero balance, No payoff can be ordered."
            Payoff_Error.Visible = True
            Exit Sub
        End If
        If CDate(PayoffDate.Text) > Now() Then
            Dim LastOrderDate As String = SQL_Codes.RunCommandGet("SELECT OrderedOn FROM DocsOrdered GROUP BY LoanNo, DocID, OrderedOn HAVING (LoanNo = '" & Session("LoanNo") & "') AND (DocID = 9) ORDER BY OrderedOn DESC")
            If LastOrderDate = "" Then
                Payoff_LastOrder.Text = "N/A"
            Else
                Dim LastOrderD As Date = FormatDateTime(LastOrderDate, DateFormat.ShortDate)
                If LastOrderD = Now.Date Then
                    'Payoff_Alert.Text = "Payoff already ordered today."
                    Payoff_PerSent.Visible = True
                End If
                Payoff_LastOrder.Text = LastOrderDate
            End If
            Payoff_NextPmtDue.Text = FormatDateTime(GetDataText("CurrPmtDue"), DateFormat.ShortDate)
            Payoff_PrinBal.Text = FormatCurrency(GetDataText("CurrBalance"))
            Payoff_NegEscrow.Text = FormatCurrency(0)
            Dim CRate As Double = GetDataText("IntRate")
            Payoff_PerDiem.Text = FormatCurrency((((CRate / 100 / 365)) * CDbl(GetDataText("CurrBalance"))), 4)
            Payoff_InterestDue.Text = FormatCurrency((((CRate / 100 / 365)) * CDbl(GetDataText("CurrBalance"))) * (DateDiff(DateInterval.Day, CDate(Payoff_NextPmtDue.Text), CDate(PayoffDate.Text))))
            Dim MDue As String
            MDue = DateDiff(DateInterval.Month, CDate(Payoff_NextPmtDue.Text), Now())
            If MDue > 0 Then
                Dim LCAmountLabel As Label = FormView1.FindControl("LCAmountLabel")
                Payoff_LCDue.Text = FormatCurrency(CDbl(LCAmountLabel.Text) * MDue)
            Else
                Payoff_LCDue.Text = FormatCurrency(0)
            End If
            Dim sqlConn As New System.Data.SqlClient.SqlConnection
            Dim sqlComm As New System.Data.SqlClient.SqlCommand
            sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
            sqlConn.Open()
            sqlComm.Connection = sqlConn
            sqlComm.CommandText = "Select Sum(ToFees) From Payments Where ([LoanID] = '" & Session("LoanNo") & "')"
            If Not IsDBNull(sqlComm.ExecuteScalar) Then
                Dim FeeBal As Double
                FeeBal = sqlComm.ExecuteScalar.ToString.Trim
                If FeeBal < 0 Then
                    Payoff_UnpaidFees.Text = FormatCurrency(-FeeBal)
                Else
                    Payoff_UnpaidFees.Text = FormatCurrency(0)
                End If
            Else
                Payoff_UnpaidFees.Text = FormatCurrency(0)
            End If
            sqlConn.Close()
            Payoff_TotalPayoff.Text = FormatCurrency(CDbl(Payoff_PrinBal.Text) + CDbl(Payoff_NegEscrow.Text) + CDbl(Payoff_InterestDue.Text) + CDbl(Payoff_LCDue.Text) + CDbl(Payoff_UnpaidFees.Text))
        Else
            Payoff_Alert.Text = "Payoff date must be greater then today."
            Payoff_Error.Visible = True
            PayoffDate.Focus()
        End If
    End Sub

    Protected Sub ImageButton5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton5.Click
        CalcPayoff()
        If Payoff_Alert.Text = "" Then
            Dim PostDateTime As DateTime = Now()
            SQL_Codes.RunCommand("INSERT INTO DocsOrdered (DocID, DocLine, LoanNo, OrderedOn, OrderedBy, Value) VALUES (9,180,'" & Session("LoanNo") & "','" & PostDateTime & "','" & Session("User") & "','" & SQL_Codes.GetData("Loans", "B1_First", "LoanID", Session("LoanNo")) & "')")
            SQL_Codes.RunCommand("INSERT INTO DocsOrdered (DocID, DocLine, LoanNo, OrderedOn, OrderedBy, Value) VALUES (9,181,'" & Session("LoanNo") & "','" & PostDateTime & "','" & Session("User") & "','" & SQL_Codes.GetData("Loans", "B1_Middle", "LoanID", Session("LoanNo")) & "')")
            SQL_Codes.RunCommand("INSERT INTO DocsOrdered (DocID, DocLine, LoanNo, OrderedOn, OrderedBy, Value) VALUES (9,182,'" & Session("LoanNo") & "','" & PostDateTime & "','" & Session("User") & "','" & SQL_Codes.GetData("Loans", "B1_Last", "LoanID", Session("LoanNo")) & "')")
            SQL_Codes.RunCommand("INSERT INTO DocsOrdered (DocID, DocLine, LoanNo, OrderedOn, OrderedBy, Value) VALUES (9,183,'" & Session("LoanNo") & "','" & PostDateTime & "','" & Session("User") & "','" & SQL_Codes.GetData("Loans", "B1_Suf", "LoanID", Session("LoanNo")) & "')")
            SQL_Codes.RunCommand("INSERT INTO DocsOrdered (DocID, DocLine, LoanNo, OrderedOn, OrderedBy, Value) VALUES (9,184,'" & Session("LoanNo") & "','" & PostDateTime & "','" & Session("User") & "','" & SQL_Codes.GetData("Loans", "B2_First", "LoanID", Session("LoanNo")) & "')")
            SQL_Codes.RunCommand("INSERT INTO DocsOrdered (DocID, DocLine, LoanNo, OrderedOn, OrderedBy, Value) VALUES (9,185,'" & Session("LoanNo") & "','" & PostDateTime & "','" & Session("User") & "','" & SQL_Codes.GetData("Loans", "B2_Middle", "LoanID", Session("LoanNo")) & "')")
            SQL_Codes.RunCommand("INSERT INTO DocsOrdered (DocID, DocLine, LoanNo, OrderedOn, OrderedBy, Value) VALUES (9,186,'" & Session("LoanNo") & "','" & PostDateTime & "','" & Session("User") & "','" & SQL_Codes.GetData("Loans", "B2_Last", "LoanID", Session("LoanNo")) & "')")
            SQL_Codes.RunCommand("INSERT INTO DocsOrdered (DocID, DocLine, LoanNo, OrderedOn, OrderedBy, Value) VALUES (9,187,'" & Session("LoanNo") & "','" & PostDateTime & "','" & Session("User") & "','" & SQL_Codes.GetData("Loans", "B2_Suf", "LoanID", Session("LoanNo")) & "')")
            SQL_Codes.RunCommand("INSERT INTO DocsOrdered (DocID, DocLine, LoanNo, OrderedOn, OrderedBy, Value) VALUES (9,188,'" & Session("LoanNo") & "','" & PostDateTime & "','" & Session("User") & "','" & SQL_Codes.GetData("Loans", "Address1", "LoanID", Session("LoanNo")) & "')")
            SQL_Codes.RunCommand("INSERT INTO DocsOrdered (DocID, DocLine, LoanNo, OrderedOn, OrderedBy, Value) VALUES (9,189,'" & Session("LoanNo") & "','" & PostDateTime & "','" & Session("User") & "','" & SQL_Codes.GetData("Loans", "Address2", "LoanID", Session("LoanNo")) & "')")
            SQL_Codes.RunCommand("INSERT INTO DocsOrdered (DocID, DocLine, LoanNo, OrderedOn, OrderedBy, Value) VALUES (9,190,'" & Session("LoanNo") & "','" & PostDateTime & "','" & Session("User") & "','" & SQL_Codes.GetData("Loans", "City", "LoanID", Session("LoanNo")) & "')")
            SQL_Codes.RunCommand("INSERT INTO DocsOrdered (DocID, DocLine, LoanNo, OrderedOn, OrderedBy, Value) VALUES (9,191,'" & Session("LoanNo") & "','" & PostDateTime & "','" & Session("User") & "','" & SQL_Codes.GetData("Loans", "State", "LoanID", Session("LoanNo")) & "')")
            SQL_Codes.RunCommand("INSERT INTO DocsOrdered (DocID, DocLine, LoanNo, OrderedOn, OrderedBy, Value) VALUES (9,192,'" & Session("LoanNo") & "','" & PostDateTime & "','" & Session("User") & "','" & SQL_Codes.GetData("Loans", "Zip", "LoanID", Session("LoanNo")) & "')")
            SQL_Codes.RunCommand("INSERT INTO DocsOrdered (DocID, DocLine, LoanNo, OrderedOn, OrderedBy, Value) VALUES (9,198,'" & Session("LoanNo") & "','" & PostDateTime & "','" & Session("User") & "','" & Session("LoanNo") & "')")
            SQL_Codes.RunCommand("INSERT INTO DocsOrdered (DocID, DocLine, LoanNo, OrderedOn, OrderedBy, Value) VALUES (9,199,'" & Session("LoanNo") & "','" & PostDateTime & "','" & Session("User") & "','" & PayoffDate.Text & "')")
            SQL_Codes.RunCommand("INSERT INTO DocsOrdered (DocID, DocLine, LoanNo, OrderedOn, OrderedBy, Value) VALUES (9,200,'" & Session("LoanNo") & "','" & PostDateTime & "','" & Session("User") & "','" & Payoff_PrinBal.Text & "')")
            SQL_Codes.RunCommand("INSERT INTO DocsOrdered (DocID, DocLine, LoanNo, OrderedOn, OrderedBy, Value) VALUES (9,201,'" & Session("LoanNo") & "','" & PostDateTime & "','" & Session("User") & "','" & Payoff_InterestDue.Text & "')")
            SQL_Codes.RunCommand("INSERT INTO DocsOrdered (DocID, DocLine, LoanNo, OrderedOn, OrderedBy, Value) VALUES (9,202,'" & Session("LoanNo") & "','" & PostDateTime & "','" & Session("User") & "','" & Payoff_PerDiem.Text & "')")
            SQL_Codes.RunCommand("INSERT INTO DocsOrdered (DocID, DocLine, LoanNo, OrderedOn, OrderedBy, Value) VALUES (9,203,'" & Session("LoanNo") & "','" & PostDateTime & "','" & Session("User") & "','" & Payoff_UnpaidFees.Text & "')")
            SQL_Codes.RunCommand("INSERT INTO DocsOrdered (DocID, DocLine, LoanNo, OrderedOn, OrderedBy, Value) VALUES (9,204,'" & Session("LoanNo") & "','" & PostDateTime & "','" & Session("User") & "','" & Payoff_LCDue.Text & "')")
            SQL_Codes.RunCommand("INSERT INTO DocsOrdered (DocID, DocLine, LoanNo, OrderedOn, OrderedBy, Value) VALUES (9,205,'" & Session("LoanNo") & "','" & PostDateTime & "','" & Session("User") & "','0')")
            SQL_Codes.RunCommand("INSERT INTO DocsOrdered (DocID, DocLine, LoanNo, OrderedOn, OrderedBy, Value) VALUES (9,206,'" & Session("LoanNo") & "','" & PostDateTime & "','" & Session("User") & "','" & Payoff_TotalPayoff.Text & "')")
            Dim DocName As String = SQL_Codes.GetData("Docs", "DocName", "DocID", "9")
            SQL_Codes.RunCommand("INSERT INTO Notes (LoanID, Priority, Dept, NoteDateTime, Note, EnteredBy) VALUES('" & Session("LoanNo") & "','0','10','" & Now.Date & "','Ordered - " & DocName & "','" & Session("User") & "')")
            Payoff_Ordered.Visible = True
        Else
            Payoff_Error.Visible = True
        End If
    End Sub

    Protected Sub CaseGrid_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CaseGrid.SelectedIndexChanged
        View_Research.ActiveViewIndex = 1
        CaseNotesGrid.DataBind()
        CaseViewID.Text = CaseGrid.SelectedValue.ToString.Trim & " | " & CaseGrid.SelectedDataKey(1).ToString.Trim
        CaseViewID1.Text = CaseGrid.SelectedValue.ToString.Trim & " | " & CaseGrid.SelectedDataKey(1).ToString.Trim
        'Build Current Details
        Dim FollowUpDate = SQL_Codes.GetData("Case_Status", "FollowUpDate", "CaseNumber", CaseGrid.SelectedValue)
        Dim PromiseDate = SQL_Codes.GetData("Case_Status", "PromiseDate", "CaseNumber", CaseGrid.SelectedValue)
        Dim AssignedTeller = SQL_Codes.GetData("Case_Status", "AssignedTeller", "CaseNumber", CaseGrid.SelectedValue)
        Dim CloseTeller = SQL_Codes.GetData("Case_Status", "CloseTeller", "CaseNumber", CaseGrid.SelectedValue)
        Dim CloseDate = SQL_Codes.GetData("Case_Status", "CloseDate", "CaseNumber", CaseGrid.SelectedValue)
        Dim Status = SQL_Codes.GetData("Case_Status", "Status", "CaseNumber", CaseGrid.SelectedValue)
        CurrentCaseDetails.Text = "<table width=100%>"
        CurrentCaseDetails.Text = CurrentCaseDetails.Text & "<tr><td>Promise Date</td><td>" & FormatDateTime(PromiseDate, DateFormat.ShortDate) & "</td>"
        CurrentCaseDetails.Text = CurrentCaseDetails.Text & "<td>Follow-Up Date</td><td>" & FormatDateTime(FollowUpDate, DateFormat.ShortDate) & "</td></tr>"
        If AssignedTeller = 0 Then
            CurrentCaseDetails.Text = CurrentCaseDetails.Text & "<tr><td>Not Currenly Assigned</td><td></td>"
            IB_SelfAssign.Visible = True
            IB_SelfReAssign.Visible = False
        Else
            CurrentCaseDetails.Text = CurrentCaseDetails.Text & "<tr><td>Assigned Teller</td><td>" & AssignedTeller & " (" & SQL_Codes.GetData("Users", "Name", "TellerID", AssignedTeller) & ")</td>"
            IB_SelfAssign.Visible = False
            IB_SelfReAssign.Visible = True
        End If
        If Status = "O" Then
            ImageButton6.Visible = True
            ImageButton7.Visible = True
            IB_CloseCasae.Visible = True
            CurrentCaseDetails.Text = CurrentCaseDetails.Text & "<td>Case Status</td><td>Opened</td></tr>"
        Else
            ImageButton6.Visible = False
            ImageButton7.Visible = False
            IB_CloseCasae.Visible = False
            CurrentCaseDetails.Text = CurrentCaseDetails.Text & "<td>Case Status</td><td>Closed</td></tr>"
            CurrentCaseDetails.Text = CurrentCaseDetails.Text & "<tr><td>Closed By</td><td>" & CloseTeller & " (" & SQL_Codes.GetData("Users", "Name", "TellerID", CloseTeller) & ")</td>"
            CurrentCaseDetails.Text = CurrentCaseDetails.Text & "<td>Closed On</td><td>" & FormatDateTime(CloseDate, DateFormat.ShortDate) & "</td></tr>"
        End If
        CurrentCaseDetails.Text = CurrentCaseDetails.Text & "</table>"
        ImageButton6.OnClientClick = "window.open('/WebSite/Loan/ALS/Cases/AddNewCaseNotes.aspx?LoanNo=" & Session("LoanNo") & "&CaseID=" & CaseGrid.SelectedValue.ToString.Trim & "',null,'height=300, width=300,status= no, resizable= Yes, scrollbars=yes, toolbar=no,location=no,menubar=no ');"
        ImageButton7.OnClientClick = "window.open('/WebSite/Loan/ALS/Cases/AddNewCaseNotes.aspx?LoanNo=" & Session("LoanNo") & "&CaseID=" & CaseGrid.SelectedValue.ToString.Trim & "',null,'height=300, width=300,status= no, resizable= Yes, scrollbars=yes, toolbar=no,location=no,menubar=no ');"
        IB_CloseCasae.OnClientClick = "window.open('/WebSite/Loan/ALS/Cases/CloseCase.aspx?LoanNo=" & Session("LoanNo") & "&CaseID=" & CaseGrid.SelectedValue.ToString.Trim & "',null,'height=300, width=300,status= no, resizable= Yes, scrollbars=yes, toolbar=no,location=no,menubar=no ');"
    End Sub

    Protected Sub CaseNotesGrid_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CaseNotesGrid.SelectedIndexChanged
        GridView2.DataBind()
        If GridView2.Rows.Count <> 0 Then
            View_Research.ActiveViewIndex = 2
        End If
    End Sub

    Protected Sub GoBackToResearchCases_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles GoBackToResearchCases.Click
        View_Research.ActiveViewIndex = 0
    End Sub
    Protected Sub GoBackToCaseNotes_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles GoBackToCaseNotes.Click
        View_Research.ActiveViewIndex = 1
    End Sub
    Protected Sub IB_SelfAssign_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IB_SelfAssign.Click, IB_SelfReAssign.Click
        Dim CurPegTime As DateTime
        CurPegTime = Now()
        Dim AssignedTeller = SQL_Codes.GetData("Case_Status", "AssignedTeller", "CaseNumber", CaseGrid.SelectedValue)
        Dim Teller = SQL_Codes.GetData("Users", "TellerID", "Username", Session("User"))
        If AssignedTeller <> Teller Then
            SQL_Codes.RunCommand("INSERT INTO Case_Notes_Entrys (NoteAdded, CaseID, AddedBy, Description) " & _
                                 "VALUES ('" & CurPegTime & "','" & CaseGrid.SelectedValue & "','" & Session("User") & "','Case Assignment Changed From " & AssignedTeller & " to " & Teller & "')")
            SQL_Codes.UpdateData("Case_Status", "AssignedTeller", Teller, "CaseNumber", CaseGrid.SelectedValue)
            CaseGrid_SelectedIndexChanged(sender, e)
        End If
    End Sub
End Class
