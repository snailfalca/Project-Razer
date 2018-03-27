<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlayingSongInfo.aspx.cs" Inherits="Razer.PlayingSongInfo" %>

<%@ Import Namespace="DAL" %>
<%@ Import Namespace="Entity" %>
<%@ Import Namespace="Razer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <%
        if (song != null)
        {
            string imgSrc, title, artistTitle;
            Artist artist = new ArtistDAO().Get(song.ArtistID);
            imgSrc = "img/ArtistCover/" + artist.CoverPath;
            title = song.Title;
            artistTitle = artist.Title;
    %>
    <img src="<%=imgSrc %>" id="PlayerArtistAva" />
    <div id="track-info-title"><%=title %></div>
    <div id="track-info-artist"><%=artistTitle %></div>
    <form runat="server">
        <asp:TextBox ID="SS_TxtIsFav" runat="server"></asp:TextBox>
    </form>
    <%
        }
    %>
</body>
</html>
