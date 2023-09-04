<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="CheckIn.aspx.cs" Inherits="User_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Latest compiled and minified CSS -->
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        a {
            text-decoration: none;
        }

        #bookingDate:focus {
            border: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a class="text-primary" href="Default_user.aspx">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Check In</li>
        </ol>
    </nav>
    <div class="container-fluid">

        <!-- Button trigger modal -->
        <div class="card">
            <div class="card-header">
                <div class="card-title">
                    <h2 class="card-text font-weight-bolder">Visitor Check In Form</h2>
                </div>
                <div class="card-body p-0">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-9">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="form-floating mb-3">
                                            <asp:TextBox ID="txtFullName" CssClass="form-control custom-textbox-ib" runat="server" placeholder="Username"></asp:TextBox>
                                            <label for="txtFullName">Full Name&nbsp<asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ControlToValidate="txtFullName" ErrorMessage="*"></asp:RequiredFieldValidator></label>

                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-floating mb-3">
                                            <asp:TextBox ID="txtMobile" CssClass="form-control" runat="server" placeholder="Username"></asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderss6" TargetControlID="txtMobile" FilterType="Custom" ValidChars="1234567890" runat="server" />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ValidationGroup="Error" runat="server"
                                                ControlToValidate="txtMobile" ErrorMessage="Invalid Mobile" SetFocusOnError="true" ForeColor="Red"
                                                Display="Dynamic" ValidationExpression="^\d{10}$">
                                            </asp:RegularExpressionValidator>


                                            <label for="txtMobile">Mobile Number&nbsp<asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ControlToValidate="txtMobile" ErrorMessage="*"></asp:RequiredFieldValidator></label>

                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-floating mb-3">
                                            <asp:DropDownList ID="DropDownListGender" CssClass=" form-control" runat="server">
                                                <asp:ListItem Value="0">Select</asp:ListItem>
                                                <asp:ListItem Value="1">Male</asp:ListItem>
                                                <asp:ListItem Value="2">Female</asp:ListItem>
                                            </asp:DropDownList>
                                            <label for="DropDownListGender">
                                                Gender
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" InitialValue="0" ControlToValidate="DropDownListGender" ErrorMessage="*"></asp:RequiredFieldValidator>
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <!--2nd row -->
                                <div class="row">
                                    <div class="col-lg-4">

                                        <div class="form-floating mb-3">
                                            <asp:TextBox ID="txtFullAddress" CssClass="form-control" runat="server" placeholder="Username"></asp:TextBox>
                                            <label for="txtFullAddress">Full Address&nbsp<asp:RequiredFieldValidator ID="RequiredFieldValidator6" CssClass="text-danger" runat="server" ControlToValidate="txtFullAddress" ErrorMessage="*"></asp:RequiredFieldValidator></label>


                                        </div>
                                    </div>


                                    <div class="col-lg-4">
                                        <div class=" form-floating mb-3">
                                            <asp:DropDownList ID="DropDownListBlock" AutoPostBack="true" Width="100%" OnSelectedIndexChanged="DropDownListBlock_SelectedIndexChanged" AppendDataBoundItems="true" DataTextField="Block" DataValueField="BUid" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0"> Choose Block </asp:ListItem>
                                            </asp:DropDownList>
                                            <label for="DropDownListBlock">
                                                Block                                                   
                                        
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  InitialValue="0" runat="server" ErrorMessage="Required" ControlToValidate="DropDownListBlock" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4">
                                        <div class=" form-floating mb-3">
                                            <asp:DropDownList ID="DropDownFloor" OnSelectedIndexChanged="DropDownFloor_SelectedIndexChanged" AutoPostBack="true" Width="100%" AppendDataBoundItems="true" DataTextField="FloorNumber" DataValueField="FUid" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0"> Choose Floor </asp:ListItem>
                                            </asp:DropDownList>
                                            <label for="DropDownFloor">
                                                Floor                                                   
                                        
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="Error" InitialValue="0" runat="server" ErrorMessage="*" ControlToValidate="DropDownFloor" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                        </div>
                                    </div>
                                </div>


                                <!--3rd Row -->

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class=" form-floating mb-3">
                                            <asp:DropDownList ID="DropDownListRoom" AutoPostBack="true" Width="100%" AppendDataBoundItems="true" DataTextField="RoomNo" DataValueField="RUid" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0"> Choose Room </asp:ListItem>
                                            </asp:DropDownList>
                                            <label for="DropDownListRoom">
                                                Room                                                  
                                        
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="Error" InitialValue="0" runat="server" ErrorMessage="*" ControlToValidate="DropDownListRoom" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                        </div>
                                    </div>


                                    <div class="col-lg-4">
                                        <div class="form-floating mb-3">
                                            <asp:TextBox ID="txtVisitDate" CssClass="form-control custom-textbox-ib" runat="server" placeholder="Username"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" CssClass="text-danger" runat="server" ControlToValidate="txtVisitDate" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1_CallDate" Format="dd-MM-yyyy" runat="server" BehaviorID="txtDateOfRegd_CalendarExtender11" TargetControlID="txtVisitDate"></ajaxToolkit:CalendarExtender>
                                            <label for="txtVisitDate">Calling Date &nbsp</label>
                                        </div>
                                    </div>

                                    <!--time -->
                                    <div class="col-lg-4">
                                        <div class="form-floating mb-3">
                                            <asp:TextBox ID="visitTime" CssClass="form-control custom-textbox-ib" runat="server" placeholder="Username"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" CssClass="text-danger" runat="server" ControlToValidate="visitTime" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                            <label for="visitTime">Visiting Time &nbsp</label>
                                        </div>
                                    </div>
                                </div>




                                <!--4th Row-->
                                <div class="row">
                                    <div class="col-lg-8">
                                        <div class="form-floating mb-3">
                                            <div class="form-floating mb-3">
                                                <asp:TextBox ID="txtVisitingPurpose" CssClass="form-control" runat="server" placeholder="Username"></asp:TextBox>
                                                <label for="txtVisitingPurpose">Visiting Purpose&nbsp<asp:RequiredFieldValidator ID="RequiredFieldValidator10" CssClass="text-danger" runat="server" ControlToValidate="txtVisitingPurpose" ErrorMessage="*"></asp:RequiredFieldValidator></label>

                                            </div>
                                        </div>
                                    </div>


                                </div>









                                <div class="row">
                                    <div class="col-lg-8">
                                        <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" Text="Submit Request" OnClick="Button1_Click" />
                                    </div>


                                </div>


                            </div>
                            
        <div class="col-lg-3">


                                <!-- Button trigger modal -->
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    Caputure Photo
                                </button>

                                <!-- Modal -->
                                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Capture Photo</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                              



                                                
                                 <div class="row">
                                    <div class="col-lg-12">

                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-sx-12">
                                                <h6>Live Camera</h6>
                                                <div id="webcam" style="width: 240px; height: 280px;"></div>
                                                <div>
                                                    <input type="button" class="btn btn-primary" id="btnCapture" value="Capture" />
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-10 col-xs-12">
                                                <h6>Captured Picture</h6>
                                                <img id="imgCapture" />
                                          </div>
                <asp:LinkButton ID="btnUpload" OnClick="btnUpload_Click1" CssClass="btn btn-info" runat="server" disabled="disabled">Upload</asp:LinkButton>
                             <asp:Label ID="lblPath" runat="server" Visible="true"></asp:Label>



                                            </div>
                                            <div class="modal-footer">
                                                <asp:Label ID="lblmessage" runat="server"></asp:Label>
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                
                                            </div>
                                       
                                    </div>
                                </div>






                            </div>
                        </div>
                    </div>


                </div>

            </div>
          
        </div>


    </div>

    </div>
                </div>
          <asp:Label ID="lblmessageInsert" runat="server"></asp:Label>
            </div>
        </div>


        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="../resources/js/WebCam.js"></script>

    <script type="text/javascript">
        $(function () {
            Webcam.set({
                width: 320,
                height: 240,
                image_format: 'jpeg',
                jpeg_quality: 90
            });
            Webcam.attach('#webcam');
            $("#btnCapture").click(function () {
                Webcam.snap(function (data_uri) {
                    $("#imgCapture")[0].src = data_uri;
                    $("#btnUpload").removeAttr("disabled");
                });
            });
            $("#btnUpload").click(function () {
                $.ajax({
                    type: "POST",
                    url: "CheckIn.aspx/SaveCapturedImage",
                    data: "{data: '" + $("#imgCapture")[0].src +  "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) { }
                });
            });
        });
    </script>
</asp:Content>

