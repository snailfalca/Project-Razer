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
    public partial class SongRequestHandler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int SongID;
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
                    Session["PlaylistHandler"] = new PlaylistHandler();
                }
            }

            switch (Request["Action"])
            {
                case "NextSong":
                    SongID = ((PlaylistHandler)Session["PlaylistHandler"]).GetNextSongID();
                    break;
                case "PrevSong":
                    SongID = ((PlaylistHandler)Session["PlaylistHandler"]).GetPrevSongID();
                    break;
                default:
                    SongID = Convert.ToInt32(Request["SongID"]);
                    ((PlaylistHandler)Session["PlaylistHandler"]).SetSongPlayed(SongID);
                    break;
            }

            Song song = new SongDAO().Get(Convert.ToInt32(SongID));
            if (song != null)
            {
                SS_TxtSongID.Text = SongID.ToString();
                SS_TxtSongPath.Text = "SongStream.aspx?SongID=" + SongID;
            }
        }
    }
}