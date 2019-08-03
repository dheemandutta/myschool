using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
    public class TimeTableEntities
    {
        public int ID { get; set; }

        public int GradeID { get; set; }

        public int YearID { get; set; }

        public int SubjectID { get; set; }

        public int DayOfWeekID { get; set; }
    }
}
