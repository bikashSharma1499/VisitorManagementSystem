using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_GenerateVisitorPasssPrint : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["VUid"] != null)
            {
                DataBindPrint();

            }
        }
      
    }


    protected void DataBindPrint()
    {

        SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("select * from tblVisitorMaster where RequestStatus = 'Granted' and Status = 'Active' and Vuid= '"+ Request.QueryString["VUid"]+"'  ", connn);
        connn.Open();
        SqlDataReader readerr = cmddd.ExecuteReader();
        if (readerr.Read())
        {
            lblVisitorId.Text = "PG2707001";
            lblFullName.Text = readerr["FullName"].ToString();
            lblMobile.Text = readerr["MobileNo"].ToString();
            lblAddress.Text = readerr["FullAddress"].ToString();
            lblDate.Text = Convert.ToDateTime(readerr["VisitDate"]).ToString("dd-MM-yyyy");
            lblTime.Text = Convert.ToDateTime(readerr["VisitTime"]).ToString("hh:mm tt");
            lblBlock.Text = readerr["BlockNo"].ToString();
            lblFloor.Text = readerr["FloorNo"].ToString();
            lblRoom.Text = readerr["RoomNo"].ToString();

        }
        connn.Close();
    }
}




