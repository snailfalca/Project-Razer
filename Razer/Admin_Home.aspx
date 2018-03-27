<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Home.aspx.cs" Inherits="Razer.Trash.Admin_Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        a {
            text-decoration: none;
        }
        div{
            width: 60%;
            margin: auto;
        }

        input {
            width: 100%;
            margin-bottom: 10px;
            height: 30px;
            border-radius: 2px;
            background: none;
            border: 1px solid lightgray;
            font-weight: bold;
        }

        input:hover{
            opacity: 0.6;
        }

        .nav-button{
            width: 100px;            
            background-color: #dddddd;
        }
    </style>
</head>
<body>
    <%-- Navigate --%>
    <div>
        <a href="HomeV2.aspx"><input type="button" class="nav-button" value="Home"/></a>
        <a href="Admin_Home.aspx"><input type="button" class="nav-button" value="Admin home"/></a>
        <a href="Admin_AddSong.aspx"><input type="button" class="nav-button" value="Songs"/></a>
        <a href="Admin_Artists.aspx"><input type="button" class="nav-button" value="Artists"/></a>
    </div>
    <form id="form1" runat="server">

    </form>
</body>
</html>
