<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false" CodeFile="NotAuth.aspx.vb" Inherits="ErrorOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            font-family: Papyrus;
            font-size: xx-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="style1">
        You are not authorized to do the command you just tried to do. Sorry.</p>
    <p class="style1">
        Please click the back button or backspace key and try again.</p>
    </asp:Content>

