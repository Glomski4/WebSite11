
Partial Class AdminMenu_CaseStatus
    Inherits System.Web.UI.Page

    Protected Sub CheckBox1_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBox1.CheckedChanged
        If CheckBox1.Checked = True Then
            SqlDataSource2.SelectCommand = "SELECT DISTINCT Users.TellerID, Users.Name + N'(' + CONVERT(Varchar, (SELECT COUNT(*) AS Expr1 FROM Case_Status WHERE (AssignedTeller = Users.TellerID) AND (Status <> N'C'))) + N')' AS OutStanding, Teller_Depts.DeptID FROM Users INNER JOIN Teller_Depts ON Users.TellerID = Teller_Depts.TellerID WHERE (Users.TellerID IS NOT NULL) AND (Teller_Depts.DeptID = " & GridView1.SelectedDataKey(1) & ")"
            ListBox1.DataBind()
        Else
            SqlDataSource2.SelectCommand = "SELECT DISTINCT TellerID, Name + N'(' + CONVERT (Varchar, (SELECT COUNT(*) AS Expr1 FROM Case_Status WHERE (AssignedTeller = Users.TellerID) AND (Status <> N'C'))) + N')' AS OutStanding FROM Users WHERE (TellerID IS NOT NULL)"
            ListBox1.DataBind()
        End If
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        If CheckBox1.Checked = True Then
            SqlDataSource2.SelectCommand = "SELECT DISTINCT Users.TellerID, Users.Name + N'(' + CONVERT(Varchar, (SELECT COUNT(*) AS Expr1 FROM Case_Status WHERE (AssignedTeller = Users.TellerID) AND (Status <> N'C'))) + N')' AS OutStanding, Teller_Depts.DeptID FROM Users INNER JOIN Teller_Depts ON Users.TellerID = Teller_Depts.TellerID WHERE (Users.TellerID IS NOT NULL) AND (Teller_Depts.DeptID = " & GridView1.SelectedDataKey(1) & ")"
            ListBox1.DataBind()
        Else
            SqlDataSource2.SelectCommand = "SELECT DISTINCT TellerID, Name + N'(' + CONVERT (Varchar, (SELECT COUNT(*) AS Expr1 FROM Case_Status WHERE (AssignedTeller = Users.TellerID) AND (Status <> N'C'))) + N')' AS OutStanding FROM Users WHERE (TellerID IS NOT NULL)"
            ListBox1.DataBind()
        End If
        FormView1.DataBind()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If ListBox1.SelectedIndex <> -1 Then
            Dim item As ListItem
            For Each item In ListBox2.Items
                If item.Selected = True Then
                    Dim CurPegTime As DateTime
                    CurPegTime = Now()
                    Dim AssignedTeller = SQL_Codes.GetData("Case_Status", "AssignedTeller", "CaseNumber", item.Value)
                    Dim Teller = ListBox1.SelectedValue
                    If AssignedTeller <> Teller Then
                        SQL_Codes.RunCommand("INSERT INTO Case_Notes_Entrys (NoteAdded, CaseID, AddedBy, Description) " & _
                                             "VALUES ('" & CurPegTime & "','" & item.Value & "','" & Session("User") & "','Case Assignment Changed From " & AssignedTeller & " to " & Teller & "')")
                        SQL_Codes.UpdateData("Case_Status", "AssignedTeller", Teller, "CaseNumber", item.Value)
                    End If
                End If
            Next
            For Each item In ListBox3.Items
                If item.Selected = True Then
                    Dim CurPegTime As DateTime
                    CurPegTime = Now()
                    Dim AssignedTeller = SQL_Codes.GetData("Case_Status", "AssignedTeller", "CaseNumber", item.Value)
                    Dim Teller = ListBox1.SelectedValue
                    If AssignedTeller <> Teller Then
                        SQL_Codes.RunCommand("INSERT INTO Case_Notes_Entrys (NoteAdded, CaseID, AddedBy, Description) " & _
                                             "VALUES ('" & CurPegTime & "','" & item.Value & "','" & Session("User") & "','Case Assignment Changed From " & AssignedTeller & " to " & Teller & "')")
                        SQL_Codes.UpdateData("Case_Status", "AssignedTeller", Teller, "CaseNumber", item.Value)
                    End If
                End If
            Next
            For Each item In ListBox4.Items
                If item.Selected = True Then
                    Dim CurPegTime As DateTime
                    CurPegTime = Now()
                    Dim AssignedTeller = SQL_Codes.GetData("Case_Status", "AssignedTeller", "CaseNumber", item.Value)
                    Dim Teller = ListBox1.SelectedValue
                    If AssignedTeller <> Teller Then
                        SQL_Codes.RunCommand("INSERT INTO Case_Notes_Entrys (NoteAdded, CaseID, AddedBy, Description) " & _
                                             "VALUES ('" & CurPegTime & "','" & item.Value & "','" & Session("User") & "','Case Assignment Changed From " & AssignedTeller & " to " & Teller & "')")
                        SQL_Codes.UpdateData("Case_Status", "AssignedTeller", Teller, "CaseNumber", item.Value)
                    End If
                End If
            Next
            GridView1.DataBind()
            ListBox1.DataBind()
            ListBox2.DataBind()
            ListBox3.DataBind()
            ListBox4.DataBind()
        End If
    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        If e.Row.RowIndex >= 0 Then
            If CDate(e.Row.Cells(5).Text) < DateSerial(Year(Now()), Month(Now()), Day(Now())) Then
                e.Row.BackColor = Drawing.Color.Red
            ElseIf CDate(e.Row.Cells(5).Text) = DateSerial(Year(Now()), Month(Now()), Day(Now())) Then
                e.Row.BackColor = Drawing.Color.Yellow
            Else
                e.Row.BackColor = Drawing.Color.LightGreen
            End If
        End If
    End Sub
End Class
