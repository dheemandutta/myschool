using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
    public class StudentHealthEntities
    {
        public int ID { get; set; }

        public int StudentID { get; set; }

        public string BloodGroup { get; set; }

        public string KnownMadicalProblems { get; set; }

        public string DoctorName { get; set; }

        public string StudentName { get; set; }

    }
}
