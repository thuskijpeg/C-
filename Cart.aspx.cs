using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_3
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCart();
            }
        }

        void LoadCart()
        {
            if (Session["Cart"] != null)
            {
                DataTable cart = (DataTable)Session["Cart"];
                gvCart.DataSource = cart;
                gvCart.DataBind();

                // Calculate total
                decimal total = 0;
                foreach (DataRow row in cart.Rows)
                    total += Convert.ToDecimal(row["Price"]) * Convert.ToInt32(row["Quantity"]);

                lblTotal.Text = total.ToString("F2");
            }
            else
            {
                lblTotal.Text = "0";
            }
        }

        protected void gvCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "RemoveItem")
            {
                string productID = e.CommandArgument.ToString();

                if (Session["Cart"] != null)
                {
                    DataTable cart = (DataTable)Session["Cart"];

                    foreach (DataRow row in cart.Rows)
                    {
                        if (row["ProductID"].ToString() == productID)
                        {
                            cart.Rows.Remove(row);
                            break;
                        }
                    }

                    Session["Cart"] = cart;
                }

                LoadCart();
            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("BuyerStore.aspx");
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (Session["Cart"] == null || ((DataTable)Session["Cart"]).Rows.Count == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Your cart is empty. Please add items before checking out.');", true);
                return;
            }
            Response.Redirect("Checkout.aspx");
        }
    }
}