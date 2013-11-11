
Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Username.Focus()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        Dim intCount As Integer
        Dim Actice As String
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.CommandText = "Select count(*) from Users where Username = '" & Username.Text & "' and Password = '" & Password.Text & "'"
        sqlComm.Connection = sqlConn
        intCount = sqlComm.ExecuteScalar
        sqlConn.Close()
        If intCount = 1 Then
            sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
            sqlConn.Open()
            sqlComm.CommandText = "Select Active from Users where Username = '" & Username.Text & "' and Password = '" & Password.Text & "'"
            sqlComm.Connection = sqlConn
            Actice = sqlComm.ExecuteScalar
            sqlConn.Close()
            If Actice = "Y" Then
                Session.Add("User", UCase(Username.Text))
                Dim UpdateSQL As New SqlDataSource
                UpdateSQL.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
                UpdateSQL.UpdateCommand = "UPDATE Users SET LastUsed = '" & Now() & "' WHERE Username ='" & Username.Text & "'"
                UpdateSQL.Update()
                If Len(My.Request.QueryString("GoTo")) > 0 Then
                    If UCase(My.Request.QueryString("GoTo")) Like "*NOTAUTH*" Then
                        Response.Redirect("~\MainMenu.aspx")
                    Else
                        Response.Redirect(My.Request.QueryString("GoTo"))
                    End If
                Else
                    Response.Redirect("~\MainMenu.aspx")
                End If
                Else
                    Alert.Text = "User not actice, Please see a manager."
                End If
        ElseIf intCount = 0 Then
            Alert.Text = "Username or Password not Vaild!"
        Else
            Alert.Text = "System Error. Please see a manager."
        End If
    End Sub
End Class
