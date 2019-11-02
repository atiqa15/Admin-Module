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
    public partial class UserAccount : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "SELECT * from adminAccount where adminAccountID=" + Session["adminAccountID"];
            cmd.CommandType = CommandType.Text;
            SqlDataReader sdr = null;
            con.Open();
            sdr = cmd.ExecuteReader();

            while (sdr.Read())
            {
                UsernameLabel.Text = (sdr["adminAccountUsername"].ToString());
                UserProfileName.Text = (sdr["adminAccountName"].ToString());
                ProfileImage.ImageUrl = (sdr["adminAccountDP"]).ToString();
                AdminProfileEmail.Text = (sdr["adminAccountEmail"].ToString());
            }
            con.Close();
        }
        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            if (ImageUpdate.HasFile)
            {
                string imagePath = "~/images/" + ImageUpdate.FileName;
                ImageUpdate.SaveAs(Server.MapPath(imagePath).ToString());
                SqlCommand cmd = new SqlCommand("UPDATE adminAccount SET adminAccountName = '" + UserProfileName.Text + "', adminAccountDP ='" + imagePath + "', adminAccountEmail = '" + AdminProfileEmail.Text + "'  WHERE adminAccountID = " + Session["adminAccountID"], con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                BindData();
            }
            Response.Redirect("UserAccount.aspx");
        }

    }
}