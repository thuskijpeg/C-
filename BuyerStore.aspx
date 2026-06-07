<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuyerStore.aspx.cs" Inherits="Project_3.BuyerStore" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Buyer Store</title>
    <script src="theme.js" type="text/javascript"></script>
    <style>
        body { font-family: Segoe UI; background: #f5f5f5; margin: 0; }
        .navbar { background: #08162d; color: white; padding: 15px; font-size: 22px; font-weight: bold; display: flex; justify-content: space-between; align-items: center; }
        .navbar a { color: white; text-decoration: none; font-size: 15px; margin-left: 20px; }
        .navbar a:hover { text-decoration: underline; }
        .cartBadge { background: #0056ff; color: white; border-radius: 50%; padding: 2px 8px; font-size: 13px; margin-left: 5px; }
        .filterBar { background: white; padding: 15px 20px; display: flex; align-items: center; gap: 20px; box-shadow: 0px 2px 5px rgba(0,0,0,0.1); flex-wrap: wrap; }
        .filterGroup { display: flex; flex-direction: column; }
        .filterLabel { font-size: 13px; font-weight: bold; margin-bottom: 5px; color: #333; }
        .filterInput { height: 35px; font-size: 14px; padding: 5px; border: 1px solid #ccc; border-radius: 5px; width: 200px; }
        .filterSelect { height: 35px; font-size: 14px; padding: 5px; border: 1px solid #ccc; border-radius: 5px; width: 180px; }
        .filterSlider { width: 180px; }
        .btnFilter { background: #0056ff; color: white; border: none; padding: 10px 25px; border-radius: 5px; cursor: pointer; font-size: 15px; font-weight: bold; margin-top: 18px; }
        .btnFilter:hover { background: #003ec7; }
        .container { padding: 20px; display: flex; flex-wrap: wrap; }
        .productCard { background: white; border: 1px solid #ddd; border-radius: 10px; padding: 15px; text-align: center; margin: 10px; width: 220px; box-shadow: 0px 2px 5px rgba(0,0,0,0.1); }
        .productCard:hover { transform: scale(1.03); transition: 0.3s; }
        .productImage { width: 150px; height: 150px; object-fit: contain; }
        .productName { font-size: 18px; font-weight: bold; margin-top: 10px; }
        .category { color: gray; margin-top: 5px; }
        .price { color: #0056ff; font-size: 20px; font-weight: bold; margin-top: 10px; }
        .btnAddToCart { background: #0056ff; color: white; border: none; padding: 10px 20px; border-radius: 5px; margin-top: 10px; cursor: pointer; width: 100%; }
        .btnAddToCart:hover { background: #003ec7; }
        .footer { background: #08162d; color: white; text-align: center; padding: 12px; margin-top: 30px; font-size: 14px; }
        /* DARK MODE */
        body.dark-mode { background: #1a1a2e !important; color: #e0e0e0 !important; }
        body.dark-mode .navbar { background: #0d0d1a !important; }
        body.dark-mode .filterBar { background: #16213e !important; }
        body.dark-mode .filterLabel { color: #e0e0e0 !important; }
        body.dark-mode .filterInput { background: #0d0d1a !important; color: #e0e0e0 !important; border-color: #555 !important; }
        body.dark-mode .filterSelect { background: #0d0d1a !important; color: #e0e0e0 !important; border-color: #555 !important; }
        body.dark-mode .productCard { background: #16213e !important; border-color: #444 !important; }
        body.dark-mode .productName { color: #e0e0e0 !important; }
        body.dark-mode .category { color: #aaa !important; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <span>NEXTGEN TECH STORE</span>
            <div>
                <a href="Default.aspx">Home</a>
                <a href="Cart.aspx">🛒 Cart <span class="cartBadge"><asp:Label ID="lblCartCount" runat="server" Text="0"></asp:Label></span></a>
                <a href="Default.aspx">Logout (Buyer)</a>
                <button id="btnThemeToggle" onclick="toggleTheme()"
                    style="background:transparent; color:white; border:1px solid white;
                           padding:6px 14px; border-radius:5px; cursor:pointer;
                           font-size:14px; margin-left:20px;">
                    🌙 Dark Mode
                </button>
            </div>
        </div>
        <div class="filterBar">
            <div class="filterGroup">
                <span class="filterLabel">Search Product</span>
                <asp:TextBox ID="txtSearch" runat="server" CssClass="filterInput" placeholder="Search..."></asp:TextBox>
            </div>
            <div class="filterGroup">
                <span class="filterLabel">Category</span>
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="filterSelect">
                    <asp:ListItem Text="All Categories" Value=""></asp:ListItem>
                    <asp:ListItem Text="Accessories" Value="Accessories"></asp:ListItem>
                    <asp:ListItem Text="Gaming" Value="Gaming"></asp:ListItem>
                    <asp:ListItem Text="Audio" Value="Audio"></asp:ListItem>
                    <asp:ListItem Text="Office" Value="Office"></asp:ListItem>
                    <asp:ListItem Text="Speaker" Value="Speaker"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="filterGroup">
                <span class="filterLabel">Max Price: R<asp:Label ID="lblPrice" runat="server" Text="50000"></asp:Label></span>
                <input type="range" id="priceSlider" min="0" max="50000" value="50000" step="100"
                    class="filterSlider"
                    oninput="document.getElementById('<%=lblPrice.ClientID%>').innerHTML = this.value;
                             document.getElementById('<%=hdnMaxPrice.ClientID%>').value = this.value;" />
                <asp:HiddenField ID="hdnMaxPrice" runat="server" Value="50000" />
            </div>
            <asp:Button ID="btnFilter" runat="server" Text="Filter" CssClass="btnFilter" OnClick="btnFilter_Click" />
        </div>
        <div class="container">
            <asp:DataList ID="dlProducts" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" CellPadding="10" OnItemCommand="dlProducts_ItemCommand">
                <ItemTemplate>
                    <div class="productCard">
                        <asp:Image ID="imgProduct" runat="server" CssClass="productImage" ImageUrl='<%# Eval("ImagePath") %>' />
                        <div class="productName">
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                        </div>
                        <div class="category">
                            <asp:Label ID="lblCategory" runat="server" Text='<%# Eval("Category") %>'></asp:Label>
                        </div>
                        <div class="price">
                            R <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                        </div>
                        <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CssClass="btnAddToCart" CommandName="AddToCart" CommandArgument='<%# Eval("ProductID") + "," + Eval("ProductName") + "," + Eval("Price") %>' />
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <div class="footer">© 2026 NextGen Tech Store</div>
    </form>
</body>
</html>