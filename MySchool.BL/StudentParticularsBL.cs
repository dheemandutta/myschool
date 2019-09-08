using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySchool.Entities;
using MySchool.DAL;

namespace MySchool.BL
{
    public class StudentParticularsBL
    {
        public int SaveStudentParticulars(StudentParticularsEntities studentParticularsEntities)
        {
            StudentParticularsDAL studentParticularsDAL = new StudentParticularsDAL();
            return studentParticularsDAL.SaveStudentParticulars(studentParticularsEntities);
        }

        public StudentParticularsEntities GetStudentParticularsByID(int ID)
        {
            StudentParticularsDAL studentParticularsDAL = new StudentParticularsDAL();
            return studentParticularsDAL.GetStudentParticularsByID(ID);
        }

        public List<StudentParticularsEntities> GetStudentParticularsPageWise(int pageIndex, ref int recordCount, int length)
        {
            StudentParticularsDAL studentParticularsDAL = new StudentParticularsDAL();
            return studentParticularsDAL.GetStudentParticularsPageWise(pageIndex, ref recordCount, length);
        }

        //for StudentName drp
        public List<StudentParticularsEntities> GetStudentForDrp()
        {
            StudentParticularsDAL studentParticularsDal = new StudentParticularsDAL();
            return studentParticularsDal.GetStudentForDrp();
        }

        //for Grade drp
        public List<StudentParticularsEntities> GetGradeForDrp()
        {
            StudentParticularsDAL studentParticularsDal = new StudentParticularsDAL();
            return studentParticularsDal.GetGradeForDrp();
        }

        //for Section drp
        public List<StudentParticularsEntities> GetSectionForDrp()
        {
            StudentParticularsDAL studentParticularsDal = new StudentParticularsDAL();
            return studentParticularsDal.GetSectionForDrp();
        }


        public List<StudentParticularsEntities> GetStudentSearchByNamePageWise(int pageIndex, ref int recordCount, int length, string searchval)
        {
            StudentParticularsDAL studentParticularsDal = new StudentParticularsDAL();
            return studentParticularsDal.GetStudentSearchByNamePageWise(pageIndex, ref recordCount, length, searchval);
        }

    }
}
