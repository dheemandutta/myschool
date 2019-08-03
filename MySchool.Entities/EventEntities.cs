using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
    public class EventEntities
    {
        public int ID { get; set; }

        public string Desc { get; set; }

        public DateTime Date { get; set; }

        public DateTime FromTime { get; set; }

        public DateTime ToTime { get; set; }

        public int TeacherID { get; set; }
    }
}
