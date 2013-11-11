<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false"
    CodeFile="CloseCase.aspx.vb" Inherits="Loan_ALS_Cases_OpenNewCase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script language="javascript" type="text/javascript">
// <!CDATA[

        function Button2_onclick() {
            window.close();
        }

        function Button3_onclick() {

        }

// ]]>
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="MultiView2" runat="server">
        <asp:View ID="View3" runat="server">
            Please close and reclick the add a new note button, if this happens more then once
            please report it.<br />
            <input id="Button4" onclick="return Button2_onclick()" type="button" value="Close" />
        </asp:View>
        <asp:View ID="View4" runat="server">
            <table>
                <tr>
                    <td style="margin-left: 80px">
                        Notes :
                    </td>
                </tr>
                <tr>
                    <td style="margin-left: 80px">
                        <asp:TextBox ID="TextBox2" runat="server" Rows="5" TextMode="MultiLine" Width="250px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right; margin-left: 80px">
                        <asp:Button ID="Button1" runat="server" Style="text-align: right" Text="Add Note" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left; margin-left: 80px">
                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Style="text-align: left"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View5" runat="server">
            Note has been added, please close this window.<br />
            <input id="Button2" type="button" value="Close" onclick="return Button2_onclick()" />
        </asp:View>
        <asp:View ID="View6" runat="server">
            Note was not able to be added, plase close the window and try again.<br />
            <input id="Button3" onclick="return Button2_onclick()" type="button" value="Close"
                onclick="return Button3_onclick()" />
        </asp:View>
    </asp:MultiView>
</asp:Content>
