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
        public int Save(SubjectEntities subject)
        {
            SubjectDAL subjectDl = new SubjectDAL();
            return subjectDl.SaveOrUpdate(subject);

        }
    }
}
