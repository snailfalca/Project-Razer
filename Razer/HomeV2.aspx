<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeV2.aspx.cs" Inherits="Razer.Home" %>

<%@ Import Namespace="Entity" %>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Veronica!</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="CSS/Home.css" />
    <script>
        function loadContentToDiv(path, divId) {
            setTimeout(function () {
                var placeHolder = document.getElementById(divId);

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        placeHolder.innerHTML = this.responseText;
                    }
                };
                xhttp.open("GET", path, true);
                xhttp.send();
            }, 500);
        }
        function loadPage(path) {
            window.history.pushState("object or string", "Home", "HomeV2.aspx");
            var placeHolder = document.getElementById("MainContent");

            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    placeHolder.innerHTML = this.responseText;
                }
            };
            xhttp.open("GET", path, true);
            xhttp.send();
        }
        var themeColor = "red";
        function togglePlaylist() {
            var button = document.getElementById("Home_PlaylistBtn");
            var placeHolder = document.getElementById("PlaylistView");

            if (button.style.color == themeColor) {
                button.style.color = "black";

                placeHolder.style.display = "none";
            } else {
                button.style.color = themeColor;

                setTimeout(function () {
                    placeHolder.style.display = "inline-block";
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (this.readyState == 4 && this.status == 200) {
                            placeHolder.innerHTML = this.responseText;
                        }
                    };

                    xhttp.open("GET", "PlayerPlaylist.aspx", true);
                    xhttp.send();
                }, 200);
            }
        }
        //-- ArtistDetails
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            var modal = document.getElementById('myModal');
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
        function loadModal(songId) {
            var modalContent = document.getElementById('ModalContentToReplace');
            var modal = document.getElementById('myModal');
            modal.style.display = "block";

            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    modalContent.innerHTML = this.responseText;
                }
            };
            xhttp.open("GET", "AddToPlayListModal.aspx?SongID=" + songId, true);
            xhttp.send();
        }
        function closeModal() {
            var modal = document.getElementById('myModal');
            modal.style.display = "none";
        }
        function removeSongFromPlaylist(songId, playlistId) {
            // Remove song by AJAX request
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    // Update the modal
                    loadModal(songId);
                }
            };
            xhttp.open("GET", "EditPlaylistHandler.aspx?Action=RemoveSong&SongID=" + songId + "&PlaylistID=" + playlistId, true);
            xhttp.send();
        }
        function addSongToPlaylist(songId, playlistId) {
            //Add song by AJAX request
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    // Update the modal
                    loadModal(songId);
                }
            };
            xhttp.open("GET", "EditPlaylistHandler.aspx?Action=AddSong&SongID=" + songId + "&PlaylistID=" + playlistId, true);
            xhttp.send();
        }
        function addPlaylist(songId) {
            var playlistName = document.getElementById("ATPMPlaylistName").value;
            // Add song by AJAX request
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    // Update the modal
                    loadModal(songId);
                }
            };
            xhttp.open("GET", "EditPlaylistHandler.aspx?Action=AddPlaylist&SongID=" + songId + "&PlaylistName=" + playlistName, true);
            xhttp.send();
        }
        function sendAJAXRequest(url) {
            var xhttp = new XMLHttpRequest();
            xhttp.open("GET", url, true);
            xhttp.send();
        }
        function setInnerHtmlByID(id, text) {
            document.getElementById(id).innerHTML = text;
        }
        function AI_HandleEditButton(EditButton) {
            // Start editing
            if (EditButton.innerHTML == "Edit") {
                //Change button text and color
                EditButton.innerHTML = "Save";
                EditButton.style.backgroundColor = "#f0ad4e";
                // Enable editing...!
                document.getElementById("AItxtName").readOnly = false;
                document.getElementById("AItxtPhone").readOnly = false;
                document.getElementById("AItxtAddress").readOnly = false;
                document.getElementById("AItxtGender").dataset.readOnly = "false";
            }// Finish editing
            else {
                // Send edit request;
                document.getElementById("AI_AccountInfoForm").submit();

                //C hange button text and color
                EditButton.innerHTML = "Edit";
                EditButton.style.backgroundColor = "#4CAF50";
                // Disable editing...!
                document.getElementById("AItxtName").readOnly = true;
                document.getElementById("AItxtPhone").readOnly = true;
                document.getElementById("AItxtAddress").readOnly = true;
                document.getElementById("AItxtGender").dataset.readOnly = "true";
            }
        }
        function AI_ToggleGender() {
            if (document.getElementById("AItxtGender").dataset.readOnly == "false") {
                if (document.getElementById("AItxtGender").value === "Male") {
                    document.getElementById("AItxtGender").value = "Female";
                } else {
                    document.getElementById("AItxtGender").value = "Male";
                }
            }
        }
        function changePlaylist(playlistActionURL) {
            document.getElementById("PlaylistView").style.display = "none";
            document.getElementById("Home_PlaylistBtn").style.color = "black";
            sendAJAXRequest(playlistActionURL);
            setTimeout(function () {
                nextSong();
            }, 1000);
        }
        function playSong(SongID) {
            document.getElementById("audioPlayer").src = "SongStream.aspx?SongID=" + SongID;
            playMusic();
            loadSongInfo(SongID);
        }
        function togglePause() {
            if (document.getElementById("audioPlayer").paused) {
                playMusic();
            } else {
                pauseMusic();
            }
        }
        function playMusic() {
            document.getElementById("Home_PlayMusicBtn").innerHTML = "pause";
            setTimeout(function () {
                document.getElementById("audioPlayer").play();
            }, 200);
        }
        function pauseMusic() {
            document.getElementById("Home_PlayMusicBtn").innerHTML = "play_arrow";
            document.getElementById("audioPlayer").pause();
        }
        function toggleMute() {
            var audio = document.getElementById("audioPlayer");
            if (audio.muted) {
                audio.muted = false;
                document.getElementById("Home_MuteMusicBtn").style.color = "black";
            } else {
                audio.muted = true;
                document.getElementById("Home_MuteMusicBtn").style.color = "red";
            }
        }
        function prevSong() {
            pauseMusic();
            try {
                LoadSongByHandler("PrevSong");
            } catch (err) {
                document.getElementById("audioPlayer").src = "https://vignette.wikia.nocookie.net/leagueoflegends/images/9/91/PiltoverCustomsBlitzcrank.sellW.ogg/revision/latest?cb=20171031011350";
            }
            playMusic();
            loadSongInfo();
        }
        function nextSong() {
            pauseMusic();
            try {
                LoadSongByHandler("NextSong");
            } catch (err) {
                document.getElementById("audioPlayer").src = "https://vignette.wikia.nocookie.net/leagueoflegends/images/9/91/PiltoverCustomsBlitzcrank.sellW.ogg/revision/latest?cb=20171031011350";
            }
            playMusic();
            loadSongInfo();
        }
        function LoadSongByHandler(action) {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    var xmlDoc = new DOMParser().parseFromString(this.responseText, "text/html");
                    var SongID = xmlDoc.getElementById("SS_TxtSongID").value;
                    document.getElementById("audioPlayer").src = xmlDoc.getElementById("SS_TxtSongPath").value;
                    loadSongInfo(SongID);
                }
            };
            xhttp.open("GET", "SongRequestHandler.aspx?Action=" + action, true);
            xhttp.send();
        }
        function toggleShuffle() {
            var toggleBtn = document.getElementById("Home_ShuffleMusicBtn");
            var toggleEnabled = toggleBtn.style.color == "red";
            try {
                sendAJAXRequest("PlaylistAction.aspx?Action=Shuffle&Value=" + !toggleEnabled);
                toggleBtn.style.color = toggleEnabled ? "black" : "red";
            } catch (err) {
            }
        }
        var PlayingSongID = -1;
        function loadSongInfo(SongID) {
            if (SongID > 0) {
                PlayingSongID = SongID;

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        updateDataFromXML(this);
                    }
                };
                xhttp.open("GET", "PlayingSongInfo.aspx?SongID=" + SongID, true);
                xhttp.send();
            }
        }
        function updateDataFromXML(xml) {
            var xmlDoc = new DOMParser().parseFromString(xml.responseText, "text/html");
            document.getElementById("PlayerArtistAva").src = xmlDoc.getElementById("PlayerArtistAva").src;
            document.getElementById("track-info-title").innerHTML = xmlDoc.getElementById("track-info-title").innerHTML;
            document.getElementById("track-info-artist").innerHTML = xmlDoc.getElementById("track-info-artist").innerHTML;
            if (xmlDoc.getElementById("SS_TxtIsFav").value == "True") {
                document.getElementById("Home_FaveBtn").style.color = "red";
            } else {
                document.getElementById("Home_FaveBtn").style.color = "black";
            }
        }
        function toggleFav() {
            if (document.getElementById("HomeBody").getAttribute("data-loggedin") == "True"
                && PlayingSongID > 0) {
                if (document.getElementById("Home_FaveBtn").style.color == "red") {
                    document.getElementById("Home_FaveBtn").style.color = "black";
                    sendAJAXRequest("SongAction.aspx?Action=UnFavSong&SongID=" + PlayingSongID);
                } else {
                    document.getElementById("Home_FaveBtn").style.color = "red";
                    sendAJAXRequest("SongAction.aspx?Action=FavSong&SongID=" + PlayingSongID);
                }
            }
        }
        function loggOut() {
            document.getElementById("HomeBody").setAttribute("data-loggedin", "False");
        }
    </script>
</head>
<body id="HomeBody" onload="loadPage('<%=MainContentUrl%>');" data-loggedin="<%=Session["User"]!=null %>">
    <%--MENU BAR--%>
    <ul class="header-menu">
        <li class="header-menu-item-container"><span onclick="loadPage('HomeContent.aspx');" id="MenuHomeItem" class="header-menu-item">Home</span></li>
        <li class="header-menu-item-container"><span onclick="loadPage('Artists.aspx');" id="MenuArtistsItem" class="header-menu-item">Artists</span></li>
        <li class="header-menu-item-container"><span onclick="loadPage('Songs.aspx?Action=ViewAll');" id="MenuSongsItem" class="header-menu-item">Songs</span></li>
        <li class="header-menu-item-container user-menu-item" style="float: right;"><span onclick="loadPage('AccountInfo.aspx'); loadContentToDiv('Songs.aspx?Action=ViewFav', 'Songs_FavSongs');" id="MenuAccountItem" class="header-menu-item"><%=(User)Session["User"]!=null?((User)Session["User"]).Name:"Login" %></span></li>
    </ul>

    <%--MAIN CONTENT--%>
    <!--Main content to display in page, replace by AJAX-->
    <div id="MainContent" runat="server"></div>

    <%--SONGS LIST--%>
    <!--Popup content to display above page, replace by AJAX-->
    <div id="PlaylistView" runat="server"></div>

    <!--AUDIO!-->
    <%--Audio element--%>
    <audio id="audioPlayer" onended="nextSong();">
        <source src="https://vignette.wikia.nocookie.net/leagueoflegends/images/9/91/PiltoverCustomsBlitzcrank.sellW.ogg/revision/latest?cb=20171031011350" type="audio/ogg" />
        Your browser does not support the audio element.
    </audio>
    <!--Media controlls-->
    <table id="mediaControlZone">
        <tr>
            <td class="control-padding"></td>
            <!--Audio navigators-->
            <td id="audio-controls-cell">
                <span class="media-button">
                    <i class="material-icons" onclick="prevSong();">skip_previous</i>
                </span>
                <span class="media-button">
                    <i class="material-icons" onclick="togglePause();" id="Home_PlayMusicBtn">play_arrow</i>
                </span>
                <span class="media-button">
                    <i class="material-icons" onclick="nextSong();">skip_next</i>
                </span>
                <span class="media-button">
                    <i class="material-icons" onclick="toggleShuffle();" id="Home_ShuffleMusicBtn">shuffle</i>
                </span>
                <span class="media-button">
                    <i class="material-icons" onclick="toggleMute();" id="Home_MuteMusicBtn">volume_off</i>
                </span>
            </td>
            <!--Track avatar-->
            <td id="track-avatar-cell">
                <img class="track-avatar-image" id="PlayerArtistAva" src="https://lh3.googleusercontent.com/-FCuVNhHg-4A/WmGx_ROf7GI/AAAAAAAAABQ/ShVA5S-5Lq8g3qpGH6gbCluG99qR6L5_wCEwYBhgL/w139-h140-p/vi_01.jpg" />
            </td>
            <!--Track info-->
            <td id="track-info-cell">
                <div class="track-info-text" id="track-info-title">How long?</div>
                <div class="track-info-text" id="track-info-artist">Charlie Puth</div>
            </td>
            <!--User functions-->
            <td id="user-functions-cell">
                <span class="media-button">
                    <i class="material-icons">share</i>
                </span>
                <span class="media-button" id="Home_FaveBtn" onclick="toggleFav();">
                    <i class="material-icons">favorite</i>
                </span>
                <span id="Home_PlaylistBtn" class="media-button" onclick="togglePlaylist();">
                    <i class="material-icons">playlist_play</i>
                </span>
            </td>
            <td class="control-padding"></td>
        </tr>
    </table>
</body>
</html>
