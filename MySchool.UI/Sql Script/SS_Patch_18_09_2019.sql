USE [MySchool]
GO

ALTER TABLE Subject DROP CONSTRAINT  FK_Subject_Grade
END

GO
Alter table subject drop column gradeid
END



GO
/****** Object:  StoredProcedure [dbo].[stpInsertUpdateSubject]    Script Date: 18-Sep-19 8:03:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  exec stpInsertUpdateSubject Null, 'FirstSubjectSubjectjhghjgh',"3,12"

ALTER procedure [dbo].[stpInsertUpdateSubject] 
( 
@ID int,
@SubjectName varchar(500)
) 
AS 
begin
	DECLARE @SubjectCnt int
	SET @SubjectCnt= 0
	if @ID IS NULL
		BEGIN
			SELECT @SubjectCnt= COUNT(*) from Subject where RTRIM(LTRIM(UPPER(SubjectName)))=RTRIM(LTRIM(UPPER(@SubjectName)))
				print @SubjectCnt
				if @SubjectCnt = 0
					begin
						insert into Subject(SubjectName) values (@SubjectName)
					END
				
		end
	ELSE
		BEGIN
			UPDATE Subject SET SubjectName=@SubjectName where id=@ID
		END

END



--USE [MySchool]
--GO
--/****** Object:  StoredProcedure [dbo].[stpInsertUpdateSubject]    Script Date: 18-Sep-19 8:03:43 PM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO

----  exec stpInsertUpdateSubject Null, 'FirstSubjectSubjectjhghjgh',"3,12"

--ALTER procedure [dbo].[stpInsertUpdateSubject] 
--( 
--@ID int,
--@SubjectName varchar(500),
--@GradeID varchar(1000)
--) 
--AS 
--BEGIN 

--DECLARE @IDs int

-- BEGIN TRY
--    BEGIN TRAN

-- IF @ID IS NULL

--BEGIN   
-- --print 'INSERT'
----INSERT INTO [Subject]
----       (SubjectName,GradeID)
----Values (@SubjectName,@GradeID)

--SET @IDs = @@IDENTITY

--INSERT INTO [Subject]
--       (SubjectName,GradeID)
--       SELECT @SubjectName,String FROM ufn_CSVToTable(@GradeID,',')


--END
--ELSE
--BEGIN
--	--print 'UPDATE'
--	UPDATE [Subject]
--	SET SubjectName=@SubjectName,GradeID=@GradeID      
--	Where ID=@ID
--END


----------------------------------------------
--	COMMIT TRAN
-- END TRY 

-- BEGIN CATCH
--	ROLLBACK TRAN
--	SELECT ERROR_MESSAGE() AS ErrorMessage;  
-- END CATCH
--END



USE [MySchool]
GO
/****** Object:  StoredProcedure [dbo].[stpGetSubjectPageWise]    Script Date: 18-Sep-19 8:12:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  declare @x int Exec stpGetSubjectPageWise 1,15, @x out
ALTER PROCEDURE [dbo].[stpGetSubjectPageWise]
 (
      @PageIndex INT = 1,
      @PageSize INT = 15,
      @RecordCount INT OUTPUT
)
AS
BEGIN
      SET NOCOUNT ON;
      SELECT ROW_NUMBER() OVER
      (
            ORDER BY [SubjectName] ASC
      )AS RowNumber
      ,ID
	  ,SubjectName
	  
     INTO #Results
      FROM [Subject] 
	  	 

	--------Where SP.GradeID=@GradeID


	    --Where IsActive=1		 
      SELECT @RecordCount = COUNT(*)
      FROM #Results
      SELECT * FROM #Results
      WHERE RowNumber BETWEEN(@PageIndex -1) * @PageSize + 1 AND(((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1
	 -- ORDER BY [Order] ASC
      DROP TABLE #Results
END



--USE [MySchool]
--GO
--/****** Object:  StoredProcedure [dbo].[stpGetSubjectPageWise]    Script Date: 18-Sep-19 8:12:05 PM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO

----  declare @x int Exec stpGetSubjectPageWise 1,15, @x out
--ALTER PROCEDURE [dbo].[stpGetSubjectPageWise]
-- (
--      @PageIndex INT = 1,
--      @PageSize INT = 15,
--      @RecordCount INT OUTPUT
--)
--AS
--BEGIN
--      SET NOCOUNT ON;
--      SELECT ROW_NUMBER() OVER
--      (
--            ORDER BY [SubjectName] ASC
--      )AS RowNumber
--      ,S.ID
--	  ,SubjectName
--	  ,G.Grade

--     INTO #Results
--      FROM [Subject] S
	  	 

--		  inner join Grade G
--	  ON G.ID = S.GradeID

--	 --------Where SP.GradeID=@GradeID


--	    --Where IsActive=1		 
--      SELECT @RecordCount = COUNT(*)
--      FROM #Results
--      SELECT * FROM #Results
--      WHERE RowNumber BETWEEN(@PageIndex -1) * @PageSize + 1 AND(((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1
--	 -- ORDER BY [Order] ASC
--      DROP TABLE #Results
--END

