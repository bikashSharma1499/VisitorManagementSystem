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
        bookingDate.Text = DateTime.Today.ToString("dd-MM-yyyy");
        TotalVisitor();
        CurrentlyCheckedIn();

        todayDate.Text= DateTime.Today.ToString("dd-MM-yyyy");

    }

    protected void TotalVisitor()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select  COUNT(*) from tblVisitorMaster where Status='Active' ", conn);
        conn.Open();

        // ExecuteScalar is used to get a single value result from the query
        int total = (int)cmd.ExecuteScalar();
         lblTotalVisitor.Text = total.ToString();

        conn.Close(); // Don't forget to close the connection after using it
    }

    protected void CurrentlyCheckedIn()
    {
        string currentDate = DateTime.Now.ToString("yyyy-MM-dd");
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM tblVisitorMaster WHERE RequestStatus = 'Granted' AND Status = 'Active' AND VisitDate = @VisitDate", conn);
        cmd.Parameters.AddWithValue("@VisitDate", currentDate);

        conn.Open();

        // ExecuteScalar is used to get a single value result from the query
        int total = (int)cmd.ExecuteScalar();
        lblCurrentlyCheckedIn.Text = total.ToString();

        conn.Close(); // Don't forget to close the connection after using it
    }

    //protected void FetchTotalDrUCJena()
    //{
    //    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
    //    SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM tblOPBookingMaster where DoctorUid=1", conn);
    //    conn.Open();

    //    // ExecuteScalar is used to get a single value result from the query
    //    int total = (int)cmd.ExecuteScalar();
    //    lblTotalDrUcJena.Text = total.ToString();

    //    conn.Close(); // Don't forget to close the connection after using it
    //}
    //protected void FetchTotalOther()
    //{
    //    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
    //    SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM tblOPBookingMaster where DoctorUid > 1", conn);
    //    conn.Open();

    //    // ExecuteScalar is used to get a single value result from the query
    //    int total = (int)cmd.ExecuteScalar();
    //    //lblOtherDoctor.Text = total.ToString();

    //    conn.Close(); // Don't forget to close the connection after using it
    //}


    protected void bookingDate_TextChanged(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select * from tblVisitorMaster where Status='Active' and BookingDate = '"+Convert.ToDateTime(bookingDate.Text).ToString("yyyy-MM-dd")+"' ", conn);
        conn.Open();
        conn.Close();
        gvDetails.DataBind();
    }

   




    protected void GeneratePass_Click(object sender, ImageClickEventArgs e)
    {
        string num;
        ImageButton ImageButton = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButton.NamingContainer;
        num = gvDetails.DataKeys[GvRow.RowIndex].Value.ToString();

        ScriptManager.RegisterStartupScript(this, typeof(string), "OPEN_WINDOW", "window.open('" + string.Format("GenerateVisitorPasssPrint.aspx?VUid={0}", num) + "', '_blank' )", true);
    }


}

