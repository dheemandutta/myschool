using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
    public class StudentAttendentEntities
    {
        public int ID { get; set; }

        public int StudentID { get; set; }

        public string StudentName { get; set; }

        public DateTime Date { get; set; }

        public string IsPresents { get; set; }
    }
}
