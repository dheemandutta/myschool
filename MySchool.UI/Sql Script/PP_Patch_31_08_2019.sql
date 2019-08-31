GO
--  exec stpInsertUpdateStudentContact Null,3, 'First', 'Second','Address XXXXXX', '900000000', Null, Null,  Null, Null, Null, Null, Null, Null, Null, Null,Null

ALTER procedure [dbo].[stpInsertUpdateStudentContact] 
( 
@ID int,
@StudentID int,
@FatherFName varchar(500),
@FatherLName varchar(500),
@FatherAddress varchar(500),
@FPh1 varchar(20),
@FPh2 varchar(20),
@MotherFName varchar(500),
@MotherLName varchar(500),
@MotherAddress varchar(500),
@MPh1 varchar(20),
@MPh2 varchar(20),
@GFName varchar(500),
@GLName varchar(500),
@GAddress varchar(500),
@GPh1 varchar(20),
@GPh2 varchar(20)
) 
AS 
BEGIN 
--DECLARE @FleetID int
 BEGIN TRY
    BEGIN TRAN
 IF @ID IS NULL
BEGIN   
	 print 'INSERT'
	INSERT INTO [StudentContact] 
	       ([StudentID]
		   ,[FatherFName]
           ,[FatherLName]
           ,[FatherAddress]
           ,[FPh1]
           ,[FPh2]
           ,[MotherFName]
           ,[MotherLName]
           ,[MotherAddress]
           ,[MPh1]
           ,[MPh2]
           ,[GFName]
           ,[GLName]
           ,[GAddress]
           ,[GPh1]
           ,[GPh2])
	Values (@StudentID
	       ,@FatherFName
           ,@FatherLName
           ,@FatherAddress
           ,@FPh1
           ,@FPh2
           ,@MotherFName
           ,@MotherLName
           ,@MotherAddress
           ,@MPh1
           ,@MPh2
           ,@GFName
           ,@GLName
           ,@GAddress
           ,@GPh1
           ,@GPh2)

	SET @ID = @@IDENTITY
	--SET @CompanyId  = @ID
END
ELSE
BEGIN
	print 'UPDATE'
	UPDATE [StudentContact]
	SET     StudentID=@StudentID
	       ,FatherFName=@FatherFName
           ,FatherLName=@FatherLName
           ,FatherAddress=@FatherAddress
           ,FPh1=@FPh1
           ,FPh2=@FPh2
           ,MotherFName=@MotherFName
           ,MotherLName=@MotherLName
           ,MotherAddress=@MotherAddress
           ,MPh1=@MPh1
           ,MPh2=@MPh2
           ,GFName=@GFName
           ,GLName=@GLName
           ,GAddress=@GAddress
           ,GPh1=@GPh1
           ,GPh2=@GPh2
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



--  declare @x int Exec stpGetStudentContactPageWise 1,15, @x out
ALTER PROCEDURE [dbo].[stpGetStudentContactPageWise]
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
           ORDER BY [GFName] ASC
      )AS RowNumber
      --,ID
	   ,SP.FirstName + ' ' + SP.LastName AS StudentName
	    ,GFName + ' ' + GLName AS GName
      ,[GAddress]
      ,[GPh1]
      --,[GPh2]

     INTO #Results
      FROM StudentContact SC
	  	 
	 inner join StudentParticulars SP
	 ON SP.StudentID = SC.StudentID

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
--  exec stpGetStudentContactByID 1

ALTER procedure [dbo].[stpGetStudentContactByID]
@ID int
as
begin
SELECT [ID]
      ,[StudentID]
      ,[FatherFName]
      ,[FatherLName]
      ,[FatherAddress]
      ,[FPh1]
      ,[FPh2]
      ,[MotherFName]
      ,[MotherLName]
      ,[MotherAddress]
      ,[MPh1]
      ,[MPh2]
      ,[GFName]
      ,[GLName]
      ,[GAddress]
      ,[GPh1]
      ,[GPh2]
  FROM [dbo].[StudentContact]
 where ID=@ID
end