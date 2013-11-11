
Partial Class Loan_ALS_Cases_OpenNewCase
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If Len(My.Request.QueryString("LoanNo")) > 0 Then
            If Len(My.Request.QueryString("CaseID")) > 0 Then
                Dim CurPegTime As DateTime
                CurPegTime = Now()
                SQL_Codes.RunCommand("INSERT INTO Case_Notes_Entrys (NoteAdded, CaseID, AddedBy, Description) " & _
                                     "VALUES ('" & CurPegTime & "','" & My.Request.QueryString("CaseID") & "','" & Session("User") & "','" & TextBox1.Text & "')")
                Dim NewNoteID = SQL_Codes.GetDataFiltering("Case_Notes_Entrys", "NoteID", "NoteAdded = '" & CurPegTime & "' AND CaseID = '" & My.Request.QueryString("CaseID") & "' AND AddedBy = '" & Session("User") & "'")
                AddLine(NewNoteID, TextBox2.Text)
                MultiView2.ActiveViewIndex = 2
            Else
                MultiView2.ActiveViewIndex = 3
            End If
        Else
            MultiView2.ActiveViewIndex = 3
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        TextBox1.Focus()
        MaintainScrollPositionOnPostBack = True
        If Len(My.Request.QueryString("LoanNo")) > 0 Then
            If Len(My.Request.QueryString("CaseID")) > 0 Then
                MultiView2.ActiveViewIndex = 1
            Else
                MultiView2.ActiveViewIndex = 0
            End If
        Else
            MultiView2.ActiveViewIndex = 0
        End If
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
