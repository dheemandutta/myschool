
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace MySchool.Entities
{
    public class AdmissionFormEntities
    {
        public int ID { get; set;}
        public string FormNumber { get; set; }
        public string SFName { get; set; }
        public string SMName { get; set; }
        public string SLNAme { get; set; }
        public string Gender { get; set; }
        public DateTime DOB { get; set; }
        public string DOB1 { get; set; }
        public string FFName { get; set; }
        public string FMName { get; set; }
        public string FLName { get; set; }
        public string MFName { get; set; }
        public string MMName { get; set; }
        public string MLName { get; set; }
        public string GFName { get; set; }
        public string GMName { get; set; }
        public string GLName { get; set; }
        public string Address { get; set; }
        public string MoutherTounge { get; set; }
        public string FatherQualification { get; set; }
        public string MotherQualification { get; set; }
        public string FatherOccupation { get; set; }
        public decimal FatherAnnualIncome { get; set; }
        public string MotherOccupation { get; set; }
        public decimal MotherAnnualIncome { get; set; }
        public int GradeID { get; set; }
        public int YearID { get; set; }
        public bool isSelectedForInterview { get; set; }
        public string IdentificationMarks { get; set; }
        public string SpecialMedicalProblem { get; set; }
        public string RelationWithGuardian { get; set; }
        public string SPhoto { get; set; }
        public string FPhoto { get; set; }
        public string FSign { get; set; }
        public string MPhoto { get; set; }
        public string MSign { get; set; }
        public string FContactNo { get; set; }
        public string MContactNo { get; set; }
        public string Email { get; set; }

        public string Religion { get; set; }
        public string Caste { get; set; }
        public DateTime FormFillDate { get; set; }
        public string StudentName { get; set; }
        public string MotherName { get; set; }
        public string FatherName { get; set; }

    }
}