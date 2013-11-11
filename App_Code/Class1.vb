Imports Microsoft.VisualBasic

Public Class Class1
    Shared Function GetAuthLevel(ByVal Username As String, ByVal LevelNeeded As String) As String
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.CommandText = "Select AuthLevel from Users where Username = '" & Username & "'"
        sqlComm.Connection = sqlConn
        GetAuthLevel = sqlComm.ExecuteScalar
        sqlConn.Close()
        If Len(Username) = 0 Then
            My.Response.Redirect("~\Login.aspx?GOTO=" + My.Request.RawUrl)
        ElseIf GetAuthLevel < LevelNeeded Then
            My.Response.Redirect("~\NotAuth.aspx")
        End If
    End Function
    Shared Function GenRandomString() As String
        Dim arrPossibleChars As Char() = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".ToCharArray()
        Dim intPasswordLength As Integer = 10
        Dim stringPassword As String = Nothing
        Dim rand As System.Random = New Random
        Dim i As Integer = 0
        For i = 0 To intPasswordLength
            Dim intRandom As Integer = rand.Next(arrPossibleChars.Length)
            stringPassword = stringPassword & arrPossibleChars(intRandom).ToString()
        Next
        Return stringPassword
    End Function
    Shared Function GenRandomNumberString() As String
        Dim arrPossibleChars As Char() = "0123456789".ToCharArray()
        Dim intPasswordLength As Integer = 10
        Dim stringPassword As String = Nothing
        Dim rand As System.Random = New Random
        Dim i As Integer = 0
        For i = 0 To intPasswordLength
            Dim intRandom As Integer = rand.Next(arrPossibleChars.Length)
            stringPassword = stringPassword & arrPossibleChars(intRandom).ToString()
        Next
        Return stringPassword
    End Function
End Class
