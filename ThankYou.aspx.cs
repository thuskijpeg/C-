using System;

namespace Project_3
{
    public partial class ThankYou : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Generate random order number
                Random rnd = new Random();
                lblOrderNumber.Text = "NG" + rnd.Next(100000, 999999).ToString();

                // Load details from session
                if (Session["FullName"] != null)
                    lblName.Text = Session["FullName"].ToString();

                if (Session["Email"] != null)
                {
                    lblEmail.Text = Session["Email"].ToString();
                    lblEmailMsg.Text = Session["Email"].ToString();
                }

                if (Session["City"] != null)
                    lblCity.Text = Session["City"].ToString();
            }
        }

        protected void btnContinueShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("BuyerStore.aspx");
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}