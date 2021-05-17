<%@ Page Title="Volunteer Roles Update" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="validVolRoles.aspx.cs" Inherits="FreemanMIS413.Admin.country" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <asp:Label ID="Label1" runat="server" 
            Text="Volunteer Role Updates"></asp:Label>
    </h1>
    <br />
    <p class="center">
        <asp:Label ID="_message" runat="server" Text=""
         CssClass="errorRed"> </asp:Label> 
        <br /><br />
        <asp:Button ID="_addStart" runat="server" Text="Add a New Volunteer Role" CssClass="btn btn-success" OnClick="_addStart_Click" />
    </p>

    <asp:Panel ID="_pnlAdd" runat="server" Visible="false">
        <div class="row">
            <div class="col-md-6 col-md-offset-4 column">
                <div class="form-group">
              <asp:Label ID="Label2" runat="server" Text="Volunteer Role:" 
                  CssClass="bold"></asp:Label>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                runat="server" ErrorMessage="*Required" 
                  CssClass="errorRed" ControlToValidate="_volunteerRole">
              </asp:RequiredFieldValidator>
              <asp:TextBox ID="_volunteerRole" runat="server" CssClass="form-control"></asp:TextBox>
          </div>
                <br /><br />
                 <asp:Button ID="_submit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="_submit_Click"  />
            <asp:Button ID="_clearData" runat="server" 
                style="margin-left:20px;"
                Text="Clear" CssClass="btn btn-secondary" CausesValidation="False" OnClick="_clearData_Click"  />
            </div>
        </div>
    </asp:Panel>

    <br /><br /><br /><br />
    <asp:GridView ID="_volunteerGrid" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="volRoleID" DataSourceID="SqlDatavalidVolRoles" HorizontalAlign="Center" OnRowUpdated="_volunteerGrid_RowUpdated" OnRowDeleted="_volunteerGrid_RowDeleted">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:TemplateField HeaderText="Volunteer Roles" SortExpression="volDescription">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("volDescription") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*Required" CssClass="errorRed"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("volDescription") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle CssClass="gridPadding" />
                <ItemStyle CssClass="gridPadding" />
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" ForeColor="Red" OnClientClick="return confirm('Are you sure you want to delete this volunteer role?')" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>

   
    <asp:SqlDataSource ID="SqlDatavalidVolRoles" runat="server" ConnectionString="<%$ ConnectionStrings:S21BackupConnectionString %>" DeleteCommand="validVolRolesDelete" DeleteCommandType="StoredProcedure" SelectCommand="validVolRolesSelectAll" SelectCommandType="StoredProcedure" UpdateCommand="validVolRolesUpdate" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="volRoleID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="volDescription" Type="String" />
            <asp:Parameter Name="volRoleID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
