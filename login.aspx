<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="FreemanMIS413.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>
        <asp:Label ID="_instruction" runat="server" 
            Text="Please Sign In:"></asp:Label></h3>
   <p class="center">
        <asp:Label ID="_message" runat="server" Text=""
         CssClass="errorRed"> </asp:Label> </p>

    <div class="row">
        <div class="col-md-6 col-md-offset-4 column">
     <div class="form-group">
         
              <asp:Label ID="Email" runat="server" Text="Email" 
                  CssClass="bold"></asp:Label>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                runat="server" ErrorMessage="*Required" 
                  CssClass="errorRed" ControlToValidate="_email">
              </asp:RequiredFieldValidator>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*Invalid Email Format" CssClass="errorRed" ControlToValidate="_email" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">></asp:RegularExpressionValidator>
              <asp:TextBox ID="_email" runat="server" CssClass="form-control"></asp:TextBox>
          </div>

     <div class="form-group">
              <asp:Label ID="Label2" runat="server" Text="Password:" 
                  CssClass="bold"></asp:Label>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                runat="server" ErrorMessage="*Required" 
                  CssClass="errorRed" ControlToValidate="_password">
              </asp:RequiredFieldValidator>
              <asp:TextBox ID="_password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
          </div>
       <br />
    <asp:Button ID="_Submit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="_Submit_Click" />
    <asp:Button ID="_Cancel" runat="server" Text="Cancel" style="margin-left:20px;" 
        CssClass="btn btn-secondary" CausesValidation="False" OnClick="_Cancel_Click" />
            <br /><br />
            <asp:Label ID="Label1" runat="server" Text="Admin Login/Pwd: admin@uncw.edu - abcd"></asp:Label>
            <br />
            <asp:Label ID="Label3" runat="server" Text="CEN Login/Pwd: wyatt123@gmail.com - 123"></asp:Label>
            </div>
        </div>
</asp:Content>
