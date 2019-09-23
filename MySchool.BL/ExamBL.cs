using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySchool.Entities;
using MySchool.DAL;

namespace MySchool.BL
{
    public class ExamBL
    {
 
        public int SaveOrUpdateExam(ExamEntities Exam)
        {
            ExamDAL ExamDl = new ExamDAL();
            return ExamDl.SaveOrUpdateExam(Exam);
        }

        
        public int DeleteExam(int ID)
        {
            ExamDAL ExamDl = new ExamDAL();
            return ExamDl.DeleteExam(ID);
        }

        public List<ExamEntities> GetAllExam()
        {
            ExamBL ExamBl = new ExamBL();
            return ExamBl.GetAllExam();
        }

        public List<ExamEntities> GetAllExamPageWise(int pageIndex, ref int recordCount, int length)
        {
            ExamDAL ExamDl = new ExamDAL();
            return ExamDl.GetAllExamPageWise(pageIndex, ref recordCount, length);
        }

        public ExamEntities GetExamByID(int ExamID)
        {
            ExamDAL ExamDl = new ExamDAL();
            return ExamDl.GetExamByID(ExamID);
        }

        //for Exam drp
        public List<ExamEntities> GetExamForDrp()
        {
            ExamDAL ExamDl = new ExamDAL();
            return ExamDl.GetExamForDrp();
        }
    }
}

