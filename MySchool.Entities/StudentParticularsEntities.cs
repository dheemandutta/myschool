﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
    public class StudentParticularsEntities
    {
        public int ID { get; set; }

        public int StudentID { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string DOB { get; set; }

        public int GradeID { get; set; }

        public string StartDate { get; set; }

        public string EndDate { get; set; }

        public string LeavingReason { get; set; }

        public string Gender { get; set; }

        public string Photo { get; set; }



        public string StudentName { get; set; }
        public string Grade { get; set; }


        public int SectionID { get; set; }
        public string Section { get; set; }


        public int ExamID { get; set; }
        public string ExamName { get; set; }
    }
}
