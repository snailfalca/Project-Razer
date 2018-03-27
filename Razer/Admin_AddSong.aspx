<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_AddSong.aspx.cs" Inherits="Razer.Admin_AddSong" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        a {
            text-decoration: none;
        }

        div {
            margin-top: 10px;
        }

        fieldset {
            margin-bottom: 10px;
        }

        input {
            width: 100%;
        }

        select {
            width: 100%;
        }

        .button {
            font-weight: bold;
            color: white;
            border: 1px solid lightgray;
            border-radius: 2px;
        }

        #BtnSave {
            background-color: #5cb85c;
            width: 40%;
            float: left;
        }

        #BtnCancel {
            background-color: #f0ad4e;
            width: 40%;
            float: right;
        }

        .nav-button {
            width: 100px;
            background-color: #dddddd;
            height: 30px;
            border-radius: 2px;
            border: 1px solid lightgray;
            font-weight: bold;
        }

            .nav-button:hover {
                opacity: 0.6;
            }
    </style>
</head>
<body style="width: 60%; margin: auto; margin-top: 8px;">
    <%-- Navigate --%>
    <div>
        <a href="HomeV2.aspx"><input type="button" class="nav-button" value="Home"/></a>
        <a href="Admin_Home.aspx"><input type="button" class="nav-button" value="Admin home"/></a>
        <a href="Admin_AddSong.aspx"><input type="button" class="nav-button" value="Songs"/></a>
        <a href="Admin_Artists.aspx"><input type="button" class="nav-button" value="Artists"/></a>
    </div>
    <form id="form1" runat="server">
        <%--Add a new song--%>
        <fieldset>
            <legend>
                <asp:Label ID="ActionLabel" runat="server" Text="Add a new song...!" Font-Bold="true"></asp:Label>
            </legend>
            <div>
                <p>Song name</p>
                <asp:TextBox ID="TxtSongName" runat="server"></asp:TextBox>
            </div>
            <div>
                <p>File</p>
                <asp:FileUpload ID="FileUpload" runat="server" />
            </div>
            <div>
                <p>Artist</p>
                <asp:DropDownList ID="DropDownArtist" runat="server"></asp:DropDownList>
            </div>
            <div>
                <asp:Button CssClass="button" ID="BtnSave" runat="server" Text="Save" OnClick="BtnSave_Click" />
                <asp:Button CssClass="button" ID="BtnCancel" runat="server" Text="Cancel" OnClick="BtnCancel_Click" />
            </div>
        </fieldset>
        <hr />
        <fieldset>
            <legend><b>Select a song to edit...!</b></legend>
            <asp:GridView ID="GridViewSongs" runat="server" AutoGenerateColumns="false" OnRowEditing="GridViewSongs_RowEditing" AllowPaging="True" OnPageIndexChanging="GridViewSongs_PageIndexChanging" PageSize="5">
                <Columns>
                    <asp:CommandField ButtonType="Link" ShowEditButton="true" />
                    <asp:BoundField HeaderText="SongID" DataField="ID"/>
                    <asp:BoundField HeaderText="Title" DataField="Title"/>
                    <asp:BoundField HeaderText="FilePath" DataField="FilePath"/>
                    <asp:BoundField HeaderText="ArtistID" DataField="ArtistID"/>
                </Columns>
            </asp:GridView>
        </fieldset>
    </form>
</body>
</html>
