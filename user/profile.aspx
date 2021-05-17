<%@ Page Title="User Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="FreemanMIS413.user.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <asp:Label ID="Label1" runat="server" 
            Text="User Profile Information"></asp:Label>
    </h1>
    <br />
    <p class="center">
        <asp:Label ID="_message" runat="server" Text=""
         CssClass="errorRed"> </asp:Label> </p>
    <h3 class="center">
        <asp:Label ID="_instruction" runat="server" 
            Text="Add A New User"></asp:Label></h3> <br/>
    <div class="row">
        <div class="col-md-6 col-md-offset-4 column">
          <div class="form-group">
              <asp:Label ID="Label2" runat="server" Text="First Name" 
                  CssClass="bold"></asp:Label>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                runat="server" ErrorMessage="*Required" 
                  CssClass="errorRed" ControlToValidate="_firstName">
              </asp:RequiredFieldValidator>
              <asp:TextBox ID="_firstName" runat="server" CssClass="form-control"></asp:TextBox>
          </div>

             <div class="form-group">
              <asp:Label ID="Label3" runat="server" Text="Last Name" 
                  CssClass="bold"></asp:Label>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                runat="server" ErrorMessage="*Required" 
                  CssClass="errorRed" ControlToValidate="_lastName">
              </asp:RequiredFieldValidator>
              <asp:TextBox ID="_lastName" runat="server" CssClass="form-control"></asp:TextBox>
          </div>

             <div class="form-group">
              <asp:Label ID="Label4" runat="server" Text="Email" 
                  CssClass="bold"></asp:Label>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                runat="server" ErrorMessage="*Required" 
                  CssClass="errorRed" ControlToValidate="_email" Display="Dynamic">
              </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*Invalid Email Format" CssClass="errorRed" ControlToValidate="_email" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
              <asp:TextBox ID="_email" runat="server" CssClass="form-control"></asp:TextBox>
          </div>

             <div class="form-group">
              <asp:Label ID="Label5" runat="server" Text="Password" 
                  CssClass="bold"></asp:Label>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                runat="server" ErrorMessage="*Required" 
                  CssClass="errorRed" ControlToValidate="_password">
              </asp:RequiredFieldValidator>
              <asp:TextBox ID="_password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
          </div>

             <div class="form-group">
              <asp:Label ID="Label6" runat="server" Text="Club" 
                  CssClass="bold"></asp:Label>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" 
                runat="server" ErrorMessage="*Required" 
                  CssClass="errorRed" ControlToValidate="_club1" InitialValue="0"></asp:RequiredFieldValidator>
                 <asp:DropDownList ID="_club1" 
                     runat="server" DataSourceID="SqlDataClub" DataTextField="clubDescription" DataValueField="clubId" AppendDataBoundItems="True">
                     <asp:ListItem Value="0">-Please Select-</asp:ListItem>
                 </asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataClub" runat="server" ConnectionString="<%$ ConnectionStrings:S21BackupConnectionString %>" SelectCommand="clubSelectAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
          </div>
            <br /><br />
            <asp:Button ID="_submit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="_submit_Click" />
            <asp:Button ID="_clearData" runat="server" 
                style="margin-left:20px;"
                Text="Clear Data" CssClass="btn btn-secondary" CausesValidation="False" OnClick="_clearData_Click" />

        </div>
    </div>

    <br /><br />
    <p class="center">
        <asp:Label ID="_returnResults" runat="server" Text=""></asp:Label>
    </p>
    <br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataPerson" HorizontalAlign="Center">
        <Columns>
            <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName">
            <HeaderStyle CssClass="gridPadding" />
            <ItemStyle CssClass="gridPadding" />
            </asp:BoundField>
            <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName">
            <HeaderStyle CssClass="gridPadding" />
            <ItemStyle CssClass="gridPadding" />
            </asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email">
            <HeaderStyle CssClass="gridPadding" />
            <ItemStyle CssClass="gridPadding" />
            </asp:BoundField>
            <asp:BoundField DataField="clubDescription" HeaderText="Club Name" SortExpression="clubDescription">
            <HeaderStyle CssClass="gridPadding" />
            <ItemStyle CssClass="gridPadding" />
            </asp:BoundField>
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
    <asp:SqlDataSource ID="SqlDataPerson" runat="server" ConnectionString="<%$ ConnectionStrings:S21BackupConnectionString %>" SelectCommand="wtfPersonClubSelect" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
