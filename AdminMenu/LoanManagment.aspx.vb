
Partial Class AdminMenu_LoanManagment
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack = True Then
            MaintainScrollPositionOnPostBack = True
        End If
    End Sub

    Protected Sub FormView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
        On Error Resume Next
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.Connection = sqlConn
        For asa = 0 To e.OldValues.Count - 1
            If e.OldValues(asa).ToString <> e.NewValues(asa).ToString Then
                Select Case e.NewValues.Keys(asa).ToString.Trim
                    Case "CurrBalance"
                        Dim PrinAdj As Double = CDbl(e.OldValues(asa)) - CDbl(e.NewValues(asa))
                        sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & TextBox1.Text & "','" & Now() & "','" & Now() & "','" & CDate(GetDataText("CurrPmtDue")) & "',9,'" & e.NewValues.Keys(asa).ToString.Trim & " changed from " & FormatCurrency(e.OldValues(asa).ToString) & " to " & FormatCurrency(e.NewValues(asa).ToString) & "'," & PrinAdj & ",0,0,0,'" & Session("User") & "')"
                        sqlComm.ExecuteScalar()
                    Case "OpenDate"
                        sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & TextBox1.Text & "','" & Now() & "','" & Now() & "','" & CDate(GetDataText("CurrPmtDue")) & "',9,'" & e.NewValues.Keys(asa).ToString.Trim & " changed from " & FormatDateTime(e.OldValues(asa).ToString.Trim(), DateFormat.ShortDate) & " to " & FormatDateTime(e.NewValues(asa).ToString.Trim(), DateFormat.ShortDate) & "',0,0,0,0,'" & Session("User") & "')"
                        sqlComm.ExecuteScalar()
                    Case "FirstPmtDate"
                        sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & TextBox1.Text & "','" & Now() & "','" & Now() & "','" & CDate(GetDataText("CurrPmtDue")) & "',9,'" & e.NewValues.Keys(asa).ToString.Trim & " changed from " & FormatDateTime(e.OldValues(asa).ToString.Trim(), DateFormat.ShortDate) & " to " & FormatDateTime(e.NewValues(asa).ToString.Trim(), DateFormat.ShortDate) & "',0,0,0,0,'" & Session("User") & "')"
                        sqlComm.ExecuteScalar()
                    Case "CurrPmtDue"
                        sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & TextBox1.Text & "','" & Now() & "','" & Now() & "','" & CDate(GetDataText("CurrPmtDue")) & "',9,'" & e.NewValues.Keys(asa).ToString.Trim & " changed from " & FormatDateTime(e.OldValues(asa).ToString.Trim(), DateFormat.ShortDate) & " to " & FormatDateTime(e.NewValues(asa).ToString.Trim(), DateFormat.ShortDate) & "',0,0,0,0,'" & Session("User") & "')"
                        sqlComm.ExecuteScalar()
                    Case "LCAmount"
                        sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & TextBox1.Text & "','" & Now() & "','" & Now() & "','" & CDate(GetDataText("CurrPmtDue")) & "',9,'" & e.NewValues.Keys(asa).ToString.Trim & " changed from " & FormatCurrency(e.OldValues(asa).ToString) & " to " & FormatCurrency(e.NewValues(asa).ToString) & "',0,0,0,0,'" & Session("User") & "')"
                        sqlComm.ExecuteScalar()
                    Case "LoanAmount"
                        sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & TextBox1.Text & "','" & Now() & "','" & Now() & "','" & CDate(GetDataText("CurrPmtDue")) & "',9,'" & e.NewValues.Keys(asa).ToString.Trim & " changed from " & FormatCurrency(e.OldValues(asa).ToString) & " to " & FormatCurrency(e.NewValues(asa).ToString) & "',0,0,0,0,'" & Session("User") & "')"
                        sqlComm.ExecuteScalar()
                    Case "MonthlyPmt"
                        sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & TextBox1.Text & "','" & Now() & "','" & Now() & "','" & CDate(GetDataText("CurrPmtDue")) & "',9,'" & e.NewValues.Keys(asa).ToString.Trim & " changed from " & FormatCurrency(e.OldValues(asa).ToString) & " to " & FormatCurrency(e.NewValues(asa).ToString) & "',0,0,0,0,'" & Session("User") & "')"
                        sqlComm.ExecuteScalar()
                    Case "IntRate"
                        sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & TextBox1.Text & "','" & Now() & "','" & Now() & "','" & CDate(GetDataText("CurrPmtDue")) & "',9,'" & e.NewValues.Keys(asa).ToString.Trim & " changed from " & FormatPercent(e.OldValues(asa).ToString, 4) & " to " & FormatPercent(e.NewValues(asa).ToString, 4) & "',0,0,0,0,'" & Session("User") & "')"
                        sqlComm.ExecuteScalar()
                    Case "DownPmt"
                        sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & TextBox1.Text & "','" & Now() & "','" & Now() & "','" & CDate(GetDataText("CurrPmtDue")) & "',9,'" & e.NewValues.Keys(asa).ToString.Trim & " changed from " & FormatCurrency(e.OldValues(asa).ToString) & " to " & FormatCurrency(e.NewValues(asa).ToString) & "',0,0,0,0,'" & Session("User") & "')"
                        sqlComm.ExecuteScalar()
                    Case "LastPmtPosted"
                        sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & TextBox1.Text & "','" & Now() & "','" & Now() & "','" & CDate(GetDataText("CurrPmtDue")) & "',9,'" & e.NewValues.Keys(asa).ToString.Trim & " changed from " & FormatDateTime(e.OldValues(asa).ToString.Trim(), DateFormat.ShortDate) & " to " & FormatDateTime(e.NewValues(asa).ToString.Trim(), DateFormat.ShortDate) & "',0,0,0,0,'" & Session("User") & "')"
                        sqlComm.ExecuteScalar()
                    Case "LastStatement"
                        sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & TextBox1.Text & "','" & Now() & "','" & Now() & "','" & CDate(GetDataText("CurrPmtDue")) & "',9,'" & e.NewValues.Keys(asa).ToString.Trim & " changed from " & FormatDateTime(e.OldValues(asa).ToString.Trim(), DateFormat.ShortDate) & " to " & FormatDateTime(e.NewValues(asa).ToString.Trim(), DateFormat.ShortDate) & "',0,0,0,0,'" & Session("User") & "')"
                        sqlComm.ExecuteScalar()
                    Case Else
                        sqlComm.CommandText = "Insert Into Payments (LoanID, PostedDate, EffDate, IntDate, Type, Description, ToPrincipal, ToInterest, ToUnpl, ToFees, EnteredBy) Values ('" & TextBox1.Text & "','" & Now() & "','" & Now() & "','" & CDate(GetDataText("CurrPmtDue")) & "',9,'" & e.NewValues.Keys(asa).ToString.Trim & " changed from " & e.OldValues(asa).ToString.Trim() & " to " & e.NewValues(asa).ToString.Trim() & "',0,0,0,0,'" & Session("User") & "')"
                        sqlComm.ExecuteScalar()
                End Select
            End If
        Next
        sqlConn.Close()
    End Sub

    Protected Sub FormView1_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormView1.ItemUpdating

    End Sub

    Public Function GetDataText(ByVal Item As String) As String
        Dim LoanNo As String = TextBox1.Text
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.Connection = sqlConn
        sqlComm.CommandText = "Select " & Item & " From Loans Where ([LoanID] = '" & LoanNo & "')"
        If IsDBNull(sqlComm.ExecuteScalar) Then
            GetDataText = ""
        Else
            GetDataText = sqlComm.ExecuteScalar.ToString.Trim
        End If
        sqlConn.Close()
    End Function
End Class
