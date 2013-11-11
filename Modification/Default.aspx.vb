
Partial Class Modification_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
    End Sub

    Protected Sub LinkButton3_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        ActiveLoan.Text = FormView1.SelectedValue.ToString
        Wizard1.ActiveStepIndex = Wizard1.ActiveStepIndex + 1
    End Sub

    Protected Sub Wizard1_ActiveStepChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Wizard1.ActiveStepChanged
        [Step].Text = Wizard1.ActiveStep.Name
        If Wizard1.ActiveStepIndex = 0 Then

        ElseIf Wizard1.ActiveStepIndex = 3 Then
            TB_MHI_1.Text = FormatCurrency(SQL_Codes.GetData("Modification", "MHI1", "LoanNo", ActiveLoan.Text))
            TB_MHI_2.Text = FormatCurrency(SQL_Codes.GetData("Modification", "MHI2", "LoanNo", ActiveLoan.Text))
            TB_MHI_3.Text = FormatCurrency(SQL_Codes.GetData("Modification", "MHI3", "LoanNo", ActiveLoan.Text))
            TB_MHI_4.Text = FormatCurrency(SQL_Codes.GetData("Modification", "MHI4", "LoanNo", ActiveLoan.Text))
            TB_MHI_5.Text = FormatCurrency(SQL_Codes.GetData("Modification", "MHI5", "LoanNo", ActiveLoan.Text))
            TB_MHI_6.Text = FormatCurrency(SQL_Codes.GetData("Modification", "MHI6", "LoanNo", ActiveLoan.Text))
            TB_MHI_7.Text = FormatCurrency(SQL_Codes.GetData("Modification", "MHI7", "LoanNo", ActiveLoan.Text))
            TB_MHI_8.Text = FormatCurrency(SQL_Codes.GetData("Modification", "MHI8", "LoanNo", ActiveLoan.Text))
            L_MHI_Total.Text = FormatCurrency(SQL_Codes.GetData("Modification", "MHITotal", "LoanNo", ActiveLoan.Text))
            HF_MHI.Value = SQL_Codes.GetData("Modification", "MHITotal", "LoanNo", ActiveLoan.Text)
        ElseIf Wizard1.ActiveStepIndex = 4 Then
            TB_MHE_1.Text = FormatCurrency(SQL_Codes.GetData("Modification", "MHE1", "LoanNo", ActiveLoan.Text))
            TB_MHE_2.Text = FormatCurrency(SQL_Codes.GetData("Modification", "MHE2", "LoanNo", ActiveLoan.Text))
            TB_MHE_3.Text = FormatCurrency(SQL_Codes.GetData("Modification", "MHE3", "LoanNo", ActiveLoan.Text))
            TB_MHE_4.Text = FormatCurrency(SQL_Codes.GetData("Modification", "MHE4", "LoanNo", ActiveLoan.Text))
            TB_MHE_5.Text = FormatCurrency(SQL_Codes.GetData("Modification", "MHE5", "LoanNo", ActiveLoan.Text))
            TB_MHE_6.Text = FormatCurrency(SQL_Codes.GetData("Modification", "MHE6", "LoanNo", ActiveLoan.Text))
            TB_MHE_7.Text = FormatCurrency(SQL_Codes.GetData("Modification", "MHE7", "LoanNo", ActiveLoan.Text))
            TB_MHE_8.Text = FormatCurrency(SQL_Codes.GetData("Modification", "MHE8", "LoanNo", ActiveLoan.Text))
            TB_MHE_9.Text = FormatCurrency(SQL_Codes.GetData("Modification", "MHE9", "LoanNo", ActiveLoan.Text))
            TB_MHE_10.Text = FormatCurrency(SQL_Codes.GetData("Modification", "MHE10", "LoanNo", ActiveLoan.Text))
            L_MHE_Total.Text = FormatCurrency(SQL_Codes.GetData("Modification", "MHETotal", "LoanNo", ActiveLoan.Text))
            HF_MHE.Value = SQL_Codes.GetData("Modification", "MHETotal", "LoanNo", ActiveLoan.Text)
        End If
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'Adding New Mod
        Button1.Text = "Adding To System"
        Button1.Enabled = False
        SQL_Codes.AddNewData("Modification", "LoanNo, Status, DateTimeAdded, AddedBy", "'" & ActiveLoan.Text & "',1,'" & Now() & "','" & Session("User") & "'")
        SQL_Codes.AddNewData("Notes", "LoanID, Priority, Dept, NoteDateTime, Note, EnteredBy", "'" & ActiveLoan.Text & "','N',8,'" & Now() & "','Loan Added To Mod System By - " & Session("User") & "','Mod-Sys'")
        Wizard1.ActiveStepIndex = Wizard1.ActiveStepIndex + 1
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        Dim NoError As Integer = 0
        If IsNumeric(TB_MHI_8.Text) = True Then
            TB_MHI_8.Text = FormatCurrency(TB_MHI_8.Text)
            TB_MHI_8.BackColor = Drawing.Color.Empty
        Else
            TB_MHI_8.Focus()
            TB_MHI_8.BackColor = Drawing.Color.Red
            NoError = NoError + 1
        End If
        If IsNumeric(TB_MHI_7.Text) = True Then
            TB_MHI_7.Text = FormatCurrency(TB_MHI_7.Text)
            TB_MHI_7.BackColor = Drawing.Color.Empty
        Else
            TB_MHI_7.Focus()
            TB_MHI_7.BackColor = Drawing.Color.Red
            NoError = NoError + 1
        End If
        If IsNumeric(TB_MHI_6.Text) = True Then
            TB_MHI_6.Text = FormatCurrency(TB_MHI_6.Text)
            TB_MHI_6.BackColor = Drawing.Color.Empty
        Else
            TB_MHI_6.Focus()
            TB_MHI_6.BackColor = Drawing.Color.Red
            NoError = NoError + 1
        End If
        If IsNumeric(TB_MHI_5.Text) = True Then
            TB_MHI_5.Text = FormatCurrency(TB_MHI_5.Text)
            TB_MHI_5.BackColor = Drawing.Color.Empty
        Else
            TB_MHI_5.Focus()
            TB_MHI_5.BackColor = Drawing.Color.Red
            NoError = NoError + 1
        End If
        If IsNumeric(TB_MHI_4.Text) = True Then
            TB_MHI_4.Text = FormatCurrency(TB_MHI_4.Text)
            TB_MHI_4.BackColor = Drawing.Color.Empty
        Else
            TB_MHI_4.Focus()
            TB_MHI_4.BackColor = Drawing.Color.Red
            NoError = NoError + 1
        End If
        If IsNumeric(TB_MHI_3.Text) = True Then
            TB_MHI_3.Text = FormatCurrency(TB_MHI_3.Text)
            TB_MHI_3.BackColor = Drawing.Color.Empty
        Else
            TB_MHI_3.Focus()
            TB_MHI_3.BackColor = Drawing.Color.Red
            NoError = NoError + 1
        End If
        If IsNumeric(TB_MHI_2.Text) = True Then
            TB_MHI_2.Text = FormatCurrency(TB_MHI_2.Text)
            TB_MHI_2.BackColor = Drawing.Color.Empty
        Else
            TB_MHI_2.Focus()
            TB_MHI_2.BackColor = Drawing.Color.Red
            NoError = NoError + 1
        End If
        If IsNumeric(TB_MHI_1.Text) = True Then
            TB_MHI_1.Text = FormatCurrency(TB_MHI_1.Text)
            TB_MHI_1.BackColor = Drawing.Color.Empty
        Else
            TB_MHI_1.Focus()
            TB_MHI_1.BackColor = Drawing.Color.Red
            NoError = NoError + 1
        End If
        If NoError > 0 Then
            L_MHI_Total.Text = "<b> !! Error !! <br/> Fix Red Boxes. <br/> " & NoError & " found.<b/>"
        Else
            L_MHI_Total.Text = FormatCurrency(CDbl(TB_MHI_1.Text) + CDbl(TB_MHI_2.Text) + CDbl(TB_MHI_3.Text) + CDbl(TB_MHI_4.Text) + CDbl(TB_MHI_5.Text) + CDbl(TB_MHI_6.Text) + CDbl(TB_MHI_7.Text) + CDbl(TB_MHI_8.Text))
        End If
    End Sub

    Protected Sub Wizard1_NextButtonClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.WizardNavigationEventArgs) Handles Wizard1.NextButtonClick
        If Wizard1.ActiveStepIndex = 3 Then
            Button3_Click(sender, e)
            If IsNumeric(L_MHI_Total.Text) = True Then
                SQL_Codes.UpdateData("Modification", "MHI1", CDbl(TB_MHI_1.Text), "LoanNo", ActiveLoan.Text)
                SQL_Codes.UpdateData("Modification", "MHI2", CDbl(TB_MHI_2.Text), "LoanNo", ActiveLoan.Text)
                SQL_Codes.UpdateData("Modification", "MHI3", CDbl(TB_MHI_3.Text), "LoanNo", ActiveLoan.Text)
                SQL_Codes.UpdateData("Modification", "MHI4", CDbl(TB_MHI_4.Text), "LoanNo", ActiveLoan.Text)
                SQL_Codes.UpdateData("Modification", "MHI5", CDbl(TB_MHI_5.Text), "LoanNo", ActiveLoan.Text)
                SQL_Codes.UpdateData("Modification", "MHI6", CDbl(TB_MHI_6.Text), "LoanNo", ActiveLoan.Text)
                SQL_Codes.UpdateData("Modification", "MHI7", CDbl(TB_MHI_7.Text), "LoanNo", ActiveLoan.Text)
                SQL_Codes.UpdateData("Modification", "MHI8", CDbl(TB_MHI_8.Text), "LoanNo", ActiveLoan.Text)
                SQL_Codes.UpdateData("Modification", "MHITotal", CDbl(L_MHI_Total.Text), "LoanNo", ActiveLoan.Text)
                If HF_MHI.Value <> SQL_Codes.GetData("Modification", "MHITotal", "LoanNo", ActiveLoan.Text) Then
                    SQL_Codes.AddNewData("Notes", "LoanID, Priority, Dept, NoteDateTime, Note, EnteredBy", "'" & ActiveLoan.Text & "','N',12,'" & Now() & "','Monthly Income Updated - " & FormatCurrency(HF_MHI.Value) & " to " & FormatCurrency(SQL_Codes.GetData("Modification", "MHITotal", "LoanNo", ActiveLoan.Text)) & "','" & Session("User") & "'")
                    HF_MHI.Value = SQL_Codes.GetData("Modification", "MHITotal", "LoanNo", ActiveLoan.Text)
                    UpdateLastEdit()
                End If
            Else
                e.Cancel = True
            End If
        ElseIf Wizard1.ActiveStepIndex = 4 Then
            Button4_Click(sender, e)
            If IsNumeric(L_MHI_Total.Text) = True Then
                SQL_Codes.UpdateData("Modification", "MHE1", CDbl(TB_MHE_1.Text), "LoanNo", ActiveLoan.Text)
                SQL_Codes.UpdateData("Modification", "MHE2", CDbl(TB_MHE_2.Text), "LoanNo", ActiveLoan.Text)
                SQL_Codes.UpdateData("Modification", "MHE3", CDbl(TB_MHE_3.Text), "LoanNo", ActiveLoan.Text)
                SQL_Codes.UpdateData("Modification", "MHE4", CDbl(TB_MHE_4.Text), "LoanNo", ActiveLoan.Text)
                SQL_Codes.UpdateData("Modification", "MHE5", CDbl(TB_MHE_5.Text), "LoanNo", ActiveLoan.Text)
                SQL_Codes.UpdateData("Modification", "MHE6", CDbl(TB_MHE_6.Text), "LoanNo", ActiveLoan.Text)
                SQL_Codes.UpdateData("Modification", "MHE7", CDbl(TB_MHE_7.Text), "LoanNo", ActiveLoan.Text)
                SQL_Codes.UpdateData("Modification", "MHE8", CDbl(TB_MHE_8.Text), "LoanNo", ActiveLoan.Text)
                SQL_Codes.UpdateData("Modification", "MHE9", CDbl(TB_MHE_9.Text), "LoanNo", ActiveLoan.Text)
                SQL_Codes.UpdateData("Modification", "MHE10", CDbl(TB_MHE_10.Text), "LoanNo", ActiveLoan.Text)
                SQL_Codes.UpdateData("Modification", "MHETotal", CDbl(L_MHE_Total.Text), "LoanNo", ActiveLoan.Text)
                If HF_MHE.Value <> SQL_Codes.GetData("Modification", "MHETotal", "LoanNo", ActiveLoan.Text) Then
                    SQL_Codes.AddNewData("Notes", "LoanID, Priority, Dept, NoteDateTime, Note, EnteredBy", "'" & ActiveLoan.Text & "','N',12,'" & Now() & "','Monthly Expenses Updated - " & FormatCurrency(HF_MHE.Value) & " to " & FormatCurrency(SQL_Codes.GetData("Modification", "MHETotal", "LoanNo", ActiveLoan.Text)) & "','" & Session("User") & "'")
                    HF_MHE.Value = SQL_Codes.GetData("Modification", "MHETotal", "LoanNo", ActiveLoan.Text)
                    UpdateLastEdit()
                End If
            Else
                e.Cancel = True
            End If
        End If
    End Sub

    Public Sub UpdateLastEdit()
        SQL_Codes.UpdateData("Modification", "DateTimeEdit", Now(), "LoanNo", ActiveLoan.Text)
        SQL_Codes.UpdateData("Modification", "EditBy", Session("User"), "LoanNo", ActiveLoan.Text)
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        Dim NoError As Integer = 0
        If IsNumeric(TB_MHE_10.Text) = True Then
            TB_MHE_10.Text = FormatCurrency(TB_MHE_10.Text)
            TB_MHE_10.BackColor = Drawing.Color.Empty
        Else
            TB_MHE_10.Focus()
            TB_MHE_10.BackColor = Drawing.Color.Red
            NoError = NoError + 1
        End If
        If IsNumeric(TB_MHE_9.Text) = True Then
            TB_MHE_9.Text = FormatCurrency(TB_MHE_9.Text)
            TB_MHE_9.BackColor = Drawing.Color.Empty
        Else
            TB_MHE_9.Focus()
            TB_MHE_9.BackColor = Drawing.Color.Red
            NoError = NoError + 1
        End If
        If IsNumeric(TB_MHE_8.Text) = True Then
            TB_MHE_8.Text = FormatCurrency(TB_MHE_8.Text)
            TB_MHE_8.BackColor = Drawing.Color.Empty
        Else
            TB_MHE_8.Focus()
            TB_MHE_8.BackColor = Drawing.Color.Red
            NoError = NoError + 1
        End If
        If IsNumeric(TB_MHE_7.Text) = True Then
            TB_MHE_7.Text = FormatCurrency(TB_MHE_7.Text)
            TB_MHE_7.BackColor = Drawing.Color.Empty
        Else
            TB_MHE_7.Focus()
            TB_MHE_7.BackColor = Drawing.Color.Red
            NoError = NoError + 1
        End If
        If IsNumeric(TB_MHE_6.Text) = True Then
            TB_MHE_6.Text = FormatCurrency(TB_MHE_6.Text)
            TB_MHE_6.BackColor = Drawing.Color.Empty
        Else
            TB_MHE_6.Focus()
            TB_MHE_6.BackColor = Drawing.Color.Red
            NoError = NoError + 1
        End If
        If IsNumeric(TB_MHE_5.Text) = True Then
            TB_MHE_5.Text = FormatCurrency(TB_MHE_5.Text)
            TB_MHE_5.BackColor = Drawing.Color.Empty
        Else
            TB_MHE_5.Focus()
            TB_MHE_5.BackColor = Drawing.Color.Red
            NoError = NoError + 1
        End If
        If IsNumeric(TB_MHE_4.Text) = True Then
            TB_MHE_4.Text = FormatCurrency(TB_MHE_4.Text)
            TB_MHE_4.BackColor = Drawing.Color.Empty
        Else
            TB_MHE_4.Focus()
            TB_MHE_4.BackColor = Drawing.Color.Red
            NoError = NoError + 1
        End If
        If IsNumeric(TB_MHE_3.Text) = True Then
            TB_MHE_3.Text = FormatCurrency(TB_MHE_3.Text)
            TB_MHE_3.BackColor = Drawing.Color.Empty
        Else
            TB_MHE_3.Focus()
            TB_MHE_3.BackColor = Drawing.Color.Red
            NoError = NoError + 1
        End If
        If IsNumeric(TB_MHE_2.Text) = True Then
            TB_MHE_2.Text = FormatCurrency(TB_MHE_2.Text)
            TB_MHE_2.BackColor = Drawing.Color.Empty
        Else
            TB_MHE_2.Focus()
            TB_MHE_2.BackColor = Drawing.Color.Red
            NoError = NoError + 1
        End If
        If IsNumeric(TB_MHE_1.Text) = True Then
            TB_MHE_1.Text = FormatCurrency(TB_MHE_1.Text)
            TB_MHE_1.BackColor = Drawing.Color.Empty
        Else
            TB_MHE_1.Focus()
            TB_MHE_1.BackColor = Drawing.Color.Red
            NoError = NoError + 1
        End If
        If NoError > 0 Then
            L_MHE_Total.Text = "<b> !! Error !! <br/> Fix Red Boxes. <br/> " & NoError & " found.<b/>"
        Else
            L_MHE_Total.Text = FormatCurrency(CDbl(TB_MHE_1.Text) + CDbl(TB_MHE_2.Text) + CDbl(TB_MHE_3.Text) + CDbl(TB_MHE_4.Text) + CDbl(TB_MHE_5.Text) + CDbl(TB_MHE_6.Text) + CDbl(TB_MHE_7.Text) + CDbl(TB_MHE_8.Text) + CDbl(TB_MHE_9.Text) + CDbl(TB_MHE_10.Text))
        End If
    End Sub

    Protected Sub Button5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button5.Click
        TB_MHE_1.Text = FormatCurrency(CDbl(TB_MHE_1.Text) + SQL_Codes.GetData("Loans", "MonthlyPmt", "LoanID", ActiveLoan.Text))
    End Sub

    Protected Sub Button6_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button6.Click
        TB_MHE_2.Text = FormatCurrency(CDbl(TB_MHE_2.Text) + SQL_Codes.GetData("Loans", "MonthlyPmt", "LoanID", ActiveLoan.Text))
    End Sub

    Protected Sub Button7_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button7.Click
        If SQL_Codes.GetData("Modification", "Status", "LoanNo", ActiveLoan.Text) = 1 Then
            SQL_Codes.UpdateData("Modification", "Status", 10, "LoanNo", ActiveLoan.Text)
            UpdateLastEdit()
        End If
        Response.Redirect("~\Loan\ALS\Default.aspx?FORWARD=VALID&LoanNo=" & ActiveLoan.Text)
    End Sub
End Class
