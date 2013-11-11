
Partial Class Loan_ALS_Payments_Teller_Sig
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ClearPostingAlert()
        Dim BoxStatus = SQL_Codes.RunCommandGet("SELECT COUNT(BoxID) AS BoxID FROM PaymentBoxes WHERE (DateClosed IS NULL) AND (CreatedBy = '" & Session("User") & "')")
        If BoxStatus = 1 Then
            Panel1.Visible = False
            Panel2.Visible = True
        Else
            Panel1.Visible = True
            Panel2.Visible = False
        End If
        If LoanNumber.Enabled = True Then
            LoanNumber.Focus()
        Else
            TextBox7.Focus()
        End If
        If IsPostBack = False Then
            TextBox7.Text = Now.Date
        End If
    End Sub

    Protected Sub LoanNumber_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles LoanNumber.TextChanged
        ClearPostingAlert()
        If Len(LoanNumber.Text) = 10 Then
            If Len(SQL_Codes.GetData("Loans", "L_Status", "LoanID", LoanNumber.Text)) = 0 Then
                Label2.Visible = True
                Label2.Text = Label2.Text & " '" & LoanNumber.Text & "'"
                LoanNumber.Text = ""
                LoanNumber.Focus()
            Else
                LoanNumber.Enabled = False
                TextBox7.Focus()
                Label2.Visible = False
            End If
        Else
            Label2.Visible = True
            Label2.Text = Label2.Text & " '" & LoanNumber.Text & "'"
            LoanNumber.Text = ""
            LoanNumber.Focus()
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        ClearPostingAlert()
        If Len(TextBox1.Text) = 0 Then TextBox1.Text = "0.00"
        If Len(TextBox2.Text) = 0 Then TextBox2.Text = "0.00"
        If Len(TextBox3.Text) = 0 Then TextBox3.Text = "0.00"
        If Len(TextBox4.Text) = 0 Then TextBox4.Text = "0.00"
        If Len(TextBox6.Text) = 0 Then TextBox6.Text = "0.00"
        If LoanNumber.Enabled = True Then
            ShowPostingAlert("Please enter a loan number first.")
        Else
            If IsNumeric(TextBox1.Text) = True Or Len(TextBox1.Text) <> 0 Then
                If TextBox1.Text <> 0 Or TextBox2.Text <> 0 Or TextBox3.Text <> 0 Or TextBox4.Text <> 0 Or TextBox6.Text <> 0 Then
                    If CDbl(TextBox1.Text) = (CDbl(TextBox2.Text) + CDbl(TextBox3.Text) + CDbl(TextBox4.Text) + CDbl(TextBox6.Text)) Then
                        If CDbl(TextBox6.Text) <> 0 And Len(TextBox5.Text) <> 0 Or CDbl(TextBox6.Text) = 0 Then
                            If TextBox8.Text <> "" Then
                                If CodeChanged.Value = True Then
                                    GoTo CompletedPosting
                                Else
                                    If CDbl(TextBox6.Text) <> 0 And CDbl(TextBox2.Text) = 0 And CDbl(TextBox3.Text) = 0 And CDbl(TextBox4.Text) = 0 Then
                                        If CDbl(TextBox6.Text) > 0 Then
                                            If ChangeCode(18) = True Then Stop
                                        Else
                                            If ChangeCode(22) = True Then Stop
                                        End If
                                    Else
                                        GoTo CompletedPosting
                                    End If
                                End If
                            Else
                                ShowPostingAlert("Must have a posting code.")
                                TextBox8.Focus()
                            End If
                        Else
                            ShowPostingAlert("Must have Unpl Code when posting with Unpl Amount.")
                            TextBox5.Focus()
                        End If
                    Else
                        ShowPostingAlert("Not in balance. Total = " & FormatCurrency(CDbl(TextBox1.Text)) & " Posting = " & FormatCurrency(CDbl(TextBox2.Text) + CDbl(TextBox3.Text) + CDbl(TextBox4.Text) + CDbl(TextBox6.Text)))
                    End If
                Else
                    ShowPostingAlert("Not showing anything to post.")
                End If
            Else
                ShowPostingAlert("Total Posting must be a number.")
            End If
        End If
        Exit Sub
CompletedPosting:
        If PostingAlert.Visible = False Then
            Dim LoanBalance = SQL_Codes.GetData("Loans", "CurrBalance", "LoanID", LoanNumber.Text)
            If CDbl(TextBox2.Text) <> 0 Then
                SQL_Codes.UpdateData("Loans", "CurrBalance", LoanBalance + CDbl(TextBox2.Text), "LoanID", LoanNumber.Text)
            End If
            Dim IntDate = SQL_Codes.GetData("Loans", "CurrPmtDue", "LoanID", LoanNumber.Text)
            Dim BoxID = SQL_Codes.RunCommandGet("SELECT MAX(BoxID) AS BoxID FROM PaymentBoxes WHERE (DateClosed IS NULL) AND (CreatedBy = '" & Session("User") & "')")
            SQL_Codes.AddNewData("Payments", "LoanID,PostedDate,EffDate,IntDate,Type,Description,ToPrincipal,ToInterest,UplnFundsCode,ToUnpl,ToFees,EnteredBy,BoxNumber", _
            "'" & LoanNumber.Text & "','" & Now() & "','" & TextBox7.Text & "','" & IntDate & "','" & TextBox8.Text & "','" & TextBox9.Text & "','" & CDbl(TextBox2.Text) & "','" & CDbl(TextBox3.Text) & "','" & UCase(TextBox5.Text) & "','" & CDbl(TextBox6.Text) & "','" & CDbl(TextBox4.Text) & "','" & Session("User") & "','" & BoxID & "'")
            Panel2.Enabled = False
            PaymentControlStrip1.DataBind()
            ShowPostingAlert("Posting Completed")
        End If
    End Sub

    Sub ShowPostingAlert(ByVal Message As String)
        PostingAlert.Text = Message
        PostingAlert.Visible = True
    End Sub

    Sub ClearPostingAlert()
        PostingAlert.Visible = False
    End Sub

    Function ChangeCode(ByVal Code As Integer) As Boolean
        If TextBox8.Text = Code Then
            ChangeCode = False
        Else
            ChangeCode = False
            CodeChanged.Value = True
            ShowPostingAlert("Posting Code changed from '" & TextBox8.Text & "' to '" & Code & "', change back if needed and submited again to complete.")
            TextBox8.Text = Code
            TextBox8.Focus()
        End If
    End Function

End Class
