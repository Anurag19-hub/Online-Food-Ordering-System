<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Foodie.Client.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <script>                                     

        //This Script tag is use for lable like after displaying content it should disappear

        /*For disappering alert message*/

        window.onload = function () {

            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID%>").style.display = "none";
            }, seconds * 1000);
        };
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div>
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </div>


                <h2>Send Us Your Query/Feedback/!!</h2>
            </div>

            <div class="row">

                <div class="col-md-6">
                    <div class="form_container">

                        <div>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is required"
                                ControlToValidate="txtName" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Your Name"></asp:TextBox>
                        </div>

                        <div>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is required"
                                ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                            </asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Your Email"
                                TextMode="Email"></asp:TextBox>
                        </div>

                        <div>
                            <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ErrorMessage="Subject is required"
                                ControlToValidate="txtSubject" ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                            </asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Your Subject"></asp:TextBox>
                        </div>

                        <div>
                            <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ErrorMessage="Message is required"
                                ControlToValidate="txtMessage" ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                            </asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control"
                                placeholder="Enter Your Query/Feedback"></asp:TextBox>
                        </div>


                        <div class="btn-box">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                                CssClass="btn btn-warning rounded-pill pl-4 pr-4 text-white" OnClick="btnSubmit_Click" />
                        </div>
                    </div>
                </div>


                <div class="col-md-6">

                    <div class="card" style="width: 30rem; height: 10rem; border-radius: 18px; border-color: black; margin-left: 5rem;">
                        <div class="card-body">
                            <h5 class="card-title">report a safety emergency</h5>
                            <h6 class="card-subtitle mb-2 text-muted">we are committed to the safety of everyone using zomato.</h6>
                            <a href="report.aspx">report here</a>
                        </div>
                    </div>


                    <div class="card" style="width: 30rem; height: 10rem; border-radius: 18px; border-color: black; margin-top: 20px; margin-left: 5rem;">
                        <div class="card-body">
                            <h5 class="card-title">issue with your live order?</h5>
                            <h6 class="card-subtitle mb-2 text-muted">click on the 'support' or 'online ordering help' section in your app to connect to 
                        our customer support team.</h6>
                        </div>
                    </div>

               </div>
                
               


                </div>
            </div>
    </section>

</asp:Content>
