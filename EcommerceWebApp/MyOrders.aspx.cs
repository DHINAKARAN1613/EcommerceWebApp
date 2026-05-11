using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EcommerceWebApp
{
    public partial class MyOrders : System.Web.UI.Page
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
                LoadOrders();
            }
        }

        // LOAD ORDERS
        void LoadOrders()
        {
            string email =
                Session["email"].ToString();

            SqlDataAdapter da =
                new SqlDataAdapter(
                @"SELECT 
                    Orders.Id,
                    Orders.ProductName,
                    Orders.Quantity,
                    Orders.Price,
                    Orders.PaymentMethod,
                    Orders.OrderDate,
                    Orders.OrderStatus,
                    Products.ImageUrl
                  FROM Orders
                  INNER JOIN Products
                  ON Orders.ProductName = Products.ProductName
                  WHERE Orders.UserEmail=@email
                  ORDER BY Orders.Id DESC",
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
        }

        // CANCEL ORDER
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            System.Web.UI.WebControls.Button btn =
                (System.Web.UI.WebControls.Button)sender;

            int id =
                Convert.ToInt32(btn.CommandArgument);

            con.Open();

            SqlCommand cmd =
                new SqlCommand(
                    "UPDATE Orders SET OrderStatus='Cancelled' WHERE Id=@id",
                    con);

            cmd.Parameters.AddWithValue(
                "@id", id);

            cmd.ExecuteNonQuery();

            con.Close();

            LoadOrders();

            Response.Write(
                "<script>alert('Order Cancelled Successfully')</script>");
        }
    }
}