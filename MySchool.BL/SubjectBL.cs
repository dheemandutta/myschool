using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySchool.Entities;
using MySchool.DAL;

namespace MySchool.BL
{
    public class SubjectBL
    {
        public int SaveSubject(SubjectEntities subjectEntities)
        {
            SubjectDAL subjectDAL = new SubjectDAL();
            return subjectDAL.SaveSubject(subjectEntities);
        }

        public int DeleteSubject(int ID)
        {
            SubjectDAL subjectDl = new SubjectDAL();
            return subjectDl.DeleteSubject(ID);
        }
        public SubjectEntities GetSubjectByID(int ID)
        {
            SubjectDAL subjectDAL = new SubjectDAL();
            return subjectDAL.GetSubjectByID(ID);
        }

        public List<SubjectEntities> GetSubjectPageWise(int pageIndex, ref int recordCount, int length)
        {
            SubjectDAL subjectDAL = new SubjectDAL();
            return subjectDAL.GetSubjectPageWise(pageIndex, ref recordCount, length);
        }

        //for Grade drp
        ////////////////////////////////////////////////////
        ///
        public List<SubjectEntities> GetAllSubjectForDrp()
        {
            SubjectDAL subjectDal = new SubjectDAL();
            return subjectDal.GetSubjectForDrp();
        }
    }
}
