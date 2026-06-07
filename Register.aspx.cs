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
    public partial class Register : System.Web.UI.Page
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
            hlLoginIn.NavigateUrl = "Default.aspx";
        }

        protected void btnLogIn2_Click(object sender, EventArgs e)
        {
            string username = txtUserName2.Text.Trim();
            string password = txtPassword2.Text.Trim();
            string role = "";

            if (rdoBuyer.Checked)
                role = "Buyer";
            else if (rdoSeller.Checked)
                role = "Seller";

            if (username == "" || password == "" || role == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Please fill in all fields and select a role.');", true);
                return;
            }

            try
            {
                // Check if username already exists
                SqlDataAdapter da = new SqlDataAdapter(
                    "SELECT * FROM Users WHERE UserName=@u", conn);
                da.SelectCommand.Parameters.AddWithValue("@u", username);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                        "alert('Username already exists. Please choose another.');", true);
                    return;
                }

                // Hash the password before storing
                string hashedPassword = HashPassword(password);

                // Insert new user with hashed password
                conn.Open();
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO Users (UserName, PasswordHash, Role) VALUES (@u, @p, @r)", conn);
                cmd.Parameters.AddWithValue("@u", username);
                cmd.Parameters.AddWithValue("@p", hashedPassword);
                cmd.Parameters.AddWithValue("@r", role);
                int rows = cmd.ExecuteNonQuery();
                conn.Close();

                if (rows > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                        "alert('Account created successfully! Please login.'); window.location='Default.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                        "alert('Registration failed. Please try again.');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Error: " + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void rdoBuyer_CheckedChanged(object sender, EventArgs e)
        {
        }
    }
}