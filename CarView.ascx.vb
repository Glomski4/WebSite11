
Partial Class CarView
    Inherits System.Web.UI.UserControl

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("~\Cars\CarDetails.aspx?CarID=" & TextBox1.Text)
    End Sub
End Class
