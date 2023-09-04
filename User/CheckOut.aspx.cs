using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class User_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

        }
    }


    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButton = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButton.NamingContainer;
        lblUid.Text = gvDetails.DataKeys[GvRow.RowIndex].Value.ToString();
        BindModalDetails();
    }

    protected void BindModalDetails()
    {
        SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("select * from tblVisitorMaster where VUid =' " + lblUid.Text + " '", connn);
        connn.Open();
        SqlDataReader readerr = cmddd.ExecuteReader();
        if (readerr.Read())
        {
            lblVisitorId.Text = "PG2707001";
            txtName.Text = readerr["FullName"].ToString();
            txtMobile.Text = readerr["MobileNo"].ToString();
            lblGender.Text = readerr["Gender"].ToString();
            lblBlock.Text = readerr["BlockNo"].ToString();
            lblFloor.Text = readerr["FloorNo"].ToString();
            lblRoomNo.Text = readerr["RoomNo"].ToString();
            lblDate.Text = Convert.ToDateTime(readerr["VisitDate"]).ToString("dd-MM-yyyy");
            lblInTime.Text = Convert.ToDateTime(readerr["VisitTime"]).ToString("hh:mm tt");
            lblOutTime.Text = DateTime.Now.ToString("hh:mm tt");
        }
        connn.Close();
       
    }



    protected void VisitorCheckOut_Click(object sender, EventArgs e)
    {
       
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("update tblVisitorMaster set Status ='Inactive' where VUid =' " + lblUid.Text + " '", conn);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        lblmessage.Text = "Sucessfully Check Out";
        lblmessage.CssClass = "alert alert-warning";
       
       

    }

    protected void CloseModal_Click(object sender, EventArgs e)
    {
        Response.Redirect("CheckOut.aspx");
    }
}