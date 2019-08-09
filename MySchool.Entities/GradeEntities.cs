using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
    public class GradeEntities
    {
        public int ID { get; set; }
        public string Grade { get; set; }
        public int GradeGroupID { get; set; }
        public string GradeGroup { get; set; }
    }
}
