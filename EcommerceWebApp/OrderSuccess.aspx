<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="OrderSuccess.aspx.cs"
    Inherits="EcommerceWebApp.OrderSuccess" %>

<!DOCTYPE html>

<html>
<head runat="server">

<title>Order Success</title>

<style>

body{
    font-family:'Segoe UI';
    background:#f1f5f9;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}

.box{
    width:550px;
    background:white;
    padding:50px;
    border-radius:25px;
    text-align:center;
    box-shadow:0px 5px 25px rgba(0,0,0,0.1);
}

.icon{
    font-size:90px;
}

.title{
    margin-top:20px;
    font-size:38px;
    font-weight:bold;
    color:#16a34a;
}

.msg{
    margin-top:18px;
    font-size:20px;
    color:#6b7280;
    line-height:32px;
}

.btn{
    margin-top:35px;
    width:100%;
    height:58px;
    border:none;
    border-radius:16px;
    background:linear-gradient(to right,#2563eb,#7c3aed);
    color:white;
    font-size:20px;
    font-weight:bold;
    cursor:pointer;
}

</style>

</head>

<body>

<form id="form1" runat="server">

<div class="box">

    <div class="icon">
        ✅
    </div>

    <div class="title">
        Order Placed Successfully
    </div>

    <div class="msg">

        Thank you for shopping with us.<br />

        Your order has been confirmed.

    </div>

    <asp:Button ID="btnHome"
        runat="server"
        Text="Continue Shopping"
        CssClass="btn"
        PostBackUrl="~/Default.aspx" />

</div>

</form>

</body>
</html>