
Partial Class AdminMenu_EditDocs
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Len(My.Request.QueryString("DocID")) > 0 Then
                If My.Computer.FileSystem.FileExists(My.Request.PhysicalApplicationPath & My.Request.QueryString("DocID")) Then
                    TextBox1.Text = My.Computer.FileSystem.ReadAllText(My.Request.PhysicalApplicationPath & My.Request.QueryString("DocID"))
                Else
                    TextBox1.Text = "File not found."
                End If
            End If
        End If
        TextBox1.Focus()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("~" & My.Request.QueryString("DocID"))
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        My.Computer.FileSystem.WriteAllText(My.Request.PhysicalApplicationPath & My.Request.QueryString("DocID"), TextBox1.Text, False)
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        TextBox1.Text += "          "
    End Sub
End Class
