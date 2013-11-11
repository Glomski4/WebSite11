<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PmtInfo.aspx.vb" Inherits="Loan_ALS_PmtInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style11
        {
            width: 100%;
        }
        #Button1
        {
            height: 26px;
        }
    </style>

    <script language="javascript" type="text/javascript">
// <!CDATA[

        function Button1_onclick() {
            close;
        }

// ]]>
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        &nbsp;<br />
    
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" 
            style="background-color: #CCFFCC" Width="500px">
            <EditItemTemplate>
                PostedDate:
                <asp:TextBox ID="PostedDateTextBox" runat="server" 
                    Text='<%# Bind("PostedDate") %>' />
                <br />
                EffDate:
                <asp:TextBox ID="EffDateTextBox" runat="server" Text='<%# Bind("EffDate") %>' />
                <br />
                IntDate:
                <asp:TextBox ID="IntDateTextBox" runat="server" Text='<%# Bind("IntDate") %>' />
                <br />
                Type:
                <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
                <br />
                Description:
                <asp:TextBox ID="DescriptionTextBox" runat="server" 
                    Text='<%# Bind("Description") %>' />
                <br />
                ToPrincipal:
                <asp:TextBox ID="ToPrincipalTextBox" runat="server" 
                    Text='<%# Bind("ToPrincipal") %>' />
                <br />
                ToInterest:
                <asp:TextBox ID="ToInterestTextBox" runat="server" 
                    Text='<%# Bind("ToInterest") %>' />
                <br />
                ToUnpl:
                <asp:TextBox ID="ToUnplTextBox" runat="server" Text='<%# Bind("ToUnpl") %>' />
                <br />
                ToFees:
                <asp:TextBox ID="ToFeesTextBox" runat="server" Text='<%# Bind("ToFees") %>' />
                <br />
                EnteredBy:
                <asp:TextBox ID="EnteredByTextBox" runat="server" 
                    Text='<%# Bind("EnteredBy") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                PostedDate:
                <asp:TextBox ID="PostedDateTextBox" runat="server" 
                    Text='<%# Bind("PostedDate") %>' />
                <br />
                EffDate:
                <asp:TextBox ID="EffDateTextBox" runat="server" Text='<%# Bind("EffDate") %>' />
                <br />
                IntDate:
                <asp:TextBox ID="IntDateTextBox" runat="server" Text='<%# Bind("IntDate") %>' />
                <br />
                Type:
                <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
                <br />
                Description:
                <asp:TextBox ID="DescriptionTextBox" runat="server" 
                    Text='<%# Bind("Description") %>' />
                <br />
                ToPrincipal:
                <asp:TextBox ID="ToPrincipalTextBox" runat="server" 
                    Text='<%# Bind("ToPrincipal") %>' />
                <br />
                ToInterest:
                <asp:TextBox ID="ToInterestTextBox" runat="server" 
                    Text='<%# Bind("ToInterest") %>' />
                <br />
                ToUnpl:
                <asp:TextBox ID="ToUnplTextBox" runat="server" Text='<%# Bind("ToUnpl") %>' />
                <br />
                ToFees:
                <asp:TextBox ID="ToFeesTextBox" runat="server" Text='<%# Bind("ToFees") %>' />
                <br />
                EnteredBy:
                <asp:TextBox ID="EnteredByTextBox" runat="server" 
                    Text='<%# Bind("EnteredBy") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <table border="1" cellpadding="1" cellspacing="1" class="style11">
                    <tr>
                        <td colspan="2">
                            Posted Date</td>
                        <td colspan="2">
                            <asp:Label ID="PostedDateLabel" runat="server" 
                                Text='<%# Bind("PostedDate") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            Eff Date</td>
                        <td colspan="2">
                            <asp:Label ID="EffDateLabel" runat="server" 
                                Text='<%# Bind("EffDate", "{0:D}") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            Int Date</td>
                        <td colspan="2">
                            <asp:Label ID="IntDateLabel" runat="server" 
                                Text='<%# Bind("IntDate", "{0:D}") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Type</td>
                        <td colspan="3">
                            <asp:Label ID="TypeLabel" runat="server" Text='<%# Bind("Type") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Description</td>
                        <td colspan="3">
                            <asp:Label ID="DescriptionLabel" runat="server" 
                                Text='<%# Bind("Description") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            To Principal</td>
                        <td>
                            To Interest</td>
                        <td>
                            To Unpl</td>
                        <td>
                            To Fees</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="ToPrincipalLabel" runat="server" 
                                Text='<%# Bind("ToPrincipal", "{0:C}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ToInterestLabel" runat="server" 
                                Text='<%# Bind("ToInterest", "{0:C}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ToUnplLabel" runat="server" 
                                Text='<%# Bind("ToUnpl", "{0:C}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ToFeesLabel" runat="server" 
                                Text='<%# Bind("ToFees", "{0:C}") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Entered By</td>
                        <td colspan="3">
                            <asp:Label ID="EnteredByLabel" runat="server" Text='<%# Bind("EnteredBy") %>' />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <EmptyDataTemplate>
                No Data To Show.
            </EmptyDataTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
            SelectCommand="SELECT Payments.PostedDate, Payments.EffDate, Payments.IntDate, PaymentTypes.Type, Payments.Description, Payments.ToPrincipal, Payments.ToInterest, Payments.ToUnpl, Payments.ToFees, Payments.EnteredBy FROM Payments INNER JOIN PaymentTypes ON Payments.Type = PaymentTypes.TypeID WHERE (Payments.PmtID = @PmtID) AND (Payments.LoanID = @LoanID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="PmtID" QueryStringField="PmtID" Type="Int32" />
                <asp:SessionParameter Name="LoanID" SessionField="LoanNo" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
