using Foodie.Admin;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Foodie
{
    public class CommonFn
    {
        public class Commonfnx
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ConnectionString);            
            public void Query(string query) 
            { 
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }

            public DataTable Fetch(string query)
            {
                if (con.State == ConnectionState.Closed)
                {

                   /* This block of code checks if the connection(con) to the database is closed.
                   
                      If the connection is closed, it is opened using the Open() method.
                      This ensures that there is an open connection before executing the query. 
                   */
                    con.Open();
                }
                //SqlCommand and SqlDataAdapter both are using to pass the queries

                // the SQL query(provided as the query parameter) and the connection(con) to the database.
                SqlCommand cmd = new SqlCommand(query, con);

                //The SqlDataAdapter object is used to fill a DataTable or a DataSet with data from the database.
                SqlDataAdapter sda = new SqlDataAdapter(cmd);

                //DataTable is use for storing the temporary data.
                DataTable dt = new DataTable();

                //This line fills the DataTable(dt) with data retrieved from the database using the SqlDataAdapter (sda).
                //The Fill method populates the DataTable with the results of the SQL query executed by the SqlCommand.
                sda.Fill(dt);
                return dt;
            }
        }
    }
}