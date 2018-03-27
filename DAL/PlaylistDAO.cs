using Entity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DAL
{
    public class PlaylistDAO : BaseDAO<Playlist>
    {
        public override void Delete(int ID)
        {
            try
            {
                // CODE HERE! :")
                if (connection.State != System.Data.ConnectionState.Closed)
                    connection.Close();
            }
            catch (Exception ex)
            {
                if (connection.State != System.Data.ConnectionState.Closed)
                    connection.Close();
                throw ex;
            }
        }

        public override Playlist Get(int ID)
        {
            try
            {
                Playlist playlist = null;

                // Query from DB the Playlist by given ID
                string query = "SELECT * FROM PlaylistTBL WHERE PlaylistID = @PlaylistID";

                SqlCommand command = new SqlCommand(query, connection);

                command.Parameters.Add(new SqlParameter("@PlaylistID", ID));

                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                // Load playlist details
                if (reader.Read())
                {
                    playlist = new Playlist()
                    {
                        ID = Convert.ToInt32(reader["PlaylistID"]),
                        Private = Convert.ToBoolean(reader["Private"]),
                        Title = Convert.ToString(reader["Title"]),
                        UserID = Convert.ToInt32(reader["UserID"]),
                    };

                    if (connection.State != System.Data.ConnectionState.Closed)
                        connection.Close();
                }
                return playlist;
            }
            catch (Exception ex)
            {
                if (connection.State != System.Data.ConnectionState.Closed)
                    connection.Close();
                throw ex;
            }
        }

        public void RemoveSongFromPlayList(int PlaylistID, int SongID)
        {
            try
            {
                // Remove song from SongPlaylistTBL
                string query = "DELETE FROM SongPlaylistTBL WHERE PlaylistID = @PlaylistID AND SongID = @SongID";

                SqlCommand command = new SqlCommand(query, connection);

                command.Parameters.Add(new SqlParameter("@PlaylistID", PlaylistID));
                command.Parameters.Add(new SqlParameter("@SongID", SongID));

                connection.Open();

                command.ExecuteNonQuery();
                if (connection.State != System.Data.ConnectionState.Closed)
                    connection.Close();
            }
            catch (Exception ex)
            {
                if (connection.State != System.Data.ConnectionState.Closed)
                    connection.Close();
                throw ex;
            }
        }

        public void InsertSongToPlayList(int PlaylistID, int SongID)
        {
            try
            {
                // Insert song to SongPlaylistTBL
                string query = "INSERT INTO SongPlaylistTBL VALUES(@PlaylistID, @SongID)";

                SqlCommand command = new SqlCommand(query, connection);

                command.Parameters.Add(new SqlParameter("@PlaylistID", PlaylistID));
                command.Parameters.Add(new SqlParameter("@SongID", SongID));

                connection.Open();

                command.ExecuteNonQuery();
                if (connection.State != System.Data.ConnectionState.Closed)
                    connection.Close();
            }
            catch (Exception ex)
            {
                if (connection.State != System.Data.ConnectionState.Closed)
                    connection.Close();
                throw ex;
            }
        }

        public List<Playlist> GetAllByUserID(int UserID)
        {
            try
            {
                List<Playlist> playlists = new List<Playlist>();

                string query = "SELECT * FROM PlaylistTBL WHERE UserID = @UserID";

                SqlCommand command = new SqlCommand(query, connection);

                command.Parameters.Add(new SqlParameter("@UserID", UserID));

                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    playlists.Add(new Playlist()
                    {
                        ID = Convert.ToInt32(reader["PlaylistID"]),
                        Title = Convert.ToString(reader["Title"]),
                        UserID = Convert.ToInt32(reader["UserID"]),
                        Private = Convert.ToBoolean(reader["Private"])
                    });
                }

                if (connection.State != System.Data.ConnectionState.Closed)
                    connection.Close();
                return playlists;
            }
            catch (Exception ex)
            {
                if (connection.State != System.Data.ConnectionState.Closed)
                    connection.Close();
                throw ex;
            }
        }

        public List<Song> GetPlaylistSongs(int playlistID)
        {
            try
            {
                List<Song> songs = new List<Song>();

                string query = "SELECT * FROM SongPlaylistTBL WHERE PlaylistID = @PlaylistID";

                SqlCommand command = new SqlCommand(query, connection);

                command.Parameters.Add(new SqlParameter("@PlaylistID", playlistID));

                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                // Add songs to list
                while (reader.Read())
                {
                    int songID = Convert.ToInt32(reader["SongID"]);
                    songs.Add(new SongDAO().Get(songID));
                }

                if (connection.State != System.Data.ConnectionState.Closed)
                    connection.Close();
                return songs;
            }
            catch (Exception ex)
            {
                if (connection.State != System.Data.ConnectionState.Closed)
                    connection.Close();
                throw ex;
            }
        }

        public override List<Playlist> GetAll()
        {
            throw new NotImplementedException();
        }

        public override int Insert(Playlist entity)
        {
            try
            {
                int InsertedID = -1;
                string query = "INSERT INTO PlaylistTBL OUTPUT Inserted.PlaylistID VALUES (@Title, @UserID, @Private)";

                SqlCommand command = new SqlCommand(query, connection);

                command.Parameters.Add(new SqlParameter("@Title", entity.Title));
                command.Parameters.Add(new SqlParameter("@UserID", entity.UserID));
                command.Parameters.Add(new SqlParameter("@Private", entity.Private));

                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                // Load playlist details
                if (reader.Read())
                {
                    InsertedID = Convert.ToInt32(reader[0]);
                }

                if (connection.State != System.Data.ConnectionState.Closed)
                    connection.Close();

                return InsertedID;
            }
            catch (Exception ex)
            {
                if (connection.State != System.Data.ConnectionState.Closed)
                    connection.Close();
                throw ex;
            }
        }

        public override void Update(Playlist entity)
        {
            throw new NotImplementedException();
        }

        public bool DoesListContainSong(int PlaylistID, int SongID)
        {
            try
            {
                string query = "SELECT * FROM SongPlaylistTBL WHERE PlaylistID = @PlaylistID AND SongID = @SongID";

                SqlCommand command = new SqlCommand(query, connection);

                command.Parameters.Add(new SqlParameter("@PlaylistID", PlaylistID));
                command.Parameters.Add(new SqlParameter("@SongID", SongID));

                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    if (connection.State != System.Data.ConnectionState.Closed)
                        connection.Close();
                    return true;
                }
                else
                {
                    if (connection.State != System.Data.ConnectionState.Closed)
                        connection.Close();
                    return false;
                }
            }
            catch (Exception ex)
            {
                if (connection.State != System.Data.ConnectionState.Closed)
                    connection.Close();
                throw ex;
            }
        }

    }
}
