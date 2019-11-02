using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace AdminModule
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PSConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
                LoginResults.Text = "Invalid Username or Password!!";
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "Select adminAccountID, adminAccountUsername, adminAccountEmail from adminAccount where adminAccountUsername ='" + username.Text + "' and adminAccountPassword ='" + password.Text + "'";
            cmd.CommandType = CommandType.Text;
            con.Open();
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                Session["adminAccountID"] = dr["adminAccountID"].ToString();
                Session["adminAccountEmail"] = dr["adminAccountEmail"].ToString();
            }
            con.Close();


            Response.Redirect("~/Home.aspx");

        }

    }
}