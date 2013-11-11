
Partial Class Loan_ALS_DocumentViewer
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        HeaderText.Text = "This is the requested letter for account 1234568023."
        PDFViewer.Text = "<embed id=""pdfviewer"" runat=""server"" width=""100%"" name=""plugin"" src=""http://theglom.selfip.com:90/WebSite/Loan/Officer/PDFs/1234568079-14-7242013.pdf"" type=""application/pdf"" height=""600px""></embed>"
    End Sub
End Class
