using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySchool.Entities;
using MySchool.DAL;

namespace MySchool.BL
{
    public class TopicBL
    {
        public int SaveTopic(TopicEntities topicEntities)
        {
            TopicDAL topicDAL = new TopicDAL();
            return topicDAL.SaveTopic(topicEntities);
        }

        public TopicEntities GetTopicByID(int ID)
        {
            TopicDAL topicDAL = new TopicDAL();
            return topicDAL.GetTopicByID(ID);
        }

        public List<TopicEntities> GetTopicPageWise(int pageIndex, ref int recordCount, int length)
        {
            TopicDAL topicDAL = new TopicDAL();
            return topicDAL.GetTopicPageWise(pageIndex, ref recordCount, length);
        }

        public int DeleteTopic(int ID)
        {
            TopicDAL topicDAL = new TopicDAL();
            return topicDAL.DeleteTopic(ID);
        }

        //for Subject drp
        public List<TopicEntities> GetSubjectForDrp()
        {
            TopicDAL topicDAL = new TopicDAL();
            return topicDAL.GetSubjectForDrp();
        }
    }
}
