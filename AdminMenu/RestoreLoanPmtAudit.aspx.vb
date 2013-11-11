
Partial Class AdminMenu_RestoreLoanPmtAudit
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Class1.GetAuthLevel(Session("User"), 3)
        TextBox1.Focus()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        TextBox6.Enabled = False
        Button2.Enabled = False
        Button1.Enabled = True
        If IsNumeric(TextBox2.Text) = False Then
            GoTo CheckData
        ElseIf IsDate(TextBox3.Text) = False Then
            GoTo CheckData
        ElseIf IsDate(TextBox4.Text) = False Then
            GoTo CheckData
        ElseIf IsNumeric(TextBox5.Text) = False Then
            GoTo CheckData
        ElseIf Len(TextBox1.Text) <> 10 Then
            GoTo CheckData
        ElseIf SQL_Codes.GetData("Loans", "NoPmts", "LoanID", TextBox1.Text) = "" Then
            GoTo CheckData
        ElseIf SQL_Codes.UpdateDataGroup("Loans", "LoanID", TextBox1.Text, "CurrBalance = '" & TextBox2.Text & "', CurrPmtDue = '" & TextBox3.Text & "', LastPmtPosted = '" & TextBox4.Text & "', NoPmtsLeft = '" & TextBox5.Text & "'") = 0 Then
            GoTo UpdateError
        End If
        Alert1.Text = "Update Done!"
        TextBox6.Enabled = True
        Button2.Enabled = True
        Button1.Enabled = False
        TextBox6.Focus()
        Exit Sub
CheckData:
        Alert1.Text = "Check Data and try again."
        TextBox1.Focus()
        Exit Sub
UpdateError:
        Alert1.Text = "There was an error when update the database."
        TextBox1.Focus()
        Exit Sub
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        SqlDataSource1.DataBind()
        GridView1.DataBind()
    End Sub
End Class
