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
    public partial class restaurant : System.Web.UI.Page
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
            objCmd.CommandText = "SELECT * FROM restaurantAdminAccount";
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
            string restaurantAdminUName = (((sender as Button).NamingContainer.FindControl("restaurantAdminUName") as Label).Text);
            string restaurantAdminName = (((sender as Button).NamingContainer.FindControl("restaurantAdminName") as Label).Text);
            string restaurantAdminDP = (((sender as Button).NamingContainer.FindControl("restaurantAdminDP") as Image).ToString());
            string restaurantAdminPass = (((sender as Button).NamingContainer.FindControl("restaurantAdminPass") as Label).Text);
            string restaurantAdminRptPass = (((sender as Button).NamingContainer.FindControl("restaurantAdminRptPass") as Label).Text);
            string restaurantAdminEmail = (((sender as Button).NamingContainer.FindControl("restaurantAdminEmail") as Label).Text);
            string constr = ConfigurationManager.ConnectionStrings["PSConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                SqlTransaction sqlTran;
                sqlTran = con.BeginTransaction();
                SqlCommand cmd = con.CreateCommand();
                cmd.Transaction = sqlTran;
                cmd.CommandText = "INSERT into BlockedRestaurants(bluname,blname,blDP,blPass,blRptPass,blEmail) values('" + restaurantAdminUName + "','" + restaurantAdminName + "','" + restaurantAdminDP + "','" + restaurantAdminPass + "','" + restaurantAdminRptPass + "','" + restaurantAdminEmail + "')";
                cmd.ExecuteNonQuery();
                cmd.CommandText = "DELETE FROM restaurantAdminAccount WHERE restaurantAdminUsername = @customerName";
                cmd.Parameters.AddWithValue("@customerName", restaurantAdminUName);
                cmd.ExecuteNonQuery();
                sqlTran.Commit();
                con.Close();
                Response.Redirect("restaurant.aspx");
            }
        }
    }
}