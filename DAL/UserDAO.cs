using Entity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DAL
{
    public class UserDAO : BaseDAO<User>
    {
        public override void Delete(int ID)
        {
            throw new NotImplementedException();
        }

        public override User Get(int ID)
        {
            throw new NotImplementedException();
        }

        public override List<User> GetAll()
        {
            throw new NotImplementedException();
        }

        public override int Insert(User entity)
        {
            try
            {
                int InsertedID = -1;
                string query = "INSERT INTO UserTBL OUTPUT Inserted.UserID VALUES (@Email, @Password, @Name, @Gender, @Phone, @Address)";

                SqlCommand command = new SqlCommand(query, connection);

                command.Parameters.Add(new SqlParameter("@Email", entity.Email));
                command.Parameters.Add(new SqlParameter("@Password", entity.Password));
                command.Parameters.Add(new SqlParameter("@Name", entity.Name));
                command.Parameters.Add(new SqlParameter("@Gender", entity.Gender));
                command.Parameters.Add(new SqlParameter("@Phone", entity.Phone));
                command.Parameters.Add(new SqlParameter("@Address", entity.Address));

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

        public override void Update(User entity)
        {
            try
            {
                string query = "UPDATE UserTBL SET Address = @Address, Gender = @Gender, Phone = @Phone, Name = @Name WHERE UserID = @UserID";

                SqlCommand command = new SqlCommand(query, connection);

                command.Parameters.Add(new SqlParameter("@Address", entity.Address));
                command.Parameters.Add(new SqlParameter("@Gender", entity.Gender));
                command.Parameters.Add(new SqlParameter("@Phone", entity.Phone));
                command.Parameters.Add(new SqlParameter("@Name", entity.Name));
                command.Parameters.Add(new SqlParameter("@UserID", entity.ID));

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

        public User AttemptLogin(string email, string password)
        {
            try
            {
                User user = null;
                // Query from DB the User with same email & password
                string query = "SELECT * FROM UserTBL WHERE Email = @Email AND Password = @Password";

                SqlCommand command = new SqlCommand(query, connection);

                command.Parameters.Add(new SqlParameter("@Email", email));
                command.Parameters.Add(new SqlParameter("@Password", password));

                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                // Login successed, return user information
                if (reader.Read())
                {
                    user = new User()
                    {
                        ID = Convert.ToInt32(reader["UserID"]),
                        Email = Convert.ToString(reader["Email"]),
                        Name = Convert.ToString(reader["Name"]),
                        Gender = Convert.ToBoolean(reader["Gender"]),
                        Phone = Convert.ToString(reader["Phone"]),
                        Address = Convert.ToString(reader["Address"])
                    };
                    if (!DBNull.Value.Equals(reader["Admin"]))
                    {
                        user.Admin = Convert.ToBoolean(reader["Admin"]);
                    }
                }

                if (connection.State != System.Data.ConnectionState.Closed)
                    connection.Close();
                // Login failed, return null;
                return user;
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
