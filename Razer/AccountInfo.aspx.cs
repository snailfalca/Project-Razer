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
    public partial class AccountInfo : System.Web.UI.Page
    {
        public User user { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["User"];

            if (user == null)
            {
                Response.Redirect("Login.aspx?RedirectUrl=AccountInfo.aspx");
            }
        }
    }
}