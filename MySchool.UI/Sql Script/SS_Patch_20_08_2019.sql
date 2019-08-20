GO
/****** Object:  StoredProcedure [dbo].[stpDeleteSectionBySectionID]    Script Date: 20-08-2019 15:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[stpDeleteSectionBySectionID]
@ID int
as
begin
delete from Section where ID=@ID
end




GO
/****** Object:  StoredProcedure [dbo].[stpGetSectionAllPageWise]    Script Date: 20-08-2019 15:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[stpGetSectionAllPageWise]
	(
		@PageIndex INT = 1,
		@PageSize INT = 10,
		@RecordCount INT OUTPUT
)
AS
BEGIN
		SET NOCOUNT ON;
		SELECT ROW_NUMBER() OVER
		(
			ORDER BY [Section] ASC
		)AS RowNumber,
	   
		Section.ID,
		Section.Section,
		Section.GradeId,
		Grade.Grade

		INTO #Results

FROM Section
LEFT JOIN Grade ON Section.GradeId =  Grade.ID



	 		--Where IsActive=1
		 
		SELECT @RecordCount = COUNT(*)
		FROM #Results
		SELECT * FROM #Results
		WHERE RowNumber BETWEEN(@PageIndex -1) * @PageSize + 1 AND(((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1
		-- ORDER BY [Order] ASC
		DROP TABLE #Results
END



--Go
--create procedure InsertUpdateTeacher
--(
--@ID	int,
--@FName	varchar(500),
--@LName	varchar(500),
--@Photo	varchar(500),
--@Gender	varchar(50),
--@Address	varchar(500),
--@Ph1	varchar(500),
--@Ph2	varchar(500),
--@StartDate	date,
--@EndDate	date,
--@Comments	varchar(500),
--@Designation	varchar(50),

--@QualificationID	int,
--@TeacherID	int,
--@QualName	varchar(500),
--@QualCertPath	varchar(1000),
--@QualStatus	varchar(100),
--@QualCompletionDate	date,


--@TeacherSubjectId	int,
--@TeacherIDinQualification	int,
--@SubjectID	int,
--@isPrimarySubject bit
--)
--as
--begin
--	declare @intCount int
--	set @intCount = 0

--	if @ID is null
--		begin
--			select @intCount =  count(*) from Teacher where rtrim(ltrim(UPPER(FName))) = RTRIM(LTRIM(UPPER(@FName))) and 
--			RTRIM(LTRIM(UPPER(LName))) = RTRIM(LTRIM(UPPER(@LName))) and
--			(RTRIM(LTRIM(UPPER(Ph1))) = RTRIM(LTRIM(UPPER(@Ph1))) or RTRIM(LTRIM(UPPER(Ph1))) = RTRIM(LTRIM(UPPER(@Ph2)))) and 
--			(RTRIM(LTRIM(UPPER(Ph2))) = RTRIM(LTRIM(UPPER(@Ph1))) or RTRIM(LTRIM(UPPER(Ph2))) = RTRIM(LTRIM(UPPER(@Ph2))))

--			if @intCount>0 
--				begin
--					insert into Teacher (FName, LName, Photo, Gender, Address, Ph1, Ph2, StartDate, EndDate, Comments, Designation) values
--					(@FName, @LName, @Photo, @Gender, @Address, @Ph1, @Ph2, @StartDate, @EndDate, @Comments, @Designation)

--					insert into TeacherQual (TeacherID, QualName, QualCertPath, QualStatus, QualCompletionDate) values
--					(@TeacherID, @QualName, @QualCertPath, @QualStatus, @QualCompletionDate)

--					insert into TeacherSubject (TeacherID, SubjectID, isPrimarySubject) values
--					(@TeacherID, @SubjectID, @isPrimarySubject)
--				end
--			else
--				begin
--					update Teacher set FName=@FName, LName=@LName, Photo=@Photo, Gender=@Gender, Address=@Address, Ph1=@Ph1, Ph2=@Ph2, StartDate=@StartDate, EndDate=@EndDate, Comments=@Comments, Designation=@Designation where ID=@ID

--					update TeacherQual set TeacherID=@TeacherID, QualName=@QualName, QualCertPath=@QualCertPath, QualStatus=@QualStatus, QualCompletionDate=@QualCompletionDate where id=@QualificationID
					
--					update TeacherSubject set TeacherID=@TeacherID, SubjectID=@SubjectID, isPrimarySubject=@isPrimarySubject where ID=@TeacherSubjectId
					
--				end
--		end
--end