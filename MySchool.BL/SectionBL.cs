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
        
        public int Delete(int id)
        {
            SectionDAL sectionDl = new SectionDAL();
            return sectionDl.Delete(id);
        }

        public List<SectionEntities> GetAllSectionPageWise(int pageIndex, ref int recordCount, int length)
        {
            SectionDAL sectionDl = new SectionDAL();
            return sectionDl.GetAllSectionPageWise(pageIndex, ref recordCount, length);
        }

        public SectionEntities GetSectionByID(int sectionID)
        {
            SectionDAL sectionDl = new SectionDAL();
            return sectionDl.GetSectionByID(sectionID);
        }
    }
}
