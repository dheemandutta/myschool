using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
    public class SectionEntities
    {
        public int ID { get; set; }
        public int GradeId { get; set; }
        public string Section { get; set; }

        public string Grade{ get; set; }
    }
}
