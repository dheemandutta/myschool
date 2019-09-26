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

        public int DeleteQuestion(int ID, ref string oUTPUT)
        {
            QuestionDAL topicDAL = new QuestionDAL();
            return topicDAL.DeleteQuestion(ID, ref oUTPUT);
        }

        //for Topic drp
        public List<QuestionEntities> GetTopicForDrp()
        {
            QuestionDAL topicDAL = new QuestionDAL();
            return topicDAL.GetTopicForDrp();
        }


        public int SaveOrUpdate(QuestionViewEntities questionEntities)
        {
            QuestionDAL topicDAL = new QuestionDAL();
            return topicDAL.SaveOrUpdate(questionEntities);
        }

        public List<ChoiceEntities> GetAnswerPageWise(int Id, int pageIndex, ref int recordCount, int length)
        {
            QuestionDAL topicDAL = new QuestionDAL();
            return topicDAL.GetAnswerPageWise(Id, pageIndex, ref recordCount, length);
        }



        public ChoiceEntities GetAnswerByID(int ID)
        {
            QuestionDAL topicDAL = new QuestionDAL();
            return topicDAL.GetAnswerByID(ID);
        }


        public void GetQuestionPaper(int questionCount, int userId)
        {
            QuestionDAL questionDAL = new QuestionDAL();
            questionDAL.GetQuestionPaper(questionCount,userId);
        }

        public ExamPaper GetNextPrevQuestion(int pageIndex, int pageSize, int userId)
        {
            QuestionDAL questionDAL = new QuestionDAL();
            return questionDAL.GetNextPrevQuestion(pageIndex, pageSize,userId);
        }

        //for GettblSubjectForDrp drp
        public List<QuestionEntities> GettblSubjectForDrp()
        {
            QuestionDAL topicDAL = new QuestionDAL();
            return topicDAL.GettblSubjectForDrp();
        }

        public void SaveUserAnswer(int answerId, int useranswerId, int userId)
        {
            QuestionDAL topicDAL = new QuestionDAL();
            topicDAL.SaveUserAnswer(answerId, useranswerId,userId);
        }


        //public ExamPaper GetAllQuestion(int QuestionCount)
        //{
        //    QuestionDAL topicDAL = new QuestionDAL();
        //    return topicDAL.GetAllQuestion(QuestionCount);
        //}


        public List<QuestionAnswerEntities> GetQuestionWithAnswerByUserID(int UserId)
        {
            QuestionDAL topicDAL = new QuestionDAL();
            return topicDAL.GetQuestionWithAnswerByUserID(UserId);
        }


        public ResultEntities GetRightAnswerByUserID(int UserId)
        {
            QuestionDAL topicDAL = new QuestionDAL();
            return topicDAL.GetRightAnswerByUserID(UserId);
        }
    }
}
