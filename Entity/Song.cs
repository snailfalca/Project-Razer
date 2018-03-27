using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class Song : BaseEntity
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public string FilePath { get; set; }
        public int ArtistID { get; set; }
        public bool Played { get; set; }
        public Song()
        {
            Played = false;
        }
    }
}
