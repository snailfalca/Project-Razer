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
    public partial class Admin_AddSong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownArtist.DataSource = new ArtistDAO().GetAll();
                DropDownArtist.DataTextField = "Title";
                DropDownArtist.DataValueField = "ID";

                DropDownArtist.DataBind();

                GridViewSongs.DataSource = new SongDAO().GetAll();
                GridViewSongs.DataBind();

                //Reset text
                TxtSongName.Text = "";
                DropDownArtist.SelectedIndex = 0;
                Session["SongAction"] = "Add";
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            // Validate name
            if (TxtSongName.Text.Length == 0)
            {
                // Prompt error            
                ScriptManager.RegisterStartupScript(this, GetType(),
                                     "ServerControlScript", "alert(\"Name can't be empty!\");", true);
            }
            else
            {
                switch ((string)Session["SongAction"])
                {
                    case "Add":
                        HandleAddSong();
                        Response.Redirect("Admin_AddSong.aspx");
                        break;
                    case "Edit":
                        HandleEditSong();
                        Response.Redirect("Admin_AddSong.aspx");
                        break;
                }

                //Reset text
                TxtSongName.Text = "";
                DropDownArtist.SelectedIndex = 0;
                Session["SongAction"] = "Add";
                ActionLabel.Text = "Add a new song...!";
            }
        }

        private void HandleEditSong()
        {
            Song workingSong = (Song)Session["WorkingSong"];
            // Update song in DB
            workingSong.ArtistID = Convert.ToInt32(DropDownArtist.SelectedValue);
            workingSong.Title = TxtSongName.Text;

            if (FileUpload.FileBytes.Length > 200)
            {
                workingSong.FilePath = FileUpload.FileName;
                // Save song file
                FileUpload.SaveAs(Server.MapPath("song") + "\\" + FileUpload.FileName);
            }

            new SongDAO().Update(workingSong);            
            }

        private void HandleAddSong()
        {
            if (FileUpload.FileBytes.Length < 200)
            {
                // Prompt error            
                ScriptManager.RegisterStartupScript(this, GetType(),
                                     "ServerControlScript", "alert(\"File too small!\");", true);
            }
            else
            {
                // Insert song to DB
                new SongDAO().Insert(new Song()
                {
                    ArtistID = Convert.ToInt32(DropDownArtist.SelectedValue),
                    Title = TxtSongName.Text,
                    FilePath = FileUpload.FileName
                });

                // Save song file
                FileUpload.SaveAs(Server.MapPath("song") + "\\" + FileUpload.FileName);

                // Prompt result            
                ScriptManager.RegisterStartupScript(this, GetType(),
                                     "ServerControlScript", "alert(\"Done...!\");", true);
            }
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            TxtSongName.Text = "";
            Session["SongAction"] = "Add";
            ActionLabel.Text = "Add a new song...!";
            BtnSave.Text = "Save";
            BtnSave.BackColor = Color.FromArgb(Convert.ToInt32("5cb85c", 16));
        }

        protected void GridViewSongs_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int workingSongID = Convert.ToInt32(GridViewSongs.Rows[e.NewEditIndex].Cells[1].Text);

            Session["WorkingSong"] = new SongDAO().Get(workingSongID);

            TxtSongName.Text = ((Song)Session["WorkingSong"]).Title;
            DropDownArtist.SelectedValue = ((Song)Session["WorkingSong"]).ArtistID.ToString();
            Session["SongAction"] = "Edit";
            ActionLabel.Text = "Edit song...!";
        }

        protected void GridViewSongs_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //GridViewSongs.PageIndex = e.NewPageIndex;

            //GridViewSongs.DataSource = new SongDAO().GetAll();
            //GridViewSongs.DataBind();
        }
    }
}