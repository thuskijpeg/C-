using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Project_3
{
    public partial class SellerDashboard : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        void LoadProducts()
        {
            try
            {
                SqlDataAdapter da = new SqlDataAdapter(
                    "SELECT * FROM Products", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvProducts.DataSource = dt;
                gvProducts.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("Error loading products: " + ex.Message);
            }
        }

        protected void btnAddProducts_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProduct.aspx");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string productID = btn.CommandArgument;
            Response.Redirect("EditProduct.aspx?id=" + productID);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string productID = btn.CommandArgument;
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(
                    "DELETE FROM Products WHERE ProductID=@id", conn);
                cmd.Parameters.AddWithValue("@id", productID);
                cmd.ExecuteNonQuery();
                conn.Close();
                LoadProducts();
            }
            catch (Exception ex)
            {
                Response.Write("Error deleting product: " + ex.Message);
            }
        }
    }
}