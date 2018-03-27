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
    public partial class ArtistDetails : System.Web.UI.Page
    {
        public Artist artist { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            artist = new ArtistDAO().Get(Convert.ToInt32(Request["ID"]));
        }
    }
}