<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Checkout.aspx.cs"
    Inherits="EcommerceWebApp.Checkout" %>

<!DOCTYPE html>

<html>
<head runat="server">

<title>Checkout</title>

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

.layout{
    margin-top:35px;
    display:grid;
    grid-template-columns:2fr 1fr;
    gap:30px;
}

.box{
    background:white;
    border-radius:25px;
    padding:30px;
    box-shadow:0px 5px 20px rgba(0,0,0,0.08);
}

.title{
    font-size:30px;
    font-weight:bold;
    margin-bottom:25px;
}

.txt{
    width:100%;
    height:58px;
    border:none;
    background:#f3f4f6;
    border-radius:14px;
    padding-left:18px;
    font-size:16px;
    margin-top:18px;
    outline:none;
}

.txt:focus{
    border:2px solid #2563eb;
    background:white;
}

textarea{
    padding-top:15px;
    resize:none;
}

.payment{
    margin-top:25px;
}

.payment label{
    display:block;
    margin-top:18px;
    font-size:18px;
}

.summaryrow{
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

.placebtn{
    width:100%;
    height:60px;
    border:none;
    border-radius:16px;
    margin-top:30px;
    background:linear-gradient(to right,#2563eb,#7c3aed);
    color:white;
    font-size:20px;
    font-weight:bold;
    cursor:pointer;
    transition:0.3s;
}

.placebtn:hover{
    transform:translateY(-2px);
    box-shadow:0px 12px 25px rgba(37,99,235,0.3);
}

.item{
    display:flex;
    justify-content:space-between;
    margin-top:18px;
    font-size:18px;
}

</style>

</head>

<body>

<form id="form1" runat="server">

<div class="container">

    <div class="topbar">

        <div class="logo">
            💳 Checkout
        </div>

    </div>

    <div class="layout">

        <!-- LEFT -->

        <div class="box">

            <div class="title">
                Billing Details
            </div>

            <asp:TextBox ID="txtName"
                runat="server"
                CssClass="txt"
                placeholder="Full Name">
            </asp:TextBox>

            <asp:TextBox ID="txtPhone"
                runat="server"
                CssClass="txt"
                placeholder="Phone Number">
            </asp:TextBox>

            <asp:TextBox ID="txtAddress"
                runat="server"
                CssClass="txt"
                TextMode="MultiLine"
                Rows="5"
                placeholder="Delivery Address">
            </asp:TextBox>

            <div class="payment">

                <div class="title" style="font-size:26px;">
                    Payment Method
                </div>

                <label>
                    <asp:RadioButton ID="rbCash"
                        runat="server"
                        GroupName="pay"
                        Checked="true" />

                    Cash On Delivery
                </label>

                <label>
                    <asp:RadioButton ID="rbUPI"
                        runat="server"
                        GroupName="pay" />

                    UPI Payment
                </label>

                <label>
                    <asp:RadioButton ID="rbCard"
                        runat="server"
                        GroupName="pay" />

                    Credit / Debit Card
                </label>

            </div>

        </div>

        <!-- RIGHT -->

        <div class="box">

            <div class="title">
                Order Summary
            </div>

            <asp:Repeater ID="Repeater1"
                runat="server">

                <ItemTemplate>

                    <div class="item">

                        <span>
                            <%# Eval("ProductName") %>
                            ×
                            <%# Eval("Quantity") %>
                        </span>

                        <span>
                            ₹ <%# Eval("SubTotal") %>
                        </span>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

            <div class="summaryrow total">

                <span>Total</span>

                <asp:Label ID="lblTotal"
                    runat="server">
                </asp:Label>

            </div>

            <asp:Button ID="btnPlaceOrder"
                runat="server"
                Text="Place Order"
                CssClass="placebtn"
                OnClick="btnPlaceOrder_Click" />

        </div>

    </div>

</div>

</form>

</body>
</html>