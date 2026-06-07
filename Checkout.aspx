<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Project_3.Checkout" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Checkout</title>
    <script src="theme.js" type="text/javascript"></script>
    <style>
        body { font-family: Segoe UI; background: #f5f5f5; margin: 0; }
        .navbar { background: #08162d; color: white; padding: 15px; font-size: 22px; font-weight: bold; display: flex; justify-content: space-between; align-items: center; }
        .navbar a { color: white; text-decoration: none; font-size: 15px; margin-left: 20px; }
        .navbar a:hover { text-decoration: underline; }
        .pageTitle { font-size: 28px; font-weight: bold; padding: 20px; }
        .checkoutContainer { display: flex; gap: 20px; padding: 0 20px 20px 20px; flex-wrap: wrap; }
        .leftPanel { flex: 1; min-width: 300px; }
        .rightPanel { width: 350px; }
        .card { background: white; border-radius: 10px; padding: 25px; box-shadow: 0px 2px 5px rgba(0,0,0,0.1); margin-bottom: 20px; }
        .cardTitle { font-size: 18px; font-weight: bold; margin-bottom: 20px; color: #08162d; }
        .formLabel { font-size: 14px; font-weight: bold; display: block; margin-top: 15px; margin-bottom: 5px; }
        .formInput { width: 100%; height: 40px; font-size: 14px; padding: 5px 10px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 5px; }
        .formTextArea { width: 100%; font-size: 14px; padding: 5px 10px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 5px; }
        .paymentOption { display: flex; align-items: center; gap: 10px; margin-top: 10px; font-size: 15px; }
        .orderItem { display: flex; justify-content: space-between; align-items: center; padding: 12px 0; border-bottom: 1px solid #eee; }
        .orderItemName { font-size: 15px; font-weight: bold; }
        .orderItemQty { font-size: 13px; color: gray; }
        .orderItemPrice { font-size: 15px; font-weight: bold; color: #0056ff; }
        .summaryRow { display: flex; justify-content: space-between; padding: 8px 0; font-size: 15px; }
        .summaryTotal { display: flex; justify-content: space-between; padding: 12px 0; font-size: 18px; font-weight: bold; border-top: 2px solid #08162d; margin-top: 10px; }
        .secureText { color: gray; font-size: 13px; text-align: center; margin-top: 10px; }
        .btnPlaceOrder { background: #0056ff; color: white; border: none; width: 100%; height: 50px; font-size: 18px; font-weight: bold; border-radius: 5px; margin-top: 20px; cursor: pointer; }
        .btnPlaceOrder:hover { background: #003ec7; }
        .footer { background: #08162d; color: white; text-align: center; padding: 12px; margin-top: 30px; font-size: 14px; }
        /* DARK MODE */
        body.dark-mode { background: #1a1a2e !important; color: #e0e0e0 !important; }
        body.dark-mode .navbar { background: #0d0d1a !important; }
        body.dark-mode .card { background: #16213e !important; color: #e0e0e0 !important; }
        body.dark-mode .cardTitle { color: #4da6ff !important; }
        body.dark-mode .formInput { background: #0d0d1a !important; color: #e0e0e0 !important; border-color: #555 !important; }
        body.dark-mode .formTextArea { background: #0d0d1a !important; color: #e0e0e0 !important; border-color: #555 !important; }
        body.dark-mode .formLabel { color: #e0e0e0 !important; }
        body.dark-mode .pageTitle { color: #e0e0e0 !important; }
        body.dark-mode .orderItem { border-color: #444 !important; }
        body.dark-mode .orderItemName { color: #e0e0e0 !important; }
        body.dark-mode .summaryRow { color: #e0e0e0 !important; }
        body.dark-mode .summaryTotal { color: #e0e0e0 !important; border-color: #555 !important; }
        body.dark-mode .secureText { color: #aaa !important; }
        body.dark-mode .paymentOption { color: #e0e0e0 !important; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <span>NEXTGEN TECH STORE</span>
            <div>
                <a href="BuyerStore.aspx">Home</a>
                <a href="Default.aspx">Logout</a>
                <button id="btnThemeToggle" onclick="toggleTheme()"
                    style="background:transparent; color:white; border:1px solid white;
                           padding:6px 14px; border-radius:5px; cursor:pointer;
                           font-size:14px; margin-left:20px;">
                    🌙 Dark Mode
                </button>
            </div>
        </div>
        <div class="pageTitle">Checkout</div>
        <div class="checkoutContainer">
            <div class="leftPanel">
                <div class="card">
                    <div class="cardTitle">1. Shipping Details</div>
                    <span class="formLabel">Full Name</span>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="formInput" placeholder="Enter your full name"></asp:TextBox>
                    <span class="formLabel">Email</span>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="formInput" placeholder="Enter your email"></asp:TextBox>
                    <span class="formLabel">Address</span>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="formTextArea" TextMode="MultiLine" Rows="2" placeholder="Enter your address"></asp:TextBox>
                    <span class="formLabel">City</span>
                    <asp:TextBox ID="txtCity" runat="server" CssClass="formInput" placeholder="Enter your city"></asp:TextBox>
                    <span class="formLabel">Postal Code</span>
                    <asp:TextBox ID="txtPostalCode" runat="server" CssClass="formInput" placeholder="Enter postal code"></asp:TextBox>
                    <span class="formLabel">Phone Number</span>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="formInput" placeholder="Enter your phone number"></asp:TextBox>
                </div>
                <div class="card">
                    <div class="cardTitle">2. Payment Method</div>
                    <div class="paymentOption">
                        <asp:RadioButton ID="rdoCreditCard" runat="server" GroupName="payment" Text="Credit / Debit Card" Checked="true" />
                    </div>
                    <div class="paymentOption">
                        <asp:RadioButton ID="rdoPayFast" runat="server" GroupName="payment" Text="PayFast" />
                    </div>
                    <div class="paymentOption">
                        <asp:RadioButton ID="rdoCashOnDelivery" runat="server" GroupName="payment" Text="Cash on Delivery" />
                    </div>
                </div>
            </div>
            <div class="rightPanel">
                <div class="card">
                    <div class="cardTitle">Order Summary</div>
                    <asp:Repeater ID="rptOrderItems" runat="server">
                        <ItemTemplate>
                            <div class="orderItem">
                                <div>
                                    <div class="orderItemName"><%# Eval("ProductName") %></div>
                                    <div class="orderItemQty">Qty: <%# Eval("Quantity") %></div>
                                </div>
                                <div class="orderItemPrice">R<%# Eval("Price") %></div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <div class="summaryRow">
                        <span>Subtotal</span>
                        <span>R<asp:Label ID="lblSubtotal" runat="server" Text="0"></asp:Label></span>
                    </div>
                    <div class="summaryRow">
                        <span>Shipping</span>
                        <span>R100</span>
                    </div>
                    <div class="summaryTotal">
                        <span>Total</span>
                        <span>R<asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label></span>
                    </div>
                    <p class="secureText">🔒 Your payment information is secure.</p>
                    <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" CssClass="btnPlaceOrder" OnClick="btnPlaceOrder_Click" />
                </div>
            </div>
        </div>
        <div class="footer">© 2026 NextGen Tech Store</div>
    </form>
</body>
</html>