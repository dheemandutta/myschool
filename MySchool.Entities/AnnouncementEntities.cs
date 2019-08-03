using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
    public class AnnouncementEntities
    {
        public int ID { get; set; }

        public string AnnouncementDesc { get; set; }

        public string Announcement { get; set; }

        public DateTime? ValitUntilDate { get; set; }

        public string CreatedBy { get; set; }
    }
}
