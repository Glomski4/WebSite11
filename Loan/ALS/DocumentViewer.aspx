<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DocumentViewer.aspx.vb"   Inherits="Loan_ALS_DocumentViewer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Document Viewer</title>
</head>
<body style="background-color: rgb(200,200,200)">
    <form id="form1" runat="server">
    <table align="center">
        <tbody>
            <tr>
                <td colspan="3" align="center">
                    <asp:Label ID="HeaderText" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center">
                    Print
                </td>
                <td align="center">
                    Email
                </td>
                <td align="center">
                    Fax
                </td>
            </tr>
        </tbody>
    </table>
    <br />
    <asp:Label ID="PDFViewer" runat="server"></asp:Label>
    </form>
</body>
</html>
