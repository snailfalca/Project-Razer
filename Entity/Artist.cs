using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class Artist : BaseEntity
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public int Gender { get; set; }
        public string CoverPath { get; set; }
        public string FullCoverPath
        {
            get
            {
                return "img/ArtistCover/" + CoverPath;
            }
        }
        public DateTime DOB { get; set; }
    }
}
