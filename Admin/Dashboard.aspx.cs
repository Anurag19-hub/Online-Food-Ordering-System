using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using static Foodie.CommonFn;
using System.Collections;

namespace Foodie.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Session["breadCrum"] = " ";

                if (Session["admin"] == null)
                {
                    Response.Redirect("../Client/Login.aspx");
                }
                else
                {
                    CategoryCount();
                    ProductCount();
                    OrdersCount();
                    DeliveredItemCount();
                    PendingItemCount();
                    UserCount();
                    QueryCount();
                }
            }


            void CategoryCount()
            {
                DataTable dt = fn.Fetch("SELECT COUNT(*) FROM Categories");
                Session["category"] = dt.Rows[0][0];                                              
            }

            void ProductCount()
            {
                DataTable dt = fn.Fetch("SELECT COUNT(*) FROM Products");
                Session["product"] = dt.Rows[0][0];
            }

            void OrdersCount()
            {
                DataTable dt = fn.Fetch("SELECT COUNT(*) FROM Orders");
                Session["order"] = dt.Rows[0][0];
            }

            void DeliveredItemCount()
            {
                DataTable dt = fn.Fetch("SELECT COUNT(*) FROM Orders WHERE Status = 'Delivered' ");
                Session["deliveredItem"] = dt.Rows[0][0];
            }

            void PendingItemCount()
            {
                DataTable dt = fn.Fetch("SELECT COUNT(*) FROM Orders WHERE Status = 'Pending'");
                Session["pendingItem"] = dt.Rows[0][0];
            }

            void UserCount()
            {
                DataTable dt = fn.Fetch("SELECT COUNT(*) FROM Users");
                Session["users"] = dt.Rows[0][0];
            }

            void QueryCount()
            {
                DataTable dt = fn.Fetch("SELECT COUNT(*) FROM Contact");
                Session["query"] = dt.Rows[0][0];
            }


        }


    }
}