GO

--  exec stpInsertUpdateSubject Null, 'FirstSubjectSubjectjhghjgh',"3,12"

create procedure [dbo].[stpInsertUpdateSubject] 
( 
@ID int,
@SubjectName varchar(500),
--@GradeID int
@GradeID varchar(1000)
) 
AS 
BEGIN 

DECLARE @IDs int

 BEGIN TRY
    BEGIN TRAN

 IF @ID IS NULL

BEGIN   
 print 'INSERT'
--INSERT INTO [Subject]
--       (SubjectName,GradeID)
--Values (@SubjectName,@GradeID)

SET @IDs = @@IDENTITY

INSERT INTO [Subject]
       (ID,SubjectName,GradeID)
       SELECT @IDs, @SubjectName,String FROM ufn_CSVToTable(@GradeID,',')






END
ELSE
BEGIN
	print 'UPDATE'
	UPDATE [Subject]
	SET SubjectName=@SubjectName,GradeID=@GradeID      
	Where ID=@ID
END


--------------------------------------------
	COMMIT TRAN
 END TRY 

 BEGIN CATCH
	ROLLBACK TRAN
	SELECT ERROR_MESSAGE() AS ErrorMessage;  
 END CATCH
END




GO