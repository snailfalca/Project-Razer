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
    public partial class PlayingSongInfo : System.Web.UI.Page
    {
        public Song song { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["SongID"] != null)
            {
                song = new SongDAO().Get(Convert.ToInt32(Request["SongID"]));
                if (Session["User"] != null)
                {
                    SS_TxtIsFav.Text = new SongDAO().IsSongFavorited(song.ID, ((User)Session["User"]).ID).ToString();
                }
            }
        }
    }
}