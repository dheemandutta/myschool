------------------------------------------------------------------------------------------------------------------------

--  exec stpInsertUpdateQuestion 5,2,'deep', 5665.00

ALTER procedure [dbo].[stpInsertUpdateQuestion] 
( 
@ID int,
@TopicId int,
@QuestionText varchar(500),
--@ImagePath varchar(500),
@Marks decimal(12,2),
@AnswerList AnswerTVT READONLY
) 
AS 
BEGIN 
--DECLARE @FleetID int
 BEGIN TRY
    BEGIN TRAN
 IF @ID IS NULL
BEGIN   
	 print 'INSERT'
	INSERT INTO [Question] 
	       ([TopicId]
		   ,QuestionText
           --,ImagePath
           ,Marks)
	Values (@TopicId
	       ,@QuestionText
           --,@ImagePath
           ,@Marks)

	SET @ID = @@IDENTITY

	INSERT INTO Choice (QuestionId,ChoiceText,IsAnswer)
	Select @ID,Ans,IsAns from @AnswerList


	--SET @CompanyId  = @ID
END
ELSE
BEGIN
	print 'UPDATE'
	IF @QuestionText IS NOT NULL
	BEGIN
		UPDATE [Question]
		SET     TopicId=@TopicId
			   ,QuestionText=@QuestionText
			   --,ImagePath=@ImagePath
			   ,Marks=@Marks
		Where Id=@ID
	END
	ELSE IF @QuestionText IS NULL
	BEGIN
		DELETE FROM Choice WHERE QuestionId= @ID

		INSERT INTO Choice (QuestionId,ChoiceText,IsAnswer)
		Select @ID,Ans,IsAns from @AnswerList
	END
END
	COMMIT TRAN
 END TRY 

 BEGIN CATCH
	ROLLBACK TRAN
	SELECT ERROR_MESSAGE() AS ErrorMessage  
 END CATCH
END



