<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="Razer.CreateAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Nunito');

        body {
            font-family: "Nunito";
            background-image: url("img/bgrd.png");
        }

        /* Full-width input fields */
        input[type=text], input[type=password], input[type=file],textarea, select {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            resize: none;
        }

        /* Set a style for all buttons */
        .button {
            font-weight: bold;
            background-color: #4CAF50;
            color: white;
            padding: 10px 18px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

            .button:hover {
                opacity: 0.8;
            }

        /* Extra styles for the cancel button */
        #btnCreateAccount {
            padding: 10px 18px;
            background-color: #5bc0de;
        }

        #btnForgot {
            padding: 10px 18px;
            background-color: #F44336;
        }
        /* Center the image and position the close button */
        .imgcontainer {
            text-align: center;
            margin: 24px 0 12px 0;
            position: relative;
        }

        img.avatar {
            width: 20%;
        }

        .container {
            padding: 15px;
        }

        span.psw {
            float: right;
            padding-top: 16px;
        }

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            padding-top: 60px;
        }

        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 20px auto auto;
            border: 1px solid #888;
            width: 80%;
        }

        @media screen and (max-width: 600px) {
            .modal-content {
                width: 100%;
                margin-left: 0px;
                margin-right: 0px;
            }

            .modal-content {
                margin: 100px auto auto;
            }
        }

        #AvatarUpload{
            padding: 2px;
        }
    </style>
</head>
<body>
    <form class="modal-content" runat="server">
        <div class="imgcontainer">
            <a href="HomeV2.aspx">
                <img src="img/ava.png" alt="Avatar" class="avatar" />
            </a>
        </div>

        <div class="container">
            <%--Email--%>
            <label for="uname"><b>Email</b></label>
            <asp:TextBox ID="TxtEmail" placeholder="Email..." AutoCompleteType="Email" runat="server" TextMode="SingleLine"></asp:TextBox>
            <%--Password--%>
            <label for="psw"><b>Password</b></label>
            <asp:TextBox ID="TxtPassword" placeholder="Password..." runat="server" TextMode="Password"></asp:TextBox>
            <%--Confirm password--%>
            <label for="psw"><b>Confirm password</b></label>
            <asp:TextBox ID="TxtConfirmPassword" placeholder="Confirm password..." runat="server" TextMode="Password"></asp:TextBox>
            <%--Name--%>
            <label for="uname"><b>Name</b></label>
            <asp:TextBox ID="TxtName" placeholder="Name..." AutoCompleteType="Email" runat="server" TextMode="SingleLine"></asp:TextBox>
            <%--Gender--%>
            <label for="uname"><b>Gender</b></label>
            <asp:DropDownList ID="DropdownGender" runat="server">
                <asp:ListItem Text="Male" Selected="True" Value="1" />
                <asp:ListItem Text="Female" Value="2" />
            </asp:DropDownList>
            <%--Phone--%>
            <label for="psw"><b>Phone</b></label>
            <asp:TextBox ID="TxtPhone" placeholder="Phone..." runat="server" TextMode="SingleLine"></asp:TextBox>
            <%--Address--%>
            <label for="psw"><b>Address</b></label>
            <asp:TextBox ID="TxtAddress" placeholder="Address..." runat="server" TextMode="MultiLine"></asp:TextBox>
            <%--Avatar--%>
            <%--<label for="psw"><b>Cover image</b></label>
            <asp:FileUpload ID="AvatarUpload" runat="server" />--%>
            <%--Buttons--%>
            <asp:Button ID="btnCreateAccount" runat="server" Text="Create Account" CssClass="button" OnClick="btnCreateAccount_Click" />
            <asp:Button ID="btnForgot" runat="server" Text="Forgot password" CssClass="button" OnClick="btnForgot_Click" />
        </div>
    </form>
</body>
</html>
