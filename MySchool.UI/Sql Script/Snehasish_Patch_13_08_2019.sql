USE [MySchool]
GO
/****** Object:  StoredProcedure [dbo].[usp_Insert_Update_Teacher]    Script Date: 13-Aug-19 1:44:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[usp_Insert_Update_Teacher]

-- teacher basic details

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
@Designation  varchar(500),

-- teacher qualification

@ID1 int,
@TeacherID int,
@QualName varchar(500),
@QualCertPath varchar(500),
@QualStatus varchar(500),
@QualCompletionDate date

-- teacher subject


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
				
				insert into TeacherQual(TeacherID, QualName, QualCertPath, QualStatus, QualCompletionDate) values (@TeacherID, @QualName, @QualCertPath, @QualStatus, @QualCompletionDate)


			
			end

			
	else
		begin
			update Teacher set FName=@FName, LName=@LName, Gender=@Gender,Address=@Address, Ph1=@Ph1, Ph2=@Ph2, StartDate=@StartDate, EndDate=@EndDate, Comments=@Comments,Designation=@Designation where ID=@ID
			
			update TeacherQual set TeacherID=@TeacherID, QualName=@QualName, QualCertPath=@QualCertPath,QualStatus=QualStatus, QualCompletionDate=@QualCompletionDate where id=@ID1

		end
end
