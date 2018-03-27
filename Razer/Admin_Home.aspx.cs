using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Razer.Trash
{
    public partial class Admin_Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnAddSong_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_AddSong.aspx");
        }
    }
}