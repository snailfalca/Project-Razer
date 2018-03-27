<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountInfo.aspx.cs" Inherits="Razer.AccountInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #MenuAccountItem {
            background-color: #ff007d;
            color: white;
        }

        .AI-row-container {
            padding-top: 10px;
            display: table;
            width: 95%;
            margin: auto;
        }

        .AI-row-label {
            cursor: default;
            vertical-align: top;
            padding-right: 5px;
            text-align: right;
            display: table-cell;
            width: 65px;
        }

        .AI-row-control-container {
            display: table-cell;
        }

        .AI-row-control {
            font-family: "Nunito";
            padding: 0px;
            width: 100%;
            padding-left: 5px;
        }

            .AI-row-control:read-only {
                cursor: pointer;
            }

        .AI-row-control-container textarea {
            padding: 1px;
            padding-left: 5px;
            resize: none;
        }

        .AI-button-container {
            display: table-cell;
            width: 30%;
            text-align: center;
        }

        .AI-button {
            color: white;
            font-weight: bold;
            padding: 5px;
            width: 80%;
            background: none;
            border: 1px solid lightgray;
            border-radius: 2px;
        }

            .AI-button:hover {
                opacity: 0.6;
            }

        .AI-button-edit {
            background-color: #4CAF50;
        }

        .AI-button-save {
            background-color: #337ab7;
        }

        .AI-button-logout {
            background-color: #f44336;
        }

        #Songs_FavSongs{
            max-height: 300px;
            overflow: auto;
        }
    </style>
</head>
<body>
    <%--Info--%>
    <iframe name="transFrame" style="display:none;" id="transFrame"></iframe>
    <form id="AI_AccountInfoForm" target="transFrame" action="AccountAction.aspx">
        <input type="text" style="display:none;" value="EditAccount" name="Action"/>
        <div class="AI-container">
            <div class="AI-row-container">
                <span class="AI-row-label">Email:</span>
                <span class="AI-row-control-container">
                    <textarea id="AItxtEmail" rows="1" class="AI-row-control AI-default-set" readonly="" required="required" ><%=user.Email %></textarea>
                </span>
            </div>
            <div class="AI-row-container">
                <span class="AI-row-label">Name:</span>
                <span class="AI-row-control-container">
                    <textarea name="AItxtName" rows="1" id="AItxtName" class="AI-row-control AI-default-set" readonly="" required="required" ><%=user.Name %></textarea>
                </span>
            </div>
            <div class="AI-row-container">
                <span class="AI-row-label">Gender:</span>
                <span class="AI-row-control-container">
                    <input type="text" name="AItxtGender" onclick="AI_ToggleGender();" id="AItxtGender" class="AI-row-control AI-default-set" readonly="" required="required"  value="<%=user.Gender?"Male":"Female" %>" />
                </span>
            </div>
            <div class="AI-row-container">
                <span class="AI-row-label">Phone:</span>
                <span class="AI-row-control-container">
                    <textarea name="AItxtPhone" rows="1" id="AItxtPhone" class="AI-row-control AI-default-set" readonly="" required="required" ><%=user.Phone %></textarea>
                </span>
            </div>
            <div class="AI-row-container">
                <span class="AI-row-label">Address:</span>
                <span class="AI-row-control-container">
                    <textarea name="AItxtAddress" id="AItxtAddress" class="AI-row-control" readonly="" required="required" ><%=user.Address %></textarea>
                </span>
            </div>
        </div>
    </form>
    <%--Buttons--%>
    <div class="AI-row-container">
        <span class="AI-row-label"></span>
        <span class="AI-row-control-container">
            <span class="AI-row-container">
                <span class="AI-button-container">
                    <button id="AI_BtnEdit" onclick="AI_HandleEditButton(this);" class="AI-button AI-button-edit">Edit</button>
                </span>
                <span class="AI-button-container">
                    <button onclick="loadPage('AccountInfo.aspx');"" id="BtnCancel" class="AI-button AI-button-save">Cancel</button>
                </span>
                <span class="AI-button-container">
                    <button onclick="loggOut(); setInnerHtmlByID('MenuAccountItem','Login');  sendAJAXRequest('Login.aspx?Action=Logout'); loadPage('HomeContent.aspx');" class="AI-button AI-button-logout">Logout</button>
                </span>
            </span>
        </span>
    </div>    
    <%--Fav songs--%>
    <fieldset style="margin-top: 10px;">
        <legend>Favorite songs</legend>
        <button class="AI-button" onclick="changePlaylist('PlaylistAction.aspx?Action=PlayFav');" style="background-color:blueviolet; margin: auto; display: block; margin-bottom: 10px;">Play all!</button>
        <div id="Songs_FavSongs"></div>
    </fieldset>
    <style>
        #MenuSongsItem {
            background-color: #f2f2f2;
            color: black;
        }
    </style>
</body>
</html>
