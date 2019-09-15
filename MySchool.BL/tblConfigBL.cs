using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySchool.Entities;
using MySchool.DAL;

namespace MySchool.BL
{
    public class tblConfigBL
    {
        public int SavetblConfig(tblConfigEntities configEntities)
        {
            tblConfigDAL topicDAL = new tblConfigDAL();
            return topicDAL.SaveConfig(configEntities);
        }

        public List<tblConfigEntities> GettblConfigPageWise(int pageIndex, ref int recordCount, int length)
        {
            tblConfigDAL topicDAL = new tblConfigDAL();
            return topicDAL.GettblConfigPageWise(pageIndex, ref recordCount, length);
        }

        public int DeletetblConfig(string KeyName)
        {
            tblConfigDAL topicDAL = new tblConfigDAL();
            return topicDAL.DeletetblConfig(KeyName);
        }
    }
}
