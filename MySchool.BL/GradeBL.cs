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

        public int SaveOrUpdateGrade(GradeEntities grade)
        {
            GradeDAL gradeDl = new GradeDAL();
            return gradeDl.SaveOrUpdateGrade(grade);
        }

        //public int UpdateGrade(GradeEntities grade)
        //{
        //    GradeDAL gradeDl = new GradeDAL();
        //    return gradeDl.UpdateGrade(grade);
        //}

        public int DeleteGrade(int ID)
        {
            GradeDAL gradeDl = new GradeDAL();
            return gradeDl.DeleteGrade(ID);
        }
        public List<GradeEntities> GetAllGrade()
        {
            GradeBL gradeBl = new GradeBL();
            return gradeBl.GetAllGrade();
        }

        public List<GradeEntities> GetAllGradePageWise(int pageIndex, ref int recordCount, int length)
        {
            GradeDAL gradeDl = new GradeDAL();
            return gradeDl.GetAllGradePageWise(pageIndex, ref recordCount, length);
        }

        public GradeEntities GetGradeByID(int GradeID)
        {
            GradeDAL gradeDl = new GradeDAL();
            return gradeDl.GetGradeByID(GradeID);
        }
    }
}
