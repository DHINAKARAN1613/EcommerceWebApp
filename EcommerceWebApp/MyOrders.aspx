<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="MyOrders.aspx.cs"
    Inherits="EcommerceWebApp.MyOrders" %>

<!DOCTYPE html>

<html>
<head runat="server">

<title>My Orders</title>

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

.btn{
    background:linear-gradient(to right,#2563eb,#7c3aed);
    color:white;
    border:none;
    padding:12px 22px;
    border-radius:14px;
    cursor:pointer;
    font-size:16px;
    font-weight:bold;
}

.orders{
    margin-top:35px;
    display:flex;
    flex-direction:column;
    gap:25px;
}

.card{
    background:white;
    border-radius:25px;
    padding:25px;
    box-shadow:0px 5px 20px rgba(0,0,0,0.08);
    transition:0.3s;
}

.card:hover{
    transform:translateY(-4px);
}

.row{
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.left{
    display:flex;
    gap:20px;
    align-items:center;
}

.productimg{
    width:120px;
    height:120px;
    object-fit:contain;
    background:#f8fafc;
    border-radius:18px;
    padding:10px;
}

.name{
    font-size:30px;
    font-weight:bold;
    color:#111827;
}

.info{
    margin-top:10px;
    color:#6b7280;
    font-size:18px;
}

.price{
    margin-top:10px;
    font-size:28px;
    font-weight:bold;
    color:#16a34a;
}

.date{
    margin-top:14px;
    color:gray;
    font-size:16px;
}

.status{
    background:#dcfce7;
    color:#16a34a;
    padding:12px 22px;
    border-radius:30px;
    font-weight:bold;
    font-size:16px;
    text-align:center;
    display:inline-block;
    min-width:170px;
}

.cancelbtn{
    margin-top:15px;
    background:#ef4444;
    color:white;
    border:none;
    padding:14px 20px;
    border-radius:14px;
    cursor:pointer;
    font-weight:bold;
    width:170px;
    font-size:15px;
    transition:0.3s;
}

.cancelbtn:hover{
    transform:translateY(-2px);
    box-shadow:0px 8px 18px rgba(239,68,68,0.3);
}

.empty{
    text-align:center;
    margin-top:120px;
    font-size:38px;
    color:gray;
}

</style>

</head>

<body>

<form id="form1" runat="server">

<div class="container">

    <div class="topbar">

        <div class="logo">
            📦 My Orders
        </div>

        <asp:Button ID="btnHome"
            runat="server"
            Text="← Continue Shopping"
            CssClass="btn"
            PostBackUrl="~/Default.aspx" />

    </div>

    <div class="orders">

        <asp:Repeater ID="Repeater1"
            runat="server">

            <ItemTemplate>

                <div class="card">

                    <div class="row">

                        <div class="left">

                            <img src='<%# Eval("ImageUrl") %>'
                                class="productimg" />

                            <div>

                                <div class="name">
                                    <%# Eval("ProductName") %>
                                </div>

                                <div class="info">
                                    Quantity :
                                    <%# Eval("Quantity") %>
                                </div>

                                <div class="info">
                                    Payment :
                                    <%# Eval("PaymentMethod") %>
                                </div>

                                <div class="price">
                                    ₹ <%# Eval("Price") %>
                                </div>

                                <div class="date">
                                    Ordered on :
                                    <%# Eval("OrderDate") %>
                                </div>

                            </div>

                        </div>

                        <!-- RIGHT SIDE -->

                        <div style="text-align:right; min-width:220px;">

                            <div class="status">

                                <%# Eval("OrderStatus") %>

                            </div>

                            <br />

                            <asp:Button ID="btnCancel"
                                runat="server"
                                Text="❌ Cancel Order"
                                CssClass="cancelbtn"
                                Visible='<%# Eval("OrderStatus").ToString() == "Order Placed" %>'
                                CommandArgument='<%# Eval("Id") %>'
                                OnClick="btnCancel_Click" />

                        </div>

                    </div>

                </div>

            </ItemTemplate>

        </asp:Repeater>

        <asp:Label ID="lblEmpty"
            runat="server"
            CssClass="empty"
            Visible="false"
            Text="📦 No Orders Yet">
        </asp:Label>

    </div>

</div>

</form>

</body>
</html>