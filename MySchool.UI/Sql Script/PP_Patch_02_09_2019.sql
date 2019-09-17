GO
--  exec stpInsertUpdateStudentHealth 2,3,'A+', 'Fever 2', 'Dr.A.Paul 2'

Create procedure [dbo].[stpInsertUpdateStudentHealth] 
( 
@ID int,
@StudentID int,
@BloodGroup varchar(500),
@KnownMadicalProblems varchar(500),
@DoctorName varchar(500)
) 
AS 
BEGIN 
--DECLARE @FleetID int
 BEGIN TRY
    BEGIN TRAN
 IF @ID IS NULL
BEGIN   
	 print 'INSERT'
	INSERT INTO [StudentHealth] 
	       ([StudentID]
		   ,BloodGroup
           ,KnownMadicalProblems
           ,DoctorName)
	Values (@StudentID
	       ,@BloodGroup
           ,@KnownMadicalProblems
           ,@DoctorName)

	SET @ID = @@IDENTITY
	--SET @CompanyId  = @ID
END
ELSE
BEGIN
	print 'UPDATE'
	UPDATE [StudentHealth]
	SET     StudentID=@StudentID
	       ,BloodGroup=@BloodGroup
		   ,KnownMadicalProblems=@KnownMadicalProblems
		   ,DoctorName=@DoctorName
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

--  declare @x int Exec stpGetStudentHealthPageWise 1,15, @x out
create PROCEDURE [dbo].[stpGetStudentHealthPageWise]
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
      ,SH.ID
      ,SP.FirstName + ' ' + SP.LastName AS StudentName
	  ,BloodGroup
      ,KnownMadicalProblems
      ,DoctorName

     INTO #Results
      FROM StudentHealth SH
	  	 
	 inner join StudentParticulars SP
	 ON SP.StudentID = SH.StudentID

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
--  exec stpGetStudentHealthByID 1

create procedure [dbo].[stpGetStudentHealthByID]
@ID int
as
begin
SELECT [ID]
      ,[StudentID]
      ,BloodGroup
      ,KnownMadicalProblems
      ,DoctorName
  FROM [dbo].StudentHealth
 where ID=@ID
end