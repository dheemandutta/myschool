using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
    public class QuestionViewEntities
    {
        public QuestionEntities QuestionEntities { get; set; }
        public AnswerEntities[] AnswerEntities { get; set; }
    }
}
