
Partial Class Loan_ALS_Cases_OpenNewCase
    Inherits System.Web.UI.Page

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Response.Redirect("~\Loan\ALS\Cases\OpenNewCase.aspx?LoanNo=" & TextBox1.Text)
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Alert.Visible = False
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        Dim intCount As Integer
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.CommandText = "SELECT COUNT(CaseNumber) AS Expr1 FROM Case_Status WHERE (CaseID = '" & DropDownList1.SelectedValue & "') AND (LoanNo = '" & My.Request.QueryString("LoanNo") & "') AND (Status = 'O')"
        sqlComm.Connection = sqlConn
        intCount = sqlComm.ExecuteScalar
        sqlConn.Close()
        If intCount = 0 Then
            Response.Redirect(My.Request.RawUrl.ToString & "&CaseID=" & DropDownList1.SelectedValue)
        Else
            Alert.Visible = True
            Alert2.Visible = True
            MultiView2.ActiveViewIndex = 1
        End If
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        MaintainScrollPositionOnPostBack = True
        If Len(My.Request.QueryString("LoanNo")) > 0 Then
            DropDownList1.Focus()
            If Len(My.Request.QueryString("CaseID")) > 0 Then
                If Len(My.Request.QueryString("Ordered")) > 0 Then
                Else
                    Dim QueryString As String
                    Dim FirstRow As Boolean = True
                    Dim FirstRowName As String
                    QueryString = "SELECT [CaseLineID], [LineType], [LineDetails], [LineLimit], [LineValues], [LineRow], [LineColumn], [LineColspan], [LineRowSpan] FROM [Case_Details] WHERE ([CaseID] = " & My.Request.QueryString("CaseID") & ") ORDER BY LineRow, LineColumn"
                    Using Connection As New System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString)
                        Dim Command As New System.Data.SqlClient.SqlCommand(QueryString, Connection)
                        Connection.Open()
                        Dim LastCol = 1
                        Dim LastRow = 1
                        Dim Reader As System.Data.SqlClient.SqlDataReader = Command.ExecuteReader()
                        Dim tbl As Table = New Table()
                        Dim tr As TableRow = New TableRow()
                        tbl.CellPadding = 5
                        tbl.CellSpacing = 5
                        If Reader.HasRows = True Then
                            PlaceHolder_Doc.Controls.Add(tbl)
                        End If
                        While Reader.Read()
                            If FirstRow = True Then
                                FirstRowName = Reader(0)
                                FirstRow = False
                            End If
                            Dim CurCol = Reader(6)
                            Dim CurRow = Reader(5)
                            Dim tc As TableCell = New TableCell()
                            tc.BorderColor = Drawing.Color.Gray
                            tc.BorderStyle = BorderStyle.Solid
                            tc.BorderWidth = 1
                            Select Case Reader(1).ToString.Trim
                                Case "Textbox"
                                    Dim Label As New Label
                                    Label.Text = Reader(2) & "<br>"
                                    tc.Controls.Add(Label)
                                    Dim N_TextBox As New TextBox
                                    N_TextBox.ID = Reader(0)
                                    If IsDBNull(Reader(4)) = False Then
                                        N_TextBox.Text = Reader(4)
                                    End If
                                    N_TextBox.MaxLength = Reader(3)
                                    tc.Controls.Add(N_TextBox)
                                Case "DropDown"
                                    Dim Label As New Label
                                    Label.Text = Reader(2) & "<br>"
                                    tc.Controls.Add(Label)
                                    Dim N_Dropdown As New DropDownList
                                    N_Dropdown.ID = Reader(0)
                                    Dim TestString As String = Reader(4)
                                    Dim TestArray() As String = Split(TestString, ",")
                                    Dim LastNonEmpty As Integer = -1
                                    For i As Integer = 0 To TestArray.Length - 1
                                        N_Dropdown.Items.Add(TestArray(i))
                                    Next
                                    tc.Controls.Add(N_Dropdown)
                                Case "Notice"
                                    Dim Label As New Label
                                    Label.Text = Reader(2) & "<br><b>" & Reader(4) & "</b>"
                                    PlaceHolder_Doc.Controls.Add(Label)
                                Case "Details"
                                    Dim Label As New Label
                                    Label.Text = Reader(2) & "<br>"
                                    tc.Controls.Add(Label)
                                    Dim N_TextBox_Notice As New TextBox
                                    N_TextBox_Notice.ID = Reader(0)
                                    N_TextBox_Notice.MaxLength = Reader(3)
                                    N_TextBox_Notice.Rows = 5
                                    If IsDBNull(Reader(4)) = False Then
                                        N_TextBox_Notice.Text = Reader(4)
                                    End If
                                    N_TextBox_Notice.Columns = 20 * Reader(7)
                                    N_TextBox_Notice.TextMode = TextBoxMode.MultiLine
                                    tc.Controls.Add(N_TextBox_Notice)
                            End Select
                            tc.ColumnSpan = Reader(7)
                            tc.RowSpan = Reader(8)
                            If CurRow <> LastRow Then
                                tr = Nothing
                                tr = New TableRow()
                            End If
                            tr.Cells.Add(tc)
                            LastCol = CurCol
                            LastRow = CurRow
                            tbl.Rows.Add(tr)
                        End While
                        Reader.Close()
                        Connection.Close()
                    End Using
                    If FirstRow = False Then
                        Dim FirstControl = PlaceHolder_Doc.FindControl(FirstRowName)
                        FirstControl.Focus()
                    End If
                End If
            End If
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        MaintainScrollPositionOnPostBack = True
        If Len(My.Request.QueryString("LoanNo")) > 0 Then
            If Len(My.Request.QueryString("CaseID")) > 0 Then
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
                Response.Redirect("~\Loan\ALS\Cases\OpenNewCase.aspx?LoanNo=" & Session("LoanNo"))
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
        Alert.Visible = False
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        Dim intCount As Integer
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.CommandText = "SELECT COUNT(CaseNumber) AS Expr1 FROM Case_Status WHERE (CaseID = '" & My.Request.QueryString("CaseID") & "') AND (LoanNo = '" & My.Request.QueryString("LoanNo") & "') AND (Status = 'O')"
        sqlComm.Connection = sqlConn
        intCount = sqlComm.ExecuteScalar
        sqlConn.Close()
        If intCount > 0 Then
            Alert.Visible = True
            Alert2.Visible = True
            MultiView2.ActiveViewIndex = 1
            Exit Sub
        End If
        Dim TAT As Integer = SQL_Codes.GetData("Case_Types", "CaseTime", "CaseID", My.Request.QueryString("CaseID"))
        Dim DEPT = SQL_Codes.GetData("Case_Types", "DeptID", "CaseID", My.Request.QueryString("CaseID"))
        Dim Teller = SQL_Codes.GetData("Users", "TellerID", "Username", Session("User"))
        If IsDBNull(Teller) Then
            MultiView2.ActiveViewIndex = 4
            Exit Sub
        End If
        Dim TATDATE, NOWDATE As Date
        Dim CurPegTime As DateTime
        CurPegTime = Now()
        NOWDATE = DateValue(CurPegTime)
        TATDATE = DateAdd(DateInterval.Day, TAT, DateValue(CurPegTime))
        SQL_Codes.RunCommand("INSERT INTO Case_Status (CaseID, DeptID, LoanNo, OpenTeller, OpenDate, PromiseDate, FollowUpDate, AssignedTeller, Status) " & _
                             "VALUES('" & My.Request.QueryString("CaseID") & "','" & DEPT & "','" & My.Request.QueryString("LoanNo") & "','" & Teller & "','" & NOWDATE & "','" & TATDATE & "','" & TATDATE & "','00000','O')")
        Dim NewCaseNumber = SQL_Codes.GetDataFiltering("Case_Status", "CaseNumber", "CaseID = '" & My.Request.QueryString("CaseID") & "' AND LoanNo = '" & My.Request.QueryString("LoanNo") & "' AND OpenTeller = '" & Teller & "' AND OpenDate = '" & NOWDATE & "'")
        SQL_Codes.RunCommand("INSERT INTO Case_Notes_Entrys (NoteAdded, CaseID, AddedBy, Description) " & _
                             "VALUES ('" & CurPegTime & "','" & NewCaseNumber & "','" & Session("User") & "','New Case Added')")
        Dim NewNoteID = SQL_Codes.GetDataFiltering("Case_Notes_Entrys", "NoteID", "NoteAdded = '" & CurPegTime & "' AND CaseID = '" & NewCaseNumber & "' AND AddedBy = '" & Session("User") & "'")
        QueryString = "SELECT [CaseLineID], [LineType], [LineDetails], [LineLimit], [LineValues], [LineRow], [LineColumn], [LineColspan], [LineRowSpan] FROM [Case_Details] WHERE ([CaseID] = " & My.Request.QueryString("CaseID") & ") ORDER BY LineRow, LineColumn"
        Using Connection As New System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString)
            Dim Command As New System.Data.SqlClient.SqlCommand(QueryString, Connection)
            Connection.Open()
            Dim Reader As System.Data.SqlClient.SqlDataReader = Command.ExecuteReader()
            While Reader.Read()
                Select Case Reader(1).ToString.Trim
                    Case "Textbox"
                        Dim N_TextBox As TextBox = PlaceHolder_Doc.FindControl(Reader(0))
                        Dim PostMessage As String = Reader(2).ToString.Trim & " : " & N_TextBox.Text.ToString.Trim
                        AddLine(NewNoteID, PostMessage)
                    Case "DropDown"
                        Dim N_Dropdown As DropDownList = PlaceHolder_Doc.FindControl(Reader(0))
                        Dim PostMessage As String = Reader(2).ToString.Trim & " : " & N_Dropdown.SelectedItem.ToString.Trim
                        AddLine(NewNoteID, PostMessage)
                    Case "Notice"
                        Dim N_TextBox As TextBox = PlaceHolder_Doc.FindControl(Reader(0))
                        Dim PostMessage As String = Reader(2).ToString.Trim & " : " & N_TextBox.Text.ToString.Trim
                        AddLine(NewNoteID, PostMessage)
                    Case "Details"
                        Dim N_TextBox As TextBox = PlaceHolder_Doc.FindControl(Reader(0))
                        Dim PostMessage As String = Reader(2).ToString.Trim & " : " & N_TextBox.Text.ToString.Trim
                        AddLine(NewNoteID, PostMessage)
                End Select
            End While
            Reader.Close()
            Connection.Close()
        End Using
        Dim CaseName As String = SQL_Codes.GetData("Case_Types", "CaseName", "CaseID", My.Request.QueryString("CaseID"))
        SQL_Codes.RunCommand("INSERT INTO Notes (LoanID, Priority, Dept, NoteDateTime, Note, EnteredBy) VALUES('" & My.Request.QueryString("LoanNo") & "','N','13','" & Now & "','Case Opened (" & NewCaseNumber & ") - " & My.Request.QueryString("CaseID") & " | " & CaseName & "','" & Session("User") & "')")
        MultiView2.ActiveViewIndex = 3
        ClientScript.RegisterStartupScript(Me.GetType(), "script", "CloseWindow();", True)
    End Sub

    Public Sub AddLine(ByVal NoteID As Integer, ByVal Note As String)
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        Note = Replace(Note, "'", "''")
        Dim PostNotes As String = UCase(Note)
        Dim NoteToPost As String
        Do Until Len(PostNotes) = 0
            If Len(PostNotes) > 50 Then
                For X = 0 To 49
                    NoteToPost = Left(PostNotes, 50 - X)
                    If Right(NoteToPost, 1) = " " Then
                        sqlComm.CommandText = "INSERT INTO Case_Notes (NoteID, Note) VALUES ('" & NoteID & "','" & NoteToPost & "')"
                        sqlComm.Connection = sqlConn
                        sqlComm.ExecuteNonQuery()
                        PostNotes = Replace(PostNotes, NoteToPost, "")
                        Exit For
                    End If
                Next
            Else
                sqlComm.CommandText = "INSERT INTO Case_Notes (NoteID, Note) VALUES ('" & NoteID & "','" & PostNotes & "')"
                sqlComm.Connection = sqlConn
                sqlComm.ExecuteNonQuery()
                PostNotes = ""
            End If
        Loop
        sqlConn.Close()
    End Sub
End Class
