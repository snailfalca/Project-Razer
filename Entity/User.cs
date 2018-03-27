using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class User : BaseEntity
    {
        public int ID { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Name { get; set; }
        public bool Gender { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public bool? Admin { get; set; }
    }
}
