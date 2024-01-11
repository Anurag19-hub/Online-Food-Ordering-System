using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Globalization;

namespace Foodie.Admin
{
    public partial class Category : System.Web.UI.Page
    {
        /*This four are classes*/
        SqlConnection con;                //SqlConnection is used for SQL connection
        SqlCommand cmd;
        SqlDataAdapter sda;              //SqlCommand and SqlDataAdapter both are using to pass the queries
        DataTable dt;                    //DataTable is use for storing the temporary data.
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //This if block is use to check whether the page is load for the first time or not and it shows the path of the page 
                //like dashboard/Category

                //after checking it will open Category Page
                Session["breadCrum"] = "Category";

                //if admin is not logged in so it will not open any pages of admin it'll redirect to loginpage
                if (Session["admin"] == null)
                {
                    Response.Redirect("../Client/Login.aspx");
                }
                else
                {
                    getCategories();
                }                
            }
            lblMsg.Visible = false;  //this message will go in the Admin.Master page
        }

        protected void btnAddOrUpdate_Click(object sender, EventArgs e)
        {


            string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
            bool isValidToExecute = false;
            int categoryId = Convert.ToInt32(hdnId.Value);  //categoryId will store the hidden field which we have taken in Category.aspx page in category name and we are fetching its value we have written there
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Category_Crud", con);
            cmd.Parameters.AddWithValue("@Action", categoryId == 0 ? "INSERT" : "UPDATE"); //it will check the hdnId value if its 0(which we have set in Category page) then we can insert new value and if it has a more than 0 than we can do upadate
            cmd.Parameters.AddWithValue("@CategoryId", categoryId);
            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@IsActive", cbIsActive.Checked);

            //it will check whether admin has selected any file or not if yes than it will gonna go in if part
            if (fuCategoryImage.HasFile)
            {
                //it will check that the uploaded file has valid extension or not which we have set default in Connection.cs page
                    if (Utils.IsValidExtension(fuCategoryImage.FileName))
                {
                    Guid obj = Guid.NewGuid(); //it will get the unique id(string and number)
                    fileExtension = Path.GetExtension(fuCategoryImage.FileName);
                    imagePath = "Images/Category/" + obj.ToString() + fileExtension;
                    fuCategoryImage.PostedFile.SaveAs(Server.MapPath("~/Images/Category/") + obj.ToString() + fileExtension);
                    cmd.Parameters.AddWithValue("@ImageUrl", imagePath);
                    isValidToExecute= true;
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Please select .jpg, .jpeg or .png image";
                    lblMsg.CssClass = "alert alert-danger";
                    isValidToExecute = false;
                }
            }
            else
            {
                isValidToExecute = true;
            }

            if(isValidToExecute) //if its true than it allows to add this record in database
            {
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    actionName = categoryId == 0 ? "inserted" : "updated";
                    lblMsg.Visible = true;
                    lblMsg.Text = "Category " + actionName + " Successfully";
                    lblMsg.CssClass = "alert alert-success";
                    getCategories();
                    clear();
                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Error " + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";
                }
                finally
                {
                    con.Close();
                }
            }

        }

        private void getCategories()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Category_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rCategory.DataSource = dt;
            rCategory.DataBind();
        }

        private void clear()
        {
            txtName.Text = string.Empty;
            cbIsActive.Checked = false;
            hdnId.Value = "0";
            btnAddOrUpdate.Text = "Add";
            imgCategory.ImageUrl = String.Empty;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }

        protected void rCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            lblMsg.Visible = false;
            con = new SqlConnection(Connection.GetConnectionString());
            if (e.CommandName == "edit")   //commandname is coming from category page in that we've make<asp:linkbutton>
            {

                cmd = new SqlCommand("Category_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "GETBYID");
                cmd.Parameters.AddWithValue("@CategoryId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                txtName.Text = dt.Rows[0]["Name"].ToString();
                cbIsActive.Checked = Convert.ToBoolean(dt.Rows[0]["IsActive"]); //here we've convert cz isactive has in boolean value 
                imgCategory.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["ImageUrl"].ToString()) ?
                    "../Images/No_image.png" : "../" + dt.Rows[0]["ImageUrl"].ToString();
                imgCategory.Height = 200;
                imgCategory.Width = 200;
                hdnId.Value = dt.Rows[0]["CategoryId"].ToString();
                btnAddOrUpdate.Text = "Update";
                LinkButton btn = e.Item.FindControl("lnkEdit") as LinkButton;
                btn.CssClass = "badge badge-warning";
            }
            else if (e.CommandName == "delete") //commandname is coming from category page in that we've make<asp:linkbutton>
            {
                // con = new SqlConnection(Connection.GetConnectionString());
                cmd = new SqlCommand("Category_Crud", con);  //sqlCommand Executes commands such as Transact-SQL INSERT, DELETE, UPDATE, and SET statements.                
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@CategoryId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.Visible = true;
                    lblMsg.Text = "Category deleted Successfully";
                    lblMsg.CssClass = "alert alert-success";
                    getCategories();
                }
                catch (Exception ex)
                {

                    lblMsg.Visible = true;
                    lblMsg.Text = "Error-" + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";
                }
                finally
                {
                    con.Close();
                }
            }

        }

        protected void rCategory_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            //This part is Use to show the product is Active  or InActive
            //like result we get in true then it return active othrwise false.
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lbl = e.Item.FindControl("lblIsActive") as Label;
                if (lbl.Text == "True")
                {
                    lbl.Text = "Active";
                    lbl.CssClass = "badge badge-success";
                }
                else
                {
                    lbl.Text = "In-Active";
                    lbl.CssClass = "badge badge-danger";
                }
            }

        }
    }
}
