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
    public partial class Project : System.Web.UI.MasterPage
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
            cmd.CommandText = "SELECT * from AdminAccount where adminAccountID=" + Session["adminAccountID"];
            cmd.CommandType = CommandType.Text;
            SqlDataReader sdr = null;
            con.Open();
            sdr = cmd.ExecuteReader();

            while (sdr.Read())
            {
                AdminProfilename.Text = sdr["adminAccountName"].ToString();
                AdminPname.Text = sdr["adminAccountName"].ToString();
                AdminDP.ImageUrl = sdr["adminAccountDP"].ToString();
                AdminImage.ImageUrl = sdr["adminAccountDP"].ToString();
                AdminPEmail.Text = sdr["adminAccountEmail"].ToString();
            }
            con.Close();
        }

    }
}