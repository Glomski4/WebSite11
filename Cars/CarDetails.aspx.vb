
Partial Class CarDetails
    Inherits System.Web.UI.Page

    Protected Sub LinkButton3_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim SellSQL As New SqlDataSource
        SellSQL.UpdateCommand = "UPDATE [Car] SET [Active] = 'P' WHERE [CarID] ='" & My.Request.QueryString("CarID") & "'"
        SellSQL.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        SellSQL.Update()
        Response.Redirect("~\Loan\NewLoan.aspx?CarID=" & My.Request.QueryString("CarID"))
    End Sub
    Protected Sub DropDownList1_SelectedIndexChanged1(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        If DropDownList1.SelectedValue <> "~" Then
            Dim SellSQL As New SqlDataSource
            SellSQL.UpdateCommand = "UPDATE [Car] SET [Active] = '" & DropDownList1.SelectedValue & "' WHERE [CarID] ='" & My.Request.QueryString("CarID") & "'"
            SellSQL.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
            SellSQL.Update()
            SqlDataSource1.DataBind()
            FormView1.DataBind()
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        

    End Sub
End Class
