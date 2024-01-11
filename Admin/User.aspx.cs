using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Foodie.Admin
{
    public partial class User : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Session["breadCrum"] = "User";

                if (Session["admin"] == null)
                {
                    Response.Redirect("../Client/Login.aspx");
                }
                else
                {
                    getUsers();
                }                
            }
        }


        private void getUsers()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("User_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT4ADMIN");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rUsers.DataSource = dt;
            rUsers.DataBind();
        }

        protected void rUsers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            if (e.CommandName == "delete") //commandname is coming from category page in that we've make<asp:linkbutton>
            {
                con = new SqlConnection(Connection.GetConnectionString());
                cmd = new SqlCommand("User_Crud", con);  //sqlCommand Executes commands such as Transact-SQL INSERT, DELETE, UPDATE, and SET statements.                
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@UserId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.Visible = true;
                    lblMsg.Text = "User deleted Successfully";
                    lblMsg.CssClass = "alert alert-success";
                    getUsers();
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
    }
}