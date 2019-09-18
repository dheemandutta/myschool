using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
    public class ChoiceEntities
    {
        public int ID { get; set; }
        public int QuestionId { get; set; }
        public string ChoiceText { get; set; }

        public string QuestionName { get; set; }
    }
}
