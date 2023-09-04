<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
 <div class="box">

 <div class="flip-card mx-auto" id="myFlipCard">
  <div class="flip-card-inner">
    <div class="flip-card-front">
        <h2>Welcome To</h2>
         <h1>PRISTINE GREEN</h1>
        <br />
        <h5>VISITOR MANAGEMENT SYSTEM</h5>
        <img src="resources/images/VISITOR-MANAGEMENT-SYSTEM.png" class="w-50" />
      <button type="button" class="animate btn btn-primary w-75 text-center" onclick="flipCard()">Login</button>
      
    </div>
    <div class="flip-card-back">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

         
      <div class="card mx-auto border-0">
          <div class="card-body">
            <h4 class="card-title text-center text-danger fw-bolder">Login Panel</h4>
            <br />

            <asp:Label ID="lblError" runat="server" Visible="false" CssClass="text-danger fw-bold fs-6 text-center"></asp:Label>

            <div class="form-floating mb-3">
                <asp:TextBox ID="EmailId" CssClass="form-control" TextMode="Email" runat="server"></asp:TextBox>
                <label class="text-primary fs-6">Email address
                <asp:RequiredFieldValidator ID="ReuiredValidateEmail" ControlToValidate="EmailId" ErrorMessage="*" CssClass="text-danger fw-bolder fs-6" runat="server"></asp:RequiredFieldValidator>
            </label>
                    </div>

            <div class="form-floating mb-3">
                <asp:TextBox ID="Password" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                <label class="text-primary fs-6">
                    Password
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatePass" ControlToValidate="Password" ErrorMessage="*" CssClass="text-danger fw-bolder fs-6" runat="server"></asp:RequiredFieldValidator>
                </label>
            </div>





            <div class="form-check form-check-inline ">
                <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">&nbsp;
  <label class="form-check-label" for="inlineCheckbox1">Remeber Me?</label>
            </div>
            <div class="form-check form-check-inline">
                <asp:LinkButton ID="LinkButton1" CssClass="mx-auto text-decoration-none text-primary" runat="server">Forgot Password?</asp:LinkButton>


            </div>

           <div class=" form-control-lg mt-2 ">
                <center>
           <asp:Button ID="LoginBtn" CssClass="loginBtn btn btn-lg btn-primary mx-auto w-50" OnClick="LoginBtn_Click" runat="server" Text="Login"  /></center>

            </div>


        </div>




    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        
      <button type="button" class="btn btn-dark text-white" onclick="flipCardBack()">Cancel</button>
    </div>
  </div>
</div>


</div>

<div class="lines">
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
            </div>

        <script>
function flipCard() {
  var flipCard = document.getElementById("myFlipCard");
  flipCard.classList.toggle("flipped");
}

function flipCardBack() {
  var flipCard = document.getElementById("myFlipCard");
  flipCard.classList.toggle("flipped");
}
</script>
</asp:Content>

