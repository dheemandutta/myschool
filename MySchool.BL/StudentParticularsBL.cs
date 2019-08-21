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
    }
}
