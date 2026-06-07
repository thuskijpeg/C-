using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_3
{
    public partial class _default : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

        // SHA256 Password Hashing Method
        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();
                foreach (var b in bytes)
                    builder.Append(b.ToString("x2"));
                return builder.ToString();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            hlRegister.NavigateUrl = "Register.aspx";
        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            string username = txtUserName.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (username == "" || password == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Please enter username and password.');", true);
                return;
            }

            // Hash the entered password before comparing
            string hashedPassword = HashPassword(password);

            try
            {
                SqlDataAdapter da = new SqlDataAdapter(
                    "SELECT * FROM Users WHERE UserName=@u AND PasswordHash=@p", conn);
                da.SelectCommand.Parameters.AddWithValue("@u", username);
                da.SelectCommand.Parameters.AddWithValue("@p", hashedPassword);

                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    string role = dt.Rows[0]["Role"].ToString();
                    Session["Username"] = username;
                    Session["Role"] = role;

                    if (role == "Buyer")
                    {
                        Response.Redirect("BuyerStore.aspx");
                    }
                    else if (role == "Seller")
                    {
                        Response.Redirect("SellerDashboard.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                            "alert('Unknown role.');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                        "alert('Invalid username or password.');", true);
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }
    }
}