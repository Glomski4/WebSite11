
Partial Class AdminMenu_CaseManager
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Len(My.Request.QueryString("CaseNumber")) = 0 Then
            Response.Redirect("~\AdminMenu\CaseManagement.aspx")
        End If
    End Sub
End Class
