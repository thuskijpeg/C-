<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Project_3.Cart" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shopping Cart</title>
    <script src="theme.js" type="text/javascript"></script>
    <style>
        body { font-family: Segoe UI; background: #f5f5f5; margin: 0; }
        .navbar { background: #08162d; color: white; padding: 15px; font-size: 22px; font-weight: bold; display: flex; justify-content: space-between; align-items: center; }
        .navbar a { color: white; text-decoration: none; font-size: 15px; margin-left: 20px; }
        .navbar a:hover { text-decoration: underline; }
        .container { padding: 20px; max-width: 900px; margin: 0 auto; }
        .pageTitle { font-size: 28px; font-weight: bold; margin-bottom: 20px; }
        .cartTable { width: 100%; border-collapse: collapse; background: white; border-radius: 10px; overflow: hidden; box-shadow: 0px 2px 5px rgba(0,0,0,0.1); }
        .cartTable th { background: #08162d; color: white; padding: 12px 15px; text-align: left; }
        .cartTable td { padding: 12px 15px; border-bottom: 1px solid #eee; font-size: 15px; }
        .cartTable tr:hover { background: #f9f9f9; }
        .btnRemove { background: red; color: white; border: none; padding: 6px 14px; border-radius: 4px; cursor: pointer; }
        .btnRemove:hover { background: darkred; }
        .totalRow { text-align: right; padding: 15px; font-size: 18px; font-weight: bold; }
        .btnCheckout { background: #0056ff; color: white; border: none; padding: 12px 30px; border-radius: 5px; font-size: 16px; font-weight: bold; cursor: pointer; }
        .btnCheckout:hover { background: #003ec7; }
        .btnContinue { background: gray; color: white; border: none; padding: 12px 30px; border-radius: 5px; font-size: 16px; font-weight: bold; cursor: pointer; margin-right: 10px; }
        .btnContinue:hover { background: #555; }
        .footer { background: #08162d; color: white; text-align: center; padding: 12px; margin-top: 30px; font-size: 14px; }
        /* DARK MODE */
        body.dark-mode { background: #1a1a2e !important; color: #e0e0e0 !important; }
        body.dark-mode .navbar { background: #0d0d1a !important; }
        body.dark-mode .cartTable { background: #16213e !important; }
        body.dark-mode .cartTable td { color: #e0e0e0 !important; border-color: #444 !important; }
        body.dark-mode .cartTable tr:hover { background: #0d0d1a !important; }
        body.dark-mode .pageTitle { color: #e0e0e0 !important; }
        body.dark-mode .totalRow { color: #e0e0e0 !important; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <span>NEXTGEN TECH STORE</span>
            <div>
                <a href="BuyerStore.aspx">Continue Shopping</a>
                <a href="Default.aspx">Logout (Buyer)</a>
                <button id="btnThemeToggle" onclick="toggleTheme()"
                    style="background:transparent; color:white; border:1px solid white;
                           padding:6px 14px; border-radius:5px; cursor:pointer;
                           font-size:14px; margin-left:20px;">
                    🌙 Dark Mode
                </button>
            </div>
        </div>
        <div class="container">
            <div class="pageTitle">🛒 Your Shopping Cart</div>
            <asp:GridView ID="gvCart" runat="server"
                CssClass="cartTable"
                AutoGenerateColumns="false"
                GridLines="None"
                OnRowCommand="gvCart_RowCommand"
                EmptyDataText="Your cart is empty.">
                <Columns>
                    <asp:BoundField DataField="ProductName" HeaderText="Product" />
                    <asp:BoundField DataField="Price" HeaderText="Price (R)" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    <asp:TemplateField HeaderText="Total">
                        <ItemTemplate>
                            R<%# Convert.ToDecimal(Eval("Price")) * Convert.ToInt32(Eval("Quantity")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Remove">
                        <ItemTemplate>
                            <asp:Button ID="btnRemove" runat="server" Text="Remove" CssClass="btnRemove" CommandName="RemoveItem" CommandArgument='<%# Eval("ProductID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div class="totalRow">
                Total: R<asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label>
            </div>
            <div style="text-align:right; padding: 0 0 20px 0;">
                <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" CssClass="btnContinue" OnClick="btnContinue_Click" />
                <asp:Button ID="btnCheckout" runat="server" Text="Proceed to Checkout" CssClass="btnCheckout" OnClick="btnCheckout_Click" />
            </div>
        </div>
        <div class="footer">© 2026 NextGen Tech Store</div>
    </form>
</body>
</html>