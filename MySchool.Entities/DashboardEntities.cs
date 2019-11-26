using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
    public class DashboardEntities
    {
        public int id { get; set; }
        public string subject { get; set; }
        public string description { get; set; }
        public DateTime releaseDate { get; set; }
        public DateTime expiryDate { get; set; }
        public string importance { get; set; }
        public string filepath { get; set; }

    }
}
