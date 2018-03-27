<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddToPlayListModal.aspx.cs" Inherits="Razer.AddToPlayListModal" %>

<%@ Import Namespace="DAL" %>
<%@ Import Namespace="Entity" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .atpm-playlist-container {
            height: 25px;
            border: 1px solid lightgray;
            border-radius: 2px;
            margin-bottom: 1px;
        }

            .atpm-playlist-container:hover {
                border-color: black;
            }

        .atpm-song-control-button {
            color: white;
            margin-top: 1px;
            margin-right: 2px;
            background: none;
            float: right;
            width: 70px;
            height: 23px;
            border-radius: 2px;
            border: 1px solid lightgray;
        }

            .atpm-song-control-button:hover {
                opacity: 0.6;
            }

        .atpm-playlist-title {
            margin-top: 2px;
            margin-left: 2px;
            display: inline-block;
        }

        #ATPMContainer {
            margin-top: 10px;
        }

        #ATPMAddPlaylistContainer{
            margin-top: 5px;
            height: 27px;
            display: flex;
        }
        #ATPMCreatePlaylistBtn {
            width: 100px;
        }

        #ATPMPlaylistNameSpan {
            flex-grow: 2;
        }
        
        #ATPMPlaylistName {
            margin-top: -1px;
            width: 99%;
            border: 1px solid gray;
            height: 19px;
        }
    </style>
</head>
<body>
    <div id="ATPMContainer">
        <%foreach (Playlist playlist in playlists)
            {
        %>
        <div class="atpm-playlist-container">
            <span class="atpm-playlist-title"><%=playlist.Title %></span>
            <% if (new PlaylistDAO().DoesListContainSong(playlist.ID, SongID))
                {
            %>
            <button onclick="removeSongFromPlaylist(<%=SongID%>,<%=playlist.ID %>)" class="atpm-song-control-button" style="background-color: #d9534f;">Remove</button>
            <% 
                }
                else
                {
            %>
            <button onclick="addSongToPlaylist(<%=SongID%>,<%=playlist.ID %>)" class="atpm-song-control-button" style="background-color: #5cb85c;">Add</button>
            <%
                }
            %>
        </div>
        <%
            }
        %>
        <div class="atpm-playlist-container" id="ATPMAddPlaylistContainer" style="width: 100%;">
            <span class="atpm-playlist-title" id="ATPMPlaylistNameSpan" >
                <input id="ATPMPlaylistName" type="text" />
            </span>
            <button onclick="addPlaylist(<%=SongID%>);" id="ATPMCreatePlaylistBtn" class="atpm-song-control-button" style="background-color: #337ab7; margin-top: 2px;">Create playlist</button>
        </div>
    </div>
</body>
</html>
