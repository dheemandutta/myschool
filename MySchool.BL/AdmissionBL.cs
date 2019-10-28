using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySchool.Entities;
using MySchool.DAL;

namespace MySchool.BL
{
    public class AdmissionBL
    {
        public List<AdmissionFormEntities> GetStudentListForAdmissionPageWise(int pageIndex, ref int recordCount, int length)
        {
            AdmissionDAL admission = new AdmissionDAL();
            return admission.GetStudentListForAdmissionPageWise(pageIndex, ref recordCount, length);
        }

    }
}
