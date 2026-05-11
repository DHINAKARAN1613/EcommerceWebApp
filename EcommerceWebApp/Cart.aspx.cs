using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

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

        // LOAD CART
        void LoadCart()
        {
            string email =
                Session["email"].ToString();

            SqlDataAdapter da =
                new SqlDataAdapter(
                @"SELECT 
                    Cart.Id,
                    Cart.ProductName,
                    Cart.Quantity,
                    Products.Price,
                    Products.ImageUrl
                  FROM Cart
                  INNER JOIN Products
                  ON Cart.ProductName = Products.ProductName
                  WHERE Cart.UserEmail=@email",
                con);

            da.SelectCommand.Parameters.AddWithValue(
                "@email", email);

            DataTable dt =
                new DataTable();

            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                lblEmpty.Visible = false;

                Repeater1.Visible = true;

                Repeater1.DataSource = dt;

                Repeater1.DataBind();
            }
            else
            {
                lblEmpty.Visible = true;

                Repeater1.Visible = false;
            }

            int totalItems = 0;

            decimal totalPrice = 0;

            foreach (DataRow row in dt.Rows)
            {
                int qty =
                    Convert.ToInt32(row["Quantity"]);

                decimal price =
                    Convert.ToDecimal(row["Price"]);

                totalItems += qty;

                totalPrice += qty * price;
            }

            lblItems.Text =
                totalItems.ToString();

            lblTotal.Text =
                "₹ " + totalPrice.ToString();
        }

        // PLUS QUANTITY
        protected void btnPlus_Click(object sender, EventArgs e)
        {
            System.Web.UI.WebControls.Button btn =
                (System.Web.UI.WebControls.Button)sender;

            int id =
                Convert.ToInt32(btn.CommandArgument);

            con.Open();

            SqlCommand cmd =
                new SqlCommand(
                    "UPDATE Cart SET Quantity = Quantity + 1 WHERE Id=@id",
                    con);

            cmd.Parameters.AddWithValue(
                "@id", id);

            cmd.ExecuteNonQuery();

            con.Close();

            LoadCart();
        }

        // MINUS QUANTITY
        protected void btnMinus_Click(object sender, EventArgs e)
        {
            System.Web.UI.WebControls.Button btn =
                (System.Web.UI.WebControls.Button)sender;

            int id =
                Convert.ToInt32(btn.CommandArgument);

            con.Open();

            SqlCommand checkCmd =
                new SqlCommand(
                    "SELECT Quantity FROM Cart WHERE Id=@id",
                    con);

            checkCmd.Parameters.AddWithValue(
                "@id", id);

            int qty =
                Convert.ToInt32(
                    checkCmd.ExecuteScalar());

            if (qty > 1)
            {
                SqlCommand cmd =
                    new SqlCommand(
                        "UPDATE Cart SET Quantity = Quantity - 1 WHERE Id=@id",
                        con);

                cmd.Parameters.AddWithValue(
                    "@id", id);

                cmd.ExecuteNonQuery();
            }

            con.Close();

            LoadCart();
        }

        // DELETE PRODUCT
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            System.Web.UI.WebControls.Button btn =
                (System.Web.UI.WebControls.Button)sender;

            int id =
                Convert.ToInt32(btn.CommandArgument);

            con.Open();

            SqlCommand cmd =
                new SqlCommand(
                    "DELETE FROM Cart WHERE Id=@id",
                    con);

            cmd.Parameters.AddWithValue(
                "@id", id);

            cmd.ExecuteNonQuery();

            con.Close();

            LoadCart();
        }

        // CONTINUE SHOPPING
        protected void btnContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Checkout.aspx");
        }
    }
}
