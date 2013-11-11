
Partial Class Loan_PendingApp
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If My.Request.QueryString("AppID") > 0 Then
            If IsPostBack Then
            Else
                MultiView1.ActiveViewIndex = 1
                Dim sqlConn As New System.Data.SqlClient.SqlConnection
                Dim sqlComm As New System.Data.SqlClient.SqlCommand
                Dim ClientID As String
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
                sqlConn.Open()
                sqlComm.CommandText = "Select AppStatus from PendingApps where AppID = '" & My.Request.QueryString("AppID") & "'"
                sqlComm.Connection = sqlConn
                ClientID = sqlComm.ExecuteScalar
                sqlConn.Close()
                Select Case ClientID
                    Case "C"
                        MultiView2.ActiveViewIndex = 0
                    Case "P"
                        MultiView2.ActiveViewIndex = 1
                    Case "A"
                        MultiView2.ActiveViewIndex = 2
                        If My.Request.QueryString("OR") = "Y" Then
                            MultiView2.ActiveViewIndex = 1
                        End If
                    Case "D"
                        MultiView2.ActiveViewIndex = 3
                        If My.Request.QueryString("OR") = "Y" Then
                            MultiView2.ActiveViewIndex = 1
                        End If
                    Case Else
                        MultiView1.Visible = False
                        MultiView2.Visible = False
                End Select
            End If
        Else
            Response.Redirect("~\Loan")
        End If
    End Sub

    Protected Sub Wizard1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Wizard1.Load
        If Wizard1.ActiveStepIndex = 0 Then
            On Error Resume Next
            Dim sqlConn As New System.Data.SqlClient.SqlConnection
            Dim sqlComm As New System.Data.SqlClient.SqlCommand
            Dim CarID As String
            sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
            sqlConn.Open()
            sqlComm.CommandText = "Select CarID from PendingApps where AppID = '" & My.Request.QueryString("AppID") & "'"
            sqlComm.Connection = sqlConn
            CarID = sqlComm.ExecuteScalar
            sqlConn.Close()
            sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
            sqlConn.Open()
            sqlComm.CommandText = "Select FinalPrice from Car where CarID = '" & CarID & "'"
            sqlComm.Connection = sqlConn
            MonthlyIncome.Text = FormatNumber(MonthlyIncome.Text)
            DownPmt.Text = FormatNumber(DownPmt.Text)
            CarPrice.Text = FormatNumber(sqlComm.ExecuteScalar)
            sqlConn.Close()
            LoanAmt.Text = FormatNumber(CarPrice.Text - DownPmt.Text)
            ' Loan Details
            If IsError(Math.Round(Rate(50, -(MonthlyIncome.Text * 0.3), CarPrice.Text) * 100, 3) + (2.4 - (DownPmt.Text / CarPrice.Text))) Then
                If MonthlyIncome.Text <> 0 Then
                    LoanRate.Text = "0.000"
                Else
                    LoanRate.Text = "Please enter text above."
                End If
            Else
                LoanRate.Text = Math.Round(Rate(50, -(MonthlyIncome.Text * 0.3), CarPrice.Text) * 100, 3) + (2.4 - (DownPmt.Text / CarPrice.Text))
                If LoanRate.Text < 1.5 Then
                    LoanRate.Text = "0.000"
                End If
            End If
            MonthlyPmt.Text = FormatNumber(-Pmt((LoanRate.Text / 100) / 12, NoOfPmts.SelectedValue, LoanAmt.Text))
        End If
    End Sub

    Protected Sub DownPmt_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DownPmt.TextChanged
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        Dim CarID As String
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.CommandText = "Select CarID from PendingApps where AppID = '" & My.Request.QueryString("AppID") & "'"
        sqlComm.Connection = sqlConn
        CarID = sqlComm.ExecuteScalar
        sqlConn.Close()
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.CommandText = "Select FinalPrice from Car where CarID = '" & CarID & "'"
        sqlComm.Connection = sqlConn
        DownPmt.Text = FormatCurrency(DownPmt.Text)
        CarPrice.Text = FormatCurrency(sqlComm.ExecuteScalar)
        sqlConn.Close()
        LoanAmt.Text = FormatCurrency(CarPrice.Text - DownPmt.Text)
    End Sub

    Protected Sub MonthlyIncome_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles MonthlyIncome.TextChanged
        MonthlyIncome.Text = FormatCurrency(MonthlyIncome.Text)
    End Sub

    Protected Sub Wizard1_ActiveStepChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Wizard1.ActiveStepChanged
        If Wizard1.ActiveStepIndex = 0 Then
            On Error Resume Next
            Dim sqlConn As New System.Data.SqlClient.SqlConnection
            Dim sqlComm As New System.Data.SqlClient.SqlCommand
            Dim CarID As String
            sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
            sqlConn.Open()
            sqlComm.CommandText = "Select CarID from PendingApps where AppID = '" & My.Request.QueryString("AppID") & "'"
            sqlComm.Connection = sqlConn
            CarID = sqlComm.ExecuteScalar
            sqlConn.Close()
            sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
            sqlConn.Open()
            sqlComm.CommandText = "Select FinalPrice from Car where CarID = '" & CarID & "'"
            sqlComm.Connection = sqlConn
            MonthlyIncome.Text = FormatNumber(MonthlyIncome.Text)
            DownPmt.Text = FormatNumber(DownPmt.Text)
            CarPrice.Text = FormatNumber(sqlComm.ExecuteScalar)
            sqlConn.Close()
            LoanAmt.Text = FormatNumber(CarPrice.Text - DownPmt.Text)
            ' Loan Details
            If IsError(Math.Round(Rate(50, -(MonthlyIncome.Text * 0.3), CarPrice.Text) * 100, 3) + (2.4 - (DownPmt.Text / CarPrice.Text))) Then
                If MonthlyIncome.Text <> 0 Then
                    LoanRate.Text = "0.000"
                Else
                    LoanRate.Text = "Please enter text above."
                End If
            Else
                LoanRate.Text = Math.Round(Rate(50, -(MonthlyIncome.Text * 0.3), CarPrice.Text) * 100, 3) + (2.4 - (DownPmt.Text / CarPrice.Text))
                If LoanRate.Text < 1.5 Then
                    LoanRate.Text = "0.000"
                End If
            End If
            MonthlyPmt.Text = FormatNumber(-Pmt((LoanRate.Text / 100) / 12, NoOfPmts.SelectedValue, LoanAmt.Text))
        ElseIf Wizard1.ActiveStepIndex = 1 Then
            A1.Rows = NoOfPmts.Text + 2
            A1.Text = "Pmt No" & Space((8 - Len("Pmt No")))
            A1.Text = A1.Text & "Pmt Amount" & Space((15 - Len("Pmt Amount")))
            A1.Text = A1.Text & "Prin Amt" & Space((15 - Len("Prin Amt")))
            A1.Text = A1.Text & "Int Amt" & Space((15 - Len("Int Amt")))
            A1.Text = A1.Text & "Int Bal" & Space((15 - Len("Int Bal")))
            A1.Text = A1.Text & "Prin Bal" & Space((15 - Len("Prin Bal")))
            A1.Text = A1.Text & vbNewLine
            Dim NoOfPmtsLeft, PBal, IBal As Double
            NoOfPmtsLeft = CDbl(NoOfPmts.SelectedValue)
            PBal = CDbl(LoanAmt.Text)
            IBal = 0
            Dim Payment, Period, P, I As Double
            Payment = Math.Abs(-Pmt((LoanRate.Text / 100) / 12, CDbl(NoOfPmts.SelectedValue), LoanAmt.Text))
            For Period = 1 To CDbl(NoOfPmts.SelectedValue)
                P = PPmt((LoanRate.Text / 100) / 12, Period, CDbl(NoOfPmts.SelectedValue), -LoanAmt.Text)
                ' Round principal.
                P = (Int((P + 0.005) * 100) / 100)
                I = Payment - P
                ' Round interest.
                I = (Int((I + 0.005) * 100) / 100)
                A1.Text = A1.Text & "  " & Period.ToString & Space((6 - Len(Period.ToString)))
                A1.Text = A1.Text & FormatCurrency(P + I) & Space((15 - Len(FormatCurrency(P + I))))
                A1.Text = A1.Text & FormatCurrency(P) & Space((15 - Len(FormatCurrency(P))))
                A1.Text = A1.Text & FormatCurrency(I) & Space((15 - Len(FormatCurrency(I))))
                IBal = IBal + I
                A1.Text = A1.Text & FormatCurrency(IBal) & Space((15 - Len(FormatCurrency(IBal))))
                PBal = PBal - P
                A1.Text = A1.Text & FormatCurrency(PBal) & Space((15 - Len(FormatCurrency(PBal))))
                A1.Text = A1.Text & vbNewLine
                NoOfPmtsLeft = NoOfPmtsLeft - 1
            Next Period
        End If
    End Sub

    Protected Sub Wizard1_FinishButtonClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.WizardNavigationEventArgs) Handles Wizard1.FinishButtonClick
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        Dim UserEmail As String
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.CommandText = "UPDATE PendingApps Set AppStatus = 'P' WHERE(AppID = '" & My.Request.QueryString("AppID") & "')"
        sqlComm.Connection = sqlConn
        sqlComm.ExecuteScalar()
        sqlConn.Close()
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.CommandText = "INSERT INTO LoanApps (AppID, Created, Income, CarPrice, DownPmt, LoanAmt, NoOfPmts, PmtAmt, SubmittedBy) VALUES ('" & My.Request.QueryString("AppID") & "','" & Now() & "','" & MonthlyIncome.Text & "','" & CarPrice.Text & "','" & DownPmt.Text & "','" & LoanAmt.Text & "','" & NoOfPmts.SelectedValue & "','" & MonthlyPmt.Text & "','" & Session("User") & "')"
        sqlComm.Connection = sqlConn
        sqlComm.ExecuteNonQuery()
        sqlComm.CommandText = "Select Email FROM Users WHERE(Username = '" & Session("User") & "')"
        sqlComm.Connection = sqlConn
        UserEmail = sqlComm.ExecuteScalar()
        sqlConn.Close()
        Dim MailMessage As System.Net.Mail.MailMessage = New System.Net.Mail.MailMessage()
        MailMessage.From = New System.Net.Mail.MailAddress("GLOMITUP@COX.NET", "LoanSystem-NonActive")
        MailMessage.To.Add(New System.Net.Mail.MailAddress("GLOMITUP@COX.NET"))
        'MailMessage.CC.Add(New System.Net.Mail.MailAddress(UserEmail))
        MailMessage.Subject = "Loan App Submitted : " & My.Request.QueryString("AppID")
        MailMessage.Body = "Loan application has been submiited by : " & Session("User") & vbNewLine & _
                           "Please review loan AppID : " & My.Request.QueryString("AppID") & vbNewLine & _
                           "Thank you." & vbNewLine & vbNewLine & _
                           "Link : " & "http://theglom.selfip.com:90/WebSite/Loan/PendingApp.aspx?AppID=" & My.Request.QueryString("AppID") & vbNewLine & _
                           "" & vbNewLine & vbNewLine & vbNewLine & vbNewLine & _
                           "Message ID : " & Class1.GenRandomString
        Dim SmtpClient As System.Net.Mail.SmtpClient = New System.Net.Mail.SmtpClient()
        SmtpClient.Send(MailMessage)
        Response.Redirect("~\Loan\")
    End Sub

    Protected Sub EditButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Class1.GetAuthLevel(Session("User"), 2)
    End Sub

    Protected Sub LinkButton3_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'Approve
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.CommandText = "UPDATE PendingApps Set AppStatus = 'A' WHERE(AppID = '" & My.Request.QueryString("AppID") & "')"
        sqlComm.Connection = sqlConn
        sqlComm.ExecuteScalar()
        sqlComm.CommandText = "UPDATE LoanApps Set ReviewedBy = '" & Session("User") & "' WHERE(AppID = '" & My.Request.QueryString("AppID") & "')"
        sqlComm.ExecuteScalar()
        sqlConn.Close()
        Response.Redirect("~\Loan\")
    End Sub

    Protected Sub LinkButton4_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'Deny
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        Dim CarID As String
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.CommandText = "UPDATE PendingApps Set AppStatus = 'D' WHERE(AppID = '" & My.Request.QueryString("AppID") & "')"
        sqlComm.Connection = sqlConn
        sqlComm.ExecuteScalar()
        sqlComm.CommandText = "UPDATE LoanApps Set ReviewedBy = '" & Session("User") & "' WHERE(AppID = '" & My.Request.QueryString("AppID") & "')"
        sqlComm.ExecuteScalar()
        sqlComm.CommandText = "Select CarID WHERE(AppID = '" & My.Request.QueryString("AppID") & "')"
        sqlComm.Connection = sqlConn
        CarID = sqlComm.ExecuteScalar()
        sqlComm.CommandText = "UPDATE Car Set Active = 'Y' WHERE(CarID = '" & CarID & "')"
        sqlComm.ExecuteScalar()
        sqlConn.Close()
        Response.Redirect("~\Loan\")
    End Sub
End Class
