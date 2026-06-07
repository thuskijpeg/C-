<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThankYou.aspx.cs" Inherits="Project_3.ThankYou" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thank You</title>
    <script src="theme.js" type="text/javascript"></script>
    <style>
        body { font-family: Segoe UI; background: #f5f5f5; margin: 0; }
        .navbar { background: #08162d; color: white; padding: 15px; font-size: 22px; font-weight: bold; display: flex; justify-content: space-between; align-items: center; }
        .navbar a { color: white; text-decoration: none; font-size: 15px; margin-left: 20px; }
        .navbar a:hover { text-decoration: underline; }
        .thankYouContainer { text-align: center; padding: 60px 20px; }
        .checkIcon { font-size: 80px; color: #28a745; margin-bottom: 20px; }
        .thankYouTitle { font-size: 40px; font-weight: bold; color: #08162d; margin-bottom: 10px; }
        .thankYouSubtitle { font-size: 20px; color: gray; margin-bottom: 30px; }
        .orderCard { background: white; border-radius: 10px; padding: 30px; box-shadow: 0px 2px 5px rgba(0,0,0,0.1); max-width: 500px; margin: 0 auto 30px auto; text-align: left; }
        .orderCardTitle { font-size: 18px; font-weight: bold; color: #08162d; margin-bottom: 15px; }
        .orderDetail { display: flex; justify-content: space-between; padding: 8px 0; border-bottom: 1px solid #eee; font-size: 15px; }
        .orderDetailLabel { color: gray; }
        .orderDetailValue { font-weight: bold; }
        .messageBox { background: #e8f4fd; border-left: 5px solid #0056ff; padding: 20px; border-radius: 5px; max-width: 500px; margin: 0 auto 30px auto; text-align: left; font-size: 15px; color: #333; line-height: 1.8; }
        .btnContinue { background: #0056ff; color: white; border: none; padding: 15px 40px; border-radius: 5px; font-size: 18px; font-weight: bold; cursor: pointer; margin: 5px; }
        .btnContinue:hover { background: #003ec7; }
        .btnHome { background: #08162d; color: white; border: none; padding: 15px 40px; border-radius: 5px; font-size: 18px; font-weight: bold; cursor: pointer; margin: 5px; }
        .btnHome:hover { background: #333; }
        .footer { background: #08162d; color: white; text-align: center; padding: 12px; margin-top: 30px; font-size: 14px; }
        /* DARK MODE */
        body.dark-mode { background: #1a1a2e !important; color: #e0e0e0 !important; }
        body.dark-mode .navbar { background: #0d0d1a !important; }
        body.dark-mode .thankYouTitle { color: #e0e0e0 !important; }
        body.dark-mode .thankYouSubtitle { color: #aaa !important; }
        body.dark-mode .orderCard { background: #16213e !important; color: #e0e0e0 !important; }
        body.dark-mode .orderCardTitle { color: #4da6ff !important; }
        body.dark-mode .orderDetail { border-color: #444 !important; }
        body.dark-mode .orderDetailLabel { color: #aaa !important; }
        body.dark-mode .orderDetailValue { color: #e0e0e0 !important; }
        body.dark-mode .messageBox { background: #0d0d1a !important; color: #e0e0e0 !important; border-color: #0056ff !important; }
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
        <div class="thankYouContainer">
            <div class="checkIcon">✔</div>
            <div class="thankYouTitle">Thank You for Your Order!</div>
            <div class="thankYouSubtitle">Your order has been placed successfully.</div>
            <div class="orderCard">
                <div class="orderCardTitle">Order Details</div>
                <div class="orderDetail">
                    <span class="orderDetailLabel">Order Number</span>
                    <span class="orderDetailValue"><asp:Label ID="lblOrderNumber" runat="server" Text=""></asp:Label></span>
                </div>
                <div class="orderDetail">
                    <span class="orderDetailLabel">Name</span>
                    <span class="orderDetailValue"><asp:Label ID="lblName" runat="server" Text=""></asp:Label></span>
                </div>
                <div class="orderDetail">
                    <span class="orderDetailLabel">Email</span>
                    <span class="orderDetailValue"><asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></span>
                </div>
                <div class="orderDetail">
                    <span class="orderDetailLabel">City</span>
                    <span class="orderDetailValue"><asp:Label ID="lblCity" runat="server" Text=""></asp:Label></span>
                </div>
                <div class="orderDetail">
                    <span class="orderDetailLabel">Payment Method</span>
                    <span class="orderDetailValue">Credit / Debit Card</span>
                </div>
            </div>
            <div class="messageBox">
                🎉 Thank you for shopping with <strong>NextGen Tech Store</strong>!<br />
                We truly appreciate your support and trust in us.<br />
                Your order is being processed and will be delivered soon.<br />
                A confirmation email will be sent to <strong><asp:Label ID="lblEmailMsg" runat="server" Text=""></asp:Label></strong>.<br /><br />
                We hope you enjoy your new tech! 🚀
            </div>
            <asp:Button ID="btnContinueShopping" runat="server" Text="Continue Shopping" CssClass="btnContinue" OnClick="btnContinueShopping_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Go to Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>
        <div class="footer">© 2026 NextGen Tech Store</div>
    </form>
</body>
</html>