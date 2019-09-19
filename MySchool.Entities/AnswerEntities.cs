using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
    public class AnswerEntities
    {
        public int  ID { get; set; }
        public int QuestionID { get; set; }
        public int ChoiceID { get; set; }

        public string AnswerText { get; set; }
        public string IsRightAnswer { get; set; }

        public bool IsUserAnswer { get; set; }


    }
}
