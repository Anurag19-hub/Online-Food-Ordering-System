<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Foodie.Admin.Product" %>

<%@ Import Namespace="Foodie" %>

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

    <script>

        //with ImagePreview we can add image but where it will show so for that we have taken imgCategory to display that image
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgProduct.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

    </script> 

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <div class="pcoded-inner-content pt-0">
        <div class="align-align-self-end">
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
        </div>

        <div class="main-body">
            <div class="page-wrapper">
                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <%--sm means small md-medium size lg-large--%>
                            <div class="card">
                                <div class="card-header">
                                </div>
                                <div class="card-block">
                                    <div class="row">
                                        <div class="col-sm-6 col-md-4 col-lg-4">
                                            <h4 class="sub-title">Product</h4>
                                            <div>
                                                <div class="form-group">
                                                    <lable>Product Name</lable>
                                                    <div>
                                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control"
                                                            placeholder="Enter Product Name"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                            ErrorMessage="Name is required" ForeColor="Red" Display="Dynamic" 
                                                            SetFocusOnError="true" ControlToValidate="txtName">
                                                        </asp:RequiredFieldValidator>
                                                        <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <lable>Product Description</lable>
                                                    <div>
                                                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control"
                                                            placeholder="Enter Product Description" TextMode="MultiLine"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                            ErrorMessage="Description is required" ForeColor="Red" Display="Dynamic" 
                                                            SetFocusOnError="true" ControlToValidate="txtDescription">
                                                        </asp:RequiredFieldValidator>                                                        
                                                    </div>
                                                </div>

                                                <div class="form-group"><%-- PRESS ctrl+alt+4 for rupees symbol--%>
                                                    <lable>Product Price(₹)</lable>
                                                    <div>  
                                                        <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"
                                                            placeholder="Enter Product Price"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                            ErrorMessage="Price is required" ForeColor="Red" Display="Dynamic" 
                                                            SetFocusOnError="true" ControlToValidate="txtPrice"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                                                            runat="server" ErrorMessage="Price must be in numeric number"
                                                            ForeColor="Red" Display="Dynamic" 
                                                            SetFocusOnError="true" ControlToValidate="txtPrice"
                                                            ValidationExpression="^\d{0,8}(\.\d{1,4})?$">
                                                        </asp:RegularExpressionValidator>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <lable>Product Quantity</lable>
                                                    <div>  
                                                        <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control"
                                                            placeholder="Enter Product Quantity"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                            ErrorMessage="Quantity is required" ForeColor="Red" Display="Dynamic" 
                                                            SetFocusOnError="true" ControlToValidate="txtQuantity"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                                                            runat="server" ErrorMessage="Quantity should not be negative"
                                                            ForeColor="Red" Display="Dynamic" 
                                                            SetFocusOnError="true" ControlToValidate="txtQuantity"
                                                            ValidationExpression="^([1-9]\d*|0)$">
                                                        </asp:RegularExpressionValidator>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Product Image</label>
                                                    <div>
                                                        <asp:FileUpload ID="fuProductImage" runat="server" CssClass="form-control"
                                                            onchange="ImagePreview(this);" />
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <lable>Product Category</lable>
                                                    <div>                                                        
                                                        <asp:DropDownList ID="ddlCategoies" runat="server" 
                                                            CssClass="form-control" DataSourceID="SqlDataSource1" 
                                                            DataTextField="Name" DataValueField="CategoryId" AppendDataBoundItems="true"> 
                                                    <%--AppendDataBoundItems is use to show the below message--%>
                                                            <asp:ListItem Value="0">Select Category</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                            ErrorMessage="Category is required" ForeColor="Red" Display="Dynamic" 
                                                            SetFocusOnError="true" ControlToValidate="ddlCategoies" InitialValue="0">
                                                        </asp:RequiredFieldValidator>  
<%--For creating SqlDataSource we have gone to design part and click on configure data source and have connected
    with this we can show the category name and ID which will show in the category dropdownlist--%>                                                        
                                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:cs %>" 
                                                            SelectCommand="SELECT [CategoryId], [Name] FROM [Categories]">
                                                        </asp:SqlDataSource>
                                                    </div>
                                                </div>

                                                <div class="form-check pl-4">
                                                    <asp:CheckBox ID="cbIsActive" runat="server" Text="&nbsp; IsActive"
                                                        CssClass="form-check-input" />
                                                </div>
                                                <div class="pb-5">
                                                    <asp:Button ID="btnAddOrUpdate" runat="server" Text="Add" CssClass="btn btn-primary"
                                                        OnClick="btnAddOrUpdate_Click"/>
                                                    &nbsp;
                                                    <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-primary"
                                                        CausesValidation="false" OnClick="btnClear_Click"/>
                                                </div>
                                                <div>
                                                    <asp:Image ID="imgProduct" runat="server" CssClass="img-thumbnail" />
                                                </div>
                                            </div>
                                        </div>
                                    <%--Creating a repeater control which is in toolbox->Data->Repeater--%>
                                        <div class="col-sm-6 col-md-8 col-lg-8 mobile-inputs">
                                            <h4 class="sub-title">Product
                                                Lists</h4>
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">

                                                    <%--Repeater --%>
        <%--in repeater we need to display that heading part like how many heading part we need to display--%>

                                                    <asp:Repeater ID="rProduct" runat="server" OnItemCommand="rProduct_ItemCommand"
                                                        OnItemDataBound="rProduct_ItemDataBound">                  
                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover nowrap">
                                                                <thead>
                                                                <tr>                 
                                                                    <%--header part --%>
                                                                    <th class="table-plus">Name</th>
                                                                    <th>Image</th>
                                                                    <th>Price(₹)</th>
                                                                    <th>Qty</th>
                                                                    <th>Category</th>
                                                                    <th>IsActive</th>
                                                                    <th>Description</th>
                                                                    <th>CreatedDate</th>
                                                                    <th class="datatable-nosort">Action</th>
                                                                </tr>
                                                            </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                         <%--It shows the actual data what use has written in the fields--%>
                                                                <td class="table-plus"> <%# Eval("Name") %> </td> 
                                                                <%--<td> <%# Eval("ImageUrl")%>--%>
                                                                <%--it gives image path--%>

                                                                <td>                                                                    
                                                                    <img alt="" width="40" src="<%# Utils.GetImageUrl( Eval("ImageUrl")) %>" />                                                                    
                                                                </td>

                                                                <td> <%# Eval("Price") %> </td>

                                                                <td> 
                                                                    <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>                                                                    
                                                                </td>

                                                                <td> <%# Eval("CategoryName") %> </td>                                                                

                                                                <td> 
                                                                    <asp:Label ID="lblIsActive" runat="server" Text='<%# Eval("IsActive") %>'></asp:Label>                                                                    
                                                                </td>
                                                             
                                                                <td> <%# Eval("Description") %> </td>   

                                                                <td> <%# Eval("CreatedDate") %> </td>

                                                                <td> 
                                                                    <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" 
                                                                        CssClass="badge badge-primary" CausesValidation="false"
                                                                        CommandArgument='<%# Eval("ProductId") %>' CommandName="edit">
                                                                        <i class="ti-pencil"></i>
                                                                    </asp:LinkButton>


                                                                    <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CommandName="delete"
                                                                        CssClass="badge bg-danger" CommandArgument='<%# Eval("ProductId") %>'
                                                                        OnClientClick="return confirm('Do you want to delete this productId?');"
                                                                        CausesValidation="false">
                                                                            <i class="ti-trash"></i>
                                                                    </asp:LinkButton>
                                                                </td>  
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </tbody>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>

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




</asp:Content>
