using Entity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DAL
{
    public class ArtistDAO : BaseDAO<Artist>
    {
        public override void Delete(int ID)
        {
            throw new NotImplementedException();
        }

        public override Artist Get(int ID)
        {
            try
            {
                Artist artist = null;
                string query = "SELECT * FROM ArtistTBL WHERE ArtistID = @ArtistID";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.Add(new SqlParameter("@ArtistID", ID));
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    artist = new Artist()
                    {
                        ID = Convert.ToInt32(reader["ArtistID"]),
                        Title = Convert.ToString(reader["Title"]),
                        Description = Convert.ToString(reader["Description"]),
                        Gender = Convert.ToInt32(reader["Gender"]),
                        CoverPath = Convert.ToString(reader["CoverPath"])
                    };
                }

                if (!DBNull.Value.Equals(reader["DOB"]))
                {
                    artist.DOB = Convert.ToDateTime(reader["DOB"]);
                }

                if (connection.State != System.Data.ConnectionState.Closed)
                    connection.Close();
                return artist;
            }
            catch (Exception ex)
            {
                if (connection.State != System.Data.ConnectionState.Closed)
                    connection.Close();
                throw ex;
            }
        }

        public override List<Artist> GetAll()
        {
            try
            {
                List<Artist> result = new List<Artist>();

                string query = "SELECT * FROM ArtistTBL ORDER BY Title ASC";

                SqlCommand command = new SqlCommand(query, connection);

                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {Artist artist = new Artist()
                    {
                        ID = Convert.ToInt32(reader["ArtistID"]),
                        Title = Convert.ToString(reader["Title"]),
                        Description = Convert.ToString(reader["Description"]),
                        Gender = Convert.ToInt32(reader["Gender"]),
                        CoverPath = Convert.ToString(reader["CoverPath"])
                    };

                    if (!DBNull.Value.Equals(reader["DOB"]))
                    {
                        artist.DOB = Convert.ToDateTime(reader["DOB"]);
                    }

                    result.Add(artist);
                }

                if (connection.State != System.Data.ConnectionState.Closed)
                    connection.Close();
                return result;
            }
            catch (Exception ex)
            {
                if (connection.State != System.Data.ConnectionState.Closed)
                    connection.Close();
                throw ex;
            }
        }

        public override int Insert(Artist entity)
        {
            try
            {
                int InsertedID = -1;
                string query = "INSERT INTO ArtistTBL OUTPUT Inserted.ArtistID VALUES (@Title, @Gender, @Description, @CoverPath, @DOB)";

                SqlCommand command = new SqlCommand(query, connection);

                command.Parameters.Add(new SqlParameter("@Title", entity.Title));
                command.Parameters.Add(new SqlParameter("@Gender", entity.Gender));
                command.Parameters.Add(new SqlParameter("@Description", entity.Description));
                command.Parameters.Add(new SqlParameter("@CoverPath", entity.CoverPath));
                command.Parameters.Add(new SqlParameter("@DOB", entity.DOB));

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

        public override void Update(Artist entity)
        {

            try
            {
                string query = "UPDATE ArtistTBL SET Title = @Title, Gender = @Gender, Description = @Description, CoverPath = @CoverPath, DOB = @DOB WHERE ArtistID = @ArtistID";

                SqlCommand command = new SqlCommand(query, connection);

                command.Parameters.Add(new SqlParameter("@Title", entity.Title));
                command.Parameters.Add(new SqlParameter("@Gender", entity.Gender));
                command.Parameters.Add(new SqlParameter("@Description", entity.Description));
                command.Parameters.Add(new SqlParameter("@CoverPath", entity.CoverPath));
                command.Parameters.Add(new SqlParameter("@ArtistID", entity.ID));
                command.Parameters.Add(new SqlParameter("@DOB", entity.DOB));

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
