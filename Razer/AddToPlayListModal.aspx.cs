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
    public partial class AddToPlayListModal : System.Web.UI.Page
    {
        public List<Playlist> playlists;
        public int SongID;
        protected void Page_Load(object sender, EventArgs e)
        {
            SongID = Convert.ToInt32(Request["SongID"]);
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
            }else
            {
                User user = (User)Session["User"];
                playlists = new PlaylistDAO().GetAllByUserID(user.ID);
            }
        }
    }
}