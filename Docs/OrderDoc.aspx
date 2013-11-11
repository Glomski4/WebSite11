<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false"
    CodeFile="OrderDoc.aspx.vb" Inherits="Docs_OrderDoc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script language="javascript" type="text/javascript">
// <!CDATA[

// ]]>
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="MultiView2" runat="server">
        <asp:View ID="View3" runat="server">
            Loan No<br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            &nbsp;<asp:Button ID="Button2" runat="server" Text="Go" />
        </asp:View>
        <asp:View ID="View4" runat="server">
            Select Document to order<br />
            <asp:Label ID="Alert" runat="server" 
                style="color: #FF0000; font-weight: 700; font-size: large" 
                Text="This document has already been order today, It can not be reorderd again on the same day." 
                Visible="False"></asp:Label>
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                DataTextField="DocName" DataValueField="DocID" Height="25px" Width="400px">
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" Text="Go" />
        </asp:View>
        <asp:View ID="View5" runat="server">
            Complete the fields below to order Doc.<br />
            <asp:PlaceHolder ID="PlaceHolder_Doc" runat="server"></asp:PlaceHolder>
            <br />
            <asp:Button ID="Button3" runat="server" Text="Order" />
        </asp:View>
        <asp:View ID="View6" runat="server">
            The document has been order and will be sent.<br />
        </asp:View>
    </asp:MultiView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
        SelectCommand="SELECT * FROM [Docs] WHERE ([Active] = @Active)">
        <SelectParameters>
            <asp:Parameter DefaultValue="True" Name="Active" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
