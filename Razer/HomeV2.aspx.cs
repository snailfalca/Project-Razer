using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Razer
{
    public partial class Home : System.Web.UI.Page
    {
        public string MainContentUrl;
        protected void Page_Load(object sender, EventArgs e)
        {
            MainContentUrl = Request["RedirectUrl"]!=null? Request["RedirectUrl"]:"HomeContent.aspx";
        }
    }
}