using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace Project_3
{
    public partial class Checkout : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrderSummary();
            }
        }

        void LoadOrderSummary()
        {
            try
            {
                // Create a sample order summary table
                DataTable dt = new DataTable();
                dt.Columns.Add("ProductName");
                dt.Columns.Add("Quantity");
                dt.Columns.Add("Price");

                // Get cart items from session if available
                if (Session["Cart"] != null)
                {
                    dt = (DataTable)Session["Cart"];
                }

                rptOrderItems.DataSource = dt;
                rptOrderItems.DataBind();

                // Calculate subtotal
                decimal subtotal = 0;
                foreach (DataRow row in dt.Rows)
                {
                    subtotal += Convert.ToDecimal(row["Price"]);
                }

                lblSubtotal.Text = subtotal.ToString("F2");
                lblTotal.Text = (subtotal + 100).ToString("F2");
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string address = txtAddress.Text.Trim();
            string city = txtCity.Text.Trim();
            string postalCode = txtPostalCode.Text.Trim();
            string phone = txtPhone.Text.Trim();

            if (fullName == "" || email == "" || address == "" || city == "" || postalCode == "" || phone == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Please fill in all shipping details.');", true);
                return;
            }

            // Store order details in session
            Session["FullName"] = fullName;
            Session["Email"] = email;
            Session["City"] = city;

            // Redirect to Thank You page
            Response.Redirect("ThankYou.aspx");
        }
    }
}