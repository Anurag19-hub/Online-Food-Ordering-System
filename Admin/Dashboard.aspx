<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Foodie.Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Dashboard Page.</h1>


    <div class="row">
        <!-- card1 start -->
        <div class="col-md-6 col-xl-3 ml-4">
            <div class="card widget-card-1">
                <div class="card-block-small">
                    <i class="icofont icofont-pie-chart bg-c-blue card1-icon"></i>
                    <span class="text-c-blue f-w-600">Categories</span>
                    <h4><%Response.Write(Session["category"]); %>  </h4>
                    <div>
                        <span class="f-left m-t-10 text-muted">
                            <a href="Category.aspx">
                                <i class="text-c-blue f-16 icofont icofont-eye m-r-10"></i>View Details
                            </a>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <!-- card1 end -->


        <!-- card2 start -->
        <div class="col-md-6 col-xl-3 ml-4">
            <div class="card widget-card-1">
                <div class="card-block-small">
                    <i class="icofont icofont-fast-food bg-c-blue card1-icon"></i>
                    <span class="text-c-blue f-w-600">Products </span>
                    <h4><%Response.Write(Session["product"]); %>  </h4>
                    <div>
                        <span class="f-left m-t-10 text-muted">
                            <a href="Category.aspx">
                                <i class="text-c-blue f-16 icofont icofont-eye m-r-10"></i>View Details
                            </a>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <!-- card2 end -->


        <!-- card3 start -->
        <div class="col-md-6 col-xl-3 ml-4">
            <div class="card widget-card-1">
                <div class="card-block-small">
                    <i class="icofont icofont-spoon-and-fork bg-c-blue card1-icon"></i>
                    <span class="text-c-blue f-w-600"> Total Order </span>
                    <h4><%Response.Write(Session["order"]); %>  </h4>
                    <div>
                        <span class="f-left m-t-10 text-muted">
                            <a href="OrderStatus.aspx">
                                <i class="text-c-blue f-16 icofont icofont-eye m-r-10"></i>View Details
                            </a>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <!-- card3 end -->


        <!-- card4 start -->
        <div class="col-md-6 col-xl-3 ml-4">
            <div class="card widget-card-1">
                <div class="card-block-small">
                    <i class="icofont icofont-fast-delivery bg-c-blue card1-icon"></i>
                    <span class="text-c-blue f-w-600"> Delivered Items </span>
                    <h4><%Response.Write(Session["deliveredItem"]); %>  </h4>
                    <div>
                        <span class="f-left m-t-10 text-muted">
                            <a href="OrderStatus.aspx">
                                <i class="text-c-blue f-16 icofont icofont-eye m-r-10"></i>View Details
                            </a>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <!-- card4 end -->


        <!-- card5 start -->
        <div class="col-md-6 col-xl-3 ml-4">
            <div class="card widget-card-1">
                <div class="card-block-small">
                    <i class="icofont icofont-delivery-time bg-c-blue card1-icon"></i>
                    <span class="text-c-blue f-w-600"> Pending Items </span>
                    <h4><%Response.Write(Session["pendingItem"]); %>  </h4>
                    <div>
                        <span class="f-left m-t-10 text-muted">
                            <a href="OrderStatus.aspx">
                                <i class="text-c-blue f-16 icofont icofont-eye m-r-10"></i>View Details
                            </a>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <!-- card5 end -->


        <!-- card6 start -->
        <div class="col-md-6 col-xl-3 ml-4">
            <div class="card widget-card-1">
                <div class="card-block-small">
                    <i class="icofont icofont-users-social bg-c-blue card1-icon"></i>
                    <span class="text-c-blue f-w-600"> Users </span>
                    <h4><%Response.Write(Session["users"]); %>  </h4>
                    <div>
                        <span class="f-left m-t-10 text-muted">
                            <a href="User.aspx">
                                <i class="text-c-blue f-16 icofont icofont-eye m-r-10"></i>View Details
                            </a>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <!-- card6 end -->



        <!-- card7 start -->
        <div class="col-md-6 col-xl-3 ml-4">
            <div class="card widget-card-1">
                <div class="card-block-small">
                    <i class="icofont icofont-question bg-c-blue card1-icon"></i>
                    <span class="text-c-blue f-w-600"> Query/Feedback </span>
                    <h4><%Response.Write(Session["query"]); %>  </h4>
                    <div>
                        <span class="f-left m-t-10 text-muted">
                            <a href="Contacts.aspx">
                                <i class="text-c-blue f-16 icofont icofont-eye m-r-10"></i>View Details
                            </a>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <!-- card7 end -->



        

    </div>
</asp:Content>

