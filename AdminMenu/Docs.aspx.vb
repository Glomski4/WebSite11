
Partial Class AdminMenu_Docs
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        GridView1.DataBind()
        GridView2.DataBind()
        GridView3.DataBind()
        FormView1.DataBind()
        FormView2.DataBind()
        FormView3.DataBind()
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        MaintainScrollPositionOnPostBack = True
        Dim Address As String
        Address = Left(My.Request.UrlReferrer.AbsoluteUri, Len(My.Request.UrlReferrer.AbsoluteUri) - 10)
        Button2.OnClientClick = "window.open('" & Address & "Docs/OrderDoc.aspx',null,'height=500, width=500,status= no, resizable= Yes, scrollbars=yes, toolbar=no,location=no,menubar=no ');"
    End Sub

    Protected Sub Button3_Click1(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim FileUpload1 As FileUpload = FormView2.FindControl("FileUpload1")
        Dim Alert As Label = FormView2.FindControl("Alert")
        If FileUpload1.HasFile Then
            If UCase(Right(FileUpload1.FileName, 4)) = ".TXT" Then
                FileUpload1.SaveAs(My.Request.PhysicalApplicationPath & "\AdminMenu\Docs\" & GridView1.SelectedValue & "-" & GridView2.SelectedValue & ".txt")
                Alert.Text = "File Uploaded"
            Else
                Alert.Text = "File Not Vaild. - " & Right(FileUpload1.FileName, 4)
            End If
        Else
            Alert.Text = "Please pick file."
        End If
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        On Error GoTo ErrorOut
        Dim fileContents As String
        fileContents = My.Computer.FileSystem.ReadAllText(My.Request.PhysicalApplicationPath & "\AdminMenu\Docs\" & GridView1.SelectedValue & "-" & GridView2.SelectedValue & ".txt")
        Dim CCount As Integer = 0
        Do Until Len(fileContents) = 0
            For X = 1 To Len(fileContents)
                Dim S_Text As String = Right(fileContents, Len(fileContents) - X)
                Dim S_Text1 As String = Right(Left(fileContents, X), 1)
                If S_Text1 = "(" Then
                    For Q = 1 To 20
                        Dim S_Text2 As String = Right(Left(S_Text, Q), 1)
                        If S_Text2 = ")" Then
                            ListBox1.Items.Add("(" & Left(S_Text, Q - 1) & ")")
                            AddItemToDB("(" & Left(S_Text, Q - 1) & ")")
                            fileContents = Right(fileContents, Len(fileContents) - (X + Q))
                            Exit For
                        End If
                    Next
                ElseIf S_Text1 = "{" Then
                    For Q = 1 To 20
                        Dim S_Text2 As String = Right(Left(S_Text, Q), 1)
                        If S_Text2 = "}" Then
                            ListBox1.Items.Add("{" & Left(S_Text, Q - 1) & "}")
                            AddItemToDB("{" & Left(S_Text, Q - 1) & "}")
                            fileContents = Right(fileContents, Len(fileContents) - (X + Q))
                            Exit For
                        End If
                    Next
                End If
                If ListBox1.Items.Count > CCount Then
                    CCount += 1
                    Exit For
                End If
                If X = Len(fileContents) Then
                    Exit Do
                End If
            Next
        Loop
        GridView3.DataBind()
        FormView3.DataBind()
ErrorOut:

    End Sub

    Public Sub AddItemToDB(ByVal Text As String)
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        Dim S_Type As String
        If Right(Left(Text, 1), 1) = "(" Then
            S_Type = "System"
        Else
            S_Type = "Textbox"
        End If
        sqlComm.CommandText = "INSERT INTO DocsLines (DocID, DocDetailsID, Swap, SwapType) VALUES" & _
        "('" & GridView1.SelectedValue & "','" & GridView2.SelectedValue & " ','" & Text & "','" & S_Type & "')"
        sqlComm.Connection = sqlConn
        sqlComm.ExecuteNonQuery()
        sqlConn.Close()
    End Sub

    Protected Sub FormView3_ModeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView3.ModeChanged
        GridView3.DataBind()
    End Sub

    Protected Sub FormView2_ModeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView2.ModeChanged
        GridView2.DataBind()
    End Sub

    Protected Sub FormView1_ModeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.ModeChanged
        GridView1.DataBind()
    End Sub
End Class
