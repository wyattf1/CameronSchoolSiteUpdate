<%@ Page Title="Menu" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="FreemanMIS413.menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <asp:Label ID="Label1" runat="server" Text="Menu of Work Items"></asp:Label>
    </h1>
    <br /><br />
    
    <div class="row">
        <div class="col-md-10 col-md-offset-2">
            <asp:Panel ID="pnlStudents" runat="server" Visible="false">
            <h4>
                Students</h4>
 <ul>
 <li>
     Update industries</li>
 <li>
     Update address</li>
 <li>
     Update skills</li>
     <li>Login/Logout</li>
 
 </ul>
</asp:Panel>
            <asp:Panel ID="pnlMentors" runat="server" Visible="false">
 <h4>
 <asp:Label ID="Label5" runat="server" Text="CEN Mentors"></asp:Label></h4>
 <ul>
 <li>
 <asp:Label ID="Label16" runat="server" Text="Update industries"></asp:Label></li>
 <li>
 <asp:Label ID="Label7" runat="server" Text="Update skills"></asp:Label></li>
 <li><asp:Label ID="Label9" runat="server" Text="Update home address"></asp:Label></li>
     <li>
 <asp:Label ID="Label6" runat="server"
Text="Login/Logout"></asp:Label></li>
 </ul>
   </asp:Panel>
            <asp:Panel ID="pnlFaculty" runat="server" Visible="false">
            <h4>
 <asp:Label ID="Label2" runat="server" Text="Faculty/Staff"></asp:Label></h4>
 <ul>
 <li>
 <asp:Label ID="Label3" runat="server"
Text="View - Industries"></asp:Label></li>
 <li>
 <asp:Label ID="Label4" runat="server" Text="View - Skills"></asp:Label></li>
 <li><asp:Label ID="Label8" runat="server" Text="View - Home Addresses"></asp:Label></li>

 </ul>
                </asp:Panel>
            <asp:Panel ID="pnlAdmin" runat="server" Visible="false">
<h4>
 <asp:Label ID="Label10" runat="server" Text="Administrators"></asp:Label></h4>
 <ul>
     <li>
        <asp:LinkButton ID="link_profile" runat="server" OnClick="link_profile_Click">CP#4 Wyatt</asp:LinkButton>

    </li>
      <li>
        <asp:LinkButton ID="_validVolRoles" runat="server" OnClick="_validVolRoles_Click" >Volunteer Roles - Add/Modify/Delete (CP#6 - WTF)</asp:LinkButton>

    </li>
 <li>
 <asp:Label ID="Label11" runat="server"
Text="Ability to modify all data tables"></asp:Label></li>
 <li>
 <asp:Label ID="Label12" runat="server" Text="Ability to add/modify/delete accounts"></asp:Label></li>
     <li>
 <asp:Label ID="Label13" runat="server" Text="Ability to create new background tables as needed"></asp:Label></li>
     <li>
 <asp:Label ID="Label14" runat="server" Text="Login/Logout"></asp:Label></li>
 </ul>
                </asp:Panel>
            <asp:Panel ID="pnlPublic" runat="server" Visible="false">
            <h4>
 <asp:Label ID="Label15" runat="server" Text="Public"></asp:Label></h4>
 <ul>
 
 <li>
 <asp:Label ID="Label17" runat="server" Text="View - Industries"></asp:Label></li>
     <li>
 <asp:Label ID="Label18" runat="server" Text="View - Skills"></asp:Label></li>
     <li>
 <asp:Label ID="Label19" runat="server" Text="View - CEN member profiles"></asp:Label></li>
 </ul>
                </asp:Panel>
            <asp:Label ID="_cookieRetrieveInfo" runat="server" Text=""></asp:Label>
        </div>
    </div>

</asp:Content>
