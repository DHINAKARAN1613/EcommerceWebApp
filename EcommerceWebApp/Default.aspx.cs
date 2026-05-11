using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace EcommerceWebApp
{
    public partial class _Default : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
            ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            lblUser.Text =
                Session["user"].ToString();

            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        void LoadProducts()
        {
            SqlDataAdapter da =
                new SqlDataAdapter(
                    "SELECT * FROM Products", con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            dt.Columns.Add("CartQty");

            string email =
                Session["email"].ToString();

            con.Open();

            foreach (DataRow row in dt.Rows)
            {
                row["CartQty"] = 1;

                SqlCommand cmd =
                    new SqlCommand(
                        "SELECT Quantity FROM Cart WHERE UserEmail=@email AND ProductName=@product",
                        con);

                cmd.Parameters.AddWithValue(
                    "@email", email);

                cmd.Parameters.AddWithValue(
                    "@product",
                    row["ProductName"].ToString());

                object result =
                    cmd.ExecuteScalar();

                if (result != null)
                {
                    row["CartQty"] =
                        result.ToString();
                }
            }

            con.Close();

            Repeater1.DataSource = dt;

            Repeater1.DataBind();
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            Button btn =
                (Button)sender;

            RepeaterItem item =
                (RepeaterItem)btn.NamingContainer;

            Label lblQty =
                (Label)item.FindControl("lblQty");

            int qty =
                Convert.ToInt32(lblQty.Text);

            string product =
                btn.CommandArgument;

            string email =
                Session["email"].ToString();

            con.Open();

            SqlCommand checkCmd =
                new SqlCommand(
                    "SELECT COUNT(*) FROM Cart WHERE UserEmail=@email AND ProductName=@product",
                    con);

            checkCmd.Parameters.AddWithValue(
                "@email", email);

            checkCmd.Parameters.AddWithValue(
                "@product", product);

            int count =
                Convert.ToInt32(
                    checkCmd.ExecuteScalar());

            if (count > 0)
            {
                SqlCommand updateCmd =
                    new SqlCommand(
                        "UPDATE Cart SET Quantity=@qty WHERE UserEmail=@email AND ProductName=@product",
                        con);

                updateCmd.Parameters.AddWithValue(
                    "@qty", qty);

                updateCmd.Parameters.AddWithValue(
                    "@email", email);

                updateCmd.Parameters.AddWithValue(
                    "@product", product);

                updateCmd.ExecuteNonQuery();
            }
            else
            {
                SqlCommand insertCmd =
                    new SqlCommand(
                        "INSERT INTO Cart(UserEmail,ProductName,Quantity) VALUES(@email,@product,@qty)",
                        con);

                insertCmd.Parameters.AddWithValue(
                    "@email", email);

                insertCmd.Parameters.AddWithValue(
                    "@product", product);

                insertCmd.Parameters.AddWithValue(
                    "@qty", qty);

                insertCmd.ExecuteNonQuery();
            }

            con.Close();

            LoadProducts();

            Response.Write(
                "<script>alert('Product Added To Cart')</script>");
        }

        protected void btnViewCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }

        protected void btnPlus_Click(object sender, EventArgs e)
        {
            Button btn =
                (Button)sender;

            RepeaterItem item =
                (RepeaterItem)btn.NamingContainer;

            Label lblQty =
                (Label)item.FindControl("lblQty");

            int qty =
                Convert.ToInt32(lblQty.Text);

            qty++;

            lblQty.Text =
                qty.ToString();
        }

        protected void btnMinus_Click(object sender, EventArgs e)
        {
            Button btn =
                (Button)sender;

            RepeaterItem item =
                (RepeaterItem)btn.NamingContainer;

            Label lblQty =
                (Label)item.FindControl("lblQty");

            int qty =
                Convert.ToInt32(lblQty.Text);

            if (qty > 1)
            {
                qty--;
            }

            lblQty.Text =
                qty.ToString();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();

            Response.Redirect("Login.aspx");
        }
        protected void btnMyOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyOrders.aspx");
        }
    }
}