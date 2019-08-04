using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySchool.Entities;
using MySchool.DAL;

namespace MySchool.BL
{
    public class GradeBL
    {
        public List<GradeGroupEntities> GetAllGradeGroup()
        {
            GradeDAL gradeGroup = new GradeDAL();
            return gradeGroup.GetAllGradeGroup();
        }

        public int SaveGrade(GradeEntities grade)
        {
            GradeDAL gradeDl = new GradeDAL();
            return gradeDl.SaveGrade(grade);
        }
    }
}
