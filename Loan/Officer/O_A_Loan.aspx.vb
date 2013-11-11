
Partial Class Loan_Officer_O_A_Loan
    Inherits System.Web.UI.Page

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        LoanID.Text = GridView1.SelectedValue.ToString
        Wizard1.ActiveStepIndex = Wizard1.ActiveStepIndex() + 1
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        W_C_Step.Text = Wizard1.ActiveStep.Title
        MaintainScrollPositionOnPostBack = True
        If Not IsPostBack Then
            LoanID.Text = "Please Select Loan From Below."
        End If
    End Sub

    Protected Sub Wizard1_ActiveStepChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Wizard1.ActiveStepChanged
        W_C_Step.Text = Wizard1.ActiveStep.Title
        If Wizard1.ActiveStepIndex = 1 Then ' Step 2
            Dim NoPmts As TextBox = FormView1.FindControl("NoOfPmtsTextBox")
            Dim PmtAmt As TextBox = FormView1.FindControl("PmtAmtTextBox")
            Dim LAmt As TextBox = FormView1.FindControl("LoanAmtTextBox")
            Dim IntRate As Double = Rate(CDbl(NoPmts.Text), CDbl(PmtAmt.Text), -CDbl(LAmt.Text)) * 12
            Dim IntRateTextBox As DropDownList = FormView1.FindControl("IntRate")
            IntRateTextBox.Items.Clear()
            Dim TestRate = Math.Round((IntRate * 100), 2)
            Do
                If Right(TestRate, 2) = ".0" Then
                    Exit Do
                ElseIf Right(TestRate, 2) = 25 Then
                    Exit Do
                ElseIf Right(TestRate, 2) = ".5" Then
                    Exit Do
                ElseIf Right(TestRate, 2) = 75 Then
                    Exit Do
                End If
                TestRate = Math.Round(TestRate - 0.01, 2)
            Loop
            For X = -16 To 0
                IntRateTextBox.Items.Add(FormatNumber((TestRate + (X * 0.25)), 4))
            Next
            IntRateTextBox.Items.Add(FormatNumber(IntRate * 100, 4))
            For X = 1 To 16
                IntRateTextBox.Items.Add(FormatNumber((TestRate + (X * 0.25)), 4))
            Next
            IntRateTextBox.SelectedValue = FormatNumber(IntRate * 100, 4)
            FindLCAmt()
            Dim OpenDate As TextBox = FormView1.FindControl("OpenDateTextBox")
            OpenDate.Text = FormatDateTime(Now(), DateFormat.ShortDate)
            Dim FirstPmtDate As DropDownList = FormView1.FindControl("FirstPmtDate")
            FirstPmtDate.Items.Clear()
            For X = 1 To 3
                FirstPmtDate.Items.Add(DateAdd(DateInterval.Month, X, DateSerial(Year(Now()), Month(Now()), 1)))
            Next
        ElseIf Wizard1.ActiveStepIndex = 2 Then ' Step 3
            Dim DownPmt As TextBox = FormView1.FindControl("DownPmtTextBox")
            If CDbl(DownPmt.Text) > 0 Then
                Dim DPMsg As New Label
                DPMsg.Text = "Please Select Payment Method for the down payment."
                Place_DownPayment.Controls.Add(DPMsg)
                DPAmt1.Text = FormatCurrency(DownPmt.Text)
                DPAmt2.Text = FormatCurrency(DownPmt.Text)
                DPAmt3.Text = FormatCurrency(DownPmt.Text)
                DPType.Visible = True
            Else
                Dim DPMsg As New Label
                DPMsg.Text = "No Down Payment needed for this loan, please click next to continue."
                Place_DownPayment.Controls.Add(DPMsg)
                DPType.Visible = False
            End If
        ElseIf Wizard1.ActiveStepIndex = 3 Then ' Step 4
            TextArea1.Value = "Stock No.	[CarID]" & vbNewLine & _
            "" & vbNewLine & _
            "       Seller/Creditor:                |       Buyer(s)/Debtor(s):" & vbNewLine & _
            "                                       |       [Name1]" & vbNewLine & _
            "       Center of Tucson                |       [Name2]" & vbNewLine & _
            "       6161 E. Grant RD #24204         |       [Address1]" & vbNewLine & _
            "       Tucson, AZ 85712                |       [Address2]" & vbNewLine & _
            "                                       |       [City], [State] [Zip]" & vbNewLine & _
            "" & vbNewLine & _
            "This is an agreement for the installment purchase by you of the Vehicle described below. As used in this Contract, the works ""you"" and ""your"" mean the Buyer or Buyers who sign below. The words ""we"",""us"",""our"" and ""Seller"" refer to the seller whose name and address appear above. BY SIGNING BELOW, YOU ALSO AGREE TO ALL OF THE TERMS OF THIS CONTRACT, PLEASE READ CAREFULLY." & vbNewLine & _
            "" & vbNewLine & _
            "> The Vehicle which you are purchasing is a:" & vbNewLine & _
            "Used, [Year] [Make] [Model]" & vbNewLine & _
            "" & vbNewLine & _
            "You intend to use the Vehicle primarily for : [X] personal, family, or household purposes (""personal use"") [ ] commercial, business, agricultural, or other non-personal uses (""commercial use"")" & vbNewLine & _
            "" & vbNewLine & _
            "> Your payment schedule will be:" & vbNewLine & _
            "Number of Payments = [NoOfPmts]" & vbNewLine & _
            "Amount of Payments = [MonthlyPmt]" & vbNewLine & _
            "Monthly, Beginning = [FirstPmtDate]" & vbNewLine & _
            "" & vbNewLine & _
            "Annual Percentage Rate         [IntRate]" & vbNewLine & _
            "Finance Charge                 [FinCharge] e" & vbNewLine & _
            "Amount Financed                [LoanAmt]" & vbNewLine & _
            "Totals of Payments             [T_Pmts] e" & vbNewLine & _
            "Down Payment                   [DownPmt]" & vbNewLine & _
            "Total Sale Price               [T_Cost] e | Including down payment" & vbNewLine & _
            "                                e means an estimate" & vbNewLine & _
            "" & vbNewLine & _
            "> Security: You are giving a security interest in the Vehicle being purchased." & vbNewLine & _
            "" & vbNewLine & _
            "> Late Charge: If the Vehicle is purchased for personal use, and a paymetns is not paid in full within [LCDate] days after it is due, you will pay a late charge of the greater of $25.00 or [LCPer] of the monthly payment." & vbNewLine & _
            "" & vbNewLine & _
            "> Perpayment: If you pay off early, you will not have to pay a pennalty." & vbNewLine & _
            "" & vbNewLine & _
            "> Promise to Pay: By signing below, you promise to pay us the Amount Financed, together with finance charges calculated thereon at the Annual Percentage Rate. You agree to make your payments to us set forth in the Payment Schedule shown above. Your final payment may change, depending upon your payment habits. We will apply each payment first to accrued finance charges and late charges and then to reduce your unpaid balance. This means your finance charge will be less when you pay early and more if you pay late. Any necessary adjustments in your total finance charge will be reflected in your final payment." & vbNewLine & _
            "" & vbNewLine & _
            "> Security Interest: To protect us if you do not pay as promised, or if you break some other promise of this Contract, you give us a purchase money security interest in the Vehicel, all accessions thereto, and in any proceeds of the Vehicle." & vbNewLine & _
            "" & vbNewLine & _
            "NOTICE : BY GIVING US A SECURITY INTEREST IN THE VEHICLE DESCRIBED ABOVE, YOU WAVIE ALL RIGHTS PROVIDED BY LAW TO CLAIM THE VEHICLE EXEMPT FROM LEGAL PROCESS." & vbNewLine & _
            "" & vbNewLine & _
            "> ADDITIONAL CHARGES FOR DELINQUENT PAYMENTS: if you fail to make timely payments under this Contrac, and is such delinquency requires collection efforts by us, you agree to pay reasonable collections charges and cose incurred by us, which may include specific charges for collection calls and collection letters." & vbNewLine & _
            "" & vbNewLine & _
            "NOTICE TO BUYER: 1. Do not sign this Contract before you read it or if it contains any blank spaces. 2. You are entitled to an exact copy of the Contract you sign." & vbNewLine & _
            "" & vbNewLine & _
            "						Buyer(s) Acknowledge(s) receipt of a fully completed" & vbNewLine & _
            "						copy of this Contract." & vbNewLine & _
            "" & vbNewLine & _
            "						*BUYER _________________________________________________" & vbNewLine & _
            "" & vbNewLine & _
            "						*BUYER _________________________________________________" & vbNewLine & _
            "" & vbNewLine & _
            "						Date of Contract : [OpenDate]"
            Dim CarIDTextBox As TextBox = FormView1.FindControl("CarIDTextBox")
            TextArea1.Value = Replace(TextArea1.Value, "[CarID]", CarIDTextBox.Text.ToString.Trim) '[CarID] 
            Dim FirstNameTextBox As TextBox = FormView1.FindControl("FirstNameTextBox")
            Dim MiddleNameTextBox As TextBox = FormView1.FindControl("MiddleNameTextBox")
            Dim LastNameTextBox As TextBox = FormView1.FindControl("LastNameTextBox")
            Dim SuffixTextBox As TextBox = FormView1.FindControl("SuffixTextBox")
            TextArea1.Value = Replace(TextArea1.Value, "[Name1]", Trim(FirstNameTextBox.Text) & " " & Trim(MiddleNameTextBox.Text) & " " & Trim(LastNameTextBox.Text) & " " & Trim(SuffixTextBox.Text)) '[Name1]
            Dim COFirstNameTextBox As TextBox = FormView1.FindControl("COFirstNameTextBox")
            Dim COMiddleNameTextBox As TextBox = FormView1.FindControl("COMiddleNameTextBox")
            Dim COLastNameTextBox As TextBox = FormView1.FindControl("COLastNameTextBox")
            Dim COSuffixTextBox As TextBox = FormView1.FindControl("COSuffixTextBox")
            TextArea1.Value = Replace(TextArea1.Value, "[Name2]", Trim(COFirstNameTextBox.Text) & " " & Trim(COMiddleNameTextBox.Text) & " " & Trim(COLastNameTextBox.Text) & " " & Trim(COSuffixTextBox.Text)) '[Name2]
            Dim Address1TextBox As TextBox = FormView1.FindControl("Address1TextBox")
            TextArea1.Value = Replace(TextArea1.Value, "[Address1]", Trim(Address1TextBox.Text)) '[Address1]
            Dim Address2TextBox As TextBox = FormView1.FindControl("Address2TextBox")
            TextArea1.Value = Replace(TextArea1.Value, "[Address2]", Trim(Address2TextBox.Text)) '[Address2]
            Dim CityTextBox As TextBox = FormView1.FindControl("CityTextBox")
            TextArea1.Value = Replace(TextArea1.Value, "[City]", Trim(CityTextBox.Text)) '[City]
            Dim StateTextBox As TextBox = FormView1.FindControl("StateTextBox")
            TextArea1.Value = Replace(TextArea1.Value, "[State]", Trim(StateTextBox.Text)) '[State]
            Dim ZipTextBox As TextBox = FormView1.FindControl("ZipTextBox")
            TextArea1.Value = Replace(TextArea1.Value, "[Zip]", Trim(ZipTextBox.Text)) '[Zip]
            Dim YearTextBox As TextBox = FormView1.FindControl("YearTextBox")
            TextArea1.Value = Replace(TextArea1.Value, "[Year]", Trim(YearTextBox.Text)) '[Year]
            Dim MakeTextBox As TextBox = FormView1.FindControl("MakeTextBox")
            TextArea1.Value = Replace(TextArea1.Value, "[Make]", Trim(MakeTextBox.Text)) '[Make]
            Dim ModelTextBox As TextBox = FormView1.FindControl("ModelTextBox")
            TextArea1.Value = Replace(TextArea1.Value, "[Model]", Trim(ModelTextBox.Text)) '[Model]
            Dim NoOfPmtsTextBox As TextBox = FormView1.FindControl("NoOfPmtsTextBox")
            TextArea1.Value = Replace(TextArea1.Value, "[NoOfPmts]", Trim(NoOfPmtsTextBox.Text)) '[NoOfPmts]
            Dim PmtAmtTextBox As TextBox = FormView1.FindControl("PmtAmtTextBox")
            TextArea1.Value = Replace(TextArea1.Value, "[MonthlyPmt]", FormatCurrency(PmtAmtTextBox.Text)) '[MonthlyPmt]
            Dim FirstPmtDate As DropDownList = FormView1.FindControl("FirstPmtDate")
            TextArea1.Value = Replace(TextArea1.Value, "[FirstPmtDate]", FormatDateTime(FirstPmtDate.SelectedValue.ToString, DateFormat.LongDate)) '[FirstPmtDate]
            Dim IntRate As DropDownList = FormView1.FindControl("IntRate")
            TextArea1.Value = Replace(TextArea1.Value, "[IntRate]", Trim(IntRate.SelectedValue.ToString) & "%") '[IntRate]
            Dim LoanAmtTextBox As TextBox = FormView1.FindControl("LoanAmtTextBox")
            TextArea1.Value = Replace(TextArea1.Value, "[LoanAmt]", FormatCurrency(LoanAmtTextBox.Text)) '[LoanAmt]
            Dim DownPmtTextBox As TextBox = FormView1.FindControl("DownPmtTextBox")
            TextArea1.Value = Replace(TextArea1.Value, "[DownPmt]", FormatCurrency(DownPmtTextBox.Text)) '[DownPmt]
            Dim IntPmt, TotInt As Double
            TotInt = 0
            IntPmt = 0
            For Period = 1 To CDbl(NoOfPmtsTextBox.Text)    ' Total all interest.
                IntPmt = IPmt((CDbl(IntRate.SelectedValue.ToString) / 100) / 12, Period, CDbl(NoOfPmtsTextBox.Text), -CDbl(LoanAmtTextBox.Text), 0)
                TotInt = TotInt + IntPmt
            Next Period
            TextArea1.Value = Replace(TextArea1.Value, "[FinCharge]", FormatCurrency(TotInt)) '[FinCharge]
            TextArea1.Value = Replace(TextArea1.Value, "[T_Pmts]", FormatCurrency(TotInt + CDbl(LoanAmtTextBox.Text))) '[T_Pmts]
            TextArea1.Value = Replace(TextArea1.Value, "[T_Cost]", FormatCurrency(TotInt + CDbl(LoanAmtTextBox.Text) + CDbl(DownPmtTextBox.Text))) '[T_Cost]
            Dim LCDate As DropDownList = FormView1.FindControl("LCDate")
            TextArea1.Value = Replace(TextArea1.Value, "[LCDate]", LCDate.SelectedValue.ToString) '[LCDate]
            Dim LCPerc As DropDownList = FormView1.FindControl("LCPerc")
            TextArea1.Value = Replace(TextArea1.Value, "[LCPer]", LCPerc.SelectedItem.Text.ToString.Trim) '[LCPer]
            TextArea1.Value = Replace(TextArea1.Value, "[OpenDate]", FormatDateTime(Now(), DateFormat.LongDate)) '[OpenDate]
            PDF.NewPDF(TextArea1.Value)
        ElseIf Wizard1.ActiveStepIndex = 4 Then ' Step 5

        End If

    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        FindLCAmt()
    End Sub
    Public Sub FindLCAmt()
        Dim PmtAmt As TextBox = FormView1.FindControl("PmtAmtTextBox")
        Dim LCPer As DropDownList = FormView1.FindControl("LCPerc")
        Dim LCAmount As TextBox = FormView1.FindControl("LCAmountTextBox")
        If FormatNumber(CDbl(PmtAmt.Text) * CDbl(LCPer.SelectedValue), 2) > 24.99 Then
            LCAmount.Text = FormatNumber(PmtAmt.Text * LCPer.SelectedValue, 2)
        Else
            LCAmount.Text = FormatNumber(25.0, 2)

        End If
    End Sub

    Protected Sub IntRate_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim IntRateTextBox As DropDownList = FormView1.FindControl("IntRate")
        Dim NoPmts As TextBox = FormView1.FindControl("NoOfPmtsTextBox")
        Dim PmtAmt As TextBox = FormView1.FindControl("PmtAmtTextBox")
        Dim LAmt As TextBox = FormView1.FindControl("LoanAmtTextBox")
        PmtAmt.Text = FormatNumber(Pmt(CDbl((IntRateTextBox.SelectedItem.Text) / 100) / 12, CDbl(NoPmts.Text), -CDbl(LAmt.Text)))
    End Sub

    Protected Sub DPTypeList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DPTypeList.SelectedIndexChanged
        DPResponce.ActiveViewIndex = DPTypeList.SelectedIndex
    End Sub

    Protected Sub CheckBoxList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxList1.SelectedIndexChanged
        Dim Total As Double = 0
        For Each item As ListItem In CheckBoxList1.Items
            If item.Selected Then
                Total = Total + 1
            End If
        Next
        If Total = 6 Then
            Dim FirstNameTextBox As TextBox = FormView1.FindControl("FirstNameTextBox")
            Dim MiddleNameTextBox As TextBox = FormView1.FindControl("MiddleNameTextBox")
            Dim LastNameTextBox As TextBox = FormView1.FindControl("LastNameTextBox")
            Dim SuffixTextBox As TextBox = FormView1.FindControl("SuffixTextBox")
            Dim SSNTextBox As TextBox = FormView1.FindControl("SSNTextBox")
            Dim COFirstNameTextBox As TextBox = FormView1.FindControl("COFirstNameTextBox")
            Dim COMiddleNameTextBox As TextBox = FormView1.FindControl("COMiddleNameTextBox")
            Dim COLastNameTextBox As TextBox = FormView1.FindControl("COLastNameTextBox")
            Dim COSuffixTextBox As TextBox = FormView1.FindControl("COSuffixTextBox")
            Dim COSSNTextBox As TextBox = FormView1.FindControl("COSSNTextBox")
            Dim Address1TextBox As TextBox = FormView1.FindControl("Address1TextBox")
            Dim Address2TextBox As TextBox = FormView1.FindControl("Address2TextBox")
            Dim CityTextBox As TextBox = FormView1.FindControl("CityTextBox")
            Dim StateTextBox As TextBox = FormView1.FindControl("StateTextBox")
            Dim ZipTextBox As TextBox = FormView1.FindControl("ZipTextBox")
            Dim HomePhoneTextBox As TextBox = FormView1.FindControl("HomePhoneTextBox")
            Dim WorkPhoneTextBox As TextBox = FormView1.FindControl("WorkPhoneTextBox")
            Dim FirstPmtDate As DropDownList = FormView1.FindControl("FirstPmtDate")
            Dim NoOfPmtsTextBox As TextBox = FormView1.FindControl("NoOfPmtsTextBox")
            Dim LCDate As DropDownList = FormView1.FindControl("LCDate")
            Dim LCAmountTextBox As TextBox = FormView1.FindControl("LCAmountTextBox")
            Dim LoanAmtTextBox As TextBox = FormView1.FindControl("LoanAmtTextBox")
            Dim PmtAmtTextBox As TextBox = FormView1.FindControl("PmtAmtTextBox")
            Dim IntRate As DropDownList = FormView1.FindControl("IntRate")
            Dim DownPmtTextBox As TextBox = FormView1.FindControl("DownPmtTextBox")
            Dim YearTextBox As TextBox = FormView1.FindControl("YearTextBox")
            Dim MakeTextBox As TextBox = FormView1.FindControl("MakeTextBox")
            Dim ModelTextBox As TextBox = FormView1.FindControl("ModelTextBox")
            Dim sqlConn As New System.Data.SqlClient.SqlConnection
            Dim sqlComm As New System.Data.SqlClient.SqlCommand
            Dim intCount As Integer
            sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
            sqlConn.Open()
            sqlComm.CommandText = "INSERT INTO [Loans] ([B1_First], [B1_Middle], [B1_Last], [B1_Suf], [B1_SSN], [B2_First], [B2_Middle], [B2_Last], [B2_Suf], [B2_SSN], [Address1], [Address2], [City], [State], [Zip], [HomePhone], [WorkPhone], [OpenDate], [FirstPmtDate], [NoPmts], [CurrPmtDue], [NoPmtsLeft], [LCDate], [LCAmount], [LoanAmount], [CurrBalance], [MonthlyPmt], [IntRate], [DownPmt], [Type]) VALUES ('" & FirstNameTextBox.Text.ToString.Trim & "','" & MiddleNameTextBox.Text.ToString.Trim & "','" & LastNameTextBox.Text.ToString.Trim & "','" & SuffixTextBox.Text.ToString.Trim & "','" & SSNTextBox.Text.ToString.Trim & "','" & COFirstNameTextBox.Text.ToString.Trim & "','" & COMiddleNameTextBox.Text.ToString.Trim & "','" & COLastNameTextBox.Text.ToString.Trim & "','" & COSuffixTextBox.Text.ToString.Trim & "','" & COSSNTextBox.Text.ToString.Trim & "','" & Address1TextBox.Text.ToString.Trim & "','" & Address2TextBox.Text.ToString.Trim & "','" & CityTextBox.Text.ToString.Trim & "','" & StateTextBox.Text.ToString.Trim & "','" & ZipTextBox.Text.ToString.Trim & "','" & HomePhoneTextBox.Text.ToString.Trim & "','" & WorkPhoneTextBox.Text.ToString.Trim & "','" & Now() & "','" & FirstPmtDate.SelectedItem.ToString.Trim & "','" & NoOfPmtsTextBox.Text.ToString.Trim & "','" & FirstPmtDate.SelectedItem.ToString.Trim & "','" & NoOfPmtsTextBox.Text.Trim & "','" & LCDate.SelectedItem.ToString.Trim & "','" & LCAmountTextBox.Text.ToString.Trim & "','" & LoanAmtTextBox.Text.ToString.Trim & "','" & LoanAmtTextBox.Text.ToString.Trim & "','" & PmtAmtTextBox.Text.ToString.Trim & "','" & IntRate.SelectedItem.ToString.Trim & "','" & DownPmtTextBox.Text.ToString.Trim & "','" & YearTextBox.Text.ToString.Trim & " " & MakeTextBox.Text.ToString.Trim & " " & ModelTextBox.Text.ToString.Trim & "')"
            sqlComm.Connection = sqlConn
            intCount = sqlComm.ExecuteNonQuery
            sqlComm.CommandText = "Select LoanID From Loans Where ([Type] = '" & YearTextBox.Text.ToString.Trim & " " & MakeTextBox.Text.ToString.Trim & " " & ModelTextBox.Text.ToString.Trim & "') and ([B1_SSN] = '" & SSNTextBox.Text.ToString.Trim & "')"
            intCount = sqlComm.ExecuteScalar
            NewLoanID.Text = intCount
            sqlComm.CommandText = "UPDATE PendingApps Set AppStatus = 'L' WHERE(AppID = '" & GridView1.SelectedRow.Cells(10).Text.ToString & "')"
            intCount = sqlComm.ExecuteScalar
            Dim CarIDTextBox As TextBox = FormView1.FindControl("CarIDTextBox")
            sqlComm.CommandText = "UPDATE Car Set Active = 'L' WHERE(CarID = '" & CarIDTextBox.Text.ToString.Trim & "')"
            intCount = sqlComm.ExecuteScalar
            sqlConn.Close()
            Wizard1.ActiveStepIndex = Wizard1.ActiveStepIndex() + 1
        End If
    End Sub

    Protected Sub UpdateCancelButton0_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        Dim AppID As Integer
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.CommandText = "Select AppID From LoanApps WHERE(LAppID = '" & LoanID.Text & "')"
        sqlComm.Connection = sqlConn
        AppID = sqlComm.ExecuteScalar()
        sqlComm.CommandText = "UPDATE PendingApps Set AppStatus = 'P' WHERE(AppID = '" & AppID & "')"
        sqlComm.Connection = sqlConn
        sqlComm.ExecuteScalar()
        sqlConn.Close()
        Response.Redirect("~\Loan\PendingApp.aspx?AppID=" & AppID)
    End Sub
End Class

