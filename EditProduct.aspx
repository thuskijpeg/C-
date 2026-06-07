<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="Project_3.EditProduct" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Product</title>
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
        .formTextArea { width: 100%; font-size: 15px; padding: 5px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 5px; }
        .btnSave { background: #0056ff; color: white; border: none; width: 100%; height: 45px; font-size: 18px; font-weight: bold; border-radius: 5px; margin-top: 20px; cursor: pointer; }
        .btnSave:hover { background: #003ec7; }
        .btnBack { background: gray; color: white; border: none; width: 100%; height: 45px; font-size: 18px; font-weight: bold; border-radius: 5px; margin-top: 10px; cursor: pointer; }
        .btnBack:hover { background: #555; }
        .footer { background: #08162d; color: white; text-align: center; padding: 12px; margin-top: 30px; font-size: 14px; }
        /* DARK MODE */
        body.dark-mode { background: #1a1a2e !important; color: #e0e0e0 !important; }
        body.dark-mode .navbar { background: #0d0d1a !important; }
        body.dark-mode .formContainer { background: #16213e !important; color: #e0e0e0 !important; }
        body.dark-mode .formInput { background: #0d0d1a !important; color: #e0e0e0 !important; border-color: #555 !important; }
        body.dark-mode .formTextArea { background: #0d0d1a !important; color: #e0e0e0 !important; border-color: #555 !important; }
        body.dark-mode .formLabel { color: #e0e0e0 !important; }
        body.dark-mode .formTitle { color: #e0e0e0 !important; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <span>NEXTGEN TECH STORE</span>
            <div>
                <a href="SellerDashboard.aspx">Dashboard</a>
                <a href="Default.aspx">Logout (Seller)</a>
                <button id="btnThemeToggle" onclick="toggleTheme()"
                    style="background:transparent; color:white; border:1px solid white;
                           padding:6px 14px; border-radius:5px; cursor:pointer;
                           font-size:14px; margin-left:20px;">
                    🌙 Dark Mode
                </button>
            </div>
        </div>
        <div class="formContainer">
            <div class="formTitle">Edit Product</div>
            <span class="formLabel">Product Name</span>
            <asp:TextBox ID="txtProductName" runat="server" CssClass="formInput"></asp:TextBox>
            <span class="formLabel">Category</span>
            <asp:TextBox ID="txtCategory" runat="server" CssClass="formInput"></asp:TextBox>
            <span class="formLabel">Description</span>
            <asp:TextBox ID="txtDescription" runat="server" CssClass="formTextArea" TextMode="MultiLine" Rows="3"></asp:TextBox>
            <span class="formLabel">Price (R)</span>
            <asp:TextBox ID="txtPrice" runat="server" CssClass="formInput"></asp:TextBox>
            <span class="formLabel">Image Path</span>
            <asp:TextBox ID="txtImagePath" runat="server" CssClass="formInput"></asp:TextBox>
            <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btnSave" OnClick="btnSave_Click" />
            <asp:Button ID="btnBack" runat="server" Text="Back to Dashboard" CssClass="btnBack" OnClick="btnBack_Click" />
        </div>
        <div class="footer">© 2026 NextGen Tech Store</div>
    </form>
</body>
</html>