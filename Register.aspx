<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Project_3.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <script src="theme.js" type="text/javascript"></script>
    <style>
        body { font-family: Segoe UI; background: #f5f5f5; margin: 0; }
        .navbar { background: #08162d; color: white; padding: 15px; font-size: 22px; font-weight: bold; display: flex; justify-content: space-between; align-items: center; }
        .navbar a { color: white; text-decoration: none; font-size: 15px; margin-left: 20px; }
        .navbar a:hover { text-decoration: underline; }
        .formContainer { margin: 40px auto; width: 500px; background: white; padding: 30px; border-radius: 10px; box-shadow: 0px 2px 10px rgba(0,0,0,0.1); }
        .formTitle { text-align: center; font-size: 28px; font-weight: bold; margin-bottom: 20px; }
        .formLabel { font-size: 16px; font-weight: bold; display: block; margin-top: 15px; }
        .formInput { width: 100%; height: 35px; font-size: 15px; padding: 5px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 5px; }
        .roleContainer { margin-top: 15px; font-size: 16px; font-weight: bold; }
        .btnRegister { background: #0056ff; color: white; border: none; width: 100%; height: 45px; font-size: 18px; font-weight: bold; border-radius: 5px; margin-top: 20px; cursor: pointer; }
        .btnRegister:hover { background: #003ec7; }
        .loginLink { text-align: center; margin-top: 15px; font-size: 15px; font-weight: bold; }
        .loginLink a { color: #0056ff; }
        .footer { background: #08162d; color: white; text-align: center; padding: 12px; margin-top: 30px; font-size: 14px; }
        /* DARK MODE */
        body.dark-mode { background: #1a1a2e !important; color: #e0e0e0 !important; }
        body.dark-mode .navbar { background: #0d0d1a !important; }
        body.dark-mode .formContainer { background: #16213e !important; color: #e0e0e0 !important; }
        body.dark-mode .formInput { background: #0d0d1a !important; color: #e0e0e0 !important; border-color: #555 !important; }
        body.dark-mode .formLabel { color: #e0e0e0 !important; }
        body.dark-mode .formTitle { color: #e0e0e0 !important; }
        body.dark-mode .roleContainer { color: #e0e0e0 !important; }
        body.dark-mode .loginLink { color: #e0e0e0 !important; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <span>NEXTGEN TECH STORE</span>
            <div>
                <a href="Default.aspx">Login</a>
                <button id="btnThemeToggle" onclick="toggleTheme()"
                    style="background:transparent; color:white; border:1px solid white;
                           padding:6px 14px; border-radius:5px; cursor:pointer;
                           font-size:14px; margin-left:20px;">
                    🌙 Dark Mode
                </button>
            </div>
        </div>
        <div class="formContainer">
            <div class="formTitle">Create Account</div>
            <span class="formLabel">Username</span>
            <asp:TextBox ID="txtUserName2" runat="server" CssClass="formInput" placeholder="Enter username"></asp:TextBox>
            <span class="formLabel">Password</span>
            <asp:TextBox ID="txtPassword2" runat="server" CssClass="formInput" TextMode="Password" placeholder="Enter password"></asp:TextBox>
            <div class="roleContainer">
                Select Role:<br />
                <asp:RadioButton ID="rdoBuyer" runat="server" Font-Bold="True" GroupName="roleOption" Text="Buyer" />
                &nbsp;&nbsp;
                <asp:RadioButton ID="rdoSeller" runat="server" Font-Bold="True" GroupName="roleOption" Text="Seller" />
            </div>
            <asp:Button ID="btnLogIn2" runat="server" Text="Register" CssClass="btnRegister" OnClick="btnLogIn2_Click" />
            <div class="loginLink">
                Already have an account?
                <asp:HyperLink ID="hlLoginIn" runat="server" ForeColor="#0066FF" Font-Bold="True">Login here</asp:HyperLink>
            </div>
        </div>
        <div class="footer">© 2026 NextGen Tech Store</div>
    </form>
</body>
</html>