using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
    public class TeacherQualEntities
    {
        public int ID { get; set; }

        public int TeacherID { get; set; }

        public string QualName { get; set; }

        public string QualCertPath { get; set; }

        public string QualStatus { get; set; }

        public DateTime QualCompletionDate { get; set; }

    }
}
