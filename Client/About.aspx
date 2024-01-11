﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Foodie.Client.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <!-- about section -->

  <section class="about_section layout_padding">
    <div class="container  ">

      <div class="row">
        <div class="col-md-6 ">
          <div class="img-box">
            <img src="../TemplateFiles/images/about-img.png" alt="">
          </div>
        </div>
        <div class="col-md-6">
          <div class="detail-box">
            <div class="heading_container">
              <h2>
                We Are Foodlers
              </h2>
            </div>
            <p>
              Launched in 2018, Our technology platform connects customers, restaurant partners and delivery partners, 
                serving their multiple needs. Customers use our platform to search and discover restaurants, read and write 
                customer generated reviews and view and upload photos, order food delivery, book a table and make payments while 
                dining-out at restaurants. On the other hand, we provide restaurant partners with industry-specific marketing tools 
                which enable them to engage and acquire customers to grow their business while also providing a reliable and efficient 
                last mile delivery service. We also operate a one-stop procurement solution, Hyperpure, which supplies high quality
                ingredients and kitchen products to restaurant partners. We also provide our delivery partners with
                transparent and flexible earning opportunities.
            </p>
            <a href="">
              Read More
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- end about section -->


</asp:Content>
