<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Admin.aspx.cs"
    Inherits="EcommerceWebApp.Admin" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <title>Admin Dashboard</title>

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

.main{
    width:95%;
    margin:auto;
    padding:30px 0;
}

.topbar{
    background:white;
    border-radius:22px;
    padding:25px 35px;
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

.logoutbtn{
    background:linear-gradient(to right,#ef4444,#dc2626);
    color:white;
    border:none;
    padding:12px 24px;
    border-radius:14px;
    cursor:pointer;
    font-size:16px;
    font-weight:bold;
    transition:0.3s;
}

.logoutbtn:hover{
    transform:translateY(-2px);
    box-shadow:0px 10px 20px rgba(239,68,68,0.3);
}

.cards{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:25px;
    margin-top:35px;
}

.card{
    background:white;
    padding:30px;
    border-radius:22px;
    box-shadow:0px 5px 20px rgba(0,0,0,0.08);
    transition:0.3s;
}

.card:hover{
    transform:translateY(-5px);
}

.cardtitle{
    font-size:22px;
    color:#374151;
}

.cardvalue{
    margin-top:20px;
    font-size:42px;
    font-weight:bold;
    color:#2563eb;
}

.section{
    margin-top:40px;
    background:white;
    padding:35px;
    border-radius:25px;
    box-shadow:0px 5px 20px rgba(0,0,0,0.08);
}

.sectiontitle{
    font-size:34px;
    font-weight:bold;
    margin-bottom:30px;
    color:#111827;
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

.btns{
    display:flex;
    gap:18px;
    margin-top:25px;
}

.actionbtn{
    height:52px;
    border:none;
    border-radius:14px;
    padding:0 28px;
    color:white;
    font-size:16px;
    font-weight:bold;
    cursor:pointer;
    transition:0.3s;
}

.addbtn{
    background:linear-gradient(to right,#2563eb,#1d4ed8);
}

.updatebtn{
    background:linear-gradient(to right,#7c3aed,#6d28d9);
}

.searchbtn{
    background:linear-gradient(to right,#059669,#047857);
    margin-top:18px;
}

.actionbtn:hover{
    transform:translateY(-2px);
    box-shadow:0px 10px 20px rgba(0,0,0,0.15);
}

.grid{
    width:100%;
    margin-top:30px;
    border-collapse:collapse;
    overflow:hidden;
    border-radius:18px;
}

.grid th{
    background:linear-gradient(to right,#2563eb,#7c3aed);
    color:white;
    padding:18px;
    font-size:17px;
}

.grid td{
    background:white;
    padding:18px;
    text-align:center;
    border-bottom:1px solid #e5e7eb;
    font-size:16px;
}

.grid tr:hover td{
    background:#f9fafb;
}

.smallbtn{
    border:none;
    padding:10px 18px;
    border-radius:10px;
    color:white;
    font-weight:bold;
    cursor:pointer;
    margin:0 4px;
}

.editbtn{
    background:#2563eb;
}

.deletebtn{
    background:#ef4444;
}

</style>

</head>

<body>

<form id="form1" runat="server">

<div class="main">

    <div class="topbar">

        <div class="logo">
            ⚡ Admin Dashboard
        </div>

        <asp:Button ID="btnLogout"
            runat="server"
            Text="Logout"
            CssClass="logoutbtn"
            OnClick="btnLogout_Click" />

    </div>

    <div class="cards">

        <div class="card">

            <div class="cardtitle">
                Total Products
            </div>

            <div class="cardvalue">

                <asp:Label ID="lblProducts"
                    runat="server">
                </asp:Label>

            </div>

        </div>

        <div class="card">

            <div class="cardtitle">
                Total Users
            </div>

            <div class="cardvalue">

                <asp:Label ID="lblUsers"
                    runat="server">
                </asp:Label>

            </div>

        </div>

    </div>

    <div class="section">

        <div class="sectiontitle">
            Manage Products
        </div>

        <asp:TextBox ID="txtName"
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

        <div class="btns">

            <asp:Button ID="btnAdd"
                runat="server"
                Text="Add Product"
                CssClass="actionbtn addbtn"
                OnClick="btnAdd_Click" />

            <asp:Button ID="btnUpdate"
                runat="server"
                Text="Update Product"
                CssClass="actionbtn updatebtn"
                OnClick="btnUpdate_Click" />

        </div>

        <asp:TextBox ID="txtSearch"
            runat="server"
            CssClass="txt"
            placeholder="Search Product">
        </asp:TextBox>

        <asp:Button ID="btnSearch"
            runat="server"
            Text="Search"
            CssClass="actionbtn searchbtn"
            OnClick="btnSearch_Click" />

        <asp:GridView ID="GridView1"
            runat="server"
            AutoGenerateColumns="False"
            CssClass="grid"
            DataKeyNames="Id"
            OnRowCommand="GridView1_RowCommand">

            <Columns>

                <asp:BoundField DataField="Id"
                    HeaderText="ID" />

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
                            CssClass="smallbtn editbtn"
                            CommandName="EditProduct"
                            CommandArgument='<%# Eval("Id") %>' />

                        <asp:Button ID="btnDelete"
                            runat="server"
                            Text="Delete"
                            CssClass="smallbtn deletebtn"
                            CommandName="DeleteProduct"
                            CommandArgument='<%# Eval("Id") %>' />

                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>

        </asp:GridView>

    </div>

</div>

</form>

</body>
</html>