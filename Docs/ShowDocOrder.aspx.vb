
Partial Class Docs_ShowDocOrder
    Inherits System.Web.UI.Page

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        Button2.Enabled = False
        Label1.Text = GridView1.SelectedDataKey(0)
        Label2.Text = GridView1.SelectedDataKey(1)
        Label3.Text = GridView1.SelectedDataKey(2)
        If Label1.Text > 0 Then
            Button1.Enabled = True
        Else
            Button1.Enabled = False
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        PDF.NewPDF_W_DocSystem(GridView1.SelectedDataKey(0), GridView1.SelectedDataKey(1), GridView1.SelectedDataKey(2), Session("User"))
        Button1.Enabled = False
        Button2.Enabled = True
        Dim Address As String
        Address = Left(My.Request.UrlReferrer.AbsoluteUri, Len(My.Request.UrlReferrer.AbsoluteUri) - 22)
        'Response.Redirect("~\Loan\Officer\PDFs\" & Label1.Text & "-" & Label2.Text & "-" & Replace(Label3.Text, "/", "") & ".pdf")
        'Button2.OnClientClick = "window.open('" & Address & "Loan/Officer/PDFs/" & Label2.Text & "-" & Label1.Text & "-" & Replace(Replace(Label3.Text, "/", ""), ":", "") & ".pdf',null,'height=500, width=500,status= no, resizable= Yes, scrollbars=yes, toolbar=no,location=no,menubar=no ');"
        Response.Redirect(Request.RawUrl)
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        Response.Redirect(Request.RawUrl)
    End Sub
End Class
