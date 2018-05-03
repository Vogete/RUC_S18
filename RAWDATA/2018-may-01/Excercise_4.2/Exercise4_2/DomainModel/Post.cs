using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise4_2.DomainModel
{
    public class Post
    {
        public int Id { get; set; }
        public int PostType { get; set; }
        public int? ParentId { get; set; }
        public string CreationDate { get; set; }
        public int Score { get; set; }
        public string Body { get; set; }
        public string Title { get; set; }
    }
}
