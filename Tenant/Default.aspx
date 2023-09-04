<%@ Page Title="" Language="C#" MasterPageFile="~/Tenant/Tenant.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Tenant_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    
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
                                <h4 class="font-weight-bolder text-danger fa-pull-right">My Visitor</h4>
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
                                <h4 class="fa-pull-right font-weight-bolder text-danger">5</h4>
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



        <div class="row">
                <div class="col-lg-12 form-group">
                    <div class="table-responsive">
                        <asp:GridView ID="gvDetails" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="VUid" AutoGenerateColumns="False" AllowPaging="True"
                            AllowSorting="true" PageSize="100" DataSourceID="dsDetails" CssClass="table table-condensed table-bordered table-striped">
                            <HeaderStyle />
                            <Columns>
                                <asp:TemplateField HeaderText="Sl No." HeaderStyle-Wrap="true">
                                    <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                    <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                    <ItemStyle Font-Size="Small" Font-Bold="true" />
                                </asp:TemplateField>
                         <%--  <asp:TemplateField HeaderText="Generate Pass">
                                    <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>

                                        <asp:ImageButton ID="ImageButton1"  data-toggle="modal" ImageUrl="../resources/images/log-out.png" Width="30"  data-target="#myModal" runat="server" />
                                        </ItemTemplate>
                                </asp:TemplateField>--%>

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
                        <asp:SqlDataSource ID="dsDetails" runat="server" ConnectionString="<%$ConnectionStrings:HMS %>" SelectCommand="select * from tblVisitorMaster where RequestStatus='Granted' and RoomNo=4 and Status='Active' order by VisitTime DESC"></asp:SqlDataSource>
                    
                    </div>
                </div>
            </div> 

           </div>


</asp:Content>

