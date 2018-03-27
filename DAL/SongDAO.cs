using Entity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DAL
{
    public class SongDAO : BaseDAO<Song>
    {
        public override void Delete(int ID)
        {
            throw new NotImplementedException();
        }

        public override Song Get(int ID)
        {
            try
            {
                Song song = null;
                string query = "SELECT * FROM SongTBL WHERE SongID = @SongID";

                SqlCommand command = new SqlCommand(query, connection);

                command.Parameters.Add(new SqlParameter("@SongID", ID));

                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    song = new Song()
                    {
                        ID = Convert.ToInt32(reader["SongID"]),
                        ArtistID = Convert.ToInt32(reader["ArtistID"]),
                        Title = Convert.ToString(reader["Title"]),
                        FilePath = Convert.ToString(reader["FilePath"]),
                    };

                    return song;
                }

                if (connection.State != System.Data.ConnectionState.Closed)
                    connection.Close();
                return null;
            }
            catch (Exception ex)
            {
                if (connection.State != System.Data.ConnectionState.Closed)
                    connection.Close();
                throw ex;
            }
        }

        public List<Song> GetAllUserFav(int userID)
        {
            try
            {
                List<Song> songs = new List<Song>();
                string query = "SELECT DISTINCT Songs.SongID, Songs.ArtistID, Songs.Title, Songs.FilePath FROM SongFavoriteTBL as Fav INNER JOIN SongTBL as Songs ON Songs.SongID = Fav.SongID WHERE Fav.UserID = @UserID ORDER BY Songs.Title ASC";

                SqlCommand command = new SqlCommand(query, connection);

                command.Parameters.Add(new SqlParameter("@UserID", userID));

                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    songs.Add(new Song()
                    {
                        ID = Convert.ToInt32(reader["SongID"]),
                        ArtistID = Convert.ToInt32(reader["ArtistID"]),
                        Title = Convert.ToString(reader["Title"]),
                        FilePath = Convert.ToString(reader["FilePath"]),
                    });
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

        public void RemoveSongFromFav(int SongID, int UserID)
        {
            try
            {
                string query = "DELETE FROM SongFavoriteTBL WHERE SongID = @SongID AND UserID = @UserID";

                SqlCommand command = new SqlCommand(query, connection);

                command.Parameters.Add(new SqlParameter("@SongID", SongID));
                command.Parameters.Add(new SqlParameter("@UserID", UserID));

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

        public void AddSongToFav(int SongID, int UserID)
        {
            try
            {
                string query = "INSERT INTO SongFavoriteTBL VALUES (@SongID, @UserID)";

                SqlCommand command = new SqlCommand(query, connection);

                command.Parameters.Add(new SqlParameter("@SongID", SongID));
                command.Parameters.Add(new SqlParameter("@UserID", UserID));

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

        public override List<Song> GetAll()
        {
            try
            {
                List<Song> songs = new List<Song>();
                string query = "SELECT * FROM SongTBL ORDER BY Title ASC";

                SqlCommand command = new SqlCommand(query, connection);

                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    songs.Add(new Song()
                    {
                        ID = Convert.ToInt32(reader["SongID"]),
                        ArtistID = Convert.ToInt32(reader["ArtistID"]),
                        Title = Convert.ToString(reader["Title"]),
                        FilePath = Convert.ToString(reader["FilePath"]),
                    });
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

        public bool IsSongFavorited(int SongID, int UserID)
        {
            string query = "SELECT * FROM SongFavoriteTBL WHERE UserID = @UserID AND SongID = @SongID";

            SqlCommand command = new SqlCommand(query, connection);

            command.Parameters.Add(new SqlParameter("@UserID", UserID));
            command.Parameters.Add(new SqlParameter("@SongID", SongID));

            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            if (reader.Read())
            {
                if (connection.State != System.Data.ConnectionState.Closed)
                    connection.Close();
                return true;
            }

            if (connection.State != System.Data.ConnectionState.Closed)
                connection.Close();
            return false;
        }

        public List<Song> GetAllByArtistID(int ID)
        {
            try
            {
                List<Song> songs = new List<Song>();
                string query = "SELECT * FROM SongTBL WHERE ArtistID = @ArtistID";

                SqlCommand command = new SqlCommand(query, connection);

                command.Parameters.Add(new SqlParameter("@ArtistID", ID));

                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    songs.Add(new Song()
                    {
                        ID = Convert.ToInt32(reader["SongID"]),
                        ArtistID = Convert.ToInt32(reader["ArtistID"]),
                        Title = Convert.ToString(reader["Title"]),
                        FilePath = Convert.ToString(reader["FilePath"]),
                    });
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
        public override int Insert(Song entity)
        {
            try
            {
                int InsertedID = -1;
                string query = "INSERT INTO SongTBL OUTPUT Inserted.SongID VALUES (@Title, @FilePath, @ArtistID)";

                SqlCommand command = new SqlCommand(query, connection);

                command.Parameters.Add(new SqlParameter("@Title", entity.Title));
                command.Parameters.Add(new SqlParameter("@FilePath", entity.FilePath));
                command.Parameters.Add(new SqlParameter("@ArtistID", entity.ArtistID));

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

        public override void Update(Song entity)
        {
            try
            {
                string query = "UPDATE SongTBL SET Title = @Title, FilePath = @FilePath, ArtistID = @ArtistID WHERE SongID = @SongID";

                SqlCommand command = new SqlCommand(query, connection);

                command.Parameters.Add(new SqlParameter("@Title", entity.Title));
                command.Parameters.Add(new SqlParameter("@FilePath", entity.FilePath));
                command.Parameters.Add(new SqlParameter("@ArtistID", entity.ArtistID));
                command.Parameters.Add(new SqlParameter("@SongID", entity.ID));

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

    }
}
