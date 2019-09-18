GO
--  exec stpInsertUpdateSubject 1, 'FirstSubjectSubject22',3

create procedure [dbo].[stpInsertUpdateSubject] 
( 
@ID int,
@SubjectName varchar(500),
@GradeID int
) 
AS 
BEGIN 
--DECLARE @FleetID int
 BEGIN TRY
    BEGIN TRAN
 IF @ID IS NULL
BEGIN   
	 print 'INSERT'
	INSERT INTO [Subject]
		   (SubjectName,GradeID)
	Values (@SubjectName,@GradeID)

	SET @ID = @@IDENTITY
	--SET @CompanyId  = @ID
END
ELSE
BEGIN
	print 'UPDATE'
	UPDATE [Subject]
	SET SubjectName=@SubjectName,GradeID=@GradeID
	Where ID=@ID
	--SET @CompanyId  = @ID
END
	COMMIT TRAN
 END TRY 

 BEGIN CATCH
	ROLLBACK TRAN
	SELECT ERROR_MESSAGE() AS ErrorMessage;  
 END CATCH
END


----------------------------------------------------------------------------------------------------------------------

GO

--  declare @x int Exec stpGetSubjectPageWise 1,15, @x out
create PROCEDURE [dbo].[stpGetSubjectPageWise]
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
      ,S.ID
	  ,SubjectName
	  ,G.Grade

     INTO #Results
      FROM [Subject] S
	  	 

		  inner join Grade G
	  ON G.ID = S.GradeID

	 --------Where SP.GradeID=@GradeID


	    --Where IsActive=1		 
      SELECT @RecordCount = COUNT(*)
      FROM #Results
      SELECT * FROM #Results
      WHERE RowNumber BETWEEN(@PageIndex -1) * @PageSize + 1 AND(((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1
	 -- ORDER BY [Order] ASC
      DROP TABLE #Results
END

------------------------------------------------------------------------------------------------------------------------------

GO


--  exec stpGetSubjectByID 1

alter procedure [dbo].[stpGetSubjectByID]
@ID int
as
begin
SELECT [ID]
      ,[SubjectName]
      ,[GradeID]
  FROM [dbo].[Subject]
 where ID=@ID
end

GO