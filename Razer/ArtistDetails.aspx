<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArtistDetails.aspx.cs" Inherits="Razer.ArtistDetails" %>

<%@ Import Namespace="Entity" %>
<%@ Import Namespace="DAL" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <style>
        .artist-info-container {
            overflow: auto;
            align-items: stretch;
            border: 1px solid lightgray;
        }

        .artist-avatar {
            margin: 2px;
            margin-right: 5px;
            float: left;
            height: 210px;
            width: 210px;
        }

        .artist-info {
            padding-left: 5px;
        }

        .description {
        }

        .padding-text {
            margin-top: 5px;
            margin-bottom: 5px;
        }

        .song-box {
            display: block;
            border: 1px solid lightgray;
            border-radius: 2px;
            padding: 5px;
            margin-top: 1px;
        }

            .song-box:hover {
                background-color: lightgray;
            }

        .AD_song-title {
            cursor: pointer;
        }

        .song-action {
            cursor: pointer;
            display: inline-block;
            float: right;
        }

            .song-action:hover {
                color: orange;
            }

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        #CloseButton {
            background: none;
            float: right;
            padding: 5px;
            border: none;
        }

            #CloseButton:hover {
                border-radius: 2px;
                background: lightgray;
            }

        #AD_PlayAllSongs {
            font-weight: bold;
            float: right;
            background: none;
            border-radius: 2px;
            padding: 2px 5px;
            border: 1px solid lightgray;
            background-color: #dddddd;
        }

            #AD_PlayAllSongs:hover {
                opacity: 0.6;
            }
    </style>
    <script>
    </script>
</head>
<body onloadstart="updateTitle('<%=artist.Title %>');">
    <form id="form1" runat="server">
    </form>
    <%--INFO--%>
    <div class="artist-info-container">
        <img class="artist-avatar" src="<%=artist.FullCoverPath %>" />
        <div class="artist-info">
            <p><%=artist.Title %></p>
            <p>Gender: <%=artist.Gender == 0 ? "N/A" : (artist.Gender == 1 ? "Female" : "Male") %></p>
            <p>DOB: <%=artist.DOB.ToShortDateString() %></p>
            <div class="description"><%=artist.Description.Length==0?"Information: N/A":artist.Description %></div>
        </div>
    </div>
    <%--SONG LISTS--%>
    <div>
        <div class="padding-text">
            Songs by <%=artist.Title %>
            <input type="button" onclick="<%="changePlaylist('PlaylistAction.aspx?Action=PlayArtist&ArtistID="+artist.ID+"');" %>" id="AD_PlayAllSongs" value="Play all" />
        </div>
        <%foreach (Song song in new SongDAO().GetAllByArtistID(artist.ID))
            {
        %>
        <div class="song-box dropdown">
            <span class="AD_song-title" onclick="playSong(<%=song.ID %>);"><%=song.Title %></span>
            <span class="song-action">
                <i class="material-icons" data-toggle="modal" onclick="loadModal('<%=song.ID %>');">playlist_add</i>
            </span>
        </div>
        <%
            }
        %>
    </div>
    <!-- The Modal -->
    <div id="myModal" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <div>
                <span>Add to playlists...!</span>
                <button id="CloseButton" onclick="closeModal();">Close</button>
            </div>

            <div id="ModalContentToReplace">
            </div>
        </div>
    </div>
</body>
</html>
