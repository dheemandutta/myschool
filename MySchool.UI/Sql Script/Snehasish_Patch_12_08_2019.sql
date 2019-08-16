Go
CREATE procedure [dbo].[usp_Insert_Update_Teacher]
@ID int,
@FName varchar(500),
@LName varchar(500),
@Photo varchar(500),
@Gender varchar(500),
@Address varchar(500),
@Ph1 varchar(20),
@Ph2 varchar(20),
@StartDate date,
@EndDate date,
@Comments  varchar(500),
@Designation  varchar(500)
as
begin
	declare @TeacherCount int
	set @TeacherCount = 0
	if @ID is null
		begin
			select @TeacherCount =count(*) from Teacher where 
			rtrim(LTRIM(upper(FName))) = rtrim(ltrim(upper(@FName))) and 
			rtrim(ltrim(upper(fname)))= rtrim(ltrim(upper(lname))) and 
			( 
			rtrim(ltrim(Ph1))=RTRIM(ltrim(@Ph1)) or 
			rtrim(ltrim(Ph1))=RTRIM(ltrim(@Ph2))
			) and 
			(rtrim(ltrim(Ph2))=RTRIM(ltrim(@Ph1)) or rtrim(ltrim(Ph2))=RTRIM(ltrim(@Ph2)))
		end
		if @TeacherCount=0
			begin
				insert into Teacher(fname,LName,Gender,Address,Ph1,Ph2,StartDate,EndDate,Comments,Designation) values (@FName,@LName,@Gender,@Address,@Ph1,@Ph2,@StartDate,@EndDate,@Comments,@Designation)
			end
	else
		begin
			update Teacher set FName=@FName, LName=@LName, Gender=@Gender,Address=@Address, Ph1=@Ph1, Ph2=@Ph2, StartDate=@StartDate, EndDate=@EndDate, Comments=@Comments,Designation=@Designation where ID=@ID
		end
end


Go
CREATE procedure [dbo].[usp_Insert_Update_Teacher_Qualification]
@ID int,
@TeacherID int,
@QualName varchar(500),
@QualCertPath varchar(500),
@QualStatus varchar(500),
@QualCompletionDate date
as
begin
	Declare @QualificationCount int
	set @QualificationCount = 0
	if @id is null
		begin
			select @QualificationCount =count(*) from TeacherQual
			where 
			RTRIM(ltrim(TeacherID))=RTRIM(ltrim(@TeacherID)) and RTRIM(LTRIM(UPPER(QualStatus)))=RTRIM(LTRIM(UPPER(@QualStatus)))
		end
		if @QualificationCount =0 
		begin
			insert into TeacherQual(TeacherID, QualName, QualCertPath, QualStatus, QualCompletionDate) values
			(@TeacherID, @QualName, @QualCertPath, @QualStatus, @QualCompletionDate)
		end
	else
		begin
			update TeacherQual set TeacherID=@TeacherID, QualName=@QualName, QualCertPath=@QualCertPath,QualStatus=QualStatus, QualCompletionDate=@QualCompletionDate where id=@ID
		end
end


Go
CREATE PROCEDURE usp_Insert_Subject
@ID int,
@SubjectName varchar(500),
@GradeID int
as
begin
	Declare @countSubject int
	set @countSubject=0
	if @countSubject is null
		begin
			select @countSubject=COUNT(*) from Subject where RTRIM(ltrim(upper(@SubjectName)))=RTRIM(ltrim(upper(SubjectName))) and RTRIM(LTRIM(@GradeID))=rtrim(ltrim(GradeID))
		end
		if @countSubject>0 
			begin
				insert into Subject(SubjectName,GradeID) values (@SubjectName, @GradeID)
			end
		else
			begin
				update Subject set SubjectName=@SubjectName, GradeID=@GradeID where id=@ID
			end
end