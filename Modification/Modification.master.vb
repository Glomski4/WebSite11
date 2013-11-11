
Partial Class Modification_Modification
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Class1.GetAuthLevel(Session("User"), 3)
    End Sub
End Class

