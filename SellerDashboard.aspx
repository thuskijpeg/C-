<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SellerDashboard.aspx.cs" Inherits="Project_3.SellerDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Seller Dashboard</title>
    <script src="theme.js" type="text/javascript"></script>
    <style>
        body { font-family: Segoe UI; background: #f5f5f5; margin: 0; }
        .navbar { background: #08162d; color: white; padding: 15px 20px; font-size: 22px; font-weight: bold; display: flex; justify-content: space-between; align-items: center; }
        .navbar a { color: white; text-decoration: none; font-size: 15px; margin-left: 20px; }
        .navbar a:hover { text-decoration: underline; }
        .container { padding: 20px; }
        .topBar { display: flex; justify-content: space-between; align-items: center; margin-bottom: 5px; }
        .welcomeText { font-size: 22px; font-weight: bold; color: #0056ff; }
        .subText { color: gray; font-size: 14px; margin-bottom: 15px; }
        .btnAdd { background: #0056ff; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer; font-size: 15px; }
        .btnAdd:hover { background: #003ec7; }
        .productTable { width: 100%; border-collapse: collapse; background: white; border-radius: 10px; overflow: hidden; box-shadow: 0px 2px 5px rgba(0,0,0,0.1); }
        .productTable th { background: #08162d; color: white; padding: 12px 15px; text-align: left; }
        .productTable td { padding: 12px 15px; border-bottom: 1px solid #eee; }
        .productTable tr:hover { background: #f9f9f9; }
        .btnEdit { background: #0056ff; color: white; border: none; padding: 6px 14px; border-radius: 4px; cursor: pointer; margin-right: 5px; }
        .btnDelete { background: red; color: white; border: none; padding: 6px 14px; border-radius: 4px; cursor: pointer; }
        .btnEdit:hover { background: #003ec7; }
        .btnDelete:hover { background: darkred; }
        .footer { background: #08162d; color: white; text-align: center; padding: 12px; margin-top: 30px; font-size: 14px; }
        /* DARK MODE */
        body.dark-mode { background: #1a1a2e !important; color: #e0e0e0 !important; }
        body.dark-mode .navbar { background: #0d0d1a !important; }
        body.dark-mode .container { background: #1a1a2e !important; }
        body.dark-mode .welcomeText { color: #4da6ff !important; }
        body.dark-mode .subText { color: #aaa !important; }
        body.dark-mode .productTable { background: #16213e !important; }
        body.dark-mode .productTable td { color: #e0e0e0 !important; border-color: #444 !important; }
        body.dark-mode .productTable tr:hover { background: #0d0d1a !important; }
        body.dark-mode h3 { color: #e0e0e0 !important; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <span>NEXTGEN TECH STORE</span>
            <div>
                <a href="SellerDashboard.aspx">Dashboard</a>
                <a href="AddProduct.aspx">Add Product</a>
                <a href="Default.aspx">Logout (Seller)</a>
                <button id="btnThemeToggle" onclick="toggleTheme()"
                    style="background:transparent; color:white; border:1px solid white;
                           padding:6px 14px; border-radius:5px; cursor:pointer;
                           font-size:14px; margin-left:20px;">
                    🌙 Dark Mode
                </button>
            </div>
        </div>
        <div class="container">
            <div class="topBar">
                <asp:Label ID="lblWelcomeSeller" runat="server" CssClass="welcomeText" Text="Welcome, Seller!"></asp:Label>
                <asp:Button ID="btnAddProducts" runat="server" Text="+ Add New Product" CssClass="btnAdd" OnClick="btnAddProducts_Click" />
            </div>
            <div class="subText">Manage your tech products</div>
            <h3>Product List</h3>
            <asp:GridView ID="gvProducts" runat="server"
                CssClass="productTable"
                AutoGenerateColumns="false"
                GridLines="None">
                <Columns>
                    <asp:BoundField DataField="ProductID" HeaderText="ID" />
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                    <asp:BoundField DataField="Category" HeaderText="Category" />
                    <asp:BoundField DataField="Price" HeaderText="Price" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btnEdit" CommandArgument='<%# Eval("ProductID") %>' OnClick="btnEdit_Click" />
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btnDelete" CommandArgument='<%# Eval("ProductID") %>' OnClick="btnDelete_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="footer">© 2026 NextGen Tech Store</div>
    </form>
</body>
</html>