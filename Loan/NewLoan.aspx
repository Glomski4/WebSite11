<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false" CodeFile="NewLoan.aspx.vb" Inherits="Loan_NewLoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
Car ID
<asp:Label ID="Label1" runat="server"></asp:Label>
&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" ForeColor="Red" 
                    Text="** YOU MUST US THE CAR SEARCH OPTION FIRST THEN CLICK ON SELL CAR. **" 
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <hr />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" 
                    DisplayCancelButton="True" Height="329px" Width="777px" 
                    BackColor="#FFFBD6" BorderColor="#FFDFAD" BorderWidth="1px" 
                    DisplaySideBar="False" Font-Names="Verdana" Font-Size="0.8em">
                    <StepStyle VerticalAlign="Top" />
                    <WizardSteps>
                        <asp:WizardStep runat="server" title="Client Search">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                            Clients SSN
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="TextBox1" 
                                ErrorMessage="SSN Needs to be in 123-12-1234 Format." SetFocusOnError="True" 
                                ValidationExpression="\d{3}-\d{2}-\d{4}">*</asp:RegularExpressionValidator>
                            &nbsp;
                        </asp:WizardStep>
                        <asp:WizardStep runat="server" title="Client Data">
                            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" 
                                EnableTheming="False">
                                <asp:View ID="View1" runat="server">
                                    * There was an error in the system using the SSN of
                                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                                    .<br />
                                    ------ Please try again and if this happens with the SSN more then once please 
                                    take the SSN to a manager for review. Sorry.
                                </asp:View>
                                <asp:View ID="View2" runat="server">
                                    * Clients SSN Not on File .... Add the new client.<br />
                                    <table border="1" cellpadding="1" cellspacing="1" class="style1">
                                        <tr>
                                            <td>
                                                First Name</td>
                                            <td>
                                                Middle Name
                                            </td>
                                            <td>
                                                Last Name</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="NC_FirstName" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="V_FN" runat="server" 
                                                    ControlToValidate="NC_FirstName" 
                                                    ErrorMessage="First Name Required to Add Client">*</asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="NC_MiddleName" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="NC_LastName" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="V_LN" runat="server" 
                                                    ControlToValidate="NC_LastName" ErrorMessage="Last Name Required to Add Client">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                Address 1</td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:TextBox ID="NC_Address1" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="V_A1" runat="server" 
                                                    ControlToValidate="NC_Address1" ErrorMessage="Address Required to Add Client">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                Address 2</td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:TextBox ID="NC_Address2" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                City</td>
                                            <td>
                                                State</td>
                                            <td>
                                                Zip</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="NC_City" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="V_City" runat="server" 
                                                    ControlToValidate="NC_City" ErrorMessage="City Required to Add Client">*</asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="NC_State" runat="server" MaxLength="2"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="V_State" runat="server" 
                                                    ControlToValidate="NC_State" ErrorMessage="State Required to Add Client">*</asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="NC_Zip" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="V_Zip" runat="server" 
                                                    ControlToValidate="NC_Zip" ErrorMessage="Zip Required to Add Client">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Phone</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                SSN</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="NC_Phone" runat="server"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="VF_Phone" runat="server" 
                                                    ControlToValidate="NC_Phone" 
                                                    ErrorMessage="Phone Number Format Invaild = (Correct Format ###-###-#### )" 
                                                    ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">*</asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="V_Phone" runat="server" 
                                                    ControlToValidate="NC_Phone" ErrorMessage="Phone Number Required to Add Client">*</asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                <asp:TextBox ID="NC_SSN" runat="server" ReadOnly="True"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="VF_SSN" runat="server" 
                                                    ControlToValidate="NC_SSN" 
                                                    ErrorMessage="SSN Format Invaild = (Correct Format ###-##-#### )" 
                                                    ValidationExpression="\d{3}-\d{2}-\d{4}">*</asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="V_SSN" runat="server" 
                                                    ControlToValidate="NC_SSN" ErrorMessage="SSN Required to Add Client">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                ID</td>
                                            <td>
                                                ID State</td>
                                            <td>
                                                Last Updated</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="NC_ID" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="NC_IDState" runat="server" MaxLength="2"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="NC_LastUpdated" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                                                    BorderStyle="Groove" HeaderText="Please Check the items listed below." 
                                                    ShowMessageBox="True" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </asp:View>
                                <asp:View ID="View3" runat="server">
                                    *Client Found .... Verify correct client.<br />
                                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ClientID" 
                                        DataSourceID="SqlDataSource1">
                                        <EditItemTemplate>
                                            <table class="style1">
                                                <tr>
                                                    <td>
                                                        Client ID</td>
                                                    <td>
                                                        <asp:Label ID="ClientIDLabel1" runat="server" Text='<%# Eval("ClientID") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        First Name</td>
                                                    <td>
                                                        <asp:TextBox ID="FirstNameTextBox" runat="server" 
                                                            Text='<%# Bind("FirstName") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Middle Name</td>
                                                    <td>
                                                        <asp:TextBox ID="MiddleNameTextBox" runat="server" 
                                                            Text='<%# Bind("MiddleName") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Last Name</td>
                                                    <td>
                                                        <asp:TextBox ID="LastNameTextBox" runat="server" 
                                                            Text='<%# Bind("LastName") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Address 1</td>
                                                    <td>
                                                        <asp:TextBox ID="Address1TextBox" runat="server" 
                                                            Text='<%# Bind("Address1") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Address 2</td>
                                                    <td>
                                                        <asp:TextBox ID="Address2TextBox" runat="server" 
                                                            Text='<%# Bind("Address2") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        City</td>
                                                    <td>
                                                        <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        State</td>
                                                    <td>
                                                        <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Zip</td>
                                                    <td>
                                                        <asp:TextBox ID="ZipTextBox" runat="server" Text='<%# Bind("Zip") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Phone</td>
                                                    <td>
                                                        <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        SSN</td>
                                                    <td>
                                                        <asp:TextBox ID="SSNTextBox" runat="server" Text='<%# Bind("SSN") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        ID</td>
                                                    <td>
                                                        <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        ID State</td>
                                                    <td>
                                                        <asp:TextBox ID="IDStateTextBox" runat="server" Text='<%# Bind("IDState") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Last Update</td>
                                                    <td>
                                                        <asp:TextBox ID="LastUpdatedTextBox" runat="server" 
                                                            Text='<%# Bind("LastUpdated") %>' />
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                                CommandName="Update" Text="Update" />
                                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            FirstName:
                                            <asp:TextBox ID="FirstNameTextBox" runat="server" 
                                                Text='<%# Bind("FirstName") %>' />
                                            <br />
                                            MiddleName:
                                            <asp:TextBox ID="MiddleNameTextBox" runat="server" 
                                                Text='<%# Bind("MiddleName") %>' />
                                            <br />
                                            LastName:
                                            <asp:TextBox ID="LastNameTextBox" runat="server" 
                                                Text='<%# Bind("LastName") %>' />
                                            <br />
                                            Address1:
                                            <asp:TextBox ID="Address1TextBox" runat="server" 
                                                Text='<%# Bind("Address1") %>' />
                                            <br />
                                            Address2:
                                            <asp:TextBox ID="Address2TextBox" runat="server" 
                                                Text='<%# Bind("Address2") %>' />
                                            <br />
                                            City:
                                            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                                            <br />
                                            State:
                                            <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                                            <br />
                                            Zip:
                                            <asp:TextBox ID="ZipTextBox" runat="server" Text='<%# Bind("Zip") %>' />
                                            <br />
                                            Phone:
                                            <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                                            <br />
                                            SSN:
                                            <asp:TextBox ID="SSNTextBox" runat="server" Text='<%# Bind("SSN") %>' />
                                            <br />
                                            ID:
                                            <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                                            <br />
                                            IDState:
                                            <asp:TextBox ID="IDStateTextBox" runat="server" Text='<%# Bind("IDState") %>' />
                                            <br />
                                            LastUpdated:
                                            <asp:TextBox ID="LastUpdatedTextBox" runat="server" 
                                                Text='<%# Bind("LastUpdated") %>' />
                                            <br />
                                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                                CommandName="Insert" Text="Insert" />
                                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            &nbsp;<table class="style1">
                                                <tr>
                                                    <td>
                                                        Cient ID</td>
                                                    <td>
                                                        <asp:Label ID="ClientIDLabel" runat="server" Text='<%# Eval("ClientID") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        First Name</td>
                                                    <td>
                                                        <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Bind("FirstName") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Middle Name</td>
                                                    <td>
                                                        <asp:Label ID="MiddleNameLabel" runat="server" 
                                                            Text='<%# Bind("MiddleName") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Last Name</td>
                                                    <td>
                                                        <asp:Label ID="LastNameLabel" runat="server" Text='<%# Bind("LastName") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Address 1</td>
                                                    <td>
                                                        <asp:Label ID="Address1Label" runat="server" Text='<%# Bind("Address1") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Address 2</td>
                                                    <td>
                                                        <asp:Label ID="Address2Label" runat="server" Text='<%# Bind("Address2") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        City</td>
                                                    <td>
                                                        <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        State</td>
                                                    <td>
                                                        <asp:Label ID="StateLabel" runat="server" Text='<%# Bind("State") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Zip</td>
                                                    <td>
                                                        <asp:Label ID="ZipLabel" runat="server" Text='<%# Bind("Zip") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Phone</td>
                                                    <td>
                                                        <asp:Label ID="PhoneLabel" runat="server" Text='<%# Bind("Phone") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        SSN</td>
                                                    <td>
                                                        <asp:Label ID="SSNLabel" runat="server" Text='<%# Bind("SSN") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        ID</td>
                                                    <td>
                                                        <asp:Label ID="IDLabel" runat="server" Text='<%# Bind("ID") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        ID State</td>
                                                    <td>
                                                        <asp:Label ID="IDStateLabel" runat="server" Text='<%# Bind("IDState") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Last Updated</td>
                                                    <td>
                                                        <asp:Label ID="LastUpdatedLabel" runat="server" 
                                                            Text='<%# Bind("LastUpdated") %>' />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                                CommandName="Edit" Text="Edit" />
                                            &nbsp;&nbsp;
                                        </ItemTemplate>
                                    </asp:FormView>
                                    <asp:LinkButton ID="LinkButton2" runat="server">Wrong Client ... Search Again</asp:LinkButton>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                        ConflictDetection="CompareAllValues" 
                                        ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
                                        DeleteCommand="DELETE FROM [Clients] WHERE [ClientID] = @original_ClientID AND [FirstName] = @original_FirstName AND (([MiddleName] = @original_MiddleName) OR ([MiddleName] IS NULL AND @original_MiddleName IS NULL)) AND [LastName] = @original_LastName AND [Address1] = @original_Address1 AND (([Address2] = @original_Address2) OR ([Address2] IS NULL AND @original_Address2 IS NULL)) AND [City] = @original_City AND [State] = @original_State AND [Zip] = @original_Zip AND [Phone] = @original_Phone AND [SSN] = @original_SSN AND (([ID] = @original_ID) OR ([ID] IS NULL AND @original_ID IS NULL)) AND (([IDState] = @original_IDState) OR ([IDState] IS NULL AND @original_IDState IS NULL)) AND (([LastUpdated] = @original_LastUpdated) OR ([LastUpdated] IS NULL AND @original_LastUpdated IS NULL))" 
                                        InsertCommand="INSERT INTO [Clients] ([FirstName], [MiddleName], [LastName], [Address1], [Address2], [City], [State], [Zip], [Phone], [SSN], [ID], [IDState], [LastUpdated]) VALUES (@FirstName, @MiddleName, @LastName, @Address1, @Address2, @City, @State, @Zip, @Phone, @SSN, @ID, @IDState, @LastUpdated)" 
                                        OldValuesParameterFormatString="original_{0}" 
                                        SelectCommand="SELECT * FROM [Clients] WHERE ([SSN] = @SSN)" 
                                        UpdateCommand="UPDATE [Clients] SET [FirstName] = @FirstName, [MiddleName] = @MiddleName, [LastName] = @LastName, [Address1] = @Address1, [Address2] = @Address2, [City] = @City, [State] = @State, [Zip] = @Zip, [Phone] = @Phone, [SSN] = @SSN, [ID] = @ID, [IDState] = @IDState, [LastUpdated] = @LastUpdated WHERE [ClientID] = @original_ClientID AND [FirstName] = @original_FirstName AND (([MiddleName] = @original_MiddleName) OR ([MiddleName] IS NULL AND @original_MiddleName IS NULL)) AND [LastName] = @original_LastName AND [Address1] = @original_Address1 AND (([Address2] = @original_Address2) OR ([Address2] IS NULL AND @original_Address2 IS NULL)) AND [City] = @original_City AND [State] = @original_State AND [Zip] = @original_Zip AND [Phone] = @original_Phone AND [SSN] = @original_SSN AND (([ID] = @original_ID) OR ([ID] IS NULL AND @original_ID IS NULL)) AND (([IDState] = @original_IDState) OR ([IDState] IS NULL AND @original_IDState IS NULL)) AND (([LastUpdated] = @original_LastUpdated) OR ([LastUpdated] IS NULL AND @original_LastUpdated IS NULL))">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="TextBox1" Name="SSN" PropertyName="Text" 
                                                Type="String" />
                                        </SelectParameters>
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_ClientID" Type="Int32" />
                                            <asp:Parameter Name="original_FirstName" Type="String" />
                                            <asp:Parameter Name="original_MiddleName" Type="String" />
                                            <asp:Parameter Name="original_LastName" Type="String" />
                                            <asp:Parameter Name="original_Address1" Type="String" />
                                            <asp:Parameter Name="original_Address2" Type="String" />
                                            <asp:Parameter Name="original_City" Type="String" />
                                            <asp:Parameter Name="original_State" Type="String" />
                                            <asp:Parameter Name="original_Zip" Type="String" />
                                            <asp:Parameter Name="original_Phone" Type="String" />
                                            <asp:Parameter Name="original_SSN" Type="String" />
                                            <asp:Parameter Name="original_ID" Type="String" />
                                            <asp:Parameter Name="original_IDState" Type="String" />
                                            <asp:Parameter Name="original_LastUpdated" Type="DateTime" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="FirstName" Type="String" />
                                            <asp:Parameter Name="MiddleName" Type="String" />
                                            <asp:Parameter Name="LastName" Type="String" />
                                            <asp:Parameter Name="Address1" Type="String" />
                                            <asp:Parameter Name="Address2" Type="String" />
                                            <asp:Parameter Name="City" Type="String" />
                                            <asp:Parameter Name="State" Type="String" />
                                            <asp:Parameter Name="Zip" Type="String" />
                                            <asp:Parameter Name="Phone" Type="String" />
                                            <asp:Parameter Name="SSN" Type="String" />
                                            <asp:Parameter Name="ID" Type="String" />
                                            <asp:Parameter Name="IDState" Type="String" />
                                            <asp:Parameter Name="LastUpdated" Type="DateTime" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="FirstName" Type="String" />
                                            <asp:Parameter Name="MiddleName" Type="String" />
                                            <asp:Parameter Name="LastName" Type="String" />
                                            <asp:Parameter Name="Address1" Type="String" />
                                            <asp:Parameter Name="Address2" Type="String" />
                                            <asp:Parameter Name="City" Type="String" />
                                            <asp:Parameter Name="State" Type="String" />
                                            <asp:Parameter Name="Zip" Type="String" />
                                            <asp:Parameter Name="Phone" Type="String" />
                                            <asp:Parameter Name="SSN" Type="String" />
                                            <asp:Parameter Name="ID" Type="String" />
                                            <asp:Parameter Name="IDState" Type="String" />
                                            <asp:Parameter Name="LastUpdated" Type="DateTime" />
                                            <asp:Parameter Name="original_ClientID" Type="Int32" />
                                            <asp:Parameter Name="original_FirstName" Type="String" />
                                            <asp:Parameter Name="original_MiddleName" Type="String" />
                                            <asp:Parameter Name="original_LastName" Type="String" />
                                            <asp:Parameter Name="original_Address1" Type="String" />
                                            <asp:Parameter Name="original_Address2" Type="String" />
                                            <asp:Parameter Name="original_City" Type="String" />
                                            <asp:Parameter Name="original_State" Type="String" />
                                            <asp:Parameter Name="original_Zip" Type="String" />
                                            <asp:Parameter Name="original_Phone" Type="String" />
                                            <asp:Parameter Name="original_SSN" Type="String" />
                                            <asp:Parameter Name="original_ID" Type="String" />
                                            <asp:Parameter Name="original_IDState" Type="String" />
                                            <asp:Parameter Name="original_LastUpdated" Type="DateTime" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </asp:View>
                            </asp:MultiView>
                        </asp:WizardStep>
                        <asp:WizardStep runat="server" Title="Creat Appliaction">
                            * Client and Car ready....<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ......Click the FINISH button to creat application.
                        </asp:WizardStep>
                    </WizardSteps>
                    <SideBarButtonStyle ForeColor="White" />
                    <NavigationButtonStyle BackColor="White" BorderColor="#CC9966" 
                        BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
                        ForeColor="#990000" />
                    <SideBarStyle VerticalAlign="Top" BackColor="#990000" Font-Size="0.9em" />
                    <HeaderStyle BackColor="#FFCC66" BorderColor="#FFFBD6" BorderStyle="Solid" 
                        BorderWidth="2px" Font-Bold="True" Font-Size="0.9em" ForeColor="#333333" 
                        HorizontalAlign="Center" />
                </asp:Wizard>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

