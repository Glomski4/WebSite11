
Partial Class AdminMenu_UploadDocument
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If FileUpload1.HasFile = False Then
            Alert.Text = "Please Select a file to upload."
            Exit Sub
        End If
        If Len(TextBox1.Text) = 0 Then
            Alert.Text = "Please enter a loan number."
            TextBox1.Focus()
            Exit Sub
        End If
        If IsDBNull(SQL_Codes.GetData("Loans", "LoanID", "LoanID", TextBox1.Text)) = True Then
            Alert.Text = "Account Number entered is not valid."
            TextBox1.Focus()
            Exit Sub
        End If
        SaveFile(FileUpload1.PostedFile)
    End Sub
    Sub SaveFile(ByVal file As HttpPostedFile)
        ' Specify the path to save the uploaded file to. 
        Dim savePath As String = My.Request.PhysicalApplicationPath & "Loan\Officer\PDFs\"
        ' Get the name of the file to upload. 
        Dim fileName As String = TextBox1.Text & "-Upload-" & FileUpload1.FileName
        ' Create the path and file name to check for duplicates. 
        Dim pathToCheck As String = savePath + fileName
        ' Create a temporary file name to use for checking duplicates. 
        Dim tempfileName As String
        ' Check to see if a file already exists with the 
        ' same name as the file to upload.         
        If (System.IO.File.Exists(pathToCheck)) Then
            Dim counter As Integer = 2
            While (System.IO.File.Exists(pathToCheck))
                ' If a file with this name already exists, 
                ' prefix the filename with a number.
                tempfileName = TextBox1.Text & "-Upload-" & counter.ToString() & "-" & FileUpload1.FileName
                pathToCheck = savePath + tempfileName
                counter = counter + 1
            End While
            fileName = tempfileName
            ' Notify the user that the file name was changed.
            Alert.Text = "A file with the same name already exists." + "<br />" + _
                                     "Your file was saved as " + fileName
        Else
            ' Notify the user that the file was saved successfully.
            Processed.Text = "Your file was uploaded successfully." + "<br />" + _
                                     "Your file was saved as " + fileName
        End If
        ' Append the name of the file to upload to the path.
        savePath += fileName
        ' Call the SaveAs method to save the uploaded 
        ' file to the specified directory.
        FileUpload1.SaveAs(savePath)
        Dim Peg As DateTime = Now()
        SQL_Codes.RunCommand("INSERT INTO DocsOrdered (DocID, DocLine, LoanNo, OrderedOn, OrderedBy, Value, PrintedOn, PrintedBy, DocLink) " & _
                             "VALUES ('" & DropDownList1.SelectedValue & "','0','" & TextBox1.Text & "','" & Peg & "','" & Session("User") & "','Upload','" & Peg & "','Upload-System','" & fileName & "')")
    End Sub

End Class
