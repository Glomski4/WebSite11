
Partial Class Cars_NewCar
    Inherits System.Web.UI.Page

    Protected Sub InsertCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub InsertButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'Response.Redirect("Default.aspx")
    End Sub

    Protected Sub FormView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormView1.ItemInserted
        Dim CarID As String = SQL_Codes.GetDataFiltering("Car", "CarID", "Year = '" & e.Values(0).ToString & "' and Make = '" & e.Values(1).ToString & "' and Model = '" & e.Values(2).ToString & "'")
        Response.Redirect("CarDetails.aspx?CarID=" & CarID)
    End Sub

End Class
