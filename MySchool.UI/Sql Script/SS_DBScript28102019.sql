/****** Script for SelectTopNRows command from SSMS  ******/
 USE [MySchool]
GO
/****** Object:  StoredProcedure [dbo].[stpGetStudentDetailsForAdmissionByID]    Script Date: 28-Oct-19 8:39:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[stpGetStudentDetailsForAdmissionByID]
(
	@ID int
)
AS
BEGIN
      
      SELECT A.ID, A.FormNumber, A.SFName, A.SMName, A.SLNAme, A.Gender, A.DOB, A.FFName, A.FMName, A.FLName, A.MFName, 
	  A.MMName, A.GFName, A.GMName, A.GLName, A.[Address], A.MoutherTounge, A.FatherQualification, A.MotherQualification, 
	  A.FatherOccupation, A.FatherAnnualIncome, A.MotherOccupation, A.MotherAnnualIncome, A.GradeID, A.YearID, 
	  A.isSelectedForInterview, A.IdentificationMarks, A.SpecialMedicalProblem, A.isSelectedForAdmission, 
	  A.MLName, A.RelationWithGuardian, A.SPhoto, A.FPhoto, A.FSign, A.MPhoto, A.MSign, A.FContactNo, A.MContactNo, 
	  A.Email, A.Religion, A.Caste, A.FormFillDate,G.Grade, Y.[Year]
      FROM AdmissionForm A
	  inner join Grade G
	  ON G.ID = A.GradeID
	  inner join Year Y
	  on Y.ID=A.YearID
	  where A.ID=@ID
END

