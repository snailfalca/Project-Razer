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
    public partial class Songs : System.Web.UI.Page
    {
        public List<Song> songs { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            switch (Request["Action"])
            {
                // View all songs
                case "ViewAll":
                    songs = new SongDAO().GetAll();
                    break;
                case "ViewFav":
                    //songs = new SongDAO().GetAllUserFav();
                    if (Session["User"] != null)
                    {
                        int userID = Convert.ToInt32(((User)Session["User"]).ID);
                        songs = new SongDAO().GetAllUserFav(userID);
                    }
                    break;
            }

            if (songs == null)
            {
                songs = new List<Song>();
            }

        }
    }
}