
Partial Class MasterPageLittle
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Len(Session("User")) = 0 Then
            MultiView1.ActiveViewIndex = 1
            If UCase(My.Request.Path) Like UCase("*Login.aspx*") Then
            Else
                Response.Redirect("~\Login.aspx?GOTO=" + My.Request.RawUrl)
            End If
        Else
            MultiView1.ActiveViewIndex = 0
            User.Text = Session("User")
        End If
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        Session.Remove("User")
        Response.Redirect("~\Login.aspx")
    End Sub

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton2.Click
        Response.Redirect("~\Login.aspx?GoTo=" & My.Request.Url.ToString)
    End Sub
End Class

