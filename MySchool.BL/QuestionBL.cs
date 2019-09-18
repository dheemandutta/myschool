using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySchool.Entities;
using MySchool.DAL;

namespace MySchool.BL
{
    public class QuestionBL
    {
        public int SaveQuestion(QuestionEntities topicEntities)
        {
            QuestionDAL topicDAL = new QuestionDAL();
            return topicDAL.SaveQuestion(topicEntities);
        }

        public QuestionEntities GetQuestionByID(int ID)
        {
            QuestionDAL topicDAL = new QuestionDAL();
            return topicDAL.GetQuestionByID(ID);
        }

        public List<QuestionEntities> GetQuestionPageWise(int pageIndex, ref int recordCount, int length)
        {
            QuestionDAL topicDAL = new QuestionDAL();
            return topicDAL.GetQuestionPageWise(pageIndex, ref recordCount, length);
        }

        public int DeleteQuestion(int ID)
        {
            QuestionDAL topicDAL = new QuestionDAL();
            return topicDAL.DeleteQuestion(ID);
        }

        //for Topic drp
        public List<QuestionEntities> GetTopicForDrp()
        {
            QuestionDAL topicDAL = new QuestionDAL();
            return topicDAL.GetTopicForDrp();
        }
    }
}
