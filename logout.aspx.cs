using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
namespace FreemanMIS413
{
    public partial class _logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            Session.Abandon();
            // Clear cookie
            if (Request.Cookies["userInfo"] != null)
            {
                HttpCookie myCookie = new HttpCookie("userInfo");
                myCookie.Expires = DateTime.Now.AddDays(-1d);
                Response.Cookies.Add(myCookie);
            }
            Response.Redirect("~/Default");
        }
    }
}