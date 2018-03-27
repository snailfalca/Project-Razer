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
    public partial class AccountAction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            User user = (User)Session["User"];
            if (user != null)
            {
                switch (Request["Action"])
                {
                    case "EditAccount":
                        int id = user.ID;
                        user.Name = Request["AItxtName"];
                        user.Gender = Request["AItxtGender"] == "Male";
                        user.Phone = Request["AItxtPhone"];
                        user.Address = Request["AItxtAddress"];

                        new UserDAO().Update(user);
                        break;
                }
            }
        }
    }
}