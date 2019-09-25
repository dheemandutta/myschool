using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
    public class QuestionAnswerEntities
    {
        public int UserId { get; set; }
        public string QuestionText { get; set; }

        public int RowNo { get; set; }
        public string ChoiceText { get; set; }
    }
}
