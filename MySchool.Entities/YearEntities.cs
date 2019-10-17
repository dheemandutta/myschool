using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
    public class YearEntities:BaseEntity
    {
        public int ID { get; set; }

        public string Year { get; set; }

        public string YearDesc { get; set; }
    }
}
