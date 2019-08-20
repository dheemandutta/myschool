using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
    public class TeacherEntities
    {
        public int ID { get; set; }


        public string FName { get; set; }

        public string LName { get; set; }

        public string Photo { get; set; }

        public string Gender { get; set; }

        public string Address { get; set; }

        public string Ph1 { get; set; }

        public string Ph2 { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime EndDate { get; set; }

        public string Comments { get; set; }

        public string  Designation{ get; set; }
    }
}
