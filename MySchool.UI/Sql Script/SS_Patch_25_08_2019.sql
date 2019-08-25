USE [MySchool]
GO
/****** Object:  StoredProcedure [dbo].[stpInsertUpdateTeacher]    Script Date: 25-Aug-19 11:21:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[stpInsertUpdateTeacher]
(
-- For Teach Master table
@ID	int,
@FName	varchar(500),
@LName	varchar(500),
@Photo	varchar(500),
@Gender	varchar(50),
@Address	varchar(500),
@Ph1	varchar(500),
@Ph2	varchar(500),
@StartDate	date,
@EndDate	date,
@Comments	varchar(500),
@Designation	varchar(50),

-- For Teach Qualification table
@QualificationID	int,
--@TeacherID	int,
@QualName	varchar(500),
@QualCertPath	varchar(1000),
@QualStatus	varchar(100),
@QualCompletionDate	date,

-- For Teach Subject table
@TeacherSubjectId	int,
--@TeacherIDinQualification	int,
@SubjectID	int,
@isPrimarySubject bit
)
as
begin
	declare @intCount int
	set @intCount = 0

	if @ID is null
		begin
			select @intCount =  count(*) from Teacher where rtrim(ltrim(UPPER(FName))) = RTRIM(LTRIM(UPPER(@FName))) and 
			RTRIM(LTRIM(UPPER(LName))) = RTRIM(LTRIM(UPPER(@LName))) and
			(RTRIM(LTRIM(UPPER(Ph1))) = RTRIM(LTRIM(UPPER(@Ph1))) or RTRIM(LTRIM(UPPER(Ph1))) = RTRIM(LTRIM(UPPER(@Ph2)))) and 
			(RTRIM(LTRIM(UPPER(Ph2))) = RTRIM(LTRIM(UPPER(@Ph1))) or RTRIM(LTRIM(UPPER(Ph2))) = RTRIM(LTRIM(UPPER(@Ph2))))

			if @intCount>0 
				begin try
					insert into Teacher (FName, LName, Photo, Gender, Address, Ph1, Ph2, StartDate, EndDate, Comments, Designation) values
					(@FName, @LName, @Photo, @Gender, @Address, @Ph1, @Ph2, @StartDate, @EndDate, @Comments, @Designation)

					--Select @ID=SCOPE_IDENTITY()

					SET @ID = @@IDENTITY

					insert into TeacherQual (TeacherID, QualName, QualCertPath, QualStatus, QualCompletionDate) values
					(@ID, @QualName, @QualCertPath, @QualStatus, @QualCompletionDate)

					--Select @TeacherIDinQualification =SCOPE_IDENTITY()

					insert into TeacherSubject (TeacherID, SubjectID, isPrimarySubject) values
					(@ID, @SubjectID, @isPrimarySubject)
					commit tran
				end try
				begin catch
					rollback tran
				end catch
			else
				begin try
					update Teacher set FName=@FName, LName=@LName, Photo=@Photo, Gender=@Gender, Address=@Address, Ph1=@Ph1, Ph2=@Ph2, StartDate=@StartDate, EndDate=@EndDate, Comments=@Comments, Designation=@Designation where ID=@ID

					update TeacherQual set TeacherID=@ID, QualName=@QualName, QualCertPath=@QualCertPath, QualStatus=@QualStatus, QualCompletionDate=@QualCompletionDate where id=@QualificationID
					
					update TeacherSubject set TeacherID=@ID, SubjectID=@SubjectID, isPrimarySubject=@isPrimarySubject where ID=@TeacherSubjectId
					commit tran
				end try
				begin catch
					rollback tran
				end catch
		end
end
