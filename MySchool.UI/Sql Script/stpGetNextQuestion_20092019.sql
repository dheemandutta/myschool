USE [MySchool]
GO
/****** Object:  StoredProcedure [dbo].[stpGetNextQuestion]    Script Date: 9/20/2019 1:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec stpGetNextQuestion 1,1
ALTER PROCEDURE [dbo].[stpGetNextQuestion]
(
	@PageIndex INT = 1,
    @PageSize INT = 1,
	@QuestionCount int OUTPUT
)
AS
BEGIN

	DECLARE @QuestionId int

	SELECT @QuestionId= Id FROM TempQuestion 
	WHERE RowNo BETWEEN(@PageIndex -1) * @PageSize + 1 AND(((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1
	ORDER BY Id

	SELECT * FROM TempQuestion 
	WHERE Id = @QuestionId

	SELECT [Id],[QuestionId],[ChoiceText],[IsAnswer],ISNULL([IsUserAnswer],0) AS IsUserAnswer FROM TempAnswer 
	WHERE QuestionId = @QuestionId

	SELECT @QuestionCount = COUNT(*)
	FROM Question

	SELECT TQ.Id FROM TempAnswer TA
	INNER JOIN TempQuestion TQ
	ON TA.QuestionId = TQ.Id
	WHERE TA.IsUserAnswer = 1

END