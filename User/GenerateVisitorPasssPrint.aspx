<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GenerateVisitorPasssPrint.aspx.cs" Inherits="User_GenerateVisitorPasssPrint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Latest compiled and minified CSS -->

    <link href="../resources/css/PassCSS/css/bootstrap.css" rel="stylesheet" />
    <link href="../resources/css/PassCSS/css/main.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">




        <div class="container-fluid">
            <header class="header">
                <div class="container-fluid">
                    <div class="row inner-box">
                        <!--Left Image -->
                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-2 text-center">
                            <img src="../resources/images/pristine-logo.png" class="pull-left" />
                        </div>

                        <!--Title -->
                        <div class="col-lg-10 col-md-10 col-sm-10 col-xs-8">



                            <h1 class="text-center print-title">PRISTINE GREEN
                            </h1>
                            <h4 class="text-center">Bhubneswar, Odisha</h4>
                        </div>




                    </div>


                </div>
            </header>

        </div>
        <!--Main Content -->


        <div class="container-fluid">

            <div class="row">
                

                    <div class="col-xs-4">
                        <asp:Label ID="lblVisitorId" runat="server" ></asp:Label>
                    </div>

                    <div class="col-xs-8">

                    </div>
                    <center>
                <h3>Visitor Pass</h3></center>
               
            </div>
            

            
            <div class="row">

                <div class="col-xs-8">
                    
                   <!--1st row --> 
                    
                    <div class="row">
                        <div class="col-xs-4">
                            <h4 class="pull-right">Name : </h4>
                            <br />
                        </div>
                        <div class="col-xs-4">
                            <h4>
                                <asp:Label ID="lblFullName" runat="server" Text="Label"></asp:Label></h4>

                        </div>
                    </div>


                     <!--2nd Row -->
            <div class="row">
                <div class="col-xs-4">
                    <h4 class="pull-right">Mobile : </h4>
                    <br />
                </div>
                <div class="col-xs-4">
                    <h4>
                        <asp:Label ID="lblMobile" runat="server" Text="Mobile"></asp:Label></h4>

                </div>


                </div>

                    
                     <!--3rd Row -->
            <div class="row">
                <div class="col-xs-4">
                    <h4 class="pull-right">Address : </h4>
                    <br />
                </div>
                <div class="col-xs-4">
                    <h4>
                        <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label></h4>

                </div>


                </div>










            </div>




            <div class="col-xs-4">
                <img class="pull-left" style="width: 50%; border: 1px solid;" src="../resources/images/profile-pic.png" />
            </div>
         
            
        </div>

            <br />
            <div class="col-xs-12">

                <div class="panel panel-default">
                    <div class="panel-heading">
       <center>  <h3>Check In Details</h3></center>
                    </div>

                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-3" >
                                
                                <h3 class=" text-primary text-center">Date</h3>
                              <h4 class="text-center"> <asp:Label ID="lblDate" runat="server" Text="Date"></asp:Label></h4>
                            </div>
                             <div class="col-xs-3">
                                <h3 class="text-center">Check In Time</h3>
                                <asp:Label ID="lblTime" runat="server" ></asp:Label>
                            </div>
                             <div class="col-xs-6">
                                <h3 class="text-center">Destination</h3>
                                 <div class="row">
                                     <div class="col-xs-4">
                                         <h4>Block</h4>
                                         <asp:Label ID="lblBlock" runat="server" Text="Block"></asp:Label>
                                     </div>
                                      <div class="col-xs-4">
                                         <h4>Floor</h4>
                                         <asp:Label ID="lblFloor" runat="server" Text="Floor"></asp:Label>
                                     </div>
                                      <div class="col-xs-4">
                                         <h4>Room</h4>
                                         <asp:Label ID="lblRoom" runat="server" Text="Room"></asp:Label>
                                     </div>
                                 </div>
                            </div>
                        </div>
                    </div>
                </div>
              
            </div>


            <asp:Label ID="lblId" runat="server" Text="Label"></asp:Label>
            </div>
        <!-- Footer -->


    </form>

    <script>
        // Function to print the current page
        function printAndRedirect() {
            window.print();
            // Redirect to the specific page after printing

        }

        // Automatically trigger the function when the page loads
        window.onload = printAndRedirect;
    </script>
</body>
</html>
