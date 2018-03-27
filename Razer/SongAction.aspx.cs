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
    public partial class SongAction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int SongID = Convert.ToInt32(Request["SongID"]),
                UserID = Convert.ToInt32(((User)Session["User"]).ID);
            switch (Request["Action"])
            {
                case "UnFavSong":
                    new SongDAO().RemoveSongFromFav(SongID, UserID);
                    break;
                case "FavSong":
                    new SongDAO().AddSongToFav(SongID, UserID);
                    break;
            }
        }
    }
}