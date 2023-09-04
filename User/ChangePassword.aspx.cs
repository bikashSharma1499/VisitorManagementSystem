using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class User_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        newPass.Text = "";
    }

    protected bool CheckPassword()
    {
        string currentPass1 = currentPass.Text;
        string currentPassDB = "";

        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("SELECT Password FROM tblUserMaster WHERE UserType = 'Staff' AND Status = 'Active'", conn);
            conn.Open();

            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.HasRows)
                {
                    reader.Read();
                    currentPassDB = reader["Password"].ToString();

                    // Compare hashed passwords here
                    // For example: if (Hash(currentPass1) == currentPassDB)
                    if (currentPass1 == currentPassDB)
                    {
                        return true;
                    }
                }
                else
                {
                    // Handle the case when no rows are found (optional)
                    lblMsg.Text = "Error: No matching records found.";
                }
            }
        }
        return false;
    }



    protected void changePassSubmit_Click(object sender, EventArgs e)
    {
        
        
        bool proceed = CheckPassword();

         if (proceed)
        {
            if (newPass.Text.Equals(newConfirmPass.Text))
            {
                // Use 'using' statement for proper resource disposal and avoid connection leaks
                using (SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString))
                {
                    SqlCommand cmd2 = new SqlCommand("UPDATE tblUserMaster SET Password = @NewPassword WHERE UserType = 'Staff' AND UserId='staff@gmail.com' AND Status = 'Active'", conn1);
                    cmd2.Parameters.AddWithValue("@NewPassword", newPass.Text);
                    conn1.Open();
                    cmd2.ExecuteNonQuery();
                    lblMsg.Text = "Password Updated Successfully";
                }
            }
            else
            {
                lblMsg.Text = "Confirm Password does not Match";
            }
        }
        else
        {
            lblMsg.Text = "Wrong current Password";
        }
    }

}