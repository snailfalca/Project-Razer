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
    public partial class LoginV2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            switch (Request["Action"])
            {
                case "Logout":
                    Session["User"] = null;
                    break;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Get redirect Url
            string redirectUrl = "HomeV2.aspx?RedirectUrl=HomeContent.aspx";

            // Get data from input fields
            string email = TxtEmail.Text,
                password = TxtPassword.Text;

            // Get login result
            User user = new UserDAO().AttemptLogin(email, password);

            // Login success, add user to session & redirect to home
            if (user != null)
            {
                Session["Error"] = null;
                Session["User"] = user;
                if (user.Admin != null && user.Admin == true)
                {
                    // Redirect to Admin_Home.aspx
                    Response.Redirect("Admin_Home.aspx");
                }
                else
                {
                    Response.Redirect(redirectUrl);
                }
            }
            // Login fails, show error!
            else
            {
                Session["Error"] = 1;
            }
        }
    }
}