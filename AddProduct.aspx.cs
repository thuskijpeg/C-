using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace Project_3
{
    public partial class AddProduct : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            string name = txtProductName.Text.Trim();
            string category = txtCategory.Text.Trim();
            string description = txtDescription.Text.Trim();
            string price = txtPrice.Text.Trim();
            string imagePath = txtImagePath.Text.Trim();

            if (name == "" || category == "" || price == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Please fill in all required fields.');", true);
                return;
            }

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO Products (ProductName, Category, Description, Price, ImagePath) VALUES (@n, @c, @d, @p, @i)", conn);
                cmd.Parameters.AddWithValue("@n", name);
                cmd.Parameters.AddWithValue("@c", category);
                cmd.Parameters.AddWithValue("@d", description);
                cmd.Parameters.AddWithValue("@p", price);
                cmd.Parameters.AddWithValue("@i", imagePath);
                cmd.ExecuteNonQuery();
                conn.Close();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Product added successfully!'); window.location='SellerDashboard.aspx';", true);
            }
            catch (Exception ex)
            {
                Response.Write("<b style='color:red'>ERROR: " + ex.Message + "</b>");
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("SellerDashboard.aspx");
        }
    }
}