using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
    public class DonarEntities
    {
        public int ID { get; set; }

        public string DonarName { get; set; }

        public decimal? Donation { get; set; }

        public decimal Amt { get; set; }

        public DateTime Date { get; set; }
    }
}
