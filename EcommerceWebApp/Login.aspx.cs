using System;
using System.Configuration;
using System.Data.SqlClient;

namespace EcommerceWebApp
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
            ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            con.Open();

            SqlCommand cmd =
                new SqlCommand(
                    "SELECT * FROM Users WHERE Email=@email AND Password=@password",
                    con);

            cmd.Parameters.AddWithValue(
                "@email", txtEmail.Text);

            cmd.Parameters.AddWithValue(
                "@password", txtPassword.Text);

            SqlDataReader dr =
                cmd.ExecuteReader();

            if (dr.Read())
            {
                Session["user"] =
                    dr["FullName"].ToString();

                Session["email"] =
                    dr["Email"].ToString();

                Session["role"] =
                    dr["Role"].ToString();

                // ADMIN LOGIN
                if (dr["Role"].ToString() == "Admin")
                {
                    Response.Redirect("Admin.aspx");
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                Response.Write(
                    "<script>alert('Invalid Email or Password')</script>");
            }

            con.Close();
        }
    }
}