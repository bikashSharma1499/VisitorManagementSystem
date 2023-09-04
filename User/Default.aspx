<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="User_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        .labelText {
            font-size: 5rem;
            font-weight: bolder;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a class="text-primary" href="#">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
        </ol>
    </nav>


    <div class="container-fluid bg-white">
        <h4>Statistics</h4>
        <asp:Label ID="todayDate" CssClass="fs-6 fw-bolder text-primary" runat="server"></asp:Label>
        <div class="row">

            <div class="col-lg-4 col-md-5 col-sm-12 col-xs-12 p-2">

                <div class="card card-custom">
                    <div class="card-body  p-3">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                <img src="../resources/images/people2.png" class="text-white" width="60" />
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                <asp:Label ID="lblTotalVisitor" CssClass=" h1 font-weight-bolder text-danger fa-pull-right" runat="server"></asp:Label>
                
                            </div>
                        </div> 
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <h4 class="font-weight-bolder text-danger fa-pull-right">Total Visitor</h4>
                            </div>

                        </div>
                    </div>
                </div>
            </div>



            <!--2nd Display -->
            <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12 p-2">

                <div class="card card-custom">
                    <div class="card-body p-3">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                <img src="../resources/images/checkout.png" width="60" />
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <asp:Label ID="lblCurrentlyCheckedIn" CssClass="h1 font-weight-bolder text-danger fa-pull-right" runat="server" ></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <h4 class="fa-pull-right text-danger font-weight-bolder">Currently Checked In</h4>
                            </div>

                        </div>
                    </div>
                </div>

            </div>


            <!--3rd display -->
            <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12 p-2">

                <div class="card card-custom">
                    <div class="card-body p-3">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                <img src="../resources/images/delivery-removebg-preview-removebg-preview-removebg-preview.png" width="100"  />
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                <h4 class="fa-pull-right font-weight-bolder text-danger">14</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <h4 class="fa-pull-right text-danger font-weight-bolder">Delivery</h4>
                            </div>

                        </div>
                    </div>
                </div>

            </div>





        </div>

           </div>

        <!--Visitors's Log -->

        <div class="container-fluid">
        <div class="row shadow-lg" >
            <div class="col-lg-2 col-md-4 col-sm-12 col-xs-12">
                <h4 class="pt-3">Visitor Log</h4>
            </div>
            <div class="col-lg-7 col-md-6 col-sm-6 col-xs-6">
              <div class="row">
                  <div class="col-lg-3 col-md-4 col-sm-4 col-xs-4">
                  
                    <div class="form-inline pb-1">

                        <asp:TextBox ID="bookingDate" OnTextChanged="bookingDate_TextChanged" AutoPostBack="true" CssClass="border-0 mt-3 pt-2 w-auto" runat="server" placeholder="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" CssClass="text-danger" runat="server" ControlToValidate="bookingDate" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" Format="dd-MM-yyyy" runat="server" BehaviorID="tbookingDate_CalendarExtender11" TargetControlID="bookingDate"></ajaxToolkit:CalendarExtender>
                     </div>
                     
                </div>
                  <div class="col-lg-9 col-md-8 col-sm-8 col-xs-8">
                <div class="form-floating mt-1">
                    <asp:TextBox ID="TextBox1" CssClass="form-control border-bottom rounded-5" runat="server" placeholder="Search.."></asp:TextBox>
                    <label>Search....</label>
                </div>
              </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-2 col-sm-6 col-xs-6">
                <button type="button" style=" padding-top: 13px; padding-bottom: 14px;" class="btn btn-block btn-lg mt-1 btn-success rounded-5" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                    Add Visitor
                </button>

            </div>
        </div>




        <!-- Modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Add Visitors</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 p-3">
                                    <div class="card bg-gradient">
                                        <div class="card-body ">
                                           <a href="CheckIn.aspx" class="btn btn-lg btn-success w-100 h-100">Visitor</a>
                                        </div>
                                    </div>
                                </div>
                                </div>
                            <div class="row">
                                 <div class="col-lg-12 p-3">
                                     <div class="card  bg-gradient">
                                        <div class="card-body">
                                           <a href="CheckIn.aspx" class="btn btn-lg btn-success w-100 h-100">Contractor</a>
                                        </div>
                                    </div>
                                </div>
                                </div>
                            <div class="row">
                                 <div class="col-lg-12 p-3">
                                      <div class="card  bg-gradient">
                                        <div class="card-body">
                                           <a href="CheckIn.aspx" class="btn btn-lg btn-success w-100 h-100">Staff</a>
                                        </div>
                                    </div>
                                </div>
                                </div>
                            </div>
                        </div>

                                        <div class="modal-footer mt-0">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                     </div>
                </div>
            </div>
            </div>

            <div class="container-fluid" style="padding-left:0;padding-right:0;">

                <div class="row" style="padding-left:0;padding-right:0;">
                    <div class="col-lg-12"  style="padding-left:0;padding-right:0;">
                        <h3 class=" bg-dark text-white" > Generate Pass for Approved Visitors</h3>
                    </div>
                </div>


             <div class="row" style="padding-left:0;padding-right:0;">
                <div class="col-lg-12 form-group" style="padding-left:0;padding-right:0;">
                    <div class="table-responsive">
                        <asp:GridView ID="gvDetails" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="VUid" AutoGenerateColumns="False" AllowPaging="True"
                            AllowSorting="true" PageSize="100" DataSourceID="dsDetails" CssClass="table table-bordered ">
                                <HeaderStyle />
                            <Columns>
                                <asp:TemplateField HeaderText="Sl No." HeaderStyle-Wrap="true">
                                    <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                    <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                    <ItemStyle Font-Size="Small" Font-Bold="true" />
                                </asp:TemplateField>
                             <asp:TemplateField HeaderText="Generate Pass">
                                    <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>

                                        <asp:ImageButton ID="GeneratePass" OnClick="GeneratePass_Click"  ImageUrl="../resources/images/log-out.png" Width="30"  data-target="#myModal" runat="server" />
                                       - </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField DataField="ProfilePicture" HeaderText="Photo" SortExpression="Name" NullDisplayText="N/A" ReadOnly="True">
                                    <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                    <ItemStyle Font-Size="Small" Wrap="false" Font-Bold="false" />
                                </asp:BoundField>

                                <asp:BoundField DataField="FullName" HeaderText="Full Name" SortExpression="PatientName" NullDisplayText="N/A" ReadOnly="True">
                                    <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                    <ItemStyle Font-Size="Small" Wrap="false" Font-Bold="false" />
                                </asp:BoundField>
                                <asp:BoundField DataField="MobileNo" HeaderText="Mobile Number" SortExpression="Mobile" NullDisplayText="N/A" ReadOnly="True">
                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                    <ItemStyle Font-Size="Small" Wrap="false" Font-Bold="false" />
                                </asp:BoundField>
                                <asp:BoundField DataField="FullAddress" HeaderText="Address" SortExpression="Address" NullDisplayText="N/A" ReadOnly="True">
                                    <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                    <ItemStyle Font-Size="Small" Wrap="true" Font-Bold="false" />
                                </asp:BoundField>
                                <asp:BoundField DataField="BlockNo" HeaderText="Block No" SortExpression="DoctorName" NullDisplayText="N/A" ReadOnly="True">
                                    <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                    <ItemStyle Font-Size="Small" Wrap="false" Font-Bold="false" />
                                </asp:BoundField>

                                <asp:BoundField DataField="FloorNo" HeaderText="Floor No" SortExpression="DateOfCall" NullDisplayText="N/A" ReadOnly="True">
                                    <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                    <ItemStyle Font-Size="Small" Wrap="false" Font-Bold="false" />
                                </asp:BoundField>

                                <asp:BoundField DataField="RoomNo" HeaderText="Room No" SortExpression="TimeOfCall" NullDisplayText="N/A" ReadOnly="True">
                                    <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                    <ItemStyle Font-Size="Small" Wrap="false" Font-Bold="false" />
                                </asp:BoundField>
                                <asp:BoundField DataField="VisitDate" HeaderText="Visitind Date" DataFormatString="{0:dd-MM-yyyy}" SortExpression="DateOfCall" NullDisplayText="N/A" ReadOnly="True">
                                    <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                    <ItemStyle Font-Size="Small" Wrap="false" Font-Bold="false" />
                                </asp:BoundField>
                                <asp:BoundField DataField="VisitTime" HeaderText="Checked in Time" DataFormatString="{0:hh:mm tt}" SortExpression="TimeOfCall" NullDisplayText="N/A" ReadOnly="True">
                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                    <ItemStyle Font-Size="Small" Wrap="false" Font-Bold="false" />
                                </asp:BoundField>

                                <asp:BoundField DataField="VisitPurpose" HeaderText="Visiting No" SortExpression="Name" NullDisplayText="N/A" ReadOnly="True">
                                    <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                    <ItemStyle Font-Size="Small" Wrap="true" Font-Bold="false" />
                                </asp:BoundField>



                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="dsDetails" runat="server" ConnectionString="<%$ConnectionStrings:HMS %>" SelectCommand="select * from tblVisitorMaster where RequestStatus='Granted' and Status='Active' order by VisitTime DESC"></asp:SqlDataSource>
                        <asp:Label ID="lblUid" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
            </div> 
 
        </div>





</asp:Content>

