<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="EcommerceWebApp.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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

        .btn {
            background: white;
            color: #2563eb;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
        }

        .dashboard {
            display: flex;
            gap: 20px;
            margin-top: 20px;
        }

        .card {
            background: white;
            width: 220px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
        }

        .count {
            font-size: 30px;
            font-weight: bold;
            color: #2563eb;
        }

        .container {
            background: white;
            margin-top: 30px;
            padding: 20px;
            border-radius: 10px;
        }

        .txt {
            width: 100%;
            padding: 12px;
            margin-top: 10px;
        }

        .actionbtn {
            background: #2563eb;
            color: white;
            border: none;
            padding: 10px 20px;
            margin-top: 10px;
            border-radius: 6px;
            cursor: pointer;
        }

        .grid {
            margin-top: 20px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Admin Dashboard</h2>

            <asp:Button ID="btnLogout"
                runat="server"
                Text="Logout"
                CssClass="btn"
                OnClick="btnLogout_Click" />
        </div>
        <div class="dashboard">

            <div class="card">

                <h3>Total Products</h3>

                <div class="count">
                    <asp:Label ID="lblProducts" runat="server"></asp:Label>
                </div>

            </div>

            <div class="card">

                <h3>Total Users</h3>

                <div class="count">
                    <asp:Label ID="lblUsers" runat="server"></asp:Label>
                </div>

            </div>

        </div>

        <div class="container">

            <h2>Manage Products</h2>

            <asp:HiddenField ID="hfId" runat="server" />

            <asp:TextBox ID="txtProductName"
                runat="server"
                CssClass="txt"
                placeholder="Product Name">
    </asp:TextBox>

            <asp:TextBox ID="txtPrice"
                runat="server"
                CssClass="txt"
                placeholder="Price">
    </asp:TextBox>

            <asp:TextBox ID="txtImage"
                runat="server"
                CssClass="txt"
                placeholder="Image URL">
    </asp:TextBox>

            <asp:Button ID="btnAdd"
                runat="server"
                Text="Add Product"
                CssClass="actionbtn"
                OnClick="btnAdd_Click" />

            <asp:Button ID="btnUpdate"
                runat="server"
                Text="Update Product"
                CssClass="actionbtn"
                OnClick="btnUpdate_Click" />

            <br />
            <br />

            <asp:TextBox ID="txtSearch"
                runat="server"
                CssClass="txt"
                placeholder="Search Product">
    </asp:TextBox>

            <asp:Button ID="btnSearch"
                runat="server"
                Text="Search"
                CssClass="actionbtn"
                OnClick="btnSearch_Click" />

            <asp:GridView ID="GridView1"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="grid"
                Width="100%"
                DataKeyNames="Id"
                OnRowCommand="GridView1_RowCommand">

                <Columns>

                    <asp:BoundField DataField="Id" HeaderText="ID" />

                    <asp:BoundField DataField="ProductName"
                        HeaderText="Product Name" />

                    <asp:BoundField DataField="Price"
                        HeaderText="Price" />

                    <asp:BoundField DataField="ImageUrl"
                        HeaderText="Image URL" />

                    <asp:TemplateField HeaderText="Actions">

                        <ItemTemplate>

                            <asp:Button ID="btnEdit"
                                runat="server"
                                Text="Edit"
                                CssClass="actionbtn"
                                CommandName="EditRow"
                                CommandArgument='<%# Eval("Id") %>' />

                            <asp:Button ID="btnDelete"
                                runat="server"
                                Text="Delete"
                                CssClass="actionbtn"
                                CommandName="DeleteRow"
                                CommandArgument='<%# Eval("Id") %>' />

                        </ItemTemplate>

                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>
    </form>
</body>
</html>
