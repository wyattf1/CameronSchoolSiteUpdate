using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace FreemanMIS413
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                this._login.Visible = false;
                this._logout.Visible = true;
            }
            else
            {
                this._login.Visible = true;
                this._logout.Visible = false;
            }
        }
    }
}