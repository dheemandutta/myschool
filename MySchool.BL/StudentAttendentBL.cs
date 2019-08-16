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
    }
}
