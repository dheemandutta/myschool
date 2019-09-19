
--exec stpGetNextQuestion 2,1
CREATE PROCEDURE stpGetNextQuestion
(
	@PageIndex INT = 1,
    @PageSize INT = 1
)
AS
BEGIN

	DECLARE @QuestionId int

	SELECT @QuestionId= Id FROM TempQuestion 
	WHERE RowNo BETWEEN(@PageIndex -1) * @PageSize + 1 AND(((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1
	ORDER BY Id

	SELECT * FROM TempQuestion 
	WHERE Id = @QuestionId

	SELECT * FROM TempAnswer 
	WHERE QuestionId = @QuestionId

END