
Partial Class Docs_OrderDoc
    Inherits System.Web.UI.Page

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Response.Redirect("~\Docs\OrderDoc.aspx?LoanNo=" & TextBox1.Text)
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Alert.Visible = False
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        Dim intCount As Integer
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.CommandText = "SELECT COUNT(DocLine) AS Expr1 FROM DocsOrdered WHERE (DocID = '" & DropDownList1.SelectedValue & "') AND (LoanNo = '" & My.Request.QueryString("LoanNo") & "') AND (OrderedOn = '" & Now.Date() & "')"
        sqlComm.Connection = sqlConn
        intCount = sqlComm.ExecuteScalar
        sqlConn.Close()
        If intCount = 0 Then
            Response.Redirect(My.Request.RawUrl.ToString & "&DocID=" & DropDownList1.SelectedValue)
        Else
            Alert.Visible = True
        End If
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Len(My.Request.QueryString("LoanNo")) > 0 Then
            If Len(My.Request.QueryString("DocID")) > 0 Then
                If Len(My.Request.QueryString("Ordered")) > 0 Then
                Else
                    Dim QueryString As String
                    QueryString = "SELECT [DocDetailsID], [Swap], [SwapDesc], [SwapType], [SwapValues] FROM [DocsLines] WHERE ([DocID] = '" & My.Request.QueryString("DocID") & "')"
                    Using Connection As New System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString)
                        Dim Command As New System.Data.SqlClient.SqlCommand(QueryString, Connection)
                        Connection.Open()
                        Dim Reader As System.Data.SqlClient.SqlDataReader = Command.ExecuteReader()
                        While Reader.Read()
                            Dim AddDiv As HtmlGenericControl = New HtmlGenericControl("div")
                            Select Case Reader(3)
                                Case "Textbox"
                                    Dim Label As New Label
                                    Label.Text = Reader(2)
                                    PlaceHolder_Doc.Controls.Add(Label)
                                    Dim N_TextBox As New TextBox
                                    N_TextBox.ID = Reader(1)
                                    PlaceHolder_Doc.Controls.Add(N_TextBox)
                                    PlaceHolder_Doc.Controls.Add(AddDiv)
                                Case "DropDown"
                                    Dim Label As New Label
                                    Label.Text = Reader(2)
                                    PlaceHolder_Doc.Controls.Add(Label)
                                    Dim N_Dropdown As New DropDownList
                                    N_Dropdown.ID = Reader(1)
                                    Dim TestString As String = Reader(4)
                                    Dim TestArray() As String = Split(TestString, ",")
                                    Dim LastNonEmpty As Integer = -1
                                    For i As Integer = 0 To TestArray.Length - 1
                                        N_Dropdown.Items.Add(TestArray(i))
                                    Next
                                    PlaceHolder_Doc.Controls.Add(N_Dropdown)
                                    PlaceHolder_Doc.Controls.Add(AddDiv)
                                Case "System"
                                Case "Close"
                                    Dim Label As New Label
                                    Label.Text = Reader(2)
                                    PlaceHolder_Doc.Controls.Add(Label)
                            End Select
                        End While
                        Reader.Close()
                        Connection.Close()
                    End Using
                End If
            End If
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Len(My.Request.QueryString("LoanNo")) > 0 Then
            If Len(My.Request.QueryString("DocID")) > 0 Then
                If Len(My.Request.QueryString("Ordered")) > 0 Then
                    MultiView2.ActiveViewIndex = 3
                Else
                    MultiView2.ActiveViewIndex = 2
                End If
            Else
                MultiView2.ActiveViewIndex = 1
            End If
        Else
            MultiView2.ActiveViewIndex = 0
            If Len(Session("LoanNo")) > 0 Then
                Response.Redirect("~\Docs\OrderDoc.aspx?LoanNo=" & Session("LoanNo"))
            End If
        End If
    End Sub

    Protected Sub MultiView2_ActiveViewChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles MultiView2.ActiveViewChanged
        If MultiView2.ActiveViewIndex = 2 Then

        End If
    End Sub

    
    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        'Save Doc Order
        Dim QueryString As String
        QueryString = "SELECT [DocDetailsID], [Swap], [SwapDesc], [SwapType], [SwapValues], [DocLine], [SwapDesc] FROM [DocsLines] WHERE ([DocID] = '" & My.Request.QueryString("DocID") & "')"
        Using Connection As New System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString)
            Dim Command As New System.Data.SqlClient.SqlCommand(QueryString, Connection)
            Connection.Open()
            Dim Reader As System.Data.SqlClient.SqlDataReader = Command.ExecuteReader()
            While Reader.Read()
                Select Case Reader(3)
                    Case "Textbox"
                        Dim N_TextBox As TextBox = PlaceHolder_Doc.FindControl(Reader(1))
                        AddLine(Reader(5), N_TextBox.Text)
                    Case "DropDown"
                        Dim N_Dropdown As DropDownList = PlaceHolder_Doc.FindControl(Reader(1))
                        AddLine(Reader(5), N_Dropdown.SelectedItem.ToString)
                    Case "System"
                        If Reader(6) = "Loans" Then
                            AddLine(Reader(5), SQL_Codes.GetData(Reader(6), Replace(Replace(Reader(1), "(", ""), ")", ""), "LoanID", My.Request.QueryString("LoanNo")))
                        ElseIf Reader(6) = "User" Then
                            AddLine(Reader(5), SQL_Codes.GetData(Reader(6), Replace(Replace(Reader(1), "(", ""), ")", ""), "Username", Session("User")))
                        End If
                    Case "System_Clients"
                    Case "System_Clients"
                End Select
            End While
            Reader.Close()
            Connection.Close()
        End Using
        Dim DocName As String = SQL_Codes.GetData("Docs", "DocName", "DocID", My.Request.QueryString("DocID"))
        SQL_Codes.RunCommand("INSERT INTO Notes (LoanID, Priority, Dept, NoteDateTime, Note, EnteredBy) VALUES('" & Session("LoanNo") & "','N','10','" & Now & "','Ordered - " & DocName & "','" & Session("User") & "')")
        MultiView2.ActiveViewIndex = 3
    End Sub

    Public Sub AddLine(ByVal DocLine As Integer, ByVal Value As String)
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        Dim intCount As Integer
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.CommandText = "INSERT INTO DocsOrdered(DocID, DocLine, LoanNo, OrderedOn, OrderedBy, Value) VALUES " & _
        "('" & My.Request.QueryString("DocID") & "','" & DocLine & "','" & My.Request.QueryString("LoanNo") & "','" & DateString & "','" & Session("User") & "','" & Value & "')"
        sqlComm.Connection = sqlConn
        intCount = sqlComm.ExecuteNonQuery
        sqlConn.Close()
    End Sub
End Class
