
Partial Class Loan_ALS_Payments_Teller_Fee
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim BoxStatus = SQL_Codes.RunCommandGet("SELECT COUNT(BoxID) AS BoxID FROM PaymentBoxes WHERE (DateClosed IS NULL) AND (CreatedBy = '" & Session("User") & "')")
        If BoxStatus = 1 Then
            Panel1.Visible = False
            Panel2.Visible = True
        Else
            Panel1.Visible = True
            Panel2.Visible = False
        End If
    End Sub
End Class
