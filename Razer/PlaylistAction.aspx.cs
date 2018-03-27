using DAL;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Razer
{
    public partial class PlaylistAction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            switch (Request["Action"])
            {
                case "PlayArtist":
                    int artistID = Convert.ToInt32(Request["ArtistID"]);
                    List<Song> songs = new SongDAO().GetAllByArtistID(artistID); ;
                    if (songs.Count > 0)
                    {
                        Session["PlaylistHandler"] = new PlaylistHandler()
                        {
                            Songs = songs,
                            Shuffle = false
                        };
                    }
                    break;
                case "Shuffle":
                    CheckPlaylistHandlerAvaiable();
                    ((PlaylistHandler)Session["PlaylistHandler"]).Shuffle = Convert.ToBoolean(Request["Value"]);
                    break;
                case "PlayFav":
                    int userID = Convert.ToInt32(((User)Session["User"]).ID);
                    List<Song> favSongs = new SongDAO().GetAllUserFav(userID); ;
                    if (favSongs.Count > 0)
                    {
                        Session["PlaylistHandler"] = new PlaylistHandler()
                        {
                            Songs = favSongs,
                            Shuffle = false
                        };
                    }
                    break;
            }
        }

        private void CheckPlaylistHandlerAvaiable()
        {
            PlaylistHandler handler = (PlaylistHandler)Session["PlaylistHandler"];

            if (handler == null)
            {
                int count = 0;
                while (count < 10 && handler == null)
                {
                    Thread.Sleep(100);
                    count++;
                }
                if (handler == null)
                {
                    handler = new PlaylistHandler();
                }
            }
        }
    }
}