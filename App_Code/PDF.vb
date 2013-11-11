Imports Microsoft.VisualBasic
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports iTextSharp.text.pdf.PdfWriter
Imports System.IO
Imports iTextSharp.text.Document
Imports iTextSharp.text.Font.FontFamily

Public Class PDF
    Shared Sub NewPDF(ByVal Text As String)
        Dim Doc1 = New Document(iTextSharp.text.PageSize.LETTER)
        Dim path As String = My.Request.PhysicalApplicationPath
        PdfWriter.GetInstance(Doc1, New FileStream(path + "Loan\Officer\PDFs\Doc1.pdf", FileMode.Create))
        Dim C_Font As Font = New Font(iTextSharp.text.Font.FontFamily.COURIER, 7, iTextSharp.text.Font.NORMAL, iTextSharp.text.BaseColor.BLACK)
        Doc1.Open()
        Doc1.Add(New Paragraph(Text, C_Font))
        Dim B_Code As Barcode39 = New Barcode39
        B_Code.Code = Class1.GenRandomNumberString()
        B_Code.CreateDrawingImage(Drawing.Color.Black, Drawing.Color.White).Save(path + "Loan\Officer\PDFs\BarCode.png")
        Dim I_B_Code As Image = Image.GetInstance(path + "Loan\Officer\PDFs\BarCode.png")
        I_B_Code.Alignment = 2
        Doc1.Add(I_B_Code)
        Doc1.Close()
    End Sub

    Shared Sub NewPDF_T(ByVal Text As String)
        Dim Doc1 = New Document(iTextSharp.text.PageSize.LETTER)
        Dim path As String = My.Request.PhysicalApplicationPath
        PdfWriter.GetInstance(Doc1, New FileStream(path + "Loan\Officer\PDFs\Doc1.pdf", FileMode.Create))
        Dim C_Font As Font = New Font(iTextSharp.text.Font.FontFamily.COURIER, 7, iTextSharp.text.Font.NORMAL, iTextSharp.text.BaseColor.BLACK)
        Doc1.Open()
        Doc1.Add(New Paragraph(Text, C_Font))
        Doc1.Close()
    End Sub

    Shared Sub NewPDF_W_Name(ByVal Text As String, ByVal DocName As String)
        Dim Doc1 = New Document(iTextSharp.text.PageSize.LETTER)
        Dim path As String = My.Request.PhysicalApplicationPath
        PdfWriter.GetInstance(Doc1, New FileStream(path + "Loan\Officer\PDFs\" + DocName + ".pdf", FileMode.Create))
        Dim C_Font As Font = New Font(iTextSharp.text.Font.FontFamily.COURIER, 6, iTextSharp.text.Font.NORMAL, iTextSharp.text.BaseColor.BLACK)
        Doc1.Open()
        Doc1.Add(New Paragraph(Text, C_Font))
        Dim B_Code As Barcode39 = New Barcode39
        B_Code.Code = Class1.GenRandomNumberString()
        B_Code.CreateDrawingImage(Drawing.Color.Black, Drawing.Color.White).Save(path + "Loan\Officer\PDFs\BarCode.png")
        Dim I_B_Code As Image = Image.GetInstance(path + "Loan\Officer\PDFs\BarCode.png")
        I_B_Code.Alignment = 2
        Doc1.Add(I_B_Code)
        Doc1.Close()
    End Sub
    Shared Sub NewPDF_W_DocSystem(ByVal DocID As Integer, ByVal LoanNo As Integer, ByVal OrderedOn As Date, ByVal User As String)
        On Error GoTo ErrorOut
        Dim Doc1 = New Document(iTextSharp.text.PageSize.LETTER)
        Dim path As String = My.Request.PhysicalApplicationPath
        PdfWriter.GetInstance(Doc1, New FileStream(path + "Loan\Officer\PDFs\" & LoanNo & "-" & DocID & "-" & Replace(Replace(OrderedOn, "/", ""), ":", "") & ".pdf", FileMode.Create))
        Doc1.Open()
        Dim QueryString As String
        QueryString = "SELECT [Text], [Font], [Size], [DocDetailsID] FROM [DocsDetails] WHERE ([DocID] = '" & DocID & "')"
        Using Connection As New System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString)
            Dim Command As New System.Data.SqlClient.SqlCommand(QueryString, Connection)
            Connection.Open()
            Dim Reader As System.Data.SqlClient.SqlDataReader = Command.ExecuteReader()
            While Reader.Read()
                Dim N_Sel_Font As iTextSharp.text.Font.FontFamily = Reader(1)
                Dim C_Font As Font = New Font(N_Sel_Font, Reader(2), iTextSharp.text.Font.NORMAL, iTextSharp.text.BaseColor.BLACK)
                Dim Ins_Text As String = My.Computer.FileSystem.ReadAllText(My.Request.PhysicalApplicationPath & "\AdminMenu\Docs\" & DocID & "-" & Reader(3) & ".txt")
                Dim QueryString1 As String
                QueryString1 = "SELECT [DocLine], [Swap], [SwapType] FROM [DocsLines] WHERE ([DocID] = '" & DocID & "')"
                Using Connection1 As New System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString)
                    Dim Command1 As New System.Data.SqlClient.SqlCommand(QueryString1, Connection1)
                    Connection1.Open()
                    Dim Reader1 As System.Data.SqlClient.SqlDataReader = Command1.ExecuteReader()
                    While Reader1.Read()
                        Dim N_Value = SQL_Codes.GetDataFiltering("DocsOrdered", "Value", "([DocID]='" & DocID & "') and ([DocLine] = '" & Reader1(0) & "') and ([LoanNo] = '" & LoanNo & "') and ([OrderedOn] = '" & OrderedOn & "')")
                        If IsDate(N_Value) = True Then FormatDateTime(N_Value, DateFormat.ShortDate)
                        Ins_Text = Replace(Ins_Text, Reader1(1).ToString.Trim, N_Value)
                    End While
                    Reader1.Close()
                    Connection1.Close()
                End Using
                Doc1.Add(New Paragraph(Ins_Text, C_Font))
            End While
            Reader.Close()
            Connection.Close()
        End Using
        'Dim C_Font As Font = New Font(COURIER, 6, iTextSharp.text.Font.NORMAL, iTextSharp.text.BaseColor.BLACK)
        'Doc1.Add(New Paragraph("", C_Font))
        Dim B_Code As Barcode39 = New Barcode39
        B_Code.Code = Class1.GenRandomNumberString()
        B_Code.CreateDrawingImage(Drawing.Color.Black, Drawing.Color.White).Save(path + "Loan\Officer\PDFs\BarCode.png")
        Dim I_B_Code As Image = Image.GetInstance(path + "Loan\Officer\PDFs\BarCode.png")
        I_B_Code.Alignment = 2
        Doc1.Add(I_B_Code)
        Doc1.Close()
        Dim sqlConn As New System.Data.SqlClient.SqlConnection
        Dim sqlComm As New System.Data.SqlClient.SqlCommand
        sqlConn.ConnectionString = ConfigurationManager.ConnectionStrings("WEB1ConnectionString").ToString
        sqlConn.Open()
        sqlComm.Connection = sqlConn
        sqlComm.CommandText = "Update DocsOrdered Set PrintedOn = '" & Now() & "', DocLink = '" & LoanNo & "-" & DocID & "-" & Replace(Replace(OrderedOn, "/", ""), ":", "") & ".pdf' , PrintedBy = '" & User & "' Where ([DocID]='" & DocID & "') and ([LoanNo] = '" & LoanNo & "') and ([OrderedOn] = '" & OrderedOn & "')"
        sqlComm.ExecuteNonQuery
        sqlConn.Close()
        Exit Sub
ErrorOut:
        My.Response.Redirect("~\ErrorOut.aspx")
    End Sub
End Class
