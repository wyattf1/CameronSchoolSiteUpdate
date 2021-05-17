using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

namespace FreemanMIS413
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void _Cancel_Click(object sender, EventArgs e)
        {
            this._email.Text = "";
            this._message.Text = "";
        }

        protected void _Submit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                Boolean isOK = false;

                //build a link the the name/pwd/user for your particular database

                //note below the [mis413...] should be the name of your connection string, open your
                //webconfig file and find the connection string name
                string dbConn =
System.Configuration.ConfigurationManager.ConnectionStrings["S21BackupConnectionString"].
ConnectionString;
                //build a connection to the database
                SqlConnection conn = new SqlConnection(dbConn);
                //use the above connection to execute a particular stored procedure
                //substitute your specific stored procedure name here]
                using (SqlCommand cmd = new SqlCommand("[wtfLogin]", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    //build the parameters (input items) that the stored procedures needs
                    cmd.Parameters.AddWithValue("@Email", this._email.Text);
                    cmd.Parameters.AddWithValue("@Pwd", this._password.Text);
                    // open the database and actually run the stored procedure, also catch any
                    //errors and display them in your _message label
                    try
                    {
                        conn.Open();
                        SqlDataReader dtrReader = cmd.ExecuteReader();
                        // see if any data was returned from the stored procedure, if no data
                        //than not a valid user or password
                        if (dtrReader.HasRows)
                        {
                            // read the first record
                            dtrReader.Read();

                            //specialized code goes here, what should you do if the login is valid?
                            //for example do you want to set a cookie
                            // if you would like to check if all of this works you might want to test to here
                            //by inserting the following code and the deleting once you confirm it works

                            //specialized code here, what should you do if the login is valid?, change as
                            // needed to be your field names in your database

                            HttpCookie aCookie = new HttpCookie("userInfo");
                            aCookie.Values["FirstName"] = (string)dtrReader["FirstName"];
                            aCookie.Values["LastName"] = (string)dtrReader["LastName"];
                            aCookie.Values["Email"] = (string)dtrReader["Email"];
                            aCookie.Values["personId"] = Convert.ToString
                           (dtrReader["personId"]);
                            aCookie.Values["RoleId"] = Convert.ToString(dtrReader["RoleId"]);
                            aCookie.Expires = DateTime.Now.AddMinutes(20);
                            //this actually writes the cookie on the users machine on the postback to the client
                            Response.Cookies.Add(aCookie);
                            isOK = true;

                            //set authentication to true and save the user’s name
                            string userName = (string)(dtrReader["FirstName"]) + " " + (string)(dtrReader["LastName"]);
                            FormsAuthentication.RedirectFromLoginPage(userName, true);

                            //demonstrate the use of a person class and session variables
                            // remember the dtrReader field names must be YOUR field names in your database
                            PersonInfo person = new PersonInfo();
                            person.PersonID = Convert.ToInt32(dtrReader["personID"]);
                            person.FirstName = (string)dtrReader["firstname"];
                            person.LastName = (string)dtrReader["lastname"];
                            person.Email = (string)dtrReader["email"];
                            person.RoleID = Convert.ToInt32(dtrReader["roleID"]);
                            // move the person class to a session variable to use on future pages
                            Session["person"] = person;

                           _message.Text = "Email/Password Good.";
                        }
                        else
                        {
                            //no data was returned from the stored procedure, update a message
                            //label
                            _message.Text = "Invalid email or password.";
                        }
                    }
                    //if there are any errors with the store procedure, display them in
                    //the FailureText Literal
                    catch (SqlException ex)
                    {
                        _message.Text = "Error on sign in procedure " + ex.Message;

                        if (isOK)
                        {
                            Response.Redirect("~/user/menu");
                        }



                    }
                }



            }

        }
    }
}