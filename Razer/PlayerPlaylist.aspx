<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlayerPlaylist.aspx.cs" Inherits="Razer.PlayerPlaylist" %>

<%@ Import Namespace="Entity" %>
<%@ Import Namespace="DAL" %>
<%@ Import Namespace="System.Collections.Generic" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <style>
        #PlaylistContent {
            border: 2px solid #CCC;
            border-radius: 2px;
            width: 100%;
            background: #CCC;
            max-height: 400px;
            overflow: scroll;
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
            #PlaylistView {
                display: block;
                width: 100%;
                padding-left: 0px;
                padding-right: 0px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="PlaylistContent">
            <%--Playlist not existed--%>
            <%if (PlayingList == null || PlayingList.Count == 0)
                      {
            %>
            <div class="playlist-item-text">Playlist is empty! :")</div>
            <%
                }
            %>
            <%--Load playlist--%>
            <%if (PlayingList != null && PlayingList.Count > 0)
                      {
            %>
            <%foreach (Song song in PlayingList)
                      {
            %>
            <div class="playlist-item" onclick="playSong(<%=song.ID %>);">
                <div class="playlist-item-text"><%=song.Title %>-<%=song.FilePath %></div>
            </div>
            <%
                }
            %>
            <%
                }
            %>
        </div>
    </form>
</body>
</html>
