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

        .header {
            background-color: #2563eb;
            color: white;
            padding: 20px;
            border-radius: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }

        .title {
            margin: 0;
            font-size: 28px;
        }

        .products {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin-top: 30px;
        }

        .card {
            width: 250px;
            background-color: white;
            margin: 15px;
            padding: 15px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
        }

        .card img {
            width: 150px;
            height: 150px;
            object-fit: contain;
        }

        .name {
            font-size: 22px;
            font-weight: bold;
            margin-top: 10px;
        }

        .price {
            color: green;
            font-size: 20px;
            margin-top: 10px;
        }

        .btn {
            background-color: #2563eb;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            margin-top: 15px;
            cursor: pointer;
            font-size: 16px;
        }

        .qtybtn {
            background-color: #2563eb;
            color: white;
            border: none;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            cursor: pointer;
            font-size: 20px;
            font-weight: bold;
        }

        .qtylabel {
            font-size: 22px;
            font-weight: bold;
            margin-left: 15px;
            margin-right: 15px;
        }

    </style>

    <div class="header">

        <h2 class="title">
            Simple E-Commerce Store
        </h2>

        <div>

            Welcome,
            <asp:Label ID="lblUser"
                runat="server"
                Font-Bold="true">
            </asp:Label>

            <asp:Button ID="btnViewCart"
                runat="server"
                Text="View Cart"
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

        <asp:Repeater ID="Repeater1" runat="server">

            <ItemTemplate>

                <div class="card">

                    <img src='<%# Eval("ImageUrl") %>'
                        alt="Product" />

                    <div class="name">
                        <%# Eval("ProductName") %>
                    </div>

                    <div class="price">
                        ₹ <%# Eval("Price") %>
                    </div>

                    <div style="margin-top:15px;">

                        <asp:Button ID="btnMinus"
                            runat="server"
                            Text="-"
                            CssClass="qtybtn"
                            OnClick="btnMinus_Click" />

                        <asp:Label ID="lblQty"
                            runat="server"
                            Text='<%# Eval("CartQty") %>'
                            CssClass="qtylabel">
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
                        CssClass="btn"
                        CommandArgument='<%# Eval("ProductName") %>'
                        OnClick="btnCart_Click" />

                </div>

            </ItemTemplate>

        </asp:Repeater>

    </div>

</asp:Content>