USE [MySchool]
GO
/****** Object:  Table [dbo].[ExamTime]    Script Date: 4/4/2020 10:35:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExamTime](
	[ExamTime] [varchar](50) NOT NULL,
	[UserId] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ExamTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO


SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TempAnswer](
	[Id] [int] NULL,
	[QuestionId] [int] NULL,
	[ChoiceText] [varchar](2000) NULL,
	[IsAnswer] [bit] NULL,
	[IsUserAnswer] [int] NULL,
	[UserId] [int] NULL,
	[ChoiceId] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


/****** Object:  StoredProcedure [dbo].[stpGetNextQuestion]    Script Date: 4/4/2020 10:35:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec stpGetNextQuestion 1,1
CREATE PROCEDURE [dbo].[stpGetNextQuestion]
(
	@PageIndex INT = 1,
    @PageSize INT = 1,
	@QuestionCount int OUTPUT,
	@UserId int
)
AS
BEGIN

	DECLARE @QuestionId int

	SELECT @QuestionId= Id FROM TempQuestion 
	WHERE RowNo BETWEEN(@PageIndex -1) * @PageSize + 1 AND(((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1
	AND UserId = @UserId
	ORDER BY Id

	SELECT * FROM TempQuestion 
	WHERE Id = @QuestionId
	AND UserId = @UserId

	SELECT [Id],[QuestionId],[ChoiceText],[IsAnswer],ISNULL([IsUserAnswer],0) AS IsUserAnswer,ChoiceId FROM TempAnswer 
	WHERE QuestionId = @QuestionId
	AND UserId = @UserId

	SELECT @QuestionCount = COUNT(*)
	FROM Question
	

	SELECT TQ.Id FROM TempAnswer TA
	INNER JOIN TempQuestion TQ
	ON TA.QuestionId = TQ.Id
	WHERE TA.IsUserAnswer = 1
	AND TA.UserId = @UserId

	Select Id FROM TempQuestion 
	WHERE  UserId = @UserId

SELECT  MAX(ISNULL(IsUserAnswer,0)) AS HasAnswered,TA.QuestionId,TQ.RowNo 
	FROM TempAnswer TA
	INNER JOIN TempQuestion TQ
	ON TQ.Id = TA.QuestionId
	WHERE TA.UserId = @UserId
	GROUP BY TA.QuestionId,TQ.RowNo 


END












GO
/****** Object:  StoredProcedure [dbo].[stpGetQuestion]    Script Date: 4/4/2020 10:35:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec stpGetQuestion 5
CREATE procedure [dbo].[stpGetQuestion]
(
	@QuestionCount int,
	@UserId	int
	
)	
AS
BEGIN

	BEGIN TRY
		BEGIN TRAN
	delete from TempAnswer WHERE UserId = @UserId
	delete from TempQuestion WHERE UserId = @UserId
	delete from ExamTime WHERE UserId = @UserId
	
		
	
	INSERT INTO TempQuestion(Id,QuestionText,Marks,UserId)
	SELECT TOP (@QuestionCount)  Id,QuestionText,Marks,@UserId 
	FROM Question
	ORDER BY NEWID()
	

	UPDATE x
	SET x.RowNo = x.New_CODE_DEST
	FROM (
      SELECT RowNo, DENSE_RANK() OVER (ORDER BY [Id]) AS New_CODE_DEST
      FROM TempQuestion
      ) x

	
	INSERT INTO TempAnswer(Id,QuestionId,ChoiceText,IsAnswer,UserId,ChoiceId)
    SELECT C.Id,C.QuestionId,C.ChoiceText,C.IsAnswer,@UserId,C.Id 
	FROM Choice C INNER JOIN TempQuestion Q
	ON C.QuestionId = Q.Id
	AND Q.UserId = @UserId
	
	--ORDER BY QuestionId

	INSERT INTO ExamTime(UserId,ExamTime) VALUES (@UserId,'60.00')

	--drop table #Questiontab
	COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
	END CATCH



END














GO
/****** Object:  StoredProcedure [dbo].[stpGettblConfigByExamTime]    Script Date: 4/4/2020 10:35:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  exec stpGettblConfigByID ....

CREATE procedure [dbo].[stpGettblConfigByExamTime]
(
	@UserId int 
)
AS
BEGIN

SELECT ExamTime
  FROM ExamTime
 where UserId= @UserId

END













GO
/****** Object:  StoredProcedure [dbo].[stpSaveUserAnswer]    Script Date: 4/4/2020 10:35:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stpSaveUserAnswer]
(
	@QuestionId int,
	@Id int,
	@UserId int,
	@CurrentTime varchar(50)
)
AS
BEGIN
	BEGIN TRY
	BEGIN TRAN

	UPDATE TempAnswer
	SET IsUserAnswer = NULL
	WHERE QuestionId = @QuestionId
	AND UserId = @UserId
	
	UPDATE TempAnswer 
	SET IsUserAnswer = 1
	WHERE ChoiceId=@Id
	AND UserId = @UserId

	UPDATE ExamTime SET [ExamTime] = @CurrentTime WHERE UserId = @UserId

	COMMIT TRAN 

	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
	END CATCH
END












GO
/****** Object:  StoredProcedure [dbo].[stpUpdateExamTime]    Script Date: 4/4/2020 10:35:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stpUpdateExamTime]
(
	@CurrentTime varchar(50),
	@UserId int
)
AS
BEGIN
	UPDATE ExamTime SET [ExamTime] = @CurrentTime WHERE UserId = @UserId
END
GO
