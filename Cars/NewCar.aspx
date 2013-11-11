<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageLittle.master" AutoEventWireup="false" CodeFile="NewCar.aspx.vb" Inherits="Cars_NewCar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="CarID" 
        DataSourceID="SqlDataSource1" DefaultMode="Insert">
        <EditItemTemplate>
            Active:
            <asp:TextBox ID="ActiveTextBox" runat="server" Text='<%# Bind("Active") %>' />
            <br />
            Year:
            <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
            <br />
            Make:
            <asp:TextBox ID="MakeTextBox" runat="server" Text='<%# Bind("Make") %>' />
            <br />
            Model:
            <asp:TextBox ID="ModelTextBox" runat="server" Text='<%# Bind("Model") %>' />
            <br />
            CarID:
            <asp:Label ID="CarIDLabel1" runat="server" Text='<%# Eval("CarID") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <table ID="table1" class="style1">
                <tr>
                    <td>
                        Year :</td>
                    <td>
                        <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Make :</td>
                    <td>
                        <asp:TextBox ID="MakeTextBox" runat="server" Text='<%# Bind("Make") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Model :</td>
                    <td>
                        <asp:TextBox ID="ModelTextBox" runat="server" Text='<%# Bind("Model") %>' />
                    </td>
                </tr>
            </table>
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" onclick="InsertButton_Click" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                CommandName="Cancel" Text="Cancel" onclick="InsertCancelButton_Click" />
        </InsertItemTemplate>
        <ItemTemplate>
            Active:
            <asp:Label ID="ActiveLabel" runat="server" Text='<%# Bind("Active") %>' />
            <br />
            Year:
            <asp:Label ID="YearLabel" runat="server" Text='<%# Bind("Year") %>' />
            <br />
            Make:
            <asp:Label ID="MakeLabel" runat="server" Text='<%# Bind("Make") %>' />
            <br />
            Model:
            <asp:Label ID="ModelLabel" runat="server" Text='<%# Bind("Model") %>' />
            <br />
            CarID:
            <asp:Label ID="CarIDLabel" runat="server" Text='<%# Eval("CarID") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:WEB1ConnectionString %>" 
        DeleteCommand="DELETE FROM [Car] WHERE [CarID] = @original_CarID AND [Active] = @original_Active AND [Year] = @original_Year AND [Make] = @original_Make AND [Model] = @original_Model" 
        InsertCommand="INSERT INTO Car(Active, Year, Make, Model) VALUES (N'Q', @Year, @Make, @Model)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT [Active], [Year], [Make], [Model], [CarID] FROM [Car]" 
        UpdateCommand="UPDATE [Car] SET [Active] = @Active, [Year] = @Year, [Make] = @Make, [Model] = @Model WHERE [CarID] = @original_CarID AND [Active] = @original_Active AND [Year] = @original_Year AND [Make] = @original_Make AND [Model] = @original_Model">
        <DeleteParameters>
            <asp:Parameter Name="original_CarID" Type="Int32" />
            <asp:Parameter Name="original_Active" Type="String" />
            <asp:Parameter Name="original_Year" Type="String" />
            <asp:Parameter Name="original_Make" Type="String" />
            <asp:Parameter Name="original_Model" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Active" Type="String" />
            <asp:Parameter Name="Year" Type="String" />
            <asp:Parameter Name="Make" Type="String" />
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="original_CarID" Type="Int32" />
            <asp:Parameter Name="original_Active" Type="String" />
            <asp:Parameter Name="original_Year" Type="String" />
            <asp:Parameter Name="original_Make" Type="String" />
            <asp:Parameter Name="original_Model" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Year" Type="String" />
            <asp:Parameter Name="Make" Type="String" />
            <asp:Parameter Name="Model" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

