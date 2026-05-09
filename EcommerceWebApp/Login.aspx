<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EcommerceWebApp.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        body {
            font-family: Arial;
            background: linear-gradient(to right,#1e3a8a,#2563eb);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .box {
            background: white;
            width: 400px;
            padding: 30px;
            border-radius: 15px;
        }

        h2 {
            text-align: center;
            color: #2563eb;
        }

        .txt {
            width: 100%;
            padding: 12px;
            margin-top: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }

        .btn {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background: #2563eb;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="box">
            <h2>User Login</h2>

            <asp:TextBox ID="txtEmail" runat="server" CssClass="txt" Placeholder="Email"></asp:TextBox>

            <asp:TextBox ID="txtPassword" runat="server" CssClass="txt" TextMode="Password" Placeholder="Password"></asp:TextBox>

            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />
        </div>

        <br />
        <br />

        <div style="text-align: center;">
            Don't have an account?

   

            <a href="Register.aspx"
                style="color: #2563eb; font-weight: bold; text-decoration: none;">Register

    </a>

        </div>


    </form>
</body>
</html>
