<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs"
    Inherits="EcommerceWebApp.Login" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <title>Login</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI';
            height: 100vh;
            background: linear-gradient(135deg,#2563eb,#1e3a8a);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-box {
            width: 430px;
            background: white;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0px 10px 30px rgba(0,0,0,0.2);
        }

        .logo {
            text-align: center;
            font-size: 40px;
            margin-bottom: 10px;
        }

        .title {
            text-align: center;
            font-size: 32px;
            font-weight: bold;
            color: #111827;
            margin-bottom: 8px;
        }

        .subtitle {
            text-align: center;
            color: gray;
            margin-bottom: 30px;
            font-size: 15px;
        }

        .txt {
            width: 100%;
            height: 55px;
            border: 1px solid #ddd;
            border-radius: 12px;
            padding-left: 18px;
            font-size: 16px;
            margin-top: 18px;
            outline: none;
            transition: 0.3s;
        }

        .txt:focus {
            border-color: #2563eb;
            box-shadow: 0px 0px 8px rgba(37,99,235,0.3);
        }

        .role-container {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-top: 25px;
            font-size: 17px;
        }

        .radio-btn input {
            margin-right: 8px;
            transform: scale(1.2);
        }

        .btn {
            width: 100%;
            height: 55px;
            background: linear-gradient(to right,#2563eb,#1d4ed8);
            border: none;
            border-radius: 12px;
            color: white;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 30px;
            transition: 0.3s;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0px 8px 15px rgba(37,99,235,0.3);
        }

        .bottom-text {
            text-align: center;
            margin-top: 28px;
            font-size: 16px;
        }

        .bottom-text a {
            color: #2563eb;
            font-weight: bold;
            text-decoration: none;
        }

        .bottom-text a:hover {
            text-decoration: underline;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

    <div class="login-box">

        <div class="logo">
            🛒
        </div>

        <div class="title">
            Welcome Back
        </div>

        <div class="subtitle">
            Login to continue shopping
        </div>

        <asp:TextBox ID="txtEmail"
            runat="server"
            CssClass="txt"
            placeholder="Enter Email">
        </asp:TextBox>

        <asp:TextBox ID="txtPassword"
            runat="server"
            CssClass="txt"
            TextMode="Password"
            placeholder="Enter Password">
        </asp:TextBox>

        <div class="role-container">

            <label class="radio-btn">

                <asp:RadioButton ID="rbUser"
                    runat="server"
                    GroupName="Role"
                    Checked="true" />

                User

            </label>

            <label class="radio-btn">

                <asp:RadioButton ID="rbAdmin"
                    runat="server"
                    GroupName="Role" />

                Admin

            </label>

        </div>

        <asp:Button ID="btnLogin"
            runat="server"
            Text="Login"
            CssClass="btn"
            OnClick="btnLogin_Click" />

        <div class="bottom-text">

            Don't have an account?

            <a href="Register.aspx">
                Register
            </a>

        </div>

    </div>

</form>

</body>
</html>