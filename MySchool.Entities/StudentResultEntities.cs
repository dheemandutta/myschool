using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
    public class StudentResultEntities
    {
        public int ID { get; set; }

        public int StudentID { get; set; }

        public decimal Marks { get; set; }

        public int ExamSubjectID { get; set; }
    }
}
