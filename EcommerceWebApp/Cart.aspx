<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Cart.aspx.cs"
    Inherits="EcommerceWebApp.Cart" %>

<!DOCTYPE html>

<html>
<head runat="server">

<title>My Cart</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:'Segoe UI';
    background:#f1f5f9;
}

.container{
    width:95%;
    margin:auto;
    padding:30px 0;
}

.topbar{
    background:white;
    padding:25px 35px;
    border-radius:22px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0px 5px 20px rgba(0,0,0,0.08);
}

.logo{
    font-size:34px;
    font-weight:bold;
    background:linear-gradient(to right,#2563eb,#7c3aed);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

.topbtn{
    background:linear-gradient(to right,#2563eb,#1d4ed8);
    color:white;
    border:none;
    padding:12px 24px;
    border-radius:14px;
    cursor:pointer;
    font-size:16px;
    font-weight:bold;
}

.cartsection{
    margin-top:35px;
    display:grid;
    grid-template-columns:2fr 1fr;
    gap:30px;
}

.cartitems{
    background:white;
    padding:25px;
    border-radius:25px;
    box-shadow:0px 5px 20px rgba(0,0,0,0.08);
}

.sectiontitle{
    font-size:32px;
    font-weight:bold;
    margin-bottom:25px;
}

.item{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:20px;
    border-radius:18px;
    background:#f8fafc;
    margin-bottom:18px;
}

.left{
    display:flex;
    align-items:center;
    gap:18px;
}

.productimg{
    width:90px;
    height:90px;
    object-fit:contain;
    background:white;
    padding:10px;
    border-radius:14px;
}

.name{
    font-size:24px;
    font-weight:bold;
    color:#111827;
}

.price{
    margin-top:8px;
    color:#16a34a;
    font-size:20px;
    font-weight:bold;
}

.qtybox{
    display:flex;
    align-items:center;
    gap:15px;
}

.qtybtn{
    width:42px;
    height:42px;
    border:none;
    border-radius:50%;
    background:#2563eb;
    color:white;
    font-size:22px;
    font-weight:bold;
    cursor:pointer;
}

.qtylabel{
    font-size:24px;
    font-weight:bold;
}

.deletebtn{
    border:none;
    background:#ef4444;
    color:white;
    padding:12px 18px;
    border-radius:12px;
    cursor:pointer;
    font-weight:bold;
}

.summary{
    background:white;
    padding:30px;
    border-radius:25px;
    height:fit-content;
    box-shadow:0px 5px 20px rgba(0,0,0,0.08);
}

.summarytitle{
    font-size:30px;
    font-weight:bold;
    margin-bottom:30px;
}

.row{
    display:flex;
    justify-content:space-between;
    margin-top:18px;
    font-size:18px;
}

.total{
    margin-top:25px;
    padding-top:20px;
    border-top:2px solid #e5e7eb;
    font-size:28px;
    font-weight:bold;
}

.checkoutbtn{
    width:100%;
    height:58px;
    margin-top:30px;
    border:none;
    border-radius:16px;
    background:linear-gradient(to right,#2563eb,#7c3aed);
    color:white;
    font-size:20px;
    font-weight:bold;
    cursor:pointer;
}

.empty{
    text-align:center;
    padding:80px;
    font-size:30px;
    color:gray;
}

</style>

</head>

<body>

<form id="form1" runat="server">

<div class="container">

    <div class="topbar">

        <div class="logo">
            🛒 My Cart
        </div>

        <asp:Button ID="btnContinue"
            runat="server"
            Text="← Continue Shopping"
            CssClass="topbtn"
            OnClick="btnContinue_Click" />

    </div>

    <div class="cartsection">

        <div class="cartitems">

            <div class="sectiontitle">
                Shopping Cart
            </div>

            <asp:Repeater ID="Repeater1"
                runat="server">

                <ItemTemplate>

                    <div class="item">

                        <div class="left">

                            <img src='<%# Eval("ImageUrl") %>'
                                class="productimg" />

                            <div>

                                <div class="name">
                                    <%# Eval("ProductName") %>
                                </div>

                                <div class="price">
                                    ₹ <%# Eval("Price") %>
                                </div>

                            </div>

                        </div>

                        <div class="qtybox">

                            <asp:Button ID="btnMinus"
                                runat="server"
                                Text="-"
                                CssClass="qtybtn"
                                CommandArgument='<%# Eval("Id") %>'
                                OnClick="btnMinus_Click" />

                            <div class="qtylabel">
                                <%# Eval("Quantity") %>
                            </div>

                            <asp:Button ID="btnPlus"
                                runat="server"
                                Text="+"
                                CssClass="qtybtn"
                                CommandArgument='<%# Eval("Id") %>'
                                OnClick="btnPlus_Click" />

                        </div>

                        <asp:Button ID="btnDelete"
                            runat="server"
                            Text="Delete"
                            CssClass="deletebtn"
                            CommandArgument='<%# Eval("Id") %>'
                            OnClick="btnDelete_Click" />

                    </div>

                </ItemTemplate>

            </asp:Repeater>

            <asp:Label ID="lblEmpty"
                runat="server"
                CssClass="empty"
                Visible="false"
                Text="🛒 Your Cart is Empty">
            </asp:Label>

        </div>

        <div class="summary">

            <div class="summarytitle">
                Order Summary
            </div>

            <div class="row">

                <span>Total Items</span>

                <asp:Label ID="lblItems"
                    runat="server">
                </asp:Label>

            </div>

            <div class="row total">

                <span>Total</span>

                <asp:Label ID="lblTotal"
                    runat="server">
                </asp:Label>

            </div>

            <asp:Button ID="btnCheckout"
                runat="server"
                Text="Proceed To Checkout"
                CssClass="checkoutbtn" 
                OnClick="btnCheckout_Click"/>

        </div>

    </div>

</div>

</form>

</body>
</html>