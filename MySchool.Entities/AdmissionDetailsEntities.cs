using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
    public class AdmissionDetailsEntities
    {
        public int ID { get; set; }

        public int AdmissionID { get; set; }

        public string FName { get; set; }

        public string LName { get; set; }

        public string Gender { get; set; }

        public DateTime DOB { get; set; }

        public string GFName { get; set; }

        public string GLName { get; set; }

        public string FatherFName { get; set; }

        public string FatherLName { get; set; }

        public string FatherOccupation { get; set; }

        public string PrevSchoolCent { get; set; }

        public string MotherTongue { get; set; }

    }

}
