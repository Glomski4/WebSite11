
Partial Class _Default
    Inherits System.Web.UI.Page

    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Model_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Model.SelectedIndexChanged
        For X = 1 To ID.Items.Count
            ID.Items.Remove(ID.Items.Item(0).Text)
        Next
    End Sub

    Protected Sub Year_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Year.SelectedIndexChanged
        For X = 1 To Make.Items.Count
            Make.Items.Remove(Make.Items.Item(0).Text)
        Next
        For X = 1 To Model.Items.Count
            Model.Items.Remove(Model.Items.Item(0).Text)
        Next
        For X = 1 To ID.Items.Count
            ID.Items.Remove(ID.Items.Item(0).Text)
        Next
    End Sub

    Protected Sub Make_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Make.SelectedIndexChanged
        For X = 1 To Model.Items.Count
            Model.Items.Remove(Model.Items.Item(0).Text)
        Next
        For X = 1 To ID.Items.Count
            ID.Items.Remove(ID.Items.Item(0).Text)
        Next
    End Sub

    Protected Sub ID_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ID.SelectedIndexChanged
        Response.Redirect("CarDetails.aspx?CarID=" & ID.SelectedValue)
    End Sub

    Protected Sub CarIDSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CarIDSearch.Click
        If CarSearchID_Text.Text = "****" Then
            Response.Redirect("NewCar.aspx")
        Else
            Response.Redirect("CarDetails.aspx?CarID=" & CarSearchID_Text.Text)
        End If
    End Sub

End Class
