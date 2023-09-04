<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <style>
        .custom-textbox-ib {
            height: 50px !important;
            font-size: 15px !important;
            border: ridge 1px;
        }

            .custom-textbox-ib:focus {
                border-color: orangered;
            }
            .lblText{
                font-size:larger;
            }

            #changePassBtn{
                background-color:navy;
                color:white;                
            }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <div id="content" class="p-4 p-md-5 pt-5">
   <div class="container-fluid">
        <h4>
            <nav aria-label="breadcrumb" ">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a class="text-primary h4" href="Default_user.aspx">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Change Password</li>
                </ol>
            </nav>

            </h4>

       <div class="card mx-auto border rounded-sm border-dark" style="width:23rem;">
           
           <div class="card-body">
               <div class="form-group mb-3">
                     <label class="text-dark font-weight-bolder lblText">Current Password 
                         <asp:RequiredFieldValidator ControlToValidate="currentPass" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                     </label>
                <asp:TextBox ID="currentPass" CssClass="form-control custom-textbox-ib" TextMode="Password" runat="server"></asp:TextBox>
          
           </div>
                  <div class="form-group mb-3">
                       <label class="text-dark font-weight-bolder lblText">New Password
                            <asp:RequiredFieldValidator ControlToValidate="newPass" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    
                       </label>
                <asp:TextBox ID="newPass" CssClass="form-control custom-textbox-ib" runat="server"></asp:TextBox>
           
           </div>

                  <div class="form-group mb-3">
                       <label class="text-dark font-weight-bolder lblText">Confirm Password
                            <asp:RequiredFieldValidator ControlToValidate="newConfirmPass" ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    
                       </label>
                <asp:TextBox ID="newConfirmPass" CssClass="form-control custom-textbox-ib" TextMode="Password" runat="server"></asp:TextBox>
           
           </div>
              
               <div class="form-group">
                   <div class="form-label"><center>
               <asp:Label ID="lblMsg" runat="server" CssClass="text-center text-danger font-weight-bold"  Text=" "></asp:Label>
               </center>
           
                       </div>
                </div>
              
               <asp:Button ID="changePassSubmit" CssClass=" btn-dark p-2 font-weight-bold text-white btn-block changePassBtn" runat="server" Text="Change Password" OnClick="changePassSubmit_Click" />
           </div>
       </div>

       
    </div>  
    
    
    </div>
</asp:Content>

