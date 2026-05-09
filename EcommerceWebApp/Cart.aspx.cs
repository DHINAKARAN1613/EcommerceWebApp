using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace EcommerceWebApp
{
    public partial class Cart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
            ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadCart();
            }
        }

        void LoadCart()
        {
            string email =
                Session["email"].ToString();

            SqlDataAdapter da =
                new SqlDataAdapter(
                    "SELECT ProductName,Quantity FROM Cart WHERE UserEmail=@email",
                    con);

            da.SelectCommand.Parameters.AddWithValue(
                "@email", email);

            DataTable dt = new DataTable();

            da.Fill(dt);

            GridView1.DataSource = dt;

            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender,
            GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteItem")
            {
                int index =
                    Convert.ToInt32(e.CommandArgument);

                GridViewRow row =
                    GridView1.Rows[index];

                string product =
                    row.Cells[0].Text;

                string email =
                    Session["email"].ToString();

                con.Open();

                SqlCommand cmd =
                    new SqlCommand(
                        "DELETE FROM Cart WHERE UserEmail=@email AND ProductName=@product",
                        con);

                cmd.Parameters.AddWithValue(
                    "@email", email);

                cmd.Parameters.AddWithValue(
                    "@product", product);

                cmd.ExecuteNonQuery();

                con.Close();

                LoadCart();
            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnClearCart_Click(object sender, EventArgs e)
        {
            string email =
                Session["email"].ToString();

            con.Open();

            SqlCommand cmd =
                new SqlCommand(
                    "DELETE FROM Cart WHERE UserEmail=@email",
                    con);

            cmd.Parameters.AddWithValue(
                "@email", email);

            cmd.ExecuteNonQuery();

            con.Close();

            LoadCart();

            Response.Write(
                "<script>alert('Cart Cleared')</script>");
        }
    }
}