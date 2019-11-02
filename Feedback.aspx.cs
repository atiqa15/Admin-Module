using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
namespace AdminModule
{
    public partial class Feedback : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PSConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }
        private void BindData()
        {
            SqlCommand objCmd = new SqlCommand();
            objCmd.Connection = con;
            objCmd.CommandText = "SELECT * FROM adminFeedback";
            objCmd.CommandType = CommandType.Text;
            DataSet objDS = new DataSet();
            SqlDataAdapter objDA = new SqlDataAdapter();
            objDA.SelectCommand = objCmd;
            con.Open();
            objDA.Fill(objDS);
            con.Close();
            rptCategory.DataSource = objDS;
            rptCategory.DataBind();
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            string adminCName = (((sender as Button).NamingContainer.FindControl("adminCustName") as Label).Text);
            string constr = ConfigurationManager.ConnectionStrings["PSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "DELETE from adminFeedback where adminCustomerName= @adminCName";
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@adminCName", adminCName);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Feedback.aspx");
            }
        }
    }
}