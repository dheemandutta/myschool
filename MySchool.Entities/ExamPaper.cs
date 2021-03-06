﻿using System;
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

            List<int> m = new List<int>();
            this.QuestionList = m;

            List<AnsweredQuestions> aq = new List<AnsweredQuestions>();
            this.AnsweredQuestions = aq;
        }
        public List<QuestionEntities> QuestionEntities { get; set; }
        public int PageIndex { get; set; }
        public int PageSize { get; set; }


        public int QuestionCount { get; set; }

        public List<int> AnsweredQuestionList { get; set; }

        public List<int> QuestionList { get; set; }

        public List<AnsweredQuestions> AnsweredQuestions { get; set; }

        public string ExamType { get; set; }

        public string RadioValue { get; set; }
        public string UserAnswer { get; set; }

        public string CurrentTime { get; set; }
    }
}
