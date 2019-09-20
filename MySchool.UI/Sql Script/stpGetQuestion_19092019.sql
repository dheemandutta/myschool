USE [MySchool]
GO
/****** Object:  StoredProcedure [dbo].[stpGetQuestion]    Script Date: 9/19/2019 3:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec stpGetQuestion 5
ALTER procedure [dbo].[stpGetQuestion]
(
	@QuestionCount int
	
)	
AS
BEGIN

	delete from TempQuestion
	delete from TempAnswer
	
	--CREATE TABLE #Questiontab
	--(
	--	qId int,
	--	QuestionText varchar(1000),
	--	Marks decimal(12,2)
	--)

	
	
	INSERT INTO TempQuestion(Id,QuestionText,Marks)
	SELECT TOP 5  Id,QuestionText,Marks 
	FROM Question
	ORDER BY NEWID()
	--WHERE (ABS(CAST((BINARY_CHECKSUM(Id, NEWID())) as int))% 100) < 10

	UPDATE x
	SET x.RowNo = x.New_CODE_DEST
	FROM (
      SELECT RowNo, ROW_NUMBER() OVER (ORDER BY [Id]) AS New_CODE_DEST
      FROM TempQuestion
      ) x

	
	INSERT INTO TempAnswer(Id,QuestionId,ChoiceText,IsAnswer)
    SELECT C.Id,C.QuestionId,C.ChoiceText,C.IsAnswer 
	FROM Choice C INNER JOIN TempQuestion Q
	ON C.QuestionId = Q.Id

	
	--ORDER BY QuestionId

	

	--drop table #Questiontab
	




END

