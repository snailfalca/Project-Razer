using DAL;
using Entity;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Razer
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            string password = TxtPassword.Text,
                confirmPass = TxtConfirmPassword.Text;

            if (PassValidation())
            {
                string email = TxtEmail.Text,
                    name = TxtName.Text,
                    phone = TxtPhone.Text,
                    address = TxtAddress.Text;
                bool gender = DropdownGender.SelectedValue == "1";

                User user = new User()
                {
                    Email = email,
                    Password = password,
                    Gender = gender,
                    Name = name,
                    Phone = phone,
                    Address = address
                };

                int UserID = new UserDAO().Insert(user);

                user = new UserDAO().AttemptLogin(email, password);

                if (user != null)
                {
                    Session["User"] = user;
                    Response.Redirect("HomeV2.aspx");
                }

            }
        }

        private bool PassValidation()
        {
            bool pass = true;

            //Validate password confirmation
            if (!TxtPassword.Text.Equals(TxtConfirmPassword.Text) || TxtPassword.Text.Length == 0)
            {
                TxtPassword.BorderColor = Color.Red;
                TxtConfirmPassword.BorderColor = Color.Red;
                pass = false;
            }

            //Validate email
            if (TxtEmail.Text.Length == 0)
            {
                TxtEmail.BorderColor = Color.Red;
                pass = false;
            }

            //Validate name
            if (TxtName.Text.Length == 0)
            {
                TxtName.BorderColor = Color.Red;
                pass = false;
            }

            //Validate phone
            if (TxtPhone.Text.Length == 0)
            {
                TxtPhone.BorderColor = Color.Red;
                pass = false;
            }

            //Validate address
            if (TxtAddress.Text.Length == 0)
            {
                TxtAddress.BorderColor = Color.Red;
                pass = false;
            }

            return pass;
        }

        protected void btnForgot_Click(object sender, EventArgs e)
        {

        }
    }
}