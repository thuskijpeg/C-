using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_3
{
    public partial class BuyerStore : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts("", "", 50000);
            }
            UpdateCartCount();
        }

        void LoadProducts(string search, string category, decimal maxPrice)
        {
            try
            {
                string query = "SELECT * FROM Products WHERE Price <= @maxPrice";
                if (search != "")
                    query += " AND ProductName LIKE @search";
                if (category != "")
                    query += " AND Category = @category";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                da.SelectCommand.Parameters.AddWithValue("@maxPrice", maxPrice);
                if (search != "")
                    da.SelectCommand.Parameters.AddWithValue("@search", "%" + search + "%");
                if (category != "")
                    da.SelectCommand.Parameters.AddWithValue("@category", category);

                DataTable dt = new DataTable();
                da.Fill(dt);
                dlProducts.DataSource = dt;
                dlProducts.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("Error loading products: " + ex.Message);
            }
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            string search = txtSearch.Text.Trim();
            string category = ddlCategory.SelectedValue;
            decimal maxPrice = 50000;
            if (hdnMaxPrice.Value != "")
                maxPrice = Convert.ToDecimal(hdnMaxPrice.Value);
            LoadProducts(search, category, maxPrice);
        }

        protected void dlProducts_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                string[] args = e.CommandArgument.ToString().Split(',');
                string productID = args[0];
                string productName = args[1];
                decimal price = Convert.ToDecimal(args[2]);

                // Get or create cart
                DataTable cart;
                if (Session["Cart"] == null)
                {
                    cart = new DataTable();
                    cart.Columns.Add("ProductID");
                    cart.Columns.Add("ProductName");
                    cart.Columns.Add("Price");
                    cart.Columns.Add("Quantity");
                    Session["Cart"] = cart;
                }
                else
                {
                    cart = (DataTable)Session["Cart"];
                }

                // Check if product already in cart
                bool found = false;
                foreach (DataRow row in cart.Rows)
                {
                    if (row["ProductID"].ToString() == productID)
                    {
                        row["Quantity"] = Convert.ToInt32(row["Quantity"]) + 1;
                        found = true;
                        break;
                    }
                }

                // Add new item if not found
                if (!found)
                {
                    DataRow newRow = cart.NewRow();
                    newRow["ProductID"] = productID;
                    newRow["ProductName"] = productName;
                    newRow["Price"] = price;
                    newRow["Quantity"] = 1;
                    cart.Rows.Add(newRow);
                }

                Session["Cart"] = cart;
                UpdateCartCount();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('" + productName + " added to cart!');", true);
            }
        }

        void UpdateCartCount()
        {
            if (Session["Cart"] != null)
            {
                DataTable cart = (DataTable)Session["Cart"];
                int count = 0;
                foreach (DataRow row in cart.Rows)
                    count += Convert.ToInt32(row["Quantity"]);
                lblCartCount.Text = count.ToString();
            }
            else
            {
                lblCartCount.Text = "0";
            }
        }

    }
}