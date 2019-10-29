using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{ 
    public class AdmissionEntities
    {
        public int ID { get; set; }
        public int YearID { get; set; }
        public int GradeID { get; set; }
        public decimal AdmAmt { get; set; }
        public string AdmissonNumber { get; set; }
        public int AdmissionFormID { get; set; }
    }
}
