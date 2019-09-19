using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
   public class ExamPaper
    {

        public ExamPaper()
        {
            List<QuestionEntities> q = new List<QuestionEntities>();
                 

            this.QuestionEntities = q;
        }
        public List<QuestionEntities> QuestionEntities { get; set; }
        public int PageIndex { get; set; }
        public int PageSize { get; set; }



    }
}
