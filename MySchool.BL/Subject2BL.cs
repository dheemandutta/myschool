using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySchool.Entities;
using MySchool.DAL;

namespace MySchool.BL
{
    public class Subject2BL
    {
        public int SaveSubject(SubjectEntities subjectEntities)
        {
            Subject2DAL subjectDAL = new Subject2DAL();
            return subjectDAL.SaveSubject(subjectEntities);
        }

        public SubjectEntities GetSubjectByID(int ID)
        {
            Subject2DAL subjectDAL = new Subject2DAL();
            return subjectDAL.GetSubjectByID(ID);
        }

        public List<SubjectEntities> GetSubjectPageWise(int pageIndex, ref int recordCount, int length)
        {
            Subject2DAL subjectDAL = new Subject2DAL();
            return subjectDAL.GetSubjectPageWise(pageIndex, ref recordCount, length);
        }

        public int DeleteSubject(int ID)
        {
            Subject2DAL subjectDAL = new Subject2DAL();
            return subjectDAL.DeleteSubject(ID);
        }

        //for Subject drp
        public List<SubjectEntities> GetSubjectForDrp()
        {
            Subject2DAL subjectDAL = new Subject2DAL();
            return subjectDAL.GetSubjectForDrp();
        }

    }
}
