using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
    public class QuestionEntities
    {
        public int Id { get; set; }

        public int TopicId { get; set; }
        public string TopicName { get; set; }

        public string QuestionText { get; set; }
        public string ImagePath { get; set; }
        public decimal Marks { get; set; }


        public string SubjectName { get; set; }
    }
}
