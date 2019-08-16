using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySchool.Entities;
using MySchool.DAL;

namespace MySchool.BL
{
    public class SectionBL
    {
        public int SaveOrUpdate(SectionEntities section)
        {
            SectionDAL sectionDl = new SectionDAL();
            return sectionDl.SaveOrUpdate(section);
        }

        public List<GradeEntities> GetAllGradeForDrp()
        {
            SectionDAL sectionDal = new SectionDAL();
            return sectionDal.GetAllGradeForDrp();
        }
    }
}
