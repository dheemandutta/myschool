GO
--  declare @x int Exec stpGetStudentParticularsPageWise 1,15, @x out
ALTER PROCEDURE [dbo].[stpGetStudentParticularsPageWise]
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
            ORDER BY [FirstName] ASC
      )AS RowNumber
      --,ID
	  ,FirstName + ' ' + LastName AS StudentName
	   ,CONVERT(varchar(12),DOB,103) DOB
	  ,G.Grade
	  --,StartDate
	  --,EndDate
	  --,LeavingReason
	  ,Gender
	  ,Photo

     INTO #Results
      FROM StudentParticulars SP
	  	 

		  inner join Grade G
	  ON G.ID = SP.GradeID

	 --------Where SP.GradeID=@GradeID


	    --Where IsActive=1		 
      SELECT @RecordCount = COUNT(*)
      FROM #Results
      SELECT * FROM #Results
      WHERE RowNumber BETWEEN(@PageIndex -1) * @PageSize + 1 AND(((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1
	 -- ORDER BY [Order] ASC
      DROP TABLE #Results
END
GO
--------------------------------------------------------------------------------------------------------------------------
GO

ALTER procedure [dbo].[stpGetStudentParticularsByID]
@ID int
as
begin
SELECT [ID]
      --,[StudentID]
      ,[FirstName]
      ,[LastName]
      ,[DOB]
      ,[GradeID]
      ,[StartDate]
      ,[EndDate]
      ,[LeavingReason]
      ,[Gender]
      --,[Photo]
  FROM [dbo].[StudentParticulars]
 where ID=@ID
end
GO
----------------------------------------------------------------------------------------------------------------------------------
GO
--  exec stpInsertUpdateStudentParticulars Null, 'First', 'gfgf','2019-05-06 00:00:00.000',3, '2019-05-06 00:00:00.000','2019-05-06 00:00:00.000','ghfghgh', 'm'

ALTER procedure [dbo].[stpInsertUpdateStudentParticulars] 
( 
@ID int,
--@StudentID int,
@FirstName varchar(500),
@LastName varchar(500),
@DOB datetime,
@GradeID int,
@StartDate datetime,
@EndDate datetime,
@LeavingReason varchar(500),
@Gender varchar(20)
--@Photo varchar(1000)

) 
AS 
BEGIN 
--DECLARE @FleetID int
 BEGIN TRY
    BEGIN TRAN
 IF @ID IS NULL
BEGIN   
	 print 'INSERT'
	INSERT INTO [StudentParticulars] 
		   (FirstName,LastName,DOB,GradeID,StartDate,EndDate,LeavingReason,Gender)
	Values (@FirstName,@LastName,@DOB,@GradeID,@StartDate,@EndDate,@LeavingReason,@Gender)

	SET @ID = @@IDENTITY
	--SET @CompanyId  = @ID
END
ELSE
BEGIN
	print 'UPDATE'
	UPDATE [StudentParticulars]
	SET FirstName=@FirstName,LastName=@LastName,DOB=@DOB,GradeID=@GradeID,StartDate=@StartDate,
	    EndDate=@EndDate,LeavingReason=@LeavingReason,Gender=@Gender
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




GO











