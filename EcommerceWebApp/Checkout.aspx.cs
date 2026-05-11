using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EcommerceWebApp
{
    public partial class Checkout : System.Web.UI.Page
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
                LoadCheckout();
            }
        }

        void LoadCheckout()
        {
            string email =
                Session["email"].ToString();

            SqlDataAdapter da =
                new SqlDataAdapter(
                @"SELECT 
                    Cart.ProductName,
                    Cart.Quantity,
                    Products.Price,
                    (Cart.Quantity * Products.Price) AS SubTotal
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

            Repeater1.DataSource = dt;

            Repeater1.DataBind();

            decimal total = 0;

            foreach (DataRow row in dt.Rows)
            {
                total +=
                    Convert.ToDecimal(row["SubTotal"]);
            }

            lblTotal.Text =
                "₹ " + total.ToString();
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            string payment = "Cash On Delivery";

            if (rbUPI.Checked)
            {
                payment = "UPI";
            }

            if (rbCard.Checked)
            {
                payment = "Card";
            }

            string email =
                Session["email"].ToString();

            // GET CART ITEMS
            SqlDataAdapter da =
                new SqlDataAdapter(
                @"SELECT 
            Cart.ProductName,
            Cart.Quantity,
            Products.Price
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

            con.Open();

            decimal grandTotal = 0;

            foreach (DataRow row in dt.Rows)
            {
                decimal subtotal =
                    Convert.ToDecimal(row["Price"])
                    *
                    Convert.ToInt32(row["Quantity"]);

                grandTotal += subtotal;
            }

            // SAVE EACH ORDER ITEM
            foreach (DataRow row in dt.Rows)
            {
                SqlCommand cmd =
                    new SqlCommand(
                        @"INSERT INTO Orders
                (
                    UserEmail,
                    FullName,
                    Phone,
                    Address,
                    PaymentMethod,
                    ProductName,
                    Quantity,
                    Price,
                    TotalAmount,
                    OrderDate
                )
                VALUES
                (
                    @email,
                    @name,
                    @phone,
                    @address,
                    @payment,
                    @product,
                    @qty,
                    @price,
                    @total,
                    GETDATE()
                )",
                        con);

                cmd.Parameters.AddWithValue(
                    "@email", email);

                cmd.Parameters.AddWithValue(
                    "@name", txtName.Text);

                cmd.Parameters.AddWithValue(
                    "@phone", txtPhone.Text);

                cmd.Parameters.AddWithValue(
                    "@address", txtAddress.Text);

                cmd.Parameters.AddWithValue(
                    "@payment", payment);

                cmd.Parameters.AddWithValue(
                    "@product",
                    row["ProductName"].ToString());

                cmd.Parameters.AddWithValue(
                    "@qty",
                    Convert.ToInt32(row["Quantity"]));

                cmd.Parameters.AddWithValue(
                    "@price",
                    Convert.ToDecimal(row["Price"]));

                cmd.Parameters.AddWithValue(
                    "@total", grandTotal);

                cmd.ExecuteNonQuery();
            }

            // CLEAR CART
            SqlCommand clearCmd =
                new SqlCommand(
                    "DELETE FROM Cart WHERE UserEmail=@email",
                    con);

            clearCmd.Parameters.AddWithValue(
                "@email", email);

            clearCmd.ExecuteNonQuery();

            con.Close();

            // SUCCESS PAGE
            Response.Redirect("OrderSuccess.aspx");
        }
    }
}