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
    public partial class SongStream : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int SongID = Convert.ToInt32(Request["SongID"]);
            Song song = new SongDAO().Get(SongID);
            Session["PlayingSongID"] = SongID;
            string FilePath = song.FilePath;
            Response.ContentType = "audio/mpeg";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + FilePath);
            Response.TransmitFile(Server.MapPath("song" + "\\" + FilePath));
            Response.End();
        }
    }
}