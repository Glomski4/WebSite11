
Partial Class Request_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim SType As String = SQL_Codes.GetDataFiltering("Computers", "Type", "[ComputerName] = '" & My.Request.UserHostAddress & "'")
        If SType = "U" Then
            MultiView2.ActiveViewIndex = 1
            Label1.Text = My.Request.UserHostAddress
        ElseIf SType = "M" Then
            MultiView2.ActiveViewIndex = 2
            Label2.Text = My.Request.UserHostAddress
        Else
            MultiView2.ActiveViewIndex = 0
            TextBox1.Text = My.Request.UserHostAddress
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        Dim intCount As Integer
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.CommandText = "INSERT INTO Computers(ComputerName, Type) VALUES " & _
        "('" & TextBox1.Text & "','" & DropDownList1.SelectedValue & "')"
        sqlComm.Connection = sqlConn
        intCount = sqlComm.ExecuteNonQuery
        sqlConn.Close()
    End Sub

    Protected Sub Timer1_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        GridView1.DataBind()
    End Sub

    Protected Sub Timer2_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles Timer2.Tick
        DataList1.DataBind()
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        Dim intCount As Integer
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.CommandText = "INSERT INTO Request(Requester, Request, Status) VALUES " & _
        "('" & Session("User") & "','" & TextBox2.Text & "','P')"
        sqlComm.Connection = sqlConn
        intCount = sqlComm.ExecuteNonQuery
        sqlConn.Close()
        TextBox2.Text = ""
        TextBox2.Focus()
    End Sub


    Protected Sub FormView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
        GridView1.DataBind()
    End Sub

    Protected Sub Timer3_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles Timer3.Tick
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        Dim intCount As Integer
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.CommandText = "INSERT INTO Request(Requester, Request, Status) VALUES " & _
        "('SYSTEM-" & Session("User") & "','AGENT FORCE LOGOUT','S')"
        sqlComm.Connection = sqlConn
        intCount = sqlComm.ExecuteNonQuery
        sqlConn.Close()
        TextBox2.Text = ""
        TextBox2.Focus()
        Session.Remove("USER")
        Response.Redirect("~\REQUEST\")
    End Sub
End Class
