using System;
using System.Configuration;
using System.Data.SqlClient;

namespace EcommerceWebApp
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
            ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            con.Open();

            SqlCommand cmd =
                new SqlCommand(
                    "INSERT INTO Users(FullName,Email,Password,Role) VALUES(@name,@email,@password,@role)",
                    con);

            cmd.Parameters.AddWithValue(
                "@name", txtName.Text);

            cmd.Parameters.AddWithValue(
                "@email", txtEmail.Text);

            cmd.Parameters.AddWithValue(
                "@password", txtPassword.Text);

            // DEFAULT USER
            cmd.Parameters.AddWithValue(
                "@role", "User");

            cmd.ExecuteNonQuery();

            con.Close();

            Response.Write(
                "<script>alert('Registration Successful')</script>");

            Response.Redirect("Login.aspx");
        }
    }
}