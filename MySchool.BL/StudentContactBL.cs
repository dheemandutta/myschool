using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySchool.Entities;
using MySchool.DAL;

namespace MySchool.BL
{
    public class StudentContactBL
    {
        public int SaveStudentContact(StudentContactEntities studentContactEntities)
        {
            StudentContactDAL studentContactDAL = new StudentContactDAL();
            return studentContactDAL.SaveStudentContact(studentContactEntities);
        }

        public StudentContactEntities GetStudentContactByID(int ID)
        {
            StudentContactDAL studentContactDAL = new StudentContactDAL();
            return studentContactDAL.GetStudentContactByID(ID);
        }

        public List<StudentContactEntities> GetStudentContactPageWise(int pageIndex, ref int recordCount, int length)
        {
            StudentContactDAL studentContactDAL = new StudentContactDAL();
            return studentContactDAL.GetStudentContactPageWise(pageIndex, ref recordCount, length);
        }
    }
}
