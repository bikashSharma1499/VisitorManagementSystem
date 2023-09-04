using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Default : System.Web.UI.Page
{
    [WebMethod(EnableSession = true)]
    public static bool SaveCapturedImage(string data)
    {
        string fileName = DateTime.Now.ToString("dd-MMM-yyyy_hh-mm-ss");
        byte[] imageBytes = Convert.FromBase64String(data.Split(',')[1]);
        string filePath = HttpContext.Current.Server.MapPath(string.Format("~/Captures/{0}.jpg", fileName));
        HttpContext.Current.Session["CapturedImage"] = "~/Captures/" + fileName.ToString() + ".jpg";
        File.WriteAllBytes(filePath, imageBytes);
        return true;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindBlockList();
           


            txtVisitDate.Text = DateTime.Today.ToString("dd-MM-yyyy");
            visitTime.Text = DateTime.Now.ToString("hh:mm tt");

        }

    }


    private void BindBlockList()
    {
        DropDownListBlock.Items.Clear();
        DropDownListBlock.Items.Insert(0, new ListItem("Choose Block", "0"));
        DropDownListBlock.Enabled = false;
        SqlConnection connnnnn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("select * from tblBlockMaster where Status='Active'", connnnnn);
        connnnnn.Open();
        SqlDataAdapter sda = new SqlDataAdapter(cmddd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        DropDownListBlock.DataSource = dt;
        DropDownListBlock.DataBind();
        DropDownListBlock.Enabled = true;
    }





    protected void DropDownListBlock_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownListBlock.SelectedValue != "0")
        {
            BindFloorNumber();

        }
        else
        {
            DropDownListBlock.SelectedValue = "0";
            DropDownFloor.Enabled = false;
        }
    }


    private void BindFloorNumber()
    {
        DropDownFloor.Items.Clear();
        DropDownFloor.Items.Insert(0, new ListItem("Choose Block", "0"));
        DropDownFloor.Enabled = false;
        SqlConnection connnnnn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("select * from tblFloorMaster where Status='Active' and BUid='"+ DropDownListBlock.SelectedValue + "' ", connnnnn);
        connnnnn.Open();
        SqlDataAdapter sda = new SqlDataAdapter(cmddd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        DropDownFloor.DataSource = dt;
        DropDownFloor.DataBind();
        DropDownFloor.Enabled = true;
    }


    private void BindRoomNumber()
    {
        DropDownListRoom.Items.Clear();
        DropDownListRoom.Items.Insert(0, new ListItem("Choose Block", "0"));
        DropDownListRoom.Enabled = false;
        SqlConnection connnnnn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("select * from tblRoomMaster where Status='Active' and FUid='" + DropDownFloor.SelectedValue + "' ", connnnnn);
        connnnnn.Open();
        SqlDataAdapter sda = new SqlDataAdapter(cmddd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        DropDownListRoom.DataSource = dt;
        DropDownListRoom.DataBind();
        DropDownListRoom.Enabled = true;
    }



 

    protected void DropDownFloor_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownFloor.SelectedValue != "0")
        {
            BindRoomNumber();

        }
        else
        {
            DropDownFloor.SelectedValue = "0";
            DropDownListRoom.Enabled = false;
        }
    }




    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("pristineVMS_insert", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Insert");
        cmd.Parameters.AddWithValue("@FullName", txtFullName.Text);
        cmd.Parameters.AddWithValue("@MobileNo", txtMobile.Text);
        cmd.Parameters.AddWithValue("@Gender", DropDownListGender.SelectedItem);
        cmd.Parameters.AddWithValue("@FullAddress", txtFullAddress.Text);
        cmd.Parameters.AddWithValue("@BlockNo", DropDownListBlock.SelectedValue);
        cmd.Parameters.AddWithValue("@FloorNo", DropDownFloor.SelectedValue);
        cmd.Parameters.AddWithValue("@RoomNo", DropDownListRoom.SelectedValue);
        cmd.Parameters.AddWithValue("@VisitDate", Convert.ToDateTime(DateTime.Now));
        cmd.Parameters.AddWithValue("@VisitTime", Convert.ToDateTime(DateTime.Now));
        cmd.Parameters.AddWithValue("@VisitPurpose", txtVisitingPurpose.Text);
        cmd.Parameters.AddWithValue("@RequestStatus", "Pending");
        cmd.Parameters.AddWithValue("@Status", "Active");
        conn.Open();
        cmd.ExecuteNonQuery();

        conn.Close();
        clearInput();
        lblmessageInsert.Text = "Sucessfully Inserted";
        lblmessageInsert.CssClass = "alert alert-warning";
    }


  

    private void clearInput()
    {
        txtFullName.Text = ""; txtMobile.Text = ""; DropDownListGender.SelectedValue = ""; txtFullAddress.Text = ""; txtFullAddress.Text = "";
        DropDownListBlock.SelectedValue = ""; DropDownFloor.SelectedValue = ""; DropDownListRoom.SelectedValue = ""; txtVisitingPurpose.Text = "";
    }

protected void btnUpload_Click1(object sender, EventArgs e)
    {
      
        if (Session["CapturedImage"] != null)
        {
            string path = HttpContext.Current.Session["CapturedImage"].ToString();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
            SqlCommand cmd = new SqlCommand("pristineVMS_insert", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "Insert");
            cmd.Parameters.AddWithValue("@ProfilePicture", path);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            lblmessage.Text = "Sucessfully Check Out";
            lblmessage.CssClass = "alert alert-warning";

        }
    }
}