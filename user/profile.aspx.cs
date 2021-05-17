using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FreemanMIS413.user
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void _clearData_Click(object sender, EventArgs e)
        {
            this._firstName.Text = "";
            this._lastName.Text = "";
            this._email.Text = "";
            this._password.Text = "";
            this._club1.SelectedIndex = 0;
            this._returnResults.Text = "";
        }

        protected void _submit_Click(object sender, EventArgs e)
        {
            this._returnResults.Text = "Thank you " + this._firstName.Text + " " +
                this._lastName.Text + "<br/>We are showing your email as " +
                this._email.Text + "<br/>Your club membership is: " +
                this._club1.SelectedItem.Text;
        }
    }
}