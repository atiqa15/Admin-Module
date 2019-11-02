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
    public partial class UnblockCustomer : System.Web.UI.Page
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
            objCmd.CommandText = "SELECT * FROM BlockedUser";
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
            string customerName = (((sender as Button).NamingContainer.FindControl("customerName") as Label).Text);
            string customerPass = (((sender as Button).NamingContainer.FindControl("customerPass") as Label).Text);
            string customerRptPass = (((sender as Button).NamingContainer.FindControl("customerRptPass") as Label).Text);
            string customerEmail = (((sender as Button).NamingContainer.FindControl("customerEmail") as Label).Text);
            string constr = ConfigurationManager.ConnectionStrings["PSConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                SqlTransaction sqlTran;
                sqlTran = con.BeginTransaction();
                SqlCommand cmd = con.CreateCommand();
                cmd.Transaction = sqlTran;
                cmd.CommandText = "INSERT into customerAccount(customerAccountUsername,customerAccountPassword,customerAccountRptPassword,customerAccountEmail) values('" + customerName + "','" + customerEmail + "','" + customerPass + "','" + customerRptPass + "')";
                cmd.ExecuteNonQuery();
                cmd.CommandText = "DELETE FROM BlockedUser WHERE blname = @customerName";
                cmd.Parameters.AddWithValue("@customerName", customerName);
                cmd.ExecuteNonQuery();
                sqlTran.Commit();
                con.Close();
                Response.Redirect("~/UnblockCustomer.aspx");
            }
        }
    }
}