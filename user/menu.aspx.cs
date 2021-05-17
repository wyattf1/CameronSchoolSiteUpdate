using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FreemanMIS413
{
    public partial class menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this._cookieRetrieveInfo.Text = "Your Person ID is: " + Convert.ToString(RetrievePersonID()) + 
                " and your Role ID is: " + Convert.ToString(RetrieveRoleID());


            if(RetrieveRoleID()==99)
            {
                pnlAdmin.Visible = true;
                pnlFaculty.Visible = true;
                pnlStudents.Visible = true;
                pnlMentors.Visible = true;
                pnlPublic.Visible = true;
            }
            if(RetrieveRoleID()==101)
            {
                pnlMentors.Visible = true;
            }
        }

        protected void link_profile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/Profile");
        }

        protected void _validVolRoles_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/validVolRoles");
        }

        protected int RetrievePersonID()
        {
            // this checks to see if a cookie exists and returns the PersonID
            int iTempID = 0;
            if (Request.Cookies["userInfo"] != null) //note the != represents Not
            {
                iTempID =
               Convert.ToInt32(Server.HtmlEncode(Request.Cookies["userInfo"]["personID"]));
            }
            return iTempID;
        }
        protected int RetrieveRoleID()
        {
            // this checks to see if a cookie exists and returns the RoleID
            int iTempID = 0;
            if (Request.Cookies["userInfo"] != null) //note the != represents Not
            {
                iTempID =
               Convert.ToInt32(Server.HtmlEncode(Request.Cookies["userInfo"]["roleID"]));
            }
            return iTempID;
        }

    }
}