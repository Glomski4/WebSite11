
Partial Class Loan_ALS_Payments_Teller_PaymentControlStrip
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim BoxStatus = SQL_Codes.RunCommandGet("SELECT COUNT(BoxID) AS BoxID FROM PaymentBoxes WHERE (DateClosed IS NULL) AND (CreatedBy = '" & Session("User") & "')")
        If BoxStatus = 1 Then
            Dim BoxID = SQL_Codes.RunCommandGet("SELECT MAX(BoxID) AS BoxID FROM PaymentBoxes WHERE (DateClosed IS NULL) AND (CreatedBy = '" & Session("User") & "')")
            Status.Text = "Open I(" & BoxID & ")"
            Dim BoxTrans = SQL_Codes.RunCommandGet("SELECT COUNT(PmtID) AS Expr1 FROM Payments WHERE (BoxNumber = " & BoxID & ")")
            If BoxTrans = 0 Then
                Balance.Text = FormatCurrency(0)
            Else
                Dim BoxBalance = SQL_Codes.RunCommandGet("SELECT SUM(ToPrincipal) + SUM(ToInterest) + SUM(ToUnpl) + SUM(ToFees) AS Expr1 FROM Payments WHERE (BoxNumber = " & BoxID & ")")
                Balance.Text = FormatCurrency(BoxBalance)
            End If
            Trans.Text = BoxTrans
        ElseIf BoxStatus = 0 Then
            Status.Text = "Closed"
            Balance.Text = ""
            Trans.Text = ""
        Else
            Status.Text = "Error M(" & BoxStatus & ")"
            Balance.Text = ""
            Trans.Text = ""
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Response.Redirect("All.aspx")
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        Response.Redirect("Reg.aspx")
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        Response.Redirect("Rev.aspx")
    End Sub

    Protected Sub Button5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button5.Click
        Response.Redirect("Sig.aspx")
    End Sub

    Protected Sub Button6_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button6.Click
        Response.Redirect("Fee.aspx")
    End Sub

    Protected Sub Button7_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button7.Click
        Response.Redirect("Box.aspx")
    End Sub
End Class
