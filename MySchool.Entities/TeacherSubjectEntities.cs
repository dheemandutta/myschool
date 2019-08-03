using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
    public class TeacherSubjectEntities
    {
        public int Id { get; set; }

        public int TeacherID { get; set; }

        public int SubjectID { get; set; }

        public string isPrimarySubject { get; set; }

    }
}
