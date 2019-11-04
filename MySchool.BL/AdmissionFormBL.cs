using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySchool.Entities;
using MySchool.DAL;
namespace MySchool.BL
{
    public class AdmissionFormBL
    {
        public List<AdmissionFormEntities> GetAdmissionFormPageWise(int pageIndex, ref int recordCount, int length)
        {
            AdmissionFormDAL admissionFormDAL = new AdmissionFormDAL();
            return admissionFormDAL.GetAdmissionFormPageWise(pageIndex, ref recordCount, length);
        }

        public int SaveOrUpdate(AdmissionFormEntities admissionForm)
        {
            AdmissionFormDAL admissionfromDal = new AdmissionFormDAL();
            return admissionfromDal.SaveorUpdate(admissionForm);
        }

        public int UpdateSelectionForAdmissionStatus(int ID)
        {
            AdmissionFormDAL admissiondal = new AdmissionFormDAL();
            return admissiondal.UpdateSelectionForAdmissionStatus(ID);
        }

        public ActualAdmissionEntities GetActualAdmissionByID(int ID)
        {
            AdmissionFormDAL admissiondal = new AdmissionFormDAL();
            return admissiondal.GetActualAdmissionByID(ID);
        }


        public int SaveOrUpdateForActualAdmission(ActualAdmissionEntities admissionForm)
        {
            AdmissionFormDAL admissionfromDal = new AdmissionFormDAL();
            // return admissionfromDal.SaveOrUpdateForActualAdmission(admissionForm);
            return 0; ////////////////////////////////////////////
        }

        public AdmissionFormEntities GetAdmissionOfMaxIdByID(string academicYear)
        {
            AdmissionFormDAL admissiondal = new AdmissionFormDAL();
            int maxAdmissionId = admissiondal.GetAdmissionOfMaxIdByID();
       
            string admnum = "ADM-" + academicYear + maxAdmissionId.ToString();
            AdmissionFormEntities admissionFormEntities = new AdmissionFormEntities();

            admissionFormEntities.FormNumber = admnum;
            return admissionFormEntities;
        }
    }
}