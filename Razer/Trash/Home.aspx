<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Razer.Home1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Veronica!</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <style>
        body {
            margin: 0px;
        }

        .page-padded-container {
            width: 80%;
            margin: 0px;
            padding-left: 10%;
            padding-right: 10%;
        }

        @media screen and (max-width: 850px) {
            .page-padded-container {
                width: 100%;
                margin: 0px;
                padding-left: 0px;
                padding-right: 0px;
            }
        }

        @media screen and (max-width: 550px) {
            #TrackInfo {
                display: none;
            }
        }

        .media-button {
            text-align: center;
            background-color: white;
            display: inline-block;
            width: 50px;
            height: 50px;
        }

        .material-icons {
            padding-top: 10px;
            font-size: 35px;
        }
        .material-icons:hover{
            color: orange;
            cursor: pointer;
        }

        #ControlZone {
            display: flex;
            height: 50px;
            bottom: 0px;
            position: absolute;
            background-color: red;
        }

        #PlayerControl {
            display: flex;
            width: 250px;
        }

        #TrackFunctions {
            display: flex;
            width: 150px;
        }
    </style>
</head>
<body>

    <div id="ControlZone" class="page-padded-container">
        <%--Player controls--%>
        <div id="PlayerControl">
            <div class="media-button">
                <i class="material-icons">skip_previous</i>
            </div>
            <div class="media-button">
                <i class="material-icons">pause</i>
            </div>
            <div class="media-button">
                <i class="material-icons">skip_next</i>
            </div>
            <div class="media-button">
                <i class="material-icons">shuffle</i>
            </div>
            <div class="media-button">
                <i class="material-icons">volume_off</i>
            </div>
        </div>
        <%--Track info--%>
        <div id="TrackInfo">
        </div>
        <%--Track functions--%>
        <div id="TrackFunctions">
            <div class="media-button">
                <i class="material-icons">share</i>
            </div>
            <div class="media-button">
                <i class="material-icons">favorite</i>
            </div>
            <div class="media-button" onclick="togglePlaylist(this);">
                <i class="material-icons">playlist_play</i>
            </div>
        </div>
    </div>
</body>
</html>
