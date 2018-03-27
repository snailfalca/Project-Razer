<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlaylistView.aspx.cs" Inherits="Razer.PlaylistView" %>

<%@ Import Namespace="Entity" %>
<%@ Import Namespace="DAL" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <style>
        #PlaylistContent {
            width: 80%;
            margin: auto;
        }

        .playlist-item {
            display: block;
            box-sizing: border-box;
            padding: 0px;
            margin: 0px;
            width: 100%;
        }

            .playlist-item:nth-child(odd) {
                background-color: lightgray;
            }

            .playlist-item:nth-child(even) {
                background-color: white;
            }

        .playlist-item-text {
            padding: 5px;
        }

        .playlist-item:hover {
            cursor: pointer;
            color: white;
            background-color: gray;
        }

        @media screen and (max-width: 850px) {
            #PlaylistContent {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="PlaylistContent">

            <%foreach (Song song in new PlaylistDAO().Get(1).Songs)
                {
            %>
            <div class="playlist-item">
                <div class="playlist-item-text"><%=song.Title %>-<%=song.FilePath %></div>
            </div>
            <%
                }

            %>
        </div>
    </form>
</body>
</html>--%>
