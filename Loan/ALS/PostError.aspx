<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PostError.aspx.vb" Inherits="Loan_ALS_PostError" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-weight: bold;
            text-decoration: underline;
            font-size: xx-large;
        }
    </style>
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
    <div>
    
        There was an error with the payment that you tried to post.
        <br />
        Please have an audit done as some payments may have posted on the account in 
        question.
        <br />
        <br />
        <span class="style1">DO NOT JUST RETRY YOUR PAYMENT<br />
        BEFORE THE AUDIT IS DONE!! </span>
        <br />
        <br />
        User/Account
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    
        <br />
    
        <br />
        <span class="style1">Please click on link below to print audit report.<br />
        ! ! YOU MUST PRINT THIS REPORT ! !
        <br />
        </span>
        <h1>
            <asp:LinkButton ID="LinkButton1" runat="server" 
                PostBackUrl="~/Loan/Officer/PDFs/ErrorOutText.pdf">Audit Report</asp:LinkButton>
        </h1>
        <br />
        <br />
        <br />
        Your session has been logged out.<br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Please click here to login again.</asp:HyperLink>
    
    </div>
    </form>
</body>
</html>
