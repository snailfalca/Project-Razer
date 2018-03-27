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
    public partial class Admin_Artists : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridViewArtists.DataSource = new ArtistDAO().GetAll();
                GridViewArtists.DataBind();

                //Reset text
                TxtName.Text = "";
                //DropDownArtist.SelectedIndex = 0;
                Session["ArtistAction"] = "Add";
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            // Validate name
            if (TxtName.Text.Length == 0)
            {
                // Prompt error            
                ScriptManager.RegisterStartupScript(this, GetType(),
                                     "ServerControlScript", "alert(\"Name can't be empty!\");", true);
            }
            else
            {
                switch ((string)Session["ArtistAction"])
                {
                    case "Add":
                        HandleAddArtist();
                        Response.Redirect("Admin_Artists.aspx");
                        break;
                    case "Edit":
                        HandleEditArtist();
                        Response.Redirect("Admin_Artists.aspx");
                        break;
                }

                //Reset text
                TxtName.Text = "";
                //DropDownArtist.SelectedIndex = 0;
                Session["ArtistAction"] = "Add";
                ActionLabel.Text = "Add a new artist...!";
            }
        }

        private void HandleEditArtist()
        {
            Artist workingArtist = (Artist)Session["WorkingArtist"];
            // Update artist in DB
            //workingArtist.ID = Convert.ToInt32(DropDownArtist.SelectedValue);
            workingArtist.Title = TxtName.Text;
            workingArtist.Description = TxtDescription.Text;
            workingArtist.Gender = Convert.ToInt32(GenderDropdown.SelectedValue);
            workingArtist.DOB = CalendarDOB.SelectedDate;

            if (FileUpload.FileBytes.Length > 20)
            {
                workingArtist.CoverPath = FileUpload.FileName;
                // Save cover file
                FileUpload.SaveAs(Server.MapPath("img\\ArtistCover") + "\\" + FileUpload.FileName);
            }

            new ArtistDAO().Update(workingArtist);
        }

        private void HandleAddArtist()
        {
            if (FileUpload.FileBytes.Length < 20)
            {
                // Prompt error            
                ScriptManager.RegisterStartupScript(this, GetType(),
                                     "ServerControlScript", "alert(\"File too small!\");", true);
            }
            else
            {
                // Insert Artist to DB
                new ArtistDAO().Insert(new Artist()
                {
                    //ArtistID = Convert.ToInt32(DropDownArtist.SelectedValue),
                    Title = TxtName.Text,
                    CoverPath = FileUpload.FileName,
                    Description = TxtDescription.Text,
                    Gender = Convert.ToInt32(GenderDropdown.SelectedValue),
                    DOB = CalendarDOB.SelectedDate
                });

                // Save Artist file
                FileUpload.SaveAs(Server.MapPath("img\\ArtistCover") + "\\" + FileUpload.FileName);

                // Prompt result            
                ScriptManager.RegisterStartupScript(this, GetType(),
                                     "ServerControlScript", "alert(\"Done...!\");", true);
            }
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            TxtName.Text = "";
            Session["ArtistAction"] = "Add";
            ActionLabel.Text = "Add a new artist...!";
            //BtnSave.Text = "Save";
            //BtnSave.BackColor = Color.FromArgb(Convert.ToInt32("5cb85c", 16));
        }

        protected void GridViewArtists_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int workingArtistID = Convert.ToInt32(GridViewArtists.Rows[e.NewEditIndex].Cells[1].Text);
            
            Artist artist = new ArtistDAO().Get(workingArtistID);

            Session["WorkingArtist"] = artist;

            TxtName.Text = artist.Title;
            TxtDescription.Text = artist.Description;
            CalendarDOB.SelectedDate = artist.DOB;
            GenderDropdown.SelectedValue = artist.Gender.ToString();
            //DropDownArtist.SelectedValue = ((Artist)Session["WorkingArtist"]).ArtistID.ToString();
            Session["ArtistAction"] = "Edit";
            ActionLabel.Text = "Edit artist...!";
        }

        protected void GridViewArtists_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewArtists.PageIndex = e.NewPageIndex;
            GridViewArtists.DataSource = new ArtistDAO().GetAll();
            GridViewArtists.DataBind();

        }
    }
}