<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Request_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
    <asp:MultiView ID="MultiView2" runat="server">
        <asp:View ID="NewComputer" runat="server">
            This is a new computer and needs to be added to the system.<br />
            Computer Name
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            Type
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Value="U">User System</asp:ListItem>
                <asp:ListItem Value="M">Manager System</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Button" />
        </asp:View>
        <asp:View ID="User" runat="server">
            Computer =
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            Computer System Setup As User<br />
            <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine"></asp:TextBox>
            <asp:Button ID="Button2" runat="server" Text="Submit Request" />
            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                <ContentTemplate>
                    <asp:Timer ID="Timer3" runat="server">
                    </asp:Timer>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" Visible="False">
                <ContentTemplate>
                    <asp:Timer ID="Timer2" runat="server" Interval="10000" Enabled="False">
                    </asp:Timer>
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource3">
                        <SeparatorTemplate>
                            <hr />
                        </SeparatorTemplate>
                        <ItemTemplate>
                            Request:
                            <asp:Label ID="RequestLabel" runat="server" Text='<%# Eval("Request") %>' />
                            <br />
                            Status:
                            <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status") %>' />
                            <br />
                            ReviewedBy:
                            <asp:Label ID="ReviewedByLabel" runat="server" 
                                Text='<%# Eval("ReviewedBy") %>' />
                            <br />
                            ReviewAnswer:
                            <asp:Label ID="ReviewAnswerLabel" runat="server" 
                                Text='<%# Eval("ReviewAnswer") %>' />
                            <br />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
                        
                        SelectCommand="SELECT TOP (3) Request, Status, ReviewedBy, ReviewAnswer FROM Request WHERE (Requester = @Requester) ORDER BY RquestID DESC">
                        <SelectParameters>
                            <asp:SessionParameter Name="Requester" SessionField="User" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:View>
        <asp:View ID="Manager" runat="server">
            Computer =
            <asp:Label ID="Label2" runat="server"></asp:Label>
            <br />
            Computer System Setup As Manager<br />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Timer ID="Timer1" runat="server" Interval="10000">
                    </asp:Timer>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="RquestID" DataSourceID="SqlDataSource1" SelectedIndex="0">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="RquestID" HeaderText="RquestID" 
                                InsertVisible="False" ReadOnly="True" SortExpression="RquestID" />
                            <asp:BoundField DataField="Requester" HeaderText="Requester" 
                                SortExpression="Requester" />
                            <asp:BoundField DataField="Status" HeaderText="Status" 
                                SortExpression="Status" />
                        </Columns>
                         <EmptyDataTemplate>
                        No Request In Queue
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
                        SelectCommand="SELECT * FROM [Request] WHERE ([ReviewedBy] IS NULL)">
                    </asp:SqlDataSource>
                    
                    
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <asp:FormView ID="FormView1" runat="server" AllowPaging="True" 
                        DataKeyNames="RquestID" DataSourceID="SqlDataSource2" DefaultMode="Edit">
                        <EditItemTemplate>
                            <table ID="table1" class="style1">
                                <tr>
                                    <td>
                                        RquestID</td>
                                    <td>
                                        <asp:Label ID="RquestIDLabel1" runat="server" Text='<%# Eval("RquestID") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Requester</td>
                                    <td>
                                        <asp:TextBox ID="RequesterTextBox" runat="server" ReadOnly="True" 
                                            Text='<%# Bind("Requester") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Request</td>
                                    <td>
                                        <asp:TextBox ID="RequestTextBox" runat="server" ReadOnly="True" 
                                            Text='<%# Bind("Request") %>' TextMode="MultiLine" Rows="5" Width="500px"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Status</td>
                                    <td>
                                        <asp:TextBox ID="StatusTextBox" runat="server" ReadOnly="True" 
                                            Text='<%# Bind("Status") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        ReviewAnswer</td>
                                    <td>
                                        <asp:TextBox ID="ReviewAnswerTextBox" runat="server" 
                                            Text='<%# Bind("ReviewAnswer") %>' TextMode="MultiLine" Rows="5" Width="500px"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        ReviewedBy</td>
                                    <td>
                                        <asp:TextBox ID="ReviewedByTextBox" runat="server" 
                                            Text='<%# Bind("ReviewedBy") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" Text="Cancel" />
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                            CommandName="Update" Text="Update" />
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            Requester:
                            <asp:TextBox ID="RequesterTextBox" runat="server" 
                                Text='<%# Bind("Requester") %>' />
                            <br />
                            Request:
                            <asp:TextBox ID="RequestTextBox" runat="server" Text='<%# Bind("Request") %>' />
                            <br />
                            Status:
                            <asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>' />
                            <br />
                            ReviewAnswer:
                            <asp:TextBox ID="ReviewAnswerTextBox" runat="server" 
                                Text='<%# Bind("ReviewAnswer") %>' />
                            <br />
                            ReviewedBy:
                            <asp:TextBox ID="ReviewedByTextBox" runat="server" 
                                Text='<%# Bind("ReviewedBy") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            RquestID:
                            <asp:Label ID="RquestIDLabel" runat="server" Text='<%# Eval("RquestID") %>' />
                            <br />
                            Requester:
                            <asp:Label ID="RequesterLabel" runat="server" Text='<%# Bind("Requester") %>' />
                            <br />
                            Request:
                            <asp:Label ID="RequestLabel" runat="server" Text='<%# Bind("Request") %>' />
                            <br />
                            Status:
                            <asp:Label ID="StatusLabel" runat="server" Text='<%# Bind("Status") %>' />
                            <br />
                            ReviewAnswer:
                            <asp:Label ID="ReviewAnswerLabel" runat="server" 
                                Text='<%# Bind("ReviewAnswer") %>' />
                            <br />
                            ReviewedBy:
                            <asp:Label ID="ReviewedByLabel" runat="server" 
                                Text='<%# Bind("ReviewedBy") %>' />
                            <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="Edit" />
                            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                CommandName="Delete" Text="Delete" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                CommandName="New" Text="New" />
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConflictDetection="CompareAllValues" 
                        ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
                        DeleteCommand="DELETE FROM [Request] WHERE [RquestID] = @original_RquestID AND [Requester] = @original_Requester AND [Request] = @original_Request AND [Status] = @original_Status AND (([ReviewAnswer] = @original_ReviewAnswer) OR ([ReviewAnswer] IS NULL AND @original_ReviewAnswer IS NULL)) AND (([ReviewedBy] = @original_ReviewedBy) OR ([ReviewedBy] IS NULL AND @original_ReviewedBy IS NULL))" 
                        InsertCommand="INSERT INTO [Request] ([Requester], [Request], [Status], [ReviewAnswer], [ReviewedBy]) VALUES (@Requester, @Request, @Status, @ReviewAnswer, @ReviewedBy)" 
                        OldValuesParameterFormatString="original_{0}" 
                        SelectCommand="SELECT [RquestID], [Requester], [Request], [Status], [ReviewAnswer], [ReviewedBy] FROM [Request] WHERE ([RquestID] = @RquestID)" 
                        UpdateCommand="UPDATE [Request] SET [Requester] = @Requester, [Request] = @Request, [Status] = @Status, [ReviewAnswer] = @ReviewAnswer, [ReviewedBy] = @ReviewedBy WHERE [RquestID] = @original_RquestID AND [Requester] = @original_Requester AND [Request] = @original_Request AND [Status] = @original_Status AND (([ReviewAnswer] = @original_ReviewAnswer) OR ([ReviewAnswer] IS NULL AND @original_ReviewAnswer IS NULL)) AND (([ReviewedBy] = @original_ReviewedBy) OR ([ReviewedBy] IS NULL AND @original_ReviewedBy IS NULL))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="RquestID" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="original_RquestID" Type="Int32" />
                            <asp:Parameter Name="original_Requester" Type="String" />
                            <asp:Parameter Name="original_Request" Type="String" />
                            <asp:Parameter Name="original_Status" Type="String" />
                            <asp:Parameter Name="original_ReviewAnswer" Type="String" />
                            <asp:Parameter Name="original_ReviewedBy" Type="String" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Requester" Type="String" />
                            <asp:Parameter Name="Request" Type="String" />
                            <asp:Parameter Name="Status" Type="String" />
                            <asp:Parameter Name="ReviewAnswer" Type="String" />
                            <asp:Parameter Name="ReviewedBy" Type="String" />
                            <asp:Parameter Name="original_RquestID" Type="Int32" />
                            <asp:Parameter Name="original_Requester" Type="String" />
                            <asp:Parameter Name="original_Request" Type="String" />
                            <asp:Parameter Name="original_Status" Type="String" />
                            <asp:Parameter Name="original_ReviewAnswer" Type="String" />
                            <asp:Parameter Name="original_ReviewedBy" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Requester" Type="String" />
                            <asp:Parameter Name="Request" Type="String" />
                            <asp:Parameter Name="Status" Type="String" />
                            <asp:Parameter Name="ReviewAnswer" Type="String" />
                            <asp:Parameter Name="ReviewedBy" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:View>
    </asp:MultiView>
</asp:Content>

