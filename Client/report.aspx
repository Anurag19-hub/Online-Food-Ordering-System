<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.Master" AutoEventWireup="true" CodeBehind="report.aspx.cs" Inherits="Foodie.Client.report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">





<%--    <div style="background-color: #222831; padding: 8rem; padding-left: 22rem;" class="heading_container">
        <h2 style="color: white;">Report an Accident or Emergency
        </h2>
    </div>




    <section class="book_section layout_padding">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">
                        <form action="">
                            <div>
                                <select class="form-control nice-select wide">
                                    <option value="" disabled selected>How can we help you?</option>
                                    <option value="1">Report an Accident</option>
                                    <option value="">Report an Incident</option>
                                </select>
                            </div>


                            <div>
                                <input type="text" class="form-control" placeholder="Name" />
                            </div>
                            <div>
                                <input type="text" class="form-control" placeholder="Phone Number" />
                            </div>
                            <div>
                                <input type="email" class="form-control" placeholder="Your Email" />
                            </div>
                            <div>
                                <textarea id="TextArea1" cols="62" rows="2" class="form-control" placeholder="Message"></textarea>
                            </div>
                            <div class="form-control" style="padding-bottom: 3rem;">
                                <p>
                                    Please use this form only for accident or abuse related emergency situations. For order or other general queries.
                    <a href="Contact.aspx">contact us here.</a>
                                </p>
                            </div>
                            <div class="btn_box" style="padding-bottom: 2rem;">
                                <button>
                                    Send Message
               
                                </button>
                            </div>
                        </form>
                    </div>
                </div>


                <div class="card" style="width: 30rem; height: 10rem; border-radius: 18px; border-color: black; margin-left: 5rem;">
                    <div class="card-body">
                        <h5 class="card-title">Disclaimer</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Please use this page to report a serious incident or accident only.
                        For order related queries, please use our chat support.
                        </h6>
                    </div>
                </div>
    </section>--%>




    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div>
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </div>


                <h2> Reports </h2>
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
                                placeholder="Enter Your Incident/Accident"></asp:TextBox>
                        </div>


                        <div class="btn-box">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                                CssClass="btn btn-warning rounded-pill pl-4 pr-4 text-white" OnClick="btnSubmit_Click" />
                        </div>
                    </div>
                </div>


                <%--<div class="col-md-6">

                    <div class="card" style="width: 30rem; height: 10rem; border-radius: 18px; border-color: black; margin-left: 5rem;">
                        <div class="card-body">
                            <h5 class="card-title">report a safety emergency</h5>
                            <h6 class="card-subtitle mb-2 text-muted">we are committed to the safety of everyone using zomato.</h6>
                            <a href="report.aspx">report here</a>
                        </div>
                    </div>--%>




</div>
                </div>
            
        </section>



</asp:Content>
