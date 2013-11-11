
Partial Class AdminMenu_DepartmentManager
    Inherits System.Web.UI.Page

    Protected Sub ListBox1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBox1.SelectedIndexChanged
        Dim Teller = SQL_Codes.GetData("Users", "TellerID", "Username", ListBox1.SelectedValue)
        Label1.Text = Teller
        If Teller = "" Then
            MultiView2.ActiveViewIndex = 0
        Else
            MultiView2.ActiveViewIndex = 1
        End If
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        If IsNumeric(TextBox2.Text) <> True Then
            Alert1.Text = "ID must be 5 numbers only."
        ElseIf Len(TextBox2.Text) <> 5 Then
            Alert1.Text = "ID must be 5 numbers only."
        Else
            SQL_Codes.UpdateData("Users", "TellerID", TextBox2.Text, "Username", ListBox1.SelectedValue)
            MultiView2.ActiveViewIndex = 1
            Dim Teller = SQL_Codes.GetData("Users", "TellerID", "Username", ListBox1.SelectedValue)
            Label1.Text = Teller
        End If
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        If ListBox3.SelectedIndex <> -1 Then
            SQL_Codes.RunCommand("INSERT INTO Teller_Depts (TellerID, DeptID) VALUES (" & Label1.Text & "," & ListBox3.SelectedValue & ")")
            ListBox2.DataBind()
            ListBox3.DataBind()
        End If
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        If ListBox2.SelectedIndex <> -1 Then
            SQL_Codes.RunCommand("DELETE From Teller_Depts WHERE TellerID =" & Label1.Text & " AND DeptID =" & ListBox2.SelectedValue)
            ListBox2.DataBind()
            ListBox3.DataBind()
        End If
    End Sub
End Class
