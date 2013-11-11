
Partial Class AdminMenu_MyCaseWork
    Inherits System.Web.UI.Page
    Dim I As Double = 0
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label1.Text = SQL_Codes.GetData("Users", "TellerID", "Username", Session("User"))
    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        If e.Row.RowIndex >= 0 Then
            I = I + 1
            If e.Row.Cells(1).Text = " " Then
                e.Row.Cells(0).Text = ""
                e.Row.Cells(1).Text = ""
                I = I - 1
            End If
            If (I / 2) = Math.Round(I / 2, 0) Then
                e.Row.BackColor = Drawing.Color.White
            Else
                e.Row.BackColor = Drawing.Color.LightGray
            End If
        End If
    End Sub

    Protected Sub GridView2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView2.SelectedIndexChanged
        I = 0
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowIndex >= 0 Then
            If CDate(e.Row.Cells(5).Text) < DateSerial(Year(Now()), Month(Now()), Day(Now())) Then
                e.Row.BackColor = Drawing.Color.Red
            ElseIf CDate(e.Row.Cells(5).Text) = DateSerial(Year(Now()), Month(Now()), Day(Now())) Then
                e.Row.BackColor = Drawing.Color.Yellow
            Else
                e.Row.BackColor = Drawing.Color.LightGreen
            End If
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If GridView1.SelectedIndex >= 0 Then
            If IsDate(TextBox1.Text) = True Then
                SQL_Codes.UpdateData("Case_Status", "FollowUpDate", TextBox1.Text, "CaseNumber", GridView1.SelectedValue)
                GridView1.DataBind()
                GridView2.DataBind()
            End If
        End If
    End Sub
End Class
