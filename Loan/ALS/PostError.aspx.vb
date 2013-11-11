
Partial Class Loan_ALS_PostError
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label1.Text = My.Request.QueryString("User/Account")
        Session.RemoveAll()
    End Sub
End Class
