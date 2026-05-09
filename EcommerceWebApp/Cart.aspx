<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Cart.aspx.cs"
    Inherits="EcommerceWebApp.Cart" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <title>Shopping Cart</title>

    <style>

        body {
            font-family: Arial;
            background: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        .header {
            background: #2563eb;
            color: white;
            padding: 20px;
            border-radius: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .title {
            margin: 0;
            font-size: 30px;
        }

        .btn {
            background: white;
            color: #2563eb;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
        }

        .container {
            background: white;
            margin-top: 30px;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
        }

        .carttitle {
            font-size: 28px;
            margin-bottom: 20px;
        }

        .grid {
            width: 100%;
            border-collapse: collapse;
        }

        .grid th {
            background: #2563eb;
            color: white;
            padding: 15px;
            text-align: center;
        }

        .grid td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        .deletebtn {
            background: red;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 6px;
            cursor: pointer;
        }

        .deletebtn:hover {
            background: darkred;
        }

        .empty {
            text-align: center;
            font-size: 25px;
            color: gray;
            padding: 50px;
        }

        .footer {
            margin-top: 20px;
            text-align: right;
        }

        .clearbtn {
            background: #111827;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 8px;
            cursor: pointer;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

    <div class="header">

        <h2 class="title">
            Shopping Cart
        </h2>

        <asp:Button ID="btnContinue"
            runat="server"
            Text="Continue Shopping"
            CssClass="btn"
            OnClick="btnContinue_Click" />

    </div>

    <div class="container">

        <h2 class="carttitle">
            Added Cart Items
        </h2>

        <asp:GridView ID="GridView1"
            runat="server"
            AutoGenerateColumns="False"
            CssClass="grid"
            Width="100%"
            OnRowCommand="GridView1_RowCommand"
            EmptyDataText="Your cart is empty">

            <Columns>

                <asp:BoundField DataField="ProductName"
                    HeaderText="Product Name" />

                <asp:BoundField DataField="Quantity"
                    HeaderText="Quantity" />

                <asp:TemplateField HeaderText="Action">

                    <ItemTemplate>

                        <asp:Button ID="btnDelete"
                            runat="server"
                            Text="Delete"
                            CssClass="deletebtn"
                            CommandName="DeleteItem"
                            CommandArgument='<%# Container.DataItemIndex %>' />

                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>

        </asp:GridView>

        <div class="footer">

            <asp:Button ID="btnClearCart"
                runat="server"
                Text="Clear Cart"
                CssClass="clearbtn"
                OnClick="btnClearCart_Click" />

        </div>

    </div>

</form>

</body>
</html>