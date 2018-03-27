using DAL;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Razer
{
    public partial class EditPlaylistHandler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int SongID = Convert.ToInt32(Request["SongID"]),
            PlaylistID = Convert.ToInt32(Request["PlaylistID"]),
            LoggedUserID = Session["User"] != null ? ((User)Session["User"]).ID : -1;

            Playlist playlist = new PlaylistDAO().Get(PlaylistID);
            int OwnerID = playlist != null ? playlist.UserID : -2;

            switch (Request["Action"])
            {
                // Add song to playlist
                case "AddSong":
                    if (OwnerID == LoggedUserID)
                    {
                        new PlaylistDAO().InsertSongToPlayList(PlaylistID, SongID);
                    }
                    break;
                // Remove song from playlist
                case "RemoveSong":
                    if (OwnerID == LoggedUserID)
                    {
                        new PlaylistDAO().RemoveSongFromPlayList(PlaylistID, SongID);
                    }
                    break;
                case "RemovePlaylist":
                    if (OwnerID == LoggedUserID)
                    {
                        new PlaylistDAO().Delete(PlaylistID);
                    }
                    break;
                case "AddPlaylist":
                    string title = Request["PlaylistName"];
                    Playlist newPlaylist = new Playlist()
                    {
                        Title = title,
                        Private = false,
                        UserID = LoggedUserID
                    };

                    int InsertedID = new PlaylistDAO().Insert(newPlaylist);

                    // Insert song if has SongID parameter
                    if (Request["SongID"] != null)
                    {
                        SongID = Convert.ToInt32(Request["SongID"]);
                        new PlaylistDAO().InsertSongToPlayList(InsertedID, SongID);
                    }
                    break;
            }
        }
    }
}