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
    public partial class PlayerPlaylist : Page
    {
        public List<Song> PlayingList { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            PlayingList = ((PlaylistHandler)Session["PlaylistHandler"]) == null ?
                new List<Song>() : ((PlaylistHandler)Session["PlaylistHandler"]).Songs;
        }
    }
}