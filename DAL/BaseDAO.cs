using Entity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DAL
{
    public abstract class BaseDAO<Entity> where Entity : BaseEntity
    {
        protected SqlConnection connection;

        public BaseDAO()
        {
            string str = ConfigurationManager.ConnectionStrings["Razer"].ConnectionString;
            connection = new SqlConnection(str);
        }
        public abstract Entity Get(int ID);
        public abstract List<Entity> GetAll();
        public abstract int Insert(Entity entity);
        public abstract void Update(Entity entity);
        public abstract void Delete(int ID);
    }
}
