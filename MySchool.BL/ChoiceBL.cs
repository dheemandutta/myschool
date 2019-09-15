using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySchool.Entities;
using MySchool.DAL;

namespace MySchool.BL
{
    public class ChoiceBL
    {
        public int SaveChoice(ChoiceEntities choiceEntities)
        {
            ChoiceDAL topicDAL = new ChoiceDAL();
            return topicDAL.SaveChoice(choiceEntities);
        }

        public ChoiceEntities GetChoiceByID(int ID)
        {
            ChoiceDAL topicDAL = new ChoiceDAL();
            return topicDAL.GetChoiceByID(ID);
        }

        public List<ChoiceEntities> GetChoicePageWise(int pageIndex, ref int recordCount, int length)
        {
            ChoiceDAL topicDAL = new ChoiceDAL();
            return topicDAL.GetChoicePageWise(pageIndex, ref recordCount, length);
        }

        public int DeleteChoice(int ID)
        {
            ChoiceDAL topicDAL = new ChoiceDAL();
            return topicDAL.DeleteChoice(ID);
        }

        //for QuestionName drp
        public List<ChoiceEntities> GetQuestionForDrp()
        {
            ChoiceDAL topicDAL = new ChoiceDAL();
            return topicDAL.GetQuestionForDrp();
        }
    }
}
