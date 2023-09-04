<%@ Page Title="" Language="C#" MasterPageFile="~/Tenant/Tenant.master" AutoEventWireup="true" CodeFile="ApproveAccess.aspx.cs" Inherits="Tenant_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
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
                              <asp:TemplateField HeaderText="View">
                                    <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>

                                        <asp:ImageButton ID="ImageButton1" OnClick="ImageButton1_Click" data-toggle="modal" ImageUrl="../resources/images/log-out.png" Width="30"  data-target="#myModal" runat="server" />
                                        </ItemTemplate>
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
                        <asp:SqlDataSource ID="dsDetails" runat="server" ConnectionString="<%$ConnectionStrings:HMS %>" SelectCommand="select * from tblVisitorMaster where RequestStatus='Pending' and RoomNo=4 and Status='Active' order by VisitTime DESC"></asp:SqlDataSource>
                    
                    </div>
                </div>
            </div> 

       </ContentTemplate>
    </asp:UpdatePanel>

       <div class="modal  fade" id="myModal" role="dialog">
        <div class="modal-dialog modal-lg">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">

                    <h4 class="modal-title">Visitor Check Out </h4>
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblUid" runat="server" Visible="false" ></asp:Label>

                            <div class="container">
                                <div class="card">
                                    <div class="card-body">
                                          <!--0th row -->
                                 <div class="row">
                                    <div class="col-lg-6 ">
                                          <div class="row  border-3 bg-gradient">
                                           <div class="col-lg-6">
                                               <h5 class=" text-info">Visitor Id :</h5>
                                           </div>
                                             <div class="col-lg-6">
                                                <asp:Label CssClass="h4 fw-bolder text-danger" ID="lblVisitorId" runat="server" ></asp:Label>
                                           </div>
                                             </div>
                                        </div>                                        
                                    </div>

                                <!--1st Row -->
                                <div class="row">
                                    <div class="col-lg-6">
                                          <div class="row">
                                           <div class="col-lg-6">
                                               <h5  class=" text-info">Name :</h5>
                                           </div>
                                             <div class="col-lg-6">
                                                <asp:Label ID="txtName" CssClass="h4 fw-bolder text-primary" runat="server" Text="Label"></asp:Label>
                                           </div>
                                             </div>
                                        </div>                                        
                                         <div class="col-lg-6" >
                                            
                                               <h5 style="border:solid 1px; border-radius:10px; height:80px; width:100px;" class=" fa-pull-right">Photo </h5>
                                           
                                          
                                         </div>
                                    </div>

                                <!--2nd row -->
                                   <div class="row">
                                    <div class="col-lg-6">
                                          <div class="row">
                                           <div class="col-lg-6">
                                               <h5 class=" text-info" >Mobile :</h5>
                                           </div>
                                             <div class="col-lg-6">
                                                <p><asp:Label ID="txtMobile" runat="server" Text="Label"></asp:Label><p>
                                           </div>
                                             </div>
                                        </div>                                        
                                         <div class="col-lg-6">
                                                 <p><asp:Label ID="lblGender" CssClass="h4 fw-bolder text-primary" runat="server" Text="Label"></asp:Label><p>                                     
                                         </div>
                                    </div>

                                 <!--3rd row -->
                                   <div class="row">
                                    <div class="col-lg-12">
                                          <div class="row">
                                           <div class="col-lg-2">
                                               <h5 class=" text-info">Block :</h5>
                                           </div>
                                               <div class="col-lg-2">
                                                <p><asp:Label ID="lblBlock" CssClass="h4 fw-bolder text-primary" runat="server" Text="Label"></asp:Label><p>
                                           </div>

                                             <div class="col-lg-2">
                                                 <h5 class=" text-info">Floor</h5>
                                           </div>
                                               <div class="col-lg-2">
                                                 <p><asp:Label ID="lblFloor" CssClass="h4 fw-bolder text-primary" runat="server" Text="Label"></asp:Label><p>
                                           </div>
                                                <div class="col-lg-2">
                                                 <h5 class=" text-info">Room No</h5>
                                           </div>
                                               <div class="col-lg-2">
                                                 <p><asp:Label ID="lblRoomNo" CssClass="h4 fw-bolder text-primary" runat="server" Text="Label"></asp:Label><p>
                                           </div>

                                             </div>
                                        </div>                                        
                                         
                                    </div>

                                <!--4th Row -->
                                <div class="row" style="border:solid 2px;">
                                    <div class="col-lg-12" style="padding-left: 0px; padding-right: 0px;">
                                        <h3 class="bg-primary text-white w-100">Check In Details</h3>
                                          <div class="row">
                                           <div class="col-lg-3">
                                               <h5 class=" text-info">Date :</h5>
                                           </div>
                                               <div class="col-lg-3">
                                                <asp:Label ID="lblDate" CssClass=" fw-bolder text-primary" runat="server" Text="Label"></asp:Label>
                                           </div>

                                             <div class="col-lg-3">
                                                 <h5 class=" text-info">In Time</h5>
                                           </div>
                                               <div class="col-lg-3">
                                                <asp:Label ID="lblInTime" CssClass="h6 fw-bolder text-primary" runat="server" Text="Label"></asp:Label>
                                           </div>
                                          

                                             </div>
                                        </div>                                        
                                         
                                    </div>


                                <!--5th Row -->
                                       <div class="row mt-3">
                                    <div class="col-lg-4">
                                      
                                        <asp:Button ID="VisitorCheckIN" OnClick="VisitorCheckIN_Click" CssClass="btn btn-success" Text="Approve Access" runat="server" />
                                        </div>                                        
                                         
                                    </div>

                                    </div>
                                    <asp:Label ID="lblmessage" runat="server"></asp:Label>
                                </div>
                              


                               
                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
                    
                    <asp:Button ID="CloseModal" OnClick="CloseModal_Click" CssClass="btn btn-info" runat="server" Text="Close" />
                   <%-- <button type="button" class="btn btn-info" data-dismiss="modal">
                        Close</button--%>
                </div>
            </div>
        </div>

    </div>



</asp:Content>

