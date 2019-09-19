
--exec stpGetQuestion 5
ALTER procedure [dbo].[stpGetQuestion]
(
	@QuestionCount int
)	
AS
BEGIN

	delete from TempQuestion
	
	--CREATE TABLE #Questiontab
	--(
	--	qId int,
	--	QuestionText varchar(1000),
	--	Marks decimal(12,2)
	--)

	
	
	INSERT INTO TempQuestion(Id,QuestionText,Marks)
	SELECT TOP 5 Id,QuestionText,Marks 
	FROM Question
	ORDER BY NEWID()
	--WHERE (ABS(CAST((BINARY_CHECKSUM(Id, NEWID())) as int))% 100) < 10


	--
	

	SELECT * FROM TempQuestion

    SELECT C.Id,C.QuestionId,C.ChoiceText,C.IsAnswer 
	FROM Choice C INNER JOIN TempQuestion Q
	ON C.QuestionId = Q.Id

	

	--drop table #Questiontab
	




END

