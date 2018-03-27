<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Songs.aspx.cs" Inherits="Razer.Songs" %>

<%@ Import Namespace="Razer" %>
<%@ Import Namespace="Entity" %>
<%@ Import Namespace="DAL" %>
<%@ Import Namespace="System.Collections.Generic" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
            margin-top: 0px;
            margin-bottom: 5px;
        }

        .Songs_song-title {
            cursor: pointer;
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

        .song-action {
            display: inline-block;
            float: right;
        }

            .song-action:hover {
                cursor: pointer;
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

        #MenuSongsItem {
            background-color: #ff007d;
            color: white;
        }
    </style>
</head>
<body>
    <div>
        <% foreach (Song song in songs)
            {
        %>
        <div class="song-box dropdown">
            <span onclick="playSong(<%=song.ID %>);" class="Songs_song-title"><%=song.Title %></span>
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
