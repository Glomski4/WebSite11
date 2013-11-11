Imports Microsoft.VisualBasic

Public Class SQL_Codes
    Shared Function GetData(ByVal Table As String, ByVal Field As String, ByVal Where As String, ByVal Filter As String) As String
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.Connection = sqlConn
        sqlComm.CommandText = "Select " & Field & " From " & Table & " Where ([" & Where & "] = '" & Filter & "')"
        If IsDBNull(sqlComm.ExecuteScalar) Then
            GetData = ""
        ElseIf sqlComm.ExecuteScalar Is Nothing Then
            GetData = ""
        Else
            GetData = sqlComm.ExecuteScalar.ToString.Trim
        End If
        sqlConn.Close()
    End Function
    Shared Function GetDataFiltering(ByVal Table As String, ByVal Field As String, ByVal Filter As String) As String
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.Connection = sqlConn
        sqlComm.CommandText = "Select " & Field & " From " & Table & " Where " & Filter
        If IsDBNull(sqlComm.ExecuteScalar) Then
            GetDataFiltering = ""
        ElseIf sqlComm.ExecuteScalar Is Nothing Then
            GetDataFiltering = ""
        Else
            GetDataFiltering = sqlComm.ExecuteScalar.ToString.Trim
        End If
        sqlConn.Close()
    End Function
    Shared Function UpdateData(ByVal Table As String, ByVal Field As String, ByVal NewData As String, ByVal Where As String, ByVal Filter As String) As String
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.Connection = sqlConn
        sqlComm.CommandText = "Update " & Table & " Set " & Field & " = '" & NewData & "' Where ([" & Where & "] = '" & Filter & "')"
        If IsDBNull(sqlComm.ExecuteNonQuery) Then
            UpdateData = "Error"
        Else
            UpdateData = sqlComm.ExecuteNonQuery
        End If
        sqlConn.Close()
    End Function
    Shared Function UpdateDataGroup(ByVal Table As String, ByVal Where As String, ByVal Filter As String, Optional ByVal Group As String = "Field = ' & NewText & ', ") As String
        If Group = "Field = NewText, " Then
            UpdateDataGroup = "Error"
            Exit Function
        End If
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.Connection = sqlConn
        sqlComm.CommandText = "Update " & Table & " Set " & Group & " Where ([" & Where & "] = '" & Filter & "')"
        If IsDBNull(sqlComm.ExecuteNonQuery) Then
            UpdateDataGroup = "Error"
        Else
            UpdateDataGroup = sqlComm.ExecuteNonQuery
        End If
        sqlConn.Close()
    End Function
    Shared Function AddNewData(ByVal Table As String, ByVal Fields As String, ByVal Values As String) As String
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.Connection = sqlConn
        sqlComm.CommandText = "INSERT INTO " & Table & " ( " & Fields & " ) VALUES ( " & Values & " )"
        If IsDBNull(sqlComm.ExecuteNonQuery) Then
            AddNewData = "Error"
        Else
            AddNewData = "Done"
        End If
        sqlConn.Close()
    End Function
    Shared Function RunCommand(ByVal Command As String) As String
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.Connection = sqlConn
        sqlComm.CommandText = Command
        If IsDBNull(sqlComm.ExecuteNonQuery) Then
            RunCommand = "Error"
        Else
            RunCommand = "Done"
        End If
        sqlConn.Close()
    End Function
    Shared Function RunCommandGet(ByVal Command As String) As String
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.Connection = sqlConn
        sqlComm.CommandText = Command
        If IsDBNull(sqlComm.ExecuteNonQuery) Then
            RunCommandGet = "Error"
        Else
            RunCommandGet = sqlComm.ExecuteScalar
        End If
        sqlConn.Close()
    End Function
End Class
