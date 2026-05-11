<%@ Page Title="Home Page"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Default.aspx.cs"
    Inherits="EcommerceWebApp._Default" %>

<asp:Content ID="BodyContent"
    ContentPlaceHolderID="MainContent"
    runat="server">

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

    .topbar{
        width:100%;
        background:white;
        padding:20px 40px;
        border-radius:20px;
        margin-top:25px;
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

    .rightmenu{
        display:flex;
        align-items:center;
        gap:20px;
    }

    .welcome{
        font-size:17px;
        color:#111827;
        font-weight:600;
    }

    .btn{
        background:linear-gradient(to right,#2563eb,#1d4ed8);
        border:none;
        color:white;
        padding:12px 22px;
        border-radius:12px;
        cursor:pointer;
        font-size:15px;
        font-weight:600;
        transition:0.3s;
    }

    .btn:hover{
        transform:translateY(-2px);
        box-shadow:0px 10px 20px rgba(37,99,235,0.3);
    }

    .products{
        margin-top:40px;
        display:grid;
        grid-template-columns:repeat(auto-fit,minmax(270px,1fr));
        gap:30px;
    }

    .card{
        background:white;
        border-radius:25px;
        padding:25px;
        text-align:center;
        box-shadow:0px 5px 20px rgba(0,0,0,0.08);
        transition:0.3s;
        position:relative;
        overflow:hidden;
    }

    .card:hover{
        transform:translateY(-8px);
        box-shadow:0px 15px 30px rgba(0,0,0,0.12);
    }

    .card::before{
        content:'';
        position:absolute;
        top:0;
        left:0;
        width:100%;
        height:6px;
        background:linear-gradient(to right,#2563eb,#7c3aed);
    }

    .productimg{
        width:180px;
        height:180px;
        object-fit:contain;
        margin-bottom:15px;
    }

    .name{
        font-size:30px;
        font-weight:bold;
        color:#111827;
        margin-top:10px;
    }

    .price{
        margin-top:12px;
        font-size:28px;
        font-weight:bold;
        color:#16a34a;
    }

    .qtybox{
        display:flex;
        justify-content:center;
        align-items:center;
        gap:18px;
        margin-top:22px;
    }

    .qtybtn{
        width:48px;
        height:48px;
        border:none;
        border-radius:50%;
        background:#eff6ff;
        color:#2563eb;
        font-size:26px;
        font-weight:bold;
        cursor:pointer;
        transition:0.3s;
    }

    .qtybtn:hover{
        background:#2563eb;
        color:white;
    }

    .qtylabel{
        font-size:30px;
        font-weight:bold;
        color:#111827;
        min-width:35px;
    }

    .cartbtn{
        width:100%;
        margin-top:25px;
        height:55px;
        border:none;
        border-radius:15px;
        background:linear-gradient(to right,#2563eb,#7c3aed);
        color:white;
        font-size:18px;
        font-weight:bold;
        cursor:pointer;
        transition:0.3s;
    }

    .cartbtn:hover{
        transform:scale(1.02);
        box-shadow:0px 12px 25px rgba(37,99,235,0.3);
    }

    .maincontainer{
        width:95%;
        margin:auto;
    }

</style>

<div class="maincontainer">

    <div class="topbar">

        <div class="logo">
            🛒 NeoCart
        </div>

       <div class="rightmenu">

    <div class="welcome">

        Welcome,
        <asp:Label ID="lblUser"
            runat="server">
        </asp:Label>

    </div>

    <asp:Button ID="btnMyOrders"
        runat="server"
        Text="📦 My Orders"
        CssClass="btn"
        OnClick="btnMyOrders_Click" />

    <asp:Button ID="btnViewCart"
        runat="server"
        Text="🛍 Cart"
        CssClass="btn"
        OnClick="btnViewCart_Click" />

    <asp:Button ID="btnLogout"
        runat="server"
        Text="Logout"
        CssClass="btn"
        OnClick="btnLogout_Click" />

</div>

    </div>

    <div class="products">

        <asp:Repeater ID="Repeater1"
            runat="server">

            <ItemTemplate>

                <div class="card">

                    <img src='<%# Eval("ImageUrl") %>'
                        class="productimg" />

                    <div class="name">
                        <%# Eval("ProductName") %>
                    </div>

                    <div class="price">
                        ₹ <%# Eval("Price") %>
                    </div>

                    <div class="qtybox">

                        <asp:Button ID="btnMinus"
                            runat="server"
                            Text="-"
                            CssClass="qtybtn"
                            OnClick="btnMinus_Click" />

                        <asp:Label ID="lblQty"
                            runat="server"
                            CssClass="qtylabel"
                            Text='<%# Eval("CartQty") %>'>
                        </asp:Label>

                        <asp:Button ID="btnPlus"
                            runat="server"
                            Text="+"
                            CssClass="qtybtn"
                            OnClick="btnPlus_Click" />

                    </div>

                    <asp:Button ID="btnCart"
                        runat="server"
                        Text="Add To Cart"
                        CssClass="cartbtn"
                        CommandArgument='<%# Eval("ProductName") %>'
                        OnClick="btnCart_Click" />

                </div>

            </ItemTemplate>

        </asp:Repeater>

    </div>

</div>

</asp:Content>