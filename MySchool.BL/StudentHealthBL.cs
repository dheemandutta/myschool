using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySchool.Entities;
using MySchool.DAL;

namespace MySchool.BL
{
    public class StudentHealthBL
    {
        public int SaveStudentHealth(StudentHealthEntities studentHealthEntities)
        {
            StudentHealthDAL studentHealthDAL = new StudentHealthDAL();
            return studentHealthDAL.SaveStudentHealth(studentHealthEntities);
        }

        public StudentHealthEntities GetStudentHealthByID(int ID)
        {
            StudentHealthDAL studentHealthDAL = new StudentHealthDAL();
            return studentHealthDAL.GetStudentHealthByID(ID);
        }

        public List<StudentHealthEntities> GetStudentHealthPageWise(int pageIndex, ref int recordCount, int length)
        {
            StudentHealthDAL studentHealthDAL = new StudentHealthDAL();
            return studentHealthDAL.GetStudentHealthPageWise(pageIndex, ref recordCount, length);
        }
    }
}
