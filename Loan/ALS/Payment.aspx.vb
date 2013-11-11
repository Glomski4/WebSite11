
Partial Class Payment
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Search1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Search1.Click
        Alert1.Visible = False
        If Len(LoanNo.Text) = 0 Then
            Alert1.Visible = True
            Exit Sub
        End If
        SqlDataSource1.SelectCommand = "SELECT LoanID, B1_First, B1_Last, B1_SSN, B2_First, B2_Last, B2_SSN, MonthlyPmt, Type FROM Loans Where (LoanID='" & LoanNo.Text & "') and (L_Status = 'A')"
        SqlDataSource1.DataBind()
        GridView1.DataBind()
        Wizard1.ActiveStepIndex = 1
    End Sub

    Protected Sub LinkButton3_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Wizard1.ActiveStepIndex = 0
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        Wizard1.ActiveStepIndex = 2
    End Sub

    Protected Sub Search2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Search2.Click
        Alert2.Visible = False
        If Len(SSN.Text) = 0 Then
            Alert2.Visible = True
            Exit Sub
        End If
        SqlDataSource1.SelectCommand = "SELECT LoanID, B1_First, B1_Last, B1_SSN, B2_First, B2_Last, B2_SSN, MonthlyPmt, Type FROM Loans Where (B1_SSN='" & SSN.Text & "') and (L_Status = 'A') or (B2_SSN='" & SSN.Text & "') and (L_Status = 'A')"
        SqlDataSource1.DataBind()
        GridView1.DataBind()
        Wizard1.ActiveStepIndex = 1
    End Sub

    Protected Sub Search3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Search3.Click
        Alert3.Visible = False
        If Len(FirstName.Text) = 0 Or Len(LastName.Text) = 0 Then
            Alert3.Visible = True
            Exit Sub
        End If
        SqlDataSource1.SelectCommand = "SELECT LoanID, B1_First, B1_Last, B1_SSN, B2_First, B2_Last, B2_SSN, MonthlyPmt, Type FROM Loans WHERE (B1_First LIKE '%" & FirstName.Text & "%') AND (B1_Last LIKE '%" & LastName.Text & "%')  and (L_Status = 'A') OR (B2_First LIKE '%" & FirstName.Text & "%') AND (B2_Last LIKE '%" & LastName.Text & "%')  and (L_Status = 'A')"
        SqlDataSource1.DataBind()
        GridView1.DataBind()
        Wizard1.ActiveStepIndex = 1
    End Sub

    Protected Sub Wizard1_ActiveStepChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Wizard1.ActiveStepChanged
        If Wizard1.ActiveStepIndex = 2 Then
            CheckBoxList1.Items.Clear()
            EffDate.Text = Format(Now(), "MM/dd/yyyy")
            Dim sqlConn As New System.Data.SqlClient.SqlConnection
            Dim sqlComm As New System.Data.SqlClient.SqlCommand
            sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
            sqlConn.Open()
            sqlComm.Connection = sqlConn
            Dim LoanNo As String = GridView1.SelectedValue
            Dim LCAmt, MthPmt As Double
            Dim MDue, DueDate As String
            sqlComm.CommandText = "Select LCAmount From Loans Where ([LoanID] = '" & LoanNo & "')"
            LCAmt = sqlComm.ExecuteScalar
            sqlComm.CommandText = "Select MonthlyPmt From Loans Where ([LoanID] = '" & LoanNo & "')"
            MthPmt = sqlComm.ExecuteScalar
            T_Due.Text = FormatCurrency(CDbl(MthPmt))
            sqlComm.CommandText = "Select CurrPmtDue From Loans Where ([LoanID] = '" & LoanNo & "')"
            DueDate = sqlComm.ExecuteScalar
            MDue = DateDiff(DateInterval.Month, CDate(DueDate), Now())
            If MDue > 0 Then
                CheckBoxList1.Items.Add("Payments Past Due : " & FormatCurrency(CDbl(MthPmt) * MDue))
                CheckBoxList1.Items(0).Selected = True
                T_Due.Text = FormatCurrency(CDbl(T_Due.Text) + (CDbl(MthPmt) * MDue))
                CheckBoxList1.Items.Add("Late Charges : " & FormatCurrency(CDbl(LCAmt) * MDue))
                T_Due.Text = FormatCurrency(CDbl(T_Due.Text) + (CDbl(LCAmt) * MDue))
                CheckBoxList1.Items(1).Selected = True
            Else
                CheckBoxList1.Items.Add("Payments Past Due : " & FormatCurrency(0))
                CheckBoxList1.Items.Add("Late Charges : " & FormatCurrency(0))
            End If
            CheckBoxList1.Items.Add("Current Payment : " & FormatCurrency(CDbl(MthPmt)))
            CheckBoxList1.Items(2).Selected = True
            sqlComm.CommandText = "Select Sum(ToFees) From Payments Where ([LoanID] = '" & LoanNo & "')"
            If Not IsDBNull(sqlComm.ExecuteScalar) Then
                Dim FeeBal As Double
                FeeBal = sqlComm.ExecuteScalar
                If FeeBal < 0 Then
                    CheckBoxList1.Items.Add("Fees Due : " & FormatCurrency(-FeeBal))
                    T_Due.Text = FormatCurrency(CDbl(T_Due.Text) + FeeBal)
                    CheckBoxList1.Items(3).Selected = True
                Else
                    CheckBoxList1.Items.Add("Fees Due: " & FormatCurrency(0))
                End If
            Else
                CheckBoxList1.Items.Add("Fees Due: " & FormatCurrency(0))
            End If
            sqlConn.Close()
        ElseIf Wizard1.ActiveStepIndex = 4 Then ' Check Pmt
            If APA.Text <> "" Then
                P_Check_Amount.Text = FormatCurrency(APA.Text)
            Else
                Dim PmtAmount As Double = 0
                For Each Item As ListItem In CheckBoxList1.Items
                    Dim NewAmount As Double = 0
                    If Item.Selected = True Then
                        For X = 1 To Len(Item.Value)
                            If Right(Item.Value, X) Like "$*" Then
                                NewAmount = Right(Item.Value, X)
                                Exit For
                            End If
                        Next
                        PmtAmount = PmtAmount + CDbl(NewAmount)
                    End If
                Next
                P_Check_Amount.Text = FormatCurrency(PmtAmount)
            End If
            P_Check_Date.Text = EffDate.Text
            P_Check_From.Focus()
        ElseIf Wizard1.ActiveStepIndex = 5 Then ' Cash Pmt
            If APA.Text <> "" Then
                P_Cash_Amount.Text = FormatCurrency(APA.Text)
            Else
                Dim PmtAmount As Double = 0
                For Each Item As ListItem In CheckBoxList1.Items
                    Dim NewAmount As Double = 0
                    If Item.Selected = True Then
                        For X = 1 To Len(Item.Value)
                            If Right(Item.Value, X) Like "$*" Then
                                NewAmount = Right(Item.Value, X)
                                Exit For
                            End If
                        Next
                        PmtAmount = PmtAmount + CDbl(NewAmount)
                    End If
                Next
                P_Cash_Amount.Text = FormatCurrency(PmtAmount)
            End If
            P_Cash_Date.Text = EffDate.Text
            Button2.Focus()
        End If
    End Sub

    Protected Sub CheckBoxList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxList2.SelectedIndexChanged
        Wizard1.ActiveStepIndex = CheckBoxList2.SelectedValue
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        'Post Check Payment
        PostPmt("Check# " & P_Check_Number.Text & " | " & P_Check_From.Text.Trim)
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        'Post Cash Payment
        PostPmt("Cash")
    End Sub

    Public ErrorOutText As String = ""

    Public Sub PostPmt(ByVal Desc As String)
        On Error GoTo ErrorOut
        'If My.Computer.FileSystem.FileExists(My.Request.PhysicalApplicationPath & "\Loan\Officer\PDFs\PostingText" & Now.Ticks & ".pdf") = True Then
        '    My.Computer.FileSystem.DeleteFile(My.Request.PhysicalApplicationPath & "\Loan\Officer\PDFs\ErrorOutText.pdf", FileIO.UIOption.OnlyErrorDialogs, FileIO.RecycleOption.DeletePermanently)
        'End If
        Dim Tick As String
        Tick = Now.Ticks.ToString
        HyperLink1.NavigateUrl = "~\Loan\Officer\PDFs\PostingText" & Tick & ".pdf"
        Dim PmtAmt As Double = 0
        Dim LoanNo As String = GridView1.SelectedValue
        Dim PEffDate As Date = CDate(EffDate.Text)
        Dim LCAmt, MthPmt, P_Int, P_Prin As Double
        Dim MDue, DueDate As String
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        ErrorOutText += "! ! YOU MUST PRINT THIS REPORT ! !" & vbNewLine & vbNewLine
        ErrorOutText += "" & vbNewLine
        ErrorOutText += "There was an error with the payment that you tried to post.  " & vbNewLine
        ErrorOutText += "Please have an audit done as some payments may have posted on the account in question. " & vbNewLine
        ErrorOutText += "DO NOT JUST RETRY YOUR PAYMENT" & vbNewLine
        ErrorOutText += "BEFORE THE AUDIT IS DONE!!" & vbNewLine & vbNewLine
        ErrorOutText += "Starting Info; " & vbNewLine
        ErrorOutText += "              Start Time = '" & Now() & vbNewLine
        ErrorOutText += "              CurrBalance = '" & GetDataText("CurrBalance") & vbNewLine
        ErrorOutText += "              CurrPmtDue = '" & GetDataText("CurrPmtDue") & vbNewLine
        ErrorOutText += "              LastPmtPosted = '" & GetDataText("LastPmtPosted") & vbNewLine
        ErrorOutText += "              NoPmtsLeft = '" & GetDataText("NoPmtsLeft") & vbNewLine & vbNewLine
        PmtAmt = 0
        If APA.Text <> "" Then
            PmtAmt = CDbl(APA.Text)
        Else
            For Each Item As ListItem In CheckBoxList1.Items
                If Item.Selected = True Then
                    For X = 1 To Len(Item.Value)
                        If Right(Item.Value, X) Like "$*" Then
                            PmtAmt = CDbl(Right(Item.Value, X)) + PmtAmt
                            Exit For
                        End If
                    Next
                End If
            Next
        End If
        ErrorOutText += Session("User") & " - " & LoanNo & " - " & Left(Desc, 50) & " - " & FormatCurrency(PmtAmt) & vbNewLine & vbNewLine
        PmtAmt = 0

        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.Connection = sqlConn
        If APA.Text <> "" Then ' Self Posting
            PmtAmt = CDbl(APA.Text)
            Do Until PmtAmt = 0
                PmtAmt = CDbl(Math.Round(PmtAmt, 2))
                sqlComm.CommandText = "Select LCAmount From Loans Where ([LoanID] = '" & LoanNo & "')"
                LCAmt = sqlComm.ExecuteScalar
                sqlComm.CommandText = "Select MonthlyPmt From Loans Where ([LoanID] = '" & LoanNo & "')"
                MthPmt = sqlComm.ExecuteScalar
                sqlComm.CommandText = "Select CurrPmtDue From Loans Where ([LoanID] = '" & LoanNo & "')"
                DueDate = sqlComm.ExecuteScalar
                MDue = DateDiff(DateInterval.Month, CDate(DueDate), Now())
                If MDue >= 0 Then
                    If PmtAmt >= MthPmt Then
                        If GetDataText("LastPmtPosted") = "" Then
                            P_Int = -Math.Round(DateDiff(DateInterval.Day, PEffDate, CDate(GetDataText("OpenDate"))) * (((GetDataText("IntRate") / 100) / 365)) * GetDataText("CurrBalance"), 2)
                            P_Prin = Math.Round(GetDataText("MonthlyPmt") - P_Int, 2)
                            ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',1,'" & Left(Desc, 50) & "','" & P_Prin & "','" & P_Int & "',0,0,'" & Session("User") & "')" & vbNewLine & vbNewLine
                            sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',1,'" & Left(Desc, 50) & "','" & P_Prin & "','" & P_Int & "',0,0,'" & Session("User") & "')"
                            sqlComm.ExecuteScalar()
                            If -DateDiff(DateInterval.Day, PEffDate, CDate(GetDataText("CurrPmtDue"))) > CLng(GetDataText("LCDate")) Then
                                ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',3,'Late Charge',0,0,0," & -LCAmt & ",'Fee')" & vbNewLine & vbNewLine
                                sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',3,'Late Charge',0,0,0," & -LCAmt & ",'Fee')"
                                sqlComm.ExecuteScalar()
                            End If
                            ErrorOutText += "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - P_Prin) & "', CurrPmtDue = '" & DateAdd(DateInterval.Month, 1, CDate(GetDataText("CurrPmtDue"))) & "', LastPmtPosted = '" & PEffDate & "', NoPmtsLeft = '" & (CDbl(GetDataText("NoPmtsLeft")) - 1) & "' Where ([LoanID] = '" & LoanNo & "')" & vbNewLine & vbNewLine
                            sqlComm.CommandText = "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - P_Prin) & "', CurrPmtDue = '" & DateAdd(DateInterval.Month, 1, CDate(GetDataText("CurrPmtDue"))) & "', LastPmtPosted = '" & PEffDate & "', NoPmtsLeft = '" & (CDbl(GetDataText("NoPmtsLeft")) - 1) & "' Where ([LoanID] = '" & LoanNo & "')"
                            sqlComm.ExecuteScalar()
                            PmtAmt = Math.Round(PmtAmt - (P_Int + P_Prin), 2)
                        Else
                            P_Int = -Math.Round(DateDiff(DateInterval.Day, PEffDate, CDate(GetDataText("LastPmtPosted"))) * (((GetDataText("IntRate") / 100) / 365)) * GetDataText("CurrBalance"), 2)
                            P_Prin = Math.Round(GetDataText("MonthlyPmt") - P_Int, 2)
                            ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',1,'" & Left(Desc, 50) & "','" & P_Prin & "','" & P_Int & "',0,0,'" & Session("User") & "')" & vbNewLine & vbNewLine
                            sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',1,'" & Left(Desc, 50) & "','" & P_Prin & "','" & P_Int & "',0,0,'" & Session("User") & "')"
                            sqlComm.ExecuteScalar()
                            If -DateDiff(DateInterval.Day, PEffDate, CDate(GetDataText("CurrPmtDue"))) > CLng(GetDataText("LCDate")) Then
                                ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',3,'Late Charge',0,0,0," & -LCAmt & ",'Fee')" & vbNewLine & vbNewLine
                                sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',3,'Late Charge',0,0,0," & -LCAmt & ",'Fee')"
                                sqlComm.ExecuteScalar()
                            End If
                            ErrorOutText += "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - P_Prin) & "', CurrPmtDue = '" & DateAdd(DateInterval.Month, 1, CDate(GetDataText("CurrPmtDue"))) & "', LastPmtPosted = '" & PEffDate & "', NoPmtsLeft = '" & (CDbl(GetDataText("NoPmtsLeft")) - 1) & "' Where ([LoanID] = '" & LoanNo & "')" & vbNewLine & vbNewLine
                            sqlComm.CommandText = "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - P_Prin) & "', CurrPmtDue = '" & DateAdd(DateInterval.Month, 1, CDate(GetDataText("CurrPmtDue"))) & "', LastPmtPosted = '" & PEffDate & "', NoPmtsLeft = '" & (CDbl(GetDataText("NoPmtsLeft")) - 1) & "' Where ([LoanID] = '" & LoanNo & "')"
                            sqlComm.ExecuteScalar()
                            PmtAmt = Math.Round(PmtAmt - (P_Int + P_Prin), 2)
                        End If
                    Else
                        'sqlComm.CommandText = "Select Sum(ToFees) From Payments Where ([LoanID] = '" & LoanNo & "')"
                        'If Not IsDBNull(sqlComm.ExecuteScalar) Then
                        '    Dim FeeBal As Double
                        '    sqlComm.CommandText = "Select Sum(ToFees) From Payments Where ([LoanID] = '" & LoanNo & "')"
                        '    FeeBal = sqlComm.ExecuteScalar
                        '    If FeeBal < 0 Then
                        '        If -FeeBal < PmtAmt Then
                        '            ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',7,'Fee Charge Paid | " & Left(Desc, 32) & "',0,0,0,'" & -FeeBal & "','" & Session("User") & "')" & vbNewLine & vbNewLine
                        '            sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',7,'Fee Charge Paid | " & Left(Desc, 32) & "',0,0,0,'" & -FeeBal & "','" & Session("User") & "')"
                        '            sqlComm.ExecuteScalar()
                        '            PmtAmt = PmtAmt - -FeeBal
                        '        Else
                        '            ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',7,'Fee Charge Paid | " & Left(Desc, 32) & "',0,0,0,'" & PmtAmt & "','" & Session("User") & "')" & vbNewLine & vbNewLine
                        '            sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',7,'Fee Charge Paid | " & Left(Desc, 32) & "',0,0,0,'" & PmtAmt & "','" & Session("User") & "')"
                        '            sqlComm.ExecuteScalar()
                        '            PmtAmt = 0
                        '        End If
                        '        CheckBoxList1.Items.Add("Fees Due : " & FormatCurrency(-FeeBal))
                        '        T_Due.Text = FormatCurrency(CDbl(T_Due.Text) + FeeBal)
                        '        CheckBoxList1.Items(3).Selected = True
                        '    End If
                        '    ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',2,'Funds In | " & Left(Desc, 39) & "','" & PmtAmt & "',0,0,0,'" & Session("User") & "')" & vbNewLine & vbNewLine
                        '    sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',2,'Funds In | " & Left(Desc, 39) & "','" & PmtAmt & "',0,0,0,'" & Session("User") & "')"
                        '    sqlComm.ExecuteScalar()
                        '    ErrorOutText += "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - PmtAmt) & "', LastPmtPosted = '" & PEffDate & "' Where ([LoanID] = '" & LoanNo & "')" & vbNewLine & vbNewLine
                        '    sqlComm.CommandText = "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - PmtAmt) & "', LastPmtPosted = '" & PEffDate & "' Where ([LoanID] = '" & LoanNo & "')" & vbNewLine & vbNewLine
                        '    sqlComm.ExecuteScalar()
                        '    PmtAmt = 0
                        'Else
                        '    ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',2,'Funds In | " & Left(Desc, 39) & "','" & PmtAmt & "',0,0,0,'" & Session("User") & "')" & vbNewLine & vbNewLine
                        '    sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',2,'Funds In | " & Left(Desc, 39) & "','" & PmtAmt & "',0,0,0,'" & Session("User") & "')"
                        '    sqlComm.ExecuteScalar()
                        '    ErrorOutText += "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - PmtAmt) & "', LastPmtPosted = '" & PEffDate & "' Where ([LoanID] = '" & LoanNo & "')" & vbNewLine & vbNewLine
                        '    sqlComm.CommandText = "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - PmtAmt) & "', LastPmtPosted = '" & PEffDate & "' Where ([LoanID] = '" & LoanNo & "')" & vbNewLine & vbNewLine
                        '    sqlComm.ExecuteScalar()
                        '    PmtAmt = 0
                        'End If
                        Dim UnplFundsBalance = SQL_Codes.RunCommandGet("SELECT SUM(ToUnpl) AS TotalUpln FROM Payments GROUP BY LoanID, UplnFundsCode HAVING (LoanID = '" & LoanNo & "') AND (UplnFundsCode = 'P')")
                        If UnplFundsBalance = "Error" Then
                            ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy, UplnFundsCode) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',18,'Funds In | " & Left(Desc, 39) & "',0,0,'" & PmtAmt & "',0,'" & Session("User") & "','P')" & vbNewLine & vbNewLine
                            sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy, UplnFundsCode) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',18,'Funds In | " & Left(Desc, 39) & "',0,0,'" & PmtAmt & "',0,'" & Session("User") & "','P')"
                            sqlComm.ExecuteScalar()
                            PmtAmt = 0
                        ElseIf Math.Round(PmtAmt + CDbl(UnplFundsBalance), 2) >= MthPmt Then
                            Dim FromUpln As Double = Math.Round(PmtAmt - MthPmt, 2)
                            P_Int = -Math.Round(DateDiff(DateInterval.Day, PEffDate, CDate(GetDataText("LastPmtPosted"))) * (((GetDataText("IntRate") / 100) / 365)) * GetDataText("CurrBalance"), 2)
                            P_Prin = Math.Round(GetDataText("MonthlyPmt") - P_Int, 2)
                            ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy, UplnFundsCode) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',1,'" & Left(Desc, 50) & "','" & P_Prin & "','" & P_Int & "','" & FromUpln & "',0,'" & Session("User") & "','P')" & vbNewLine & vbNewLine
                            sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy, UplnFundsCode) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',1,'" & Left(Desc, 50) & "','" & P_Prin & "','" & P_Int & "','" & FromUpln & "',0,'" & Session("User") & "','P')"
                            sqlComm.ExecuteScalar()
                            If -DateDiff(DateInterval.Day, PEffDate, CDate(GetDataText("CurrPmtDue"))) > CLng(GetDataText("LCDate")) Then
                                ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',3,'Late Charge',0,0,0," & -LCAmt & ",'Fee')" & vbNewLine & vbNewLine
                                sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',3,'Late Charge',0,0,0," & -LCAmt & ",'Fee')"
                                sqlComm.ExecuteScalar()
                            End If
                            ErrorOutText += "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - P_Prin) & "', CurrPmtDue = '" & DateAdd(DateInterval.Month, 1, CDate(GetDataText("CurrPmtDue"))) & "', LastPmtPosted = '" & PEffDate & "', NoPmtsLeft = '" & (CDbl(GetDataText("NoPmtsLeft")) - 1) & "' Where ([LoanID] = '" & LoanNo & "')" & vbNewLine & vbNewLine
                            sqlComm.CommandText = "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - P_Prin) & "', CurrPmtDue = '" & DateAdd(DateInterval.Month, 1, CDate(GetDataText("CurrPmtDue"))) & "', LastPmtPosted = '" & PEffDate & "', NoPmtsLeft = '" & (CDbl(GetDataText("NoPmtsLeft")) - 1) & "' Where ([LoanID] = '" & LoanNo & "')"
                            sqlComm.ExecuteScalar()
                            PmtAmt = Math.Round(PmtAmt - ((P_Int + P_Prin) + FromUpln), 2)
                        Else
                            ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy, UplnFundsCode) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',18,'Funds In | " & Left(Desc, 39) & "',0,0,'" & PmtAmt & "',0,'" & Session("User") & "','P')" & vbNewLine & vbNewLine
                            sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy, UplnFundsCode) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',18,'Funds In | " & Left(Desc, 39) & "',0,0,'" & PmtAmt & "',0,'" & Session("User") & "','P')"
                            sqlComm.ExecuteScalar()
                            PmtAmt = 0
                        End If
                    End If
                Else
                    'If PmtAmt >= MthPmt Then
                    '    If GetDataText("LastPmtPosted") = "" Then
                    '        P_Int = -Math.Round(DateDiff(DateInterval.Day, PEffDate, CDate(GetDataText("OpenDate"))) * (((GetDataText("IntRate") / 100) / 365)) * GetDataText("CurrBalance"), 2)
                    '        P_Prin = Math.Round(GetDataText("MonthlyPmt") - P_Int, 2)
                    '        ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',1,'" & Left(Desc, 50) & "','" & P_Prin & "','" & P_Int & "',0,0,'" & Session("User") & "')" & vbNewLine & vbNewLine
                    '        sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',1,'" & Left(Desc, 50) & "','" & P_Prin & "','" & P_Int & "',0,0,'" & Session("User") & "')"
                    '        sqlComm.ExecuteScalar()
                    '        If -DateDiff(DateInterval.Day, PEffDate, CDate(GetDataText("CurrPmtDue"))) > CLng(GetDataText("LCDate")) Then
                    '            ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',3,'Late Charge',0,0,0," & -LCAmt & ",'Fee')" & vbNewLine & vbNewLine
                    '            sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',3,'Late Charge',0,0,0," & -LCAmt & ",'Fee')"
                    '            sqlComm.ExecuteScalar()
                    '        End If
                    '        ErrorOutText += "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - P_Prin) & "', CurrPmtDue = '" & DateAdd(DateInterval.Month, 1, CDate(GetDataText("CurrPmtDue"))) & "', LastPmtPosted = '" & PEffDate & "', NoPmtsLeft = '" & (CDbl(GetDataText("NoPmtsLeft")) - 1) & "' Where ([LoanID] = '" & LoanNo & "')" & vbNewLine & vbNewLine
                    '        sqlComm.CommandText = "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - P_Prin) & "', CurrPmtDue = '" & DateAdd(DateInterval.Month, 1, CDate(GetDataText("CurrPmtDue"))) & "', LastPmtPosted = '" & PEffDate & "', NoPmtsLeft = '" & (CDbl(GetDataText("NoPmtsLeft")) - 1) & "' Where ([LoanID] = '" & LoanNo & "')"
                    '        sqlComm.ExecuteScalar()
                    '        PmtAmt = Math.Round(PmtAmt - (P_Int + P_Prin), 2)
                    '    Else
                    '        P_Int = -Math.Round(DateDiff(DateInterval.Day, PEffDate, CDate(GetDataText("LastPmtPosted"))) * (((GetDataText("IntRate") / 100) / 365)) * GetDataText("CurrBalance"), 2)
                    '        P_Prin = Math.Round(GetDataText("MonthlyPmt") - P_Int, 2)
                    '        ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',1,'" & Left(Desc, 50) & "','" & P_Prin & "','" & P_Int & "',0,0,'" & Session("User") & "')" & vbNewLine & vbNewLine
                    '        sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',1,'" & Left(Desc, 50) & "','" & P_Prin & "','" & P_Int & "',0,0,'" & Session("User") & "')"
                    '        sqlComm.ExecuteScalar()
                    '        If -DateDiff(DateInterval.Day, PEffDate, CDate(GetDataText("CurrPmtDue"))) > CLng(GetDataText("LCDate")) Then
                    '            ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',3,'Late Charge',0,0,0," & -LCAmt & ",'Fee')" & vbNewLine & vbNewLine
                    '            sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',3,'Late Charge',0,0,0," & -LCAmt & ",'Fee')"
                    '            sqlComm.ExecuteScalar()
                    '        End If
                    '        ErrorOutText += "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - P_Prin) & "', CurrPmtDue = '" & DateAdd(DateInterval.Month, 1, CDate(GetDataText("CurrPmtDue"))) & "', LastPmtPosted = '" & PEffDate & "', NoPmtsLeft = '" & (CDbl(GetDataText("NoPmtsLeft")) - 1) & "' Where ([LoanID] = '" & LoanNo & "')" & vbNewLine & vbNewLine
                    '        sqlComm.CommandText = "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - P_Prin) & "', CurrPmtDue = '" & DateAdd(DateInterval.Month, 1, CDate(GetDataText("CurrPmtDue"))) & "', LastPmtPosted = '" & PEffDate & "', NoPmtsLeft = '" & (CDbl(GetDataText("NoPmtsLeft")) - 1) & "' Where ([LoanID] = '" & LoanNo & "')"
                    '        sqlComm.ExecuteScalar()
                    '        PmtAmt = Math.Round(PmtAmt - (P_Int + P_Prin), 2)
                    '    End If
                    'Else
                    sqlComm.CommandText = "Select Sum(ToFees) From Payments Where ([LoanID] = '" & LoanNo & "')"
                    If Not IsDBNull(sqlComm.ExecuteScalar) Then
                        Dim FeeBal As Double
                        FeeBal = sqlComm.ExecuteScalar
                        If FeeBal < 0 Then
                            If -FeeBal < PmtAmt Then
                                ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',7,'Fee Charge Paid | " & Left(Desc, 32) & "',0,0,0,'" & -FeeBal & "','" & Session("User") & "')" & vbNewLine & vbNewLine
                                sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',7,'Fee Charge Paid | " & Left(Desc, 32) & "',0,0,0,'" & -FeeBal & "','" & Session("User") & "')"
                                sqlComm.ExecuteScalar()
                                PmtAmt = PmtAmt - -FeeBal
                            Else
                                ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',7,'Fee Charge Paid | " & Left(Desc, 32) & "',0,0,0,'" & PmtAmt & "','" & Session("User") & "')" & vbNewLine & vbNewLine
                                sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',7,'Fee Charge Paid | " & Left(Desc, 32) & "',0,0,0,'" & PmtAmt & "','" & Session("User") & "')"
                                sqlComm.ExecuteScalar()
                                PmtAmt = 0
                            End If
                        Else
                            If GetDataText("LastPmtPosted") = "" Then
                                P_Int = -Math.Round(DateDiff(DateInterval.Day, PEffDate, CDate(GetDataText("OpenDate"))) * (((GetDataText("IntRate") / 100) / 365)) * GetDataText("CurrBalance"), 2)
                                P_Prin = Math.Round(PmtAmt - P_Int, 2)
                                ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',2,'" & Left(Desc, 50) & "','" & P_Prin & "','" & P_Int & "',0,0,'" & Session("User") & "')" & vbNewLine & vbNewLine
                                sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',2,'" & Left(Desc, 50) & "','" & P_Prin & "','" & P_Int & "',0,0,'" & Session("User") & "')"
                                sqlComm.ExecuteScalar()
                                ErrorOutText += "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - PmtAmt) & "', LastPmtPosted = '" & PEffDate & "' Where ([LoanID] = '" & LoanNo & "')" & vbNewLine & vbNewLine
                                sqlComm.CommandText = "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - PmtAmt) & "', LastPmtPosted = '" & PEffDate & "' Where ([LoanID] = '" & LoanNo & "')" & vbNewLine & vbNewLine
                                sqlComm.ExecuteScalar()
                                PmtAmt = Math.Round(PmtAmt - (P_Int + P_Prin), 2)
                            Else
                                P_Int = -Math.Round(DateDiff(DateInterval.Day, PEffDate, CDate(GetDataText("LastPmtPosted"))) * (((GetDataText("IntRate") / 100) / 365)) * GetDataText("CurrBalance"), 2)
                                P_Prin = Math.Round(PmtAmt - P_Int, 2)
                                ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',2,'" & Left(Desc, 50) & "','" & P_Prin & "','" & P_Int & "',0,0,'" & Session("User") & "')" & vbNewLine & vbNewLine
                                sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',2,'" & Left(Desc, 50) & "','" & P_Prin & "','" & P_Int & "',0,0,'" & Session("User") & "')"
                                sqlComm.ExecuteScalar()
                                ErrorOutText += "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - PmtAmt) & "', LastPmtPosted = '" & PEffDate & "' Where ([LoanID] = '" & LoanNo & "')" & vbNewLine & vbNewLine
                                sqlComm.CommandText = "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - PmtAmt) & "', LastPmtPosted = '" & PEffDate & "' Where ([LoanID] = '" & LoanNo & "')" & vbNewLine & vbNewLine
                                sqlComm.ExecuteScalar()
                                PmtAmt = Math.Round(PmtAmt - (P_Int + P_Prin), 2)
                            End If
                        End If
                    End If
                End If
                'End If
            Loop
        Else
            Dim PmtAmount As Double = 0
            For Each Item As ListItem In CheckBoxList1.Items
                Dim PostAmount As Double = 0
                If Item.Selected = True Then
                    For X = 1 To Len(Item.Value)
                        If Right(Item.Value, X) Like "$*" Then
                            PostAmount = Right(Item.Value, X)
                            Exit For
                        End If
                    Next
                    Select Case Left(Item.Value, 1)
                        Case "P" ' Past Due Pmts
                            Do Until PostAmount = 0
                                sqlComm.CommandText = "Select LCAmount From Loans Where ([LoanID] = '" & LoanNo & "')"
                                LCAmt = sqlComm.ExecuteScalar
                                sqlComm.CommandText = "Select MonthlyPmt From Loans Where ([LoanID] = '" & LoanNo & "')"
                                MthPmt = sqlComm.ExecuteScalar
                                sqlComm.CommandText = "Select CurrPmtDue From Loans Where ([LoanID] = '" & LoanNo & "')"
                                DueDate = sqlComm.ExecuteScalar
                                MDue = DateDiff(DateInterval.Month, CDate(DueDate), Now())
                                If GetDataText("LastPmtPosted") = "" Then
                                    P_Int = -Math.Round(DateDiff(DateInterval.Day, PEffDate, CDate(GetDataText("OpenDate"))) * (((GetDataText("IntRate") / 100) / 365)) * GetDataText("CurrBalance"), 2)
                                    P_Prin = Math.Round(GetDataText("MonthlyPmt") - P_Int, 2)
                                    ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',1,'" & Left(Desc, 50) & "','" & P_Prin & "','" & P_Int & "',0,0,'" & Session("User") & "')" & vbNewLine & vbNewLine
                                    sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',1,'" & Left(Desc, 50) & "','" & P_Prin & "','" & P_Int & "',0,0,'" & Session("User") & "')"
                                    sqlComm.ExecuteScalar()
                                    If -DateDiff(DateInterval.Day, PEffDate, CDate(GetDataText("CurrPmtDue"))) > CLng(GetDataText("LCDate")) Then
                                        ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',3,'Late Charge',0,0,0," & -LCAmt & ",'Fee')" & vbNewLine & vbNewLine
                                        sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',3,'Late Charge',0,0,0," & -LCAmt & ",'Fee')"
                                        sqlComm.ExecuteScalar()
                                    End If
                                    ErrorOutText += "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - P_Prin) & "', CurrPmtDue = '" & DateAdd(DateInterval.Month, 1, CDate(GetDataText("CurrPmtDue"))) & "', LastPmtPosted = '" & PEffDate & "', NoPmtsLeft = '" & (CDbl(GetDataText("NoPmtsLeft")) - 1) & "' Where ([LoanID] = '" & LoanNo & "')" & vbNewLine & vbNewLine
                                    sqlComm.CommandText = "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - P_Prin) & "', CurrPmtDue = '" & DateAdd(DateInterval.Month, 1, CDate(GetDataText("CurrPmtDue"))) & "', LastPmtPosted = '" & PEffDate & "', NoPmtsLeft = '" & (CDbl(GetDataText("NoPmtsLeft")) - 1) & "' Where ([LoanID] = '" & LoanNo & "')"
                                    sqlComm.ExecuteScalar()
                                    PostAmount = Math.Round(PostAmount - (P_Int + P_Prin), 2)
                                Else
                                    P_Int = -Math.Round(DateDiff(DateInterval.Day, PEffDate, CDate(GetDataText("LastPmtPosted"))) * (((GetDataText("IntRate") / 100) / 365)) * GetDataText("CurrBalance"), 2)
                                    P_Prin = Math.Round(GetDataText("MonthlyPmt") - P_Int, 2)
                                    ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',1,'" & Left(Desc, 50) & "','" & P_Prin & "','" & P_Int & "',0,0,'" & Session("User") & "')" & vbNewLine & vbNewLine
                                    sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',1,'" & Left(Desc, 50) & "','" & P_Prin & "','" & P_Int & "',0,0,'" & Session("User") & "')"
                                    sqlComm.ExecuteScalar()
                                    If -DateDiff(DateInterval.Day, PEffDate, CDate(GetDataText("CurrPmtDue"))) > CLng(GetDataText("LCDate")) Then
                                        ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',3,'Late Charge',0,0,0," & -LCAmt & ",'Fee')" & vbNewLine & vbNewLine
                                        sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',3,'Late Charge',0,0,0," & -LCAmt & ",'Fee')"
                                        sqlComm.ExecuteScalar()
                                    End If
                                    ErrorOutText += "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - P_Prin) & "', CurrPmtDue = '" & DateAdd(DateInterval.Month, 1, CDate(GetDataText("CurrPmtDue"))) & "', LastPmtPosted = '" & PEffDate & "', NoPmtsLeft = '" & (CDbl(GetDataText("NoPmtsLeft")) - 1) & "' Where ([LoanID] = '" & LoanNo & "')" & vbNewLine & vbNewLine
                                    sqlComm.CommandText = "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - P_Prin) & "', CurrPmtDue = '" & DateAdd(DateInterval.Month, 1, CDate(GetDataText("CurrPmtDue"))) & "', LastPmtPosted = '" & PEffDate & "', NoPmtsLeft = '" & (CDbl(GetDataText("NoPmtsLeft")) - 1) & "' Where ([LoanID] = '" & LoanNo & "')"
                                    sqlComm.ExecuteScalar()
                                    PostAmount = Math.Round(PostAmount - (P_Int + P_Prin), 2)
                                End If
                            Loop
                        Case "C" ' Current Pmt
                            Do Until PostAmount = 0
                                sqlComm.CommandText = "Select LCAmount From Loans Where ([LoanID] = '" & LoanNo & "')"
                                LCAmt = sqlComm.ExecuteScalar
                                sqlComm.CommandText = "Select MonthlyPmt From Loans Where ([LoanID] = '" & LoanNo & "')"
                                MthPmt = sqlComm.ExecuteScalar
                                sqlComm.CommandText = "Select CurrPmtDue From Loans Where ([LoanID] = '" & LoanNo & "')"
                                DueDate = sqlComm.ExecuteScalar
                                MDue = DateDiff(DateInterval.Month, CDate(DueDate), Now())
                                If GetDataText("LastPmtPosted") = "" Then
                                    P_Int = -Math.Round(DateDiff(DateInterval.Day, PEffDate, CDate(GetDataText("OpenDate"))) * (((GetDataText("IntRate") / 100) / 365)) * GetDataText("CurrBalance"), 2)
                                    P_Prin = Math.Round(GetDataText("MonthlyPmt") - P_Int, 2)
                                    ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',1,'" & Left(Desc, 50) & "','" & P_Prin & "','" & P_Int & "',0,0,'" & Session("User") & "')" & vbNewLine & vbNewLine
                                    sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',1,'" & Left(Desc, 50) & "','" & P_Prin & "','" & P_Int & "',0,0,'" & Session("User") & "')"
                                    sqlComm.ExecuteScalar()
                                    If -DateDiff(DateInterval.Day, PEffDate, CDate(GetDataText("CurrPmtDue"))) > CLng(GetDataText("LCDate")) Then
                                        ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',3,'Late Charge',0,0,0," & -LCAmt & ",'Fee')" & vbNewLine & vbNewLine
                                        sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',3,'Late Charge',0,0,0," & -LCAmt & ",'Fee')"
                                        sqlComm.ExecuteScalar()
                                    End If
                                    ErrorOutText += "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - P_Prin) & "', CurrPmtDue = '" & DateAdd(DateInterval.Month, 1, CDate(GetDataText("CurrPmtDue"))) & "',  LastPmtPosted = '" & PEffDate & "', NoPmtsLeft = '" & (CDbl(GetDataText("NoPmtsLeft")) - 1) & "' Where ([LoanID] = '" & LoanNo & "')" & vbNewLine & vbNewLine
                                    sqlComm.CommandText = "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - P_Prin) & "', CurrPmtDue = '" & DateAdd(DateInterval.Month, 1, CDate(GetDataText("CurrPmtDue"))) & "',  LastPmtPosted = '" & PEffDate & "', NoPmtsLeft = '" & (CDbl(GetDataText("NoPmtsLeft")) - 1) & "' Where ([LoanID] = '" & LoanNo & "')"
                                    sqlComm.ExecuteScalar()
                                    PostAmount = Math.Round(PostAmount - (P_Int + P_Prin), 2)
                                Else
                                    P_Int = -Math.Round(DateDiff(DateInterval.Day, PEffDate, CDate(GetDataText("LastPmtPosted"))) * (((GetDataText("IntRate") / 100) / 365)) * GetDataText("CurrBalance"), 2)
                                    P_Prin = Math.Round(GetDataText("MonthlyPmt") - P_Int, 2)
                                    ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',1,'" & Left(Desc, 50) & "','" & P_Prin & "','" & P_Int & "',0,0,'" & Session("User") & "')" & vbNewLine & vbNewLine
                                    sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',1,'" & Left(Desc, 50) & "','" & P_Prin & "','" & P_Int & "',0,0,'" & Session("User") & "')"
                                    sqlComm.ExecuteScalar()
                                    If -DateDiff(DateInterval.Day, PEffDate, CDate(GetDataText("CurrPmtDue"))) > CLng(GetDataText("LCDate")) Then
                                        ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',3,'Late Charge',0,0,0," & -LCAmt & ",'Fee')" & vbNewLine & vbNewLine
                                        sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',3,'Late Charge',0,0,0," & -LCAmt & ",'Fee')"
                                        sqlComm.ExecuteScalar()
                                    End If
                                    ErrorOutText += "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - P_Prin) & "', CurrPmtDue = '" & DateAdd(DateInterval.Month, 1, CDate(GetDataText("CurrPmtDue"))) & "',  LastPmtPosted = '" & PEffDate & "', NoPmtsLeft = '" & (CDbl(GetDataText("NoPmtsLeft")) - 1) & "' Where ([LoanID] = '" & LoanNo & "')" & vbNewLine & vbNewLine
                                    sqlComm.CommandText = "Update Loans Set CurrBalance = '" & (GetDataText("CurrBalance") - P_Prin) & "', CurrPmtDue = '" & DateAdd(DateInterval.Month, 1, CDate(GetDataText("CurrPmtDue"))) & "',  LastPmtPosted = '" & PEffDate & "', NoPmtsLeft = '" & (CDbl(GetDataText("NoPmtsLeft")) - 1) & "' Where ([LoanID] = '" & LoanNo & "')"
                                    sqlComm.ExecuteScalar()
                                    PostAmount = Math.Round(PostAmount - (P_Int + P_Prin), 2)
                                End If
                            Loop
                        Case "L" ' Late Charges
                            ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',4,'Late Charge Paid | " & Left(Desc, 31) & "',0,0,0,'" & PostAmount & "','" & Session("User") & "')" & vbNewLine & vbNewLine & vbNewLine
                            sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',4,'Late Charge Paid | " & Left(Desc, 31) & "',0,0,0,'" & PostAmount & "','" & Session("User") & "')"
                            sqlComm.ExecuteScalar()
                        Case "F" ' Fees
                            ErrorOutText += "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',7,'Fee Charge Paid | " & Left(Desc, 32) & "',0,0,0,'" & PostAmount & "','" & Session("User") & "')" & vbNewLine & vbNewLine & vbNewLine
                            sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & LoanNo & "','" & Now() & "','" & PEffDate & "','" & CDate(GetDataText("CurrPmtDue")) & "',7,'Fee Charge Paid | " & Left(Desc, 32) & "',0,0,0,'" & PostAmount & "','" & Session("User") & "')"
                            sqlComm.ExecuteScalar()
                    End Select
                End If
            Next
            sqlConn.Close()
        End If
        Wizard1.ActiveStepIndex = 6
        ErrorOutText += vbNewLine & "End Time = '" & Now() & vbNewLine
        PDF.NewPDF_W_Name(ErrorOutText, "PostingText" & Tick)
        Exit Sub
ErrorOut:
        ErrorOutText += vbNewLine & "End Time = '" & Now() & vbNewLine
        ErrorOutText += vbNewLine & "Error Details = '" & Err.Description & vbNewLine
        PDF.NewPDF_W_Name(ErrorOutText, "PostingText" & Tick)
        Session("User") = ""
        Session("LoanNo") = ""
        Response.Redirect("~\Loan\Officer\PDFs\PostingText" & Tick & ".pdf")
    End Sub
    Public Function GetDataText(ByVal Item As String) As String
        Dim LoanNo As String = GridView1.SelectedValue
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.Connection = sqlConn
        sqlComm.CommandText = "Select " & Item & " From Loans Where ([LoanID] = '" & LoanNo & "')"
        If IsDBNull(sqlComm.ExecuteScalar) Then
            GetDataText = ""
        Else
            GetDataText = sqlComm.ExecuteScalar.ToString.Trim
        End If
        sqlConn.Close()
    End Function
End Class
