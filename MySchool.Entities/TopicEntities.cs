using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
    public class TopicEntities
    {
        public int ID { get; set; }
        public int SubjectId { get; set; }
        public string TopicName { get; set; }
        public string SubjectName { get; set; }
    }
}
