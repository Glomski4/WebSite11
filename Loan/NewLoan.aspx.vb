
Partial Class Loan_NewLoan
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label1.Text = My.Request.QueryString("CarID")
        If IsNumeric(Label1.Text) Then
        Else
            Label2.Visible = True
            TextBox1.Enabled = False
            Wizard1.Enabled = False
        End If
        Label3.Text = Wizard1.ActiveStep.Title
    End Sub

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton2.Click
        Response.Redirect("~\Loan\NewLoan.aspx?CarID=" & My.Request.QueryString("CarID"))
    End Sub

    Protected Sub Wizard1_NextButtonClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.WizardNavigationEventArgs) Handles Wizard1.NextButtonClick
        If Wizard1.ActiveStepIndex = 0 Then
            Dim sqlConn As New System.Data.SqlClient.SqlConnection
            Dim sqlComm As New System.Data.SqlClient.SqlCommand
            Dim intCount As Integer
            sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
            sqlConn.Open()
            sqlComm.CommandText = "Select count(*) from Clients where SSN = '" & TextBox1.Text & "'"
            sqlComm.Connection = sqlConn
            intCount = sqlComm.ExecuteScalar
            sqlConn.Close()
            If intCount = 1 Then 'Client On File
                MultiView1.ActiveViewIndex = 2
                TextBox1.Enabled = False
            ElseIf intCount = 0 Then ' Client Not On File
                MultiView1.ActiveViewIndex = 1
                NC_SSN.Text = TextBox1.Text
                NC_LastUpdated.Text = Now()
            Else ' System Issue With SSN more then 1
                MultiView1.ActiveViewIndex = 0
                Label4.Text = TextBox1.TabIndex
            End If
            Wizard1.ActiveStepIndex = 1
        ElseIf Wizard1.ActiveStepIndex = 1 Then
            If MultiView1.ActiveViewIndex = 1 Then ' Client Not On File
                Dim sqlConn As New System.Data.SqlClient.SqlConnection
                Dim sqlComm As New System.Data.SqlClient.SqlCommand
                Dim intCount As Integer
                sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
                sqlConn.Open()
                sqlComm.CommandText = "INSERT INTO Clients (FirstName, MiddleName, LastName, Address1, Address2, City, State, Zip, Phone, SSN, ID, IDState, LastUpdated) VALUES('" & NC_FirstName.Text & "','" & NC_MiddleName.Text & " ','" & NC_LastName.Text & "','" & NC_Address1.Text & "','" & NC_Address2.Text & "','" & NC_City.Text & "','" & NC_State.Text & "','" & NC_Zip.Text & "','" & NC_Phone.Text & "','" & NC_SSN.Text & "','" & NC_ID.Text & "','" & NC_IDState.Text & "','" & Now() & "')"
                sqlComm.Connection = sqlConn
                intCount = sqlComm.ExecuteNonQuery
                sqlConn.Close()
                If intCount = 1 Then ' Client Added
                    sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
                    sqlConn.Open()
                    sqlComm.CommandText = "Select count(*) from Clients where SSN = '" & TextBox1.Text & "'"
                    sqlComm.Connection = sqlConn
                    intCount = sqlComm.ExecuteScalar
                    sqlConn.Close()
                    If intCount = 1 Then 'Client On File
                        MultiView1.ActiveViewIndex = 2
                        TextBox1.Enabled = False
                    ElseIf intCount = 0 Then ' Client Not On File
                        MultiView1.ActiveViewIndex = 1
                        NC_SSN.Text = TextBox1.Text
                        NC_LastUpdated.Text = Now()
                    Else ' System Issue With SSN more then 1
                        MultiView1.ActiveViewIndex = 0
                        Label4.Text = TextBox1.TabIndex
                    End If
                    Wizard1.ActiveStepIndex = 1
                Else ' Error when adding client

                End If
            ElseIf MultiView1.ActiveViewIndex = 2 Then 'Client On File
                Wizard1.ActiveStepIndex = Wizard1.ActiveStepIndex + 1
            Else ' System Issue With SSN more then 1
            End If
        Else
            Wizard1.ActiveStepIndex = Wizard1.ActiveStepIndex + 1
        End If
    End Sub

    Protected Sub Wizard1_CancelButtonClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles Wizard1.CancelButtonClick
        Dim SellSQL As New SqlDataSource
        SellSQL.UpdateCommand = "UPDATE [Car] SET [Active] = 'Y' WHERE [CarID] ='" & My.Request.QueryString("CarID") & "'"
        SellSQL.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        SellSQL.Update()
        Response.Redirect("~\Cars\CarDetails.aspx?CarID=" & My.Request.QueryString("CarID"))
    End Sub

    Protected Sub Wizard1_FinishButtonClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.WizardNavigationEventArgs) Handles Wizard1.FinishButtonClick
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        Dim intCount As Integer
        Dim ClientID As String
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.CommandText = "Select ClientID from Clients where SSN = '" & TextBox1.Text & "'"
        sqlComm.Connection = sqlConn
        ClientID = sqlComm.ExecuteScalar
        sqlConn.Close()
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.CommandText = "INSERT INTO PendingApps (CarID, ClientID, Created,AppStatus) VALUES ('" & My.Request.QueryString("CarID") & "','" & ClientID & "','" & Now() & "','C')"
        sqlComm.Connection = sqlConn
        intCount = sqlComm.ExecuteNonQuery
        sqlConn.Close()
        Response.Redirect("~\Cars\CarDetails.aspx?CarID=" & My.Request.QueryString("CarID"))
    End Sub
End Class
