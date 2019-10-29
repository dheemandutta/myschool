using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MySchool.Entities
{
    public class TeacherEntities
   {
        public int  ID { get; set; }
        public string TFName { get; set; }
        public string TMName { get; set; }
        public string TLName { get; set; }
        public string Gender { get; set; }
        public DateTime DOB { get; set; }
        public string FFName { get; set; }
        public string  FMName { get; set; }
        public string  FLName { get; set; }
        public string MFName { get; set; }
        public string MMName { get; set; }
        public string MLName { get; set; }
        public string Religion { get; set; }
        public string Caste { get; set; }
        public string email { get; set; }
        public string MotherTounge { get; set; }
        public string Address { get; set; }
        public string Ph1 { get; set; }
        public string  Ph2 { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string Photo { get; set; }
        public string Sign { get; set; }
        public string Comments { get; set; }
        public string Designation { get; set; }
 

//Teacher Qualification

        public int TeacherQualificationID { get; set; }
        public int TeacherIDInTeacherQualification { get; set; }
        public string QualName { get; set; }
        public string QualCertPath { get; set; }
        public string QualStatus { get; set; }
        public DateTime QualCompletionDate { get; set; }

//Teacher Subject
        public int TeacheSubjectId { get; set; }
        public int TeacherIDinTeacherSubject { get; set; }
        public int SubjectID { get; set; }
        public string isPrimarySubject { get; set; }
    }
}
