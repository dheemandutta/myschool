create procedure stpInsertUpdateAdmission
(
@ID int,
@YearID  int,
@GradeID  int,
@AdmAmt decimal(12,2),
@AdmissonNumber varchar(50),
@AdmissionFormID int
)
as
begin
declare @countAdmissionFormID int
set @countAdmissionFormID = 0
select @countAdmissionFormID = count(*) from Admission where AdmissionFormID=@AdmissionFormID
if @countAdmissionFormID is null
begin
insert into Admission(YearID, GradeID, AdmAmt, AdmissonNumber, AdmissionFormID) values
(@YearID, @GradeID, @AdmAmt,@AdmissonNumber,@AdmissionFormID)USE [MySchool]
GO
/****** Object:  StoredProcedure [dbo].[stpInsertUpdateGrade]    Script Date: 29-Oct-19 6:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stpInsertUpdateGrade]
@ID int,
@Grade varchar(100),
@GradeGroupID int
as
begin
	DECLARE @GradeCnt int
	SET @GradeCnt = 0
	if @ID IS NULL
		BEGIN
			SELECT @GradeCnt = COUNT(*) from Grade where RTRIM(LTRIM(UPPER(Grade)))=RTRIM(LTRIM(UPPER(@Grade)))
				print @GradeCnt
				if @GradeCnt = 0
					begin
						insert into Grade(Grade,GradeGroupID) values (@Grade,@GradeGroupID)
					END
				
		end
	ELSE
		BEGIN
			UPDATE Grade SET Grade=@Grade, GradeGroupID=@GradeGroupID WHERE ID=@ID
		END

END














end
else
begin
update Admission set YearID=@YearID, GradeID=@GradeID, AdmAmt=@AdmAmt,AdmissonNumber=@AdmissonNumber, AdmissionFormID=@AdmissionFormID where id=@id
end

end