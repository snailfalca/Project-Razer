using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class Playlist : BaseEntity
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public int UserID { get; set; }
        public bool Private { get; set; }
        public List<Song> Songs { get; set; }

    }
}
