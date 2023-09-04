using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LoginBtn_Click(object sender, EventArgs e)
    {
        string userId = EmailId.Text;
        string password = Password.Text;

        if (userId.Equals("admin@gmail.com") && password.Equals("admin"))
        {
            // Login successful, perform actions here
            // For example, redirect the user to another page:
            Response.Redirect("http://localhost:63783/User/Default.aspx");
        }
        else if (userId.Equals("user@gmail.com") && password.Equals("user"))
        {
            Response.Redirect("http://localhost:63783/Tenant/Default.aspx");
        }
       else {
            // Login failed, show an error message or perform other actions
            lblError.Text = "Invalid credentials. Please try again.";
        }
    }

}