using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySchool.Entities;
using MySchool.DAL;

namespace MySchool.BL
{
    public class StudentAttendentBL
    {
        public List<GradeEntities> GetAllGradeForDrp()
        {
            StudentAttendentDAL studentAttendentDAL = new StudentAttendentDAL();
            return studentAttendentDAL.GetAllGradeForDrp();
        }

        public List<StudentAttendentEntities> GetStudentAttendentPageWise(int pageIndex, ref int recordCount, int length)
        {
            StudentAttendentDAL studentAttendentDAL = new StudentAttendentDAL();
            return studentAttendentDAL.GetStudentAttendentPageWise(pageIndex, ref recordCount, length);
        }

        public List<GradeEntities> GetAllGradeForDrpNew()
        {
            StudentAttendentDAL studentAttendentDAL = new StudentAttendentDAL();
            return studentAttendentDAL.GetAllGradeForDrpNew();
        }

        public List<SectionEntities> GetAllSectionByGradeIdForDrp_New(string ID)
        {
            StudentAttendentDAL studentAttendentDAL = new StudentAttendentDAL();
            return studentAttendentDAL.GetAllSectionByGradeIdForDrp_New(ID);
        }

        public List<StudentEntities> stpGetAllStudentBySectionIdForDrp_New(string ID, string YearID)
        {
            StudentAttendentDAL studentAttendentDAL = new StudentAttendentDAL();
            return studentAttendentDAL.stpGetAllStudentBySectionIdForDrp_New(ID, YearID);
        }
    }
}
