using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace FreemanMIS413.Admin
{
    public partial class country : System.Web.UI.Page
    {
        PersonInfo person = new PersonInfo();
        protected void Page_Load(object sender, EventArgs e)
        {
            person = (PersonInfo)Session["person"];
            if(person.RoleID != 99)
            {
                Response.Redirect("~/user/menu.aspx");
            }
        }

        protected void _volunteerGrid_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            this._message.Text = "Volunteer Roles was updated";
        }

        protected void _volunteerGrid_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            this._message.Text = "Volunteer Role was deleted";
        }

        protected void _clearData_Click(object sender, EventArgs e)
        {
            this._pnlAdd.Visible = false;
            this._volunteerGrid.Visible = true;
            this._addStart.Visible = true;
            this._volunteerRole.Text = "";

        }

        protected void _addStart_Click(object sender, EventArgs e)
        {
            this._pnlAdd.Visible = true;
            this._volunteerGrid.Visible = false;
            this._addStart.Visible = false;
        }

        protected void _submit_Click(object sender, EventArgs e)
        {
            // this will insert a new record
            // this will insert a new record into the database
            //build a link the the name/pwd/user for your particular database
            //note below the [mis413...] should be the name of your connection string,
            //open your webconfig file and find the connection string name
            string dbConn =
           System.Configuration.ConfigurationManager.ConnectionStrings["S21BackupConnectionString"].
           ConnectionString;
            //build a connection to the database
            SqlConnection conn = new SqlConnection(dbConn);
            //use the above connection to execute a particular stored procedure
            //[substitue your validTableInsert stored procedure name below]
            using (SqlCommand cmd = new SqlCommand("[validVolRolesInsert]", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                //build the parameters (input items) that the stored procedures needs
                cmd.Parameters.AddWithValue("@volDescription",
               this._volunteerRole.Text);
                // add more parameters as needed by your stored procedure
                // open the database and actually run the stored procedure, also catch
                //any errors and display them in your _message label, also refreshed grid to show new
                //record
                try
                {
                    conn.Open();
                    int intResponse = Convert.ToInt16(cmd.ExecuteScalar());
                    if (intResponse == 0)
                    {
                        this._message.Text = "Volunteer Role already existed - Not Added";
                    }
                    else
                    {
                        this._message.Text = "New Volunteer Role was Added";
                    } // following line refreshes your grid
                      //for the new record
                    this._volunteerGrid.DataBind();
                    this._pnlAdd.Visible = false;
                    this._volunteerGrid.Visible = true;
                    this._addStart.Visible = true;
                    this._volunteerRole.Text = "";
                }
                //if there are any errors with the store procedure, display
                //them in the message label
                catch (SqlException ex)
                {
                    this._message.Text = "Error inserting into the Volunteer Roles Table " + ex.Message;
                }
            }
        }

        
    }
}