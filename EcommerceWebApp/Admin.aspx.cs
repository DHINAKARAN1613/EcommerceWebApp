using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EcommerceWebApp
{
    public partial class Admin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
            ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (Session["role"].ToString() != "Admin")
            {
                Response.Redirect("Default.aspx");
            }

            if (!IsPostBack)
            {
                LoadProducts();
                LoadCounts();
            }
        }

        void LoadProducts()
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT * FROM Products", con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        void LoadCounts()
        {
            con.Open();

            SqlCommand cmd1 = new SqlCommand(
                "SELECT COUNT(*) FROM Products", con);

            lblProducts.Text = cmd1.ExecuteScalar().ToString();

            SqlCommand cmd2 = new SqlCommand(
                "SELECT COUNT(*) FROM Users", con);

            lblUsers.Text = cmd2.ExecuteScalar().ToString();

            con.Close();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            decimal price;

            if (!decimal.TryParse(txtPrice.Text, out price))
            {
                Response.Write("<script>alert('Enter valid numeric price')</script>");
                return;
            }

            con.Open();

            SqlCommand cmd = new SqlCommand(
                "INSERT INTO Products(ProductName,Price,ImageUrl) VALUES(@name,@price,@image)", con);

            cmd.Parameters.AddWithValue("@name", txtProductName.Text);
            cmd.Parameters.AddWithValue("@price", price);
            cmd.Parameters.AddWithValue("@image", txtImage.Text);

            cmd.ExecuteNonQuery();

            con.Close();

            LoadProducts();
            LoadCounts();
            Clear();

            Response.Write("<script>alert('Product Added Successfully')</script>");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            decimal price;

            if (!decimal.TryParse(txtPrice.Text, out price))
            {
                Response.Write("<script>alert('Enter valid numeric price')</script>");
                return;
            }

            con.Open();

            SqlCommand cmd = new SqlCommand(
                "UPDATE Products SET ProductName=@name,Price=@price,ImageUrl=@image WHERE Id=@id", con);

            cmd.Parameters.AddWithValue("@id", hfId.Value);
            cmd.Parameters.AddWithValue("@name", txtProductName.Text);
            cmd.Parameters.AddWithValue("@price", price);
            cmd.Parameters.AddWithValue("@image", txtImage.Text);

            cmd.ExecuteNonQuery();

            con.Close();

            LoadProducts();
            LoadCounts();
            Clear();

            Response.Write("<script>alert('Product Updated Successfully')</script>");
        }

        protected void GridView1_RowCommand(object sender,
            System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRow")
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(
                    "DELETE FROM Products WHERE Id=@id", con);

                cmd.Parameters.AddWithValue("@id", e.CommandArgument);

                cmd.ExecuteNonQuery();

                con.Close();

                LoadProducts();
                LoadCounts();

                Response.Write("<script>alert('Product Deleted Successfully')</script>");
            }

            if (e.CommandName == "EditRow")
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(
                    "SELECT * FROM Products WHERE Id=@id", con);

                cmd.Parameters.AddWithValue("@id", e.CommandArgument);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    hfId.Value = dr["Id"].ToString();

                    txtProductName.Text =
                        dr["ProductName"].ToString();

                    txtPrice.Text =
                        dr["Price"].ToString();

                    txtImage.Text =
                        dr["ImageUrl"].ToString();
                }

                con.Close();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT * FROM Products WHERE ProductName LIKE @name", con);

            da.SelectCommand.Parameters.AddWithValue(
                "@name", "%" + txtSearch.Text + "%");

            DataTable dt = new DataTable();

            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();

            Response.Redirect("Login.aspx");
        }

        void Clear()
        {
            txtProductName.Text = "";
            txtPrice.Text = "";
            txtImage.Text = "";
        }
    }
}