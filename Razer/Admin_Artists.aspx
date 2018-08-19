<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Artists.aspx.cs" Inherits="Razer.Admin_Artists" %>

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

        input, #TxtDescription {
            width: 100%;
        }

        #TxtDescription{
            overflow: auto;
            min-height:100px;
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

        #CheckMale {
            width: auto;
        }
    </style>
</head>
<body style="width: 60%; margin: auto; margin-top: 8px;">
    <%-- Navigate --%>
    <div>
        <a href="HomeV2.aspx">
            <input type="button" class="nav-button" value="Home" /></a>
        <a href="Admin_Home.aspx">
            <input type="button" class="nav-button" value="Admin home" /></a>
        <a href="Admin_AddSong.aspx">
            <input type="button" class="nav-button" value="Songs" /></a>
        <a href="Admin_Artists.aspx">
            <input type="button" class="nav-button" value="Artists" /></a>
    </div>
    <form id="form1" runat="server">
        <%--Add a new song--%>
        <fieldset>
            <legend>
                <asp:Label ID="ActionLabel" runat="server" Text="Add a new artist...!" Font-Bold="true"></asp:Label>
            </legend>
            <div>
                <p>Artist title</p>
                <asp:TextBox ID="TxtName" runat="server"></asp:TextBox>
            </div>
            <div>
                <p>DOB</p>
                <asp:Calendar ID="CalendarDOB" runat="server" SelectedDate="<%# DateTime.Today %>"></asp:Calendar>
            </div>
            <div>
                <p>Gender</p>
                <asp:DropDownList ID="GenderDropdown" runat="server">
                    <asp:ListItem Text="Male" Value="1" />
                    <asp:ListItem Text="Male" Value="2" />
                    <asp:ListItem Text="N/A" Value="3" />
                </asp:DropDownList>
            </div>
            <div>
                <p>Description</p>
                <asp:TextBox ID="TxtDescription" TextMode="MultiLine" runat="server"></asp:TextBox>
            </div>
            <div>
                <p>Cover</p>
                <asp:FileUpload ID="FileUpload" runat="server" />
            </div>
            <div>
                <asp:Button CssClass="button" ID="BtnSave" runat="server" Text="Save" OnClick="BtnSave_Click" />
                <asp:Button CssClass="button" ID="BtnCancel" runat="server" Text="Cancel" OnClick="BtnCancel_Click" />
            </div>
        </fieldset>
        <hr />
        <fieldset>
            <legend><b>Select a song to edit...!</b></legend>
            <asp:GridView ID="GridViewArtists" runat="server" AutoGenerateColumns="false" OnRowEditing="GridViewArtists_RowEditing" AllowPaging="True" OnPageIndexChanging="GridViewArtists_PageIndexChanging" PageSize="5">
                <Columns>
                    <asp:CommandField ButtonType="Link" ShowEditButton="true" />
                    <asp:BoundField HeaderText="ArtistID" DataField="ID" />
                    <asp:BoundField HeaderText="Title" DataField="Title" />
                    <asp:BoundField HeaderText="Description" DataField="Description" />
                    <asp:BoundField HeaderText="Gender" DataField="Gender" />
                    <asp:ImageField HeaderText="Cover" ControlStyle-Width="300" DataImageUrlField="FullCoverPath" />
                    <asp:BoundField HeaderText="DOB" DataField="DOB" />
                </Columns>
            </asp:GridView>
        </fieldset>
    </form>
</body>
</html>
