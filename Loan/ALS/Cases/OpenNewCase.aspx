<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false"
    CodeFile="OpenNewCase.aspx.vb" Inherits="Loan_ALS_Cases_OpenNewCase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        //Closes the browser window
        function CloseWindow() {
            window.close();
        }
    </script>

    <asp:MultiView ID="MultiView2" runat="server">
        <asp:View ID="View3" runat="server">
            Loan No<br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            &nbsp;<asp:Button ID="Button2" runat="server" Text="Go" />
        </asp:View>
        <asp:View ID="View4" runat="server">
            Select case to open.<br />
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                DataTextField="DName" DataValueField="CaseID" Height="25px" Width="400px">
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" Text="Go" />
            <br />
            <asp:Label ID="Alert" runat="server" Style="color: #FF0000; font-weight: 700; font-size: large"
                Text="The selected case is already open and can not open a new one." Visible="False"></asp:Label>
            <br />
            <asp:Label ID="Alert2" runat="server" Style="color: #FF0000; font-weight: 700; font-size: large"
                Text="Please add a note to the current case if needed." Visible="False"></asp:Label>
            <br />
        </asp:View>
        <asp:View ID="View5" runat="server">
            Complete the fields below to open case.<br />
            <asp:PlaceHolder ID="PlaceHolder_Doc" runat="server"></asp:PlaceHolder>
            <br />
            <asp:Button ID="Button3" runat="server" Text="Submit" />
        </asp:View>
        <asp:View ID="View6" runat="server">
            The document has been order and will be sent.<br />
        </asp:View>
        <asp:View ID="View7" runat="server">
            You are not authorized to add cases at this time.<br />
            Please see your manager if you think this is an error.
        </asp:View>
    </asp:MultiView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>"
        SelectCommand="SELECT CaseID, CONVERT (varchar, CaseID) + ' | ' + CaseName AS DName, Active FROM Case_Types WHERE (Active = @Active) ORDER BY CaseID">
        <SelectParameters>
            <asp:Parameter DefaultValue="True" Name="Active" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
