<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Artists.aspx.cs" Inherits="Razer.Artists" %>

<%@ Import Namespace="Entity" %>
<%@ Import Namespace="DAL" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="CSS/Artists.css" />
    <style>        
        #MenuArtistsItem {
            background-color: #ff007d;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="ArtistsContent">
            <% foreach (Artist artist in new ArtistDAO().GetAll())
                {
            %>
            <a  href="javascript:void(0);" onclick="loadPage('ArtistDetails.aspx?ID=<%=artist.ID %>');" class="gallery-item">
                <div>
                    <img src="<%=artist.FullCoverPath %>" />
                </div>
                <div class="desc"><%=artist.Title %></div>
            </a>
            <%
                }
            %>
        </div>
    </form>
</body>
</html>