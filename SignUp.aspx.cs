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
    public partial class SignUp : System.Web.UI.Page
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
            SqlCommand cmd1 = new SqlCommand();
            cmd1.Connection = con;
            cmd1.CommandText = "SELECT * from adminAccount where adminAccountEmail = @adminAccountEmail";
            cmd1.CommandType = CommandType.Text;
            cmd1.Parameters.AddWithValue("@adminAccountEmail", UserEmail.Text);
            DataSet objDS = new DataSet();
            SqlDataAdapter objDA = new SqlDataAdapter();
            objDA.SelectCommand = cmd1;
            objDA.Fill(objDS);
            if (objDS.Tables[0].Rows.Count > 0)
            {
                LoginResults.Text = "User Already Exists!! ";
            }
            else if (objDS.Tables[0].Rows.Count <= 0)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "INSERT into adminAccount(adminAccountUsername, adminAccountPassword, adminAccountRptPassword, adminAccountEmail)values('" + Username.Text + "','" + Password.Text + "','" + RptPassword.Text + "','" + UserEmail.Text + "')";
                cmd.CommandType = CommandType.Text;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("~/Login.aspx");
            }
        }
    }
}