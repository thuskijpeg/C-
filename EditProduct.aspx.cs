using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace Project_3
{
    public partial class EditProduct : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

        string productID = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                productID = Request.QueryString["id"].ToString();

                if (!IsPostBack)
                {
                    LoadProduct();
                }
            }
            else
            {
                Response.Redirect("SellerDashboard.aspx");
            }
        }

        void LoadProduct()
        {
            try
            {
                SqlDataAdapter da = new SqlDataAdapter(
                    "SELECT * FROM Products WHERE ProductID=@id", conn);
                da.SelectCommand.Parameters.AddWithValue("@id", productID);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    txtProductName.Text = dt.Rows[0]["ProductName"].ToString();
                    txtCategory.Text = dt.Rows[0]["Category"].ToString();
                    txtDescription.Text = dt.Rows[0]["Description"].ToString();
                    txtPrice.Text = dt.Rows[0]["Price"].ToString();
                    txtImagePath.Text = dt.Rows[0]["ImagePath"].ToString();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Error loading product: " + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            productID = Request.QueryString["id"].ToString();

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
                    "UPDATE Products SET ProductName=@n, Category=@c, Description=@d, Price=@p, ImagePath=@i WHERE ProductID=@id", conn);
                cmd.Parameters.AddWithValue("@n", name);
                cmd.Parameters.AddWithValue("@c", category);
                cmd.Parameters.AddWithValue("@d", description);
                cmd.Parameters.AddWithValue("@p", price);
                cmd.Parameters.AddWithValue("@i", imagePath);
                cmd.Parameters.AddWithValue("@id", productID);
                cmd.ExecuteNonQuery();
                conn.Close();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Product updated successfully!'); window.location='SellerDashboard.aspx';", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Error: " + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("SellerDashboard.aspx");
        }
    }
}