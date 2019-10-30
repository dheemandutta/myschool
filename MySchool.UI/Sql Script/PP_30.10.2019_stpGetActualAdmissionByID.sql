
--EXEC stpGetActualAdmissionByID 1

alter procedure [dbo].[stpGetActualAdmissionByID]
(
@ID int
)
as
begin
Select [ID]
      ,[FormNumber]
      ,[SFName]
      ,[SMName]
      ,[SLNAme]
      ,[Gender]
      ,[DOB]
      ,[FFName]
      ,[FMName]
      ,[FLName]
      ,[MFName]
      ,[MMName]
      ,[GFName]
      ,[GMName]
      ,[GLName]
      ,[Address]
      ,[MoutherTounge]
      ,[FatherQualification]
      ,[MotherQualification]
      ,[FatherOccupation]
      ,[FatherAnnualIncome]
      ,[MotherOccupation]
      ,[MotherAnnualIncome]
      ,[GradeID]
      ,[YearID]
      ,[isSelectedForInterview]
      ,[IdentificationMarks]
      ,[SpecialMedicalProblem]
      ,[isSelectedForAdmission]
      ,[MLName]
      ,[RelationWithGuardian]
      ,[SPhoto]
      ,[FPhoto]
      ,[FSign]
      ,[MPhoto]
      ,[MSign]
      ,[FContactNo]
      ,[MContactNo]
      ,[Email]
      ,[Religion]
      ,[Caste]
      ,[FormFillDate]
	  FROM dbo.AdmissionForm
			where ID=@ID
end
