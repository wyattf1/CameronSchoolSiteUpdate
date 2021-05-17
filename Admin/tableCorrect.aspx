<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="tableCorrect.aspx.cs" Inherits="FreemanMIS413.Admin.tableCorrect" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <asp:Label ID="Label1" runat="server" 
            Text="Volunteer Role Spelling Corrections"></asp:Label>
    </h1>
    <br />
    <p class="center">
        <asp:Label ID="_message" runat="server" Text=""
         CssClass="errorRed"> </asp:Label> 
        <br /><br />
      <div class="row">
 <div class="col-md-3 col-md-offset-2 column">
 <div class="form-group">
     <asp:Label ID="Label2" runat="server" Text="Incorrect Volunteer Role"></asp:Label>
 <asp:DropDownList ID="_volRoleStart" runat="server"
CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="volDescription" DataValueField="volDescription" AppendDataBoundItems="True">
     <asp:ListItem Value="0">-Please Select-</asp:ListItem>
 </asp:DropDownList>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:S21BackupConnectionString %>" SelectCommand="validVolRolesSelectAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
 </div>
 </div>
 <div class="col-md-3 col-md-offset-1 column">
 <div class="form-group">
     <asp:Label ID="Label3" runat="server" Text="Merge into Volunteer Roles"></asp:Label>
 <asp:DropDownList ID="_volRoleEnd" runat="server"
CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="volDescription" DataValueField="volDescription" AppendDataBoundItems="True">
     <asp:ListItem Value="0">-Please Select-</asp:ListItem>
 </asp:DropDownList>
 </div>
 </div>
</div>
    </p>

  


</asp:Content>
