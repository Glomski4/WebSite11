
Partial Class Loan_ALS_Payments_Teller_Default
    Inherits System.Web.UI.Page

    Protected Sub Button8_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button8.Click
        SQL_Codes.AddNewData("PaymentBoxes", "DateOpen,CreatedBy", "'" & Now() & "','" & Session("User") & "'")
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub Button9_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button9.Click
        If OutOfBalance.Value = False Then
            Label3.Visible = True
            CloseCashBox()
        Else
            Label2.Visible = True
            OutOfBalance.Value = True
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim BoxStatus = SQL_Codes.RunCommandGet("SELECT COUNT(BoxID) AS BoxID FROM PaymentBoxes WHERE (DateClosed IS NULL) AND (CreatedBy = '" & Session("User") & "')")
        If BoxStatus = 1 Then
            Dim BoxID = SQL_Codes.RunCommandGet("SELECT MAX(BoxID) AS BoxID FROM PaymentBoxes WHERE (DateClosed IS NULL) AND (CreatedBy = '" & Session("User") & "')")
            Dim BoxTrans = SQL_Codes.RunCommandGet("SELECT COUNT(PmtID) AS Expr1 FROM Payments WHERE (BoxNumber = " & BoxID & ")")
            If BoxTrans = 0 Then
                OutOfBalance.Value = False
            Else
                Dim BoxBalance = SQL_Codes.RunCommandGet("SELECT SUM(ToPrincipal) + SUM(ToInterest) + SUM(ToUnpl) + SUM(ToFees) AS Expr1 FROM Payments WHERE (BoxNumber = " & BoxID & ")")
                If BoxBalance = 0 Then
                    OutOfBalance.Value = False
                    Label4.Text = FormatCurrency(0)
                Else
                    OutOfBalance.Value = True
                    Label4.Text = FormatCurrency(BoxBalance)
                End If
                Dim ToPrin, ToInt, ToUnpl, ToFees
                ToPrin = SQL_Codes.RunCommandGet("SELECT SUM(ToPrincipal) AS Expr1 FROM Payments WHERE (BoxNumber = " & BoxID & ")")
                Label5.Text = FormatCurrency(ToPrin)
                ToInt = SQL_Codes.RunCommandGet("SELECT SUM(ToInterest) AS Expr1 FROM Payments WHERE (BoxNumber = " & BoxID & ")")
                Label6.Text = FormatCurrency(ToInt)
                ToUnpl = SQL_Codes.RunCommandGet("SELECT SUM(ToUnpl)  AS Expr1 FROM Payments WHERE (BoxNumber = " & BoxID & ")")
                Label7.Text = FormatCurrency(ToUnpl)
                ToFees = SQL_Codes.RunCommandGet("SELECT SUM(ToFees) AS Expr1 FROM Payments WHERE (BoxNumber = " & BoxID & ")")
                Label8.Text = FormatCurrency(ToFees)
                Label9.Text = BoxID
            End If
            Button8.Enabled = False
            Button9.Enabled = True
            GridView1.Enabled = True
        ElseIf BoxStatus = 0 Then
            Button8.Enabled = True
            Button9.Enabled = False
            Label4.Text = "N/A"
            Label5.Text = "N/A"
            Label6.Text = "N/A"
            Label7.Text = "N/A"
            Label8.Text = "N/A"
            GridView1.Enabled = False
        Else
            Button8.Enabled = False
            Button9.Enabled = False
            Label4.Text = "N/A"
            Label5.Text = "N/A"
            Label6.Text = "N/A"
            Label7.Text = "N/A"
            Label8.Text = "N/A"
            GridView1.Enabled = False
        End If
    End Sub

    Protected Sub Label2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Label2.Click
        Label2.Visible = False
        Label3.Visible = True
        CloseCashBox()
    End Sub

    Sub CloseCashBox()
        Dim BoxID = SQL_Codes.RunCommandGet("SELECT MAX(BoxID) AS BoxID FROM PaymentBoxes WHERE (DateClosed IS NULL) AND (CreatedBy = '" & Session("User") & "')")
        Dim BoxTrans = SQL_Codes.RunCommandGet("SELECT COUNT(PmtID) AS Expr1 FROM Payments WHERE (BoxNumber = " & BoxID & ")")
        Dim BoxBalance = 0
        If BoxTrans = 0 Then
            BoxBalance = 0
        Else
            BoxBalance = SQL_Codes.RunCommandGet("SELECT SUM(ToPrincipal) + SUM(ToInterest) + SUM(ToUnpl) + SUM(ToFees) AS Expr1 FROM Payments WHERE (BoxNumber = " & BoxID & ")")
        End If
        SQL_Codes.UpdateDataGroup("PaymentBoxes", "BoxID", BoxID, "DateClosed = '" & Now() & "', ClosingBalance = '" & BoxBalance & "', ClosingTrans = '" & BoxTrans & "'")
        Button8.Enabled = True
        Button9.Enabled = False
    End Sub
End Class
