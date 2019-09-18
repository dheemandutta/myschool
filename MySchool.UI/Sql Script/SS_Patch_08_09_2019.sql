GO
Create procedure [dbo].[stpInsertUpdateExam]
@ID int,
@ExamName varchar(100)
as
begin
	DECLARE @ExamCnt int
	SET @ExamCnt = 0
	if @ID IS NULL
		BEGIN
			SELECT @ExamCnt = COUNT(*) from Exam where RTRIM(LTRIM(UPPER(ExamName)))=RTRIM(LTRIM(UPPER(@ExamName)))
				print @ExamCnt
				if @ExamCnt = 0
					begin
						insert into Exam(ExamName) values (@ExamName)
					END
				
		end
	ELSE
		BEGIN
			UPDATE Exam SET ExamName=@ExamName WHERE ID=@ID
		END

END






GO
Create procedure [dbo].[stpDeleteExamByExamID]
@id int
as
begin
	Delete  from Exam where ID =@id
end 


GO

Create procedure [dbo].[stpGetExamByExamID]
@ID int

as
begin
select id, ExamName from [dbo].[Exam] where id=@ID
end



GO
Create PROCEDURE [dbo].[stpGetExamAllPageWise]
 (
      @PageIndex INT = 1,
      @PageSize INT = 10,
      @RecordCount INT OUTPUT
)
AS
BEGIN
      SET NOCOUNT ON;
      SELECT ROW_NUMBER() OVER
      (
            ORDER BY [ExamName] ASC
      )AS RowNumber,
	   
      ID,
	  ExamName

     INTO #Results

FROM Exam
	 	    --Where IsActive=1
		 
      SELECT @RecordCount = COUNT(*)
      FROM #Results
      SELECT * FROM #Results
      WHERE RowNumber BETWEEN(@PageIndex -1) * @PageSize + 1 AND(((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1
	 --ORDER BY  ExamGroup, Exam ASC
      DROP TABLE #Results
END



GO
Create procedure [dbo].[stpGetExamAll]
as
begin
select ID,ExamName
from Exam
end


