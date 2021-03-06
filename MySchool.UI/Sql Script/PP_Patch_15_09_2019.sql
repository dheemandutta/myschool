
GO
/****** Object:  Table [dbo].[Choice]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Choice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[ChoiceText] [varchar](500) NULL,
 CONSTRAINT [PK_Choice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Question]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Question](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TopicId] [int] NOT NULL,
	[QuestionText] [varchar](1000) NULL,
	[ImagePath] [varchar](1000) NULL,
	[Marks] [decimal](12, 2) NULL,
	[HasMultipleAnswers] [bit] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblAnswer]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAnswer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[ChoiceId] [int] NOT NULL,
 CONSTRAINT [PK_tblAnswer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblConfig]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblConfig](
	[KeyName] [varchar](50) NOT NULL,
	[ConfigValue] [varchar](100) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSubject]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSubject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tblSubject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Topic](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubjectId] [int] NOT NULL,
	[TopicName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Choice] ON 

INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText]) VALUES (1, 1, N'CT1')
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText]) VALUES (6, 2, N'CT2')
SET IDENTITY_INSERT [dbo].[Choice] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (1, 1, N'QT1-2', NULL, CAST(78.00 AS Decimal(12, 2)), NULL)
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (2, 2, N'QT2', NULL, CAST(66.00 AS Decimal(12, 2)), NULL)
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (8, 3, N'paul-2', NULL, CAST(100.00 AS Decimal(12, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Question] OFF
INSERT [dbo].[tblConfig] ([KeyName], [ConfigValue]) VALUES (N'KN1', N'CV1')
INSERT [dbo].[tblConfig] ([KeyName], [ConfigValue]) VALUES (N'KN2', N'CV2')
INSERT [dbo].[tblConfig] ([KeyName], [ConfigValue]) VALUES (N'KN3', N'CV-fghhdy')
INSERT [dbo].[tblConfig] ([KeyName], [ConfigValue]) VALUES (N'dfdf', N'dddd')
INSERT [dbo].[tblConfig] ([KeyName], [ConfigValue]) VALUES (N'555', N'555')
INSERT [dbo].[tblConfig] ([KeyName], [ConfigValue]) VALUES (N'kn555', N'cv555')
INSERT [dbo].[tblConfig] ([KeyName], [ConfigValue]) VALUES (N'Key1', N'dfdfdf')
SET IDENTITY_INSERT [dbo].[tblSubject] ON 

INSERT [dbo].[tblSubject] ([Id], [SubjectName]) VALUES (2, N'SB2')
INSERT [dbo].[tblSubject] ([Id], [SubjectName]) VALUES (3, N'SB3')
INSERT [dbo].[tblSubject] ([Id], [SubjectName]) VALUES (4, N'SB4')
INSERT [dbo].[tblSubject] ([Id], [SubjectName]) VALUES (5, N'SB5')
INSERT [dbo].[tblSubject] ([Id], [SubjectName]) VALUES (6, N'SB6')
SET IDENTITY_INSERT [dbo].[tblSubject] OFF
SET IDENTITY_INSERT [dbo].[Topic] ON 

INSERT [dbo].[Topic] ([Id], [SubjectId], [TopicName]) VALUES (1, 2, N'TN2')
INSERT [dbo].[Topic] ([Id], [SubjectId], [TopicName]) VALUES (2, 3, N'TN3')
INSERT [dbo].[Topic] ([Id], [SubjectId], [TopicName]) VALUES (3, 4, N'TN4')
INSERT [dbo].[Topic] ([Id], [SubjectId], [TopicName]) VALUES (4, 5, N'TN5')
INSERT [dbo].[Topic] ([Id], [SubjectId], [TopicName]) VALUES (5, 6, N'TN6')
INSERT [dbo].[Topic] ([Id], [SubjectId], [TopicName]) VALUES (6, 3, N'5555')
SET IDENTITY_INSERT [dbo].[Topic] OFF
ALTER TABLE [dbo].[Choice]  WITH CHECK ADD  CONSTRAINT [FK_Choice_Question] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([Id])
GO
ALTER TABLE [dbo].[Choice] CHECK CONSTRAINT [FK_Choice_Question]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Topic] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topic] ([Id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Topic]
GO
ALTER TABLE [dbo].[tblAnswer]  WITH CHECK ADD  CONSTRAINT [FK_tblAnswer_Choice] FOREIGN KEY([ChoiceId])
REFERENCES [dbo].[Choice] ([Id])
GO
ALTER TABLE [dbo].[tblAnswer] CHECK CONSTRAINT [FK_tblAnswer_Choice]
GO
ALTER TABLE [dbo].[tblAnswer]  WITH CHECK ADD  CONSTRAINT [FK_tblAnswer_Question] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([Id])
GO
ALTER TABLE [dbo].[tblAnswer] CHECK CONSTRAINT [FK_tblAnswer_Question]
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_Topic_tblSubject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[tblSubject] ([Id])
GO
ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK_Topic_tblSubject]
GO
/****** Object:  StoredProcedure [dbo].[stpDeleteChoiceByID]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  exec stpChoiceByID 1
create procedure [dbo].[stpDeleteChoiceByID]
@ID int
as
begin
delete from Choice where Id=@ID
end


GO
/****** Object:  StoredProcedure [dbo].[stpDeleteQuestionByID]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  exec stpDeleteQuestionByID 1
create procedure [dbo].[stpDeleteQuestionByID]
@ID int
as
begin
delete from Question where Id=@ID
end


GO
/****** Object:  StoredProcedure [dbo].[stpDeletetblConfigByID]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--  exec stpDeletetblConfigByID 1
create procedure [dbo].[stpDeletetblConfigByID]
@KeyName int
as
begin
delete from tblConfig where KeyName=@KeyName
end


GO
/****** Object:  StoredProcedure [dbo].[stpDeletetblSubjectByID]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  exec stpDeletetblSubjectByID 1
CREATE procedure [dbo].[stpDeletetblSubjectByID]
@ID int
as
begin
delete from tblSubject where Id=@ID
end


GO
/****** Object:  StoredProcedure [dbo].[stpDeleteTopicByID]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  exec stpDeleteTopicByID 1
create procedure [dbo].[stpDeleteTopicByID]
@ID int
as
begin
delete from Topic where Id=@ID
end


GO
/****** Object:  StoredProcedure [dbo].[stpGetAlltblSubjectForDrp]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  exec stpGetAlltblSubjectForDrp 
create procedure [dbo].[stpGetAlltblSubjectForDrp]
as
begin
select Id,SubjectName
from tblSubject
end



GO
/****** Object:  StoredProcedure [dbo].[stpGetChoiceByID]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  exec stpGetChoiceByID 1

CREATE procedure [dbo].[stpGetChoiceByID]
@ID int
as
begin
SELECT [Id]
      ,QuestionId
      ,ChoiceText
  FROM [dbo].Choice
 where Id=@ID
end
GO
/****** Object:  StoredProcedure [dbo].[stpGetChoicePageWise]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  declare @x int Exec stpGetChoicePageWise 1,15, @x out
CREATE PROCEDURE [dbo].[stpGetChoicePageWise]
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
           ORDER BY [ChoiceText] ASC
      )AS RowNumber
      ,C.Id
      ,Q.QuestionText
	  ,ChoiceText

     INTO #Results
      FROM Choice C
	  	 
	 inner join Question Q
	 ON Q.Id = C.QuestionId

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
/****** Object:  StoredProcedure [dbo].[stpGetQuestionByID]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  exec stpGetQuestionByID 1

create procedure [dbo].[stpGetQuestionByID]
@ID int
as
begin
SELECT [Id]
      ,[TopicId]
      ,QuestionText
      ,ImagePath
      ,Marks
  FROM [dbo].Question
 where ID=@ID
end
GO
/****** Object:  StoredProcedure [dbo].[stpGetQuestionForDrp]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec stpGetQuestionForDrp
create procedure [dbo].[stpGetQuestionForDrp]

as
begin
Select ID
      ,QuestionText
from Question
end




GO
/****** Object:  StoredProcedure [dbo].[stpGetQuestionPageWise]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  declare @x int Exec stpGetQuestionPageWise 1,15, @x out
create PROCEDURE [dbo].[stpGetQuestionPageWise]
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
           ORDER BY [QuestionText] ASC
      )AS RowNumber
      ,Q.Id
      ,T.TopicName
	  ,QuestionText
      ,ImagePath
      ,Marks

     INTO #Results
      FROM Question Q
	  	 
	 inner join Topic T
	 ON T.Id = Q.TopicId

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
/****** Object:  StoredProcedure [dbo].[stpGettblConfigByKey]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  exec stpGettblConfigByKey KN1

create procedure [dbo].[stpGettblConfigByKey]
@KeyName varchar(100)
as
begin
SELECT KeyName
      ,ConfigValue
  FROM tblConfig
 where KeyName=@KeyName
end
GO
/****** Object:  StoredProcedure [dbo].[stpGettblConfigPageWise]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--  declare @x int Exec stpGettblConfigPageWise 1,15, @x out
create PROCEDURE [dbo].[stpGettblConfigPageWise]
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
           ORDER BY [KeyName] ASC
      )AS RowNumber
      ,KeyName
      ,ConfigValue

     INTO #Results
      FROM tblConfig 

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
/****** Object:  StoredProcedure [dbo].[stpGettblSubjectByID]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  exec stpGettblSubjectByID 2

create procedure [dbo].[stpGettblSubjectByID]
@ID int
as
begin
SELECT [Id]
       ,SubjectName
  FROM tblSubject
 where Id=@ID
end
GO
/****** Object:  StoredProcedure [dbo].[stpGettblSubjectPageWise]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  declare @x int Exec stpGettblSubjectPageWise 1,15, @x out
create PROCEDURE [dbo].[stpGettblSubjectPageWise]
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
           ORDER BY [SubjectName] ASC
      )AS RowNumber
      ,Id
      ,SubjectName

     INTO #Results
      FROM tblSubject

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
/****** Object:  StoredProcedure [dbo].[stpGetTopicByID]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  exec stpGetTopicByID 1
create procedure [dbo].[stpGetTopicByID]
@ID int
as
begin
SELECT [Id]
      ,[SubjectId]
      ,TopicName
  FROM Topic
 where Id=@ID
end
GO
/****** Object:  StoredProcedure [dbo].[stpGetTopicForDrp]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec stpGetTopicForDrp
CREATE procedure [dbo].[stpGetTopicForDrp]

as
begin
Select Id
      ,TopicName 
from Topic
end
GO
/****** Object:  StoredProcedure [dbo].[stpGetTopicPageWise]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  declare @x int Exec stpGetTopicPageWise 1,15, @x out
Create PROCEDURE [dbo].[stpGetTopicPageWise]
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
           ORDER BY [TopicName] ASC
      )AS RowNumber
      ,T.ID
      ,TS.SubjectName
	  ,TopicName

     INTO #Results
      FROM Topic T
	  	 
	 inner join tblSubject TS
	 ON T.SubjectID = TS.Id

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
/****** Object:  StoredProcedure [dbo].[stpInsertUpdateChoice]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  exec stpInsertUpdateChoice Null,3,'A+', 'Fever', 'Dr.A.Paul'

CREATE procedure [dbo].[stpInsertUpdateChoice] 
( 
@ID int,
@QuestionId int,
@ChoiceText varchar(500)
) 
AS 
BEGIN 
--DECLARE @FleetID int
 BEGIN TRY
    BEGIN TRAN
 IF @ID IS NULL
BEGIN   
	 print 'INSERT'
	INSERT INTO [Choice] 
	       ([QuestionId]
		   ,ChoiceText)
	Values (@QuestionId
	       ,@ChoiceText)

	SET @ID = @@IDENTITY
	--SET @CompanyId  = @ID
END
ELSE
BEGIN
	print 'UPDATE'
	UPDATE [Choice]
	SET     QuestionId=@QuestionId
	       ,ChoiceText=@ChoiceText
	Where Id=@ID
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
/****** Object:  StoredProcedure [dbo].[stpInsertUpdateQuestion]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  exec stpInsertUpdateQuestion 5,2,'deep', 5665.00

CREATE procedure [dbo].[stpInsertUpdateQuestion] 
( 
@ID int,
@TopicId int,
@QuestionText varchar(500),
--@ImagePath varchar(500),
@Marks decimal(12,2)
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
	--SET @CompanyId  = @ID
END
ELSE
BEGIN
	print 'UPDATE'
	UPDATE [Question]
	SET     TopicId=@TopicId
	       ,QuestionText=@QuestionText
		   --,ImagePath=@ImagePath
		   ,Marks=@Marks
	Where Id=@ID
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
/****** Object:  StoredProcedure [dbo].[stpInsertUpdateSubject]    Script Date: 15/09/2019 11:33:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  exec stpInsertUpdateSubject Null, 'FirstSubjectSubjectjhghjgh',"3,12"

CREATE procedure [dbo].[stpInsertUpdateSubject] 
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
/****** Object:  StoredProcedure [dbo].[stpInsertUpdatetblConfig]    Script Date: 15/09/2019 11:33:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  exec stpInsertUpdatetblConfig dfdf, dddd

create procedure [dbo].[stpInsertUpdatetblConfig] 
( 

@KeyName varchar(50),
@ConfigValue varchar(100)
) 
AS 
BEGIN 
--DECLARE @FleetID int
 BEGIN TRY
    BEGIN TRAN

BEGIN   
	 print 'INSERT'
	INSERT INTO tblConfig 
	       (KeyName
		   ,ConfigValue)
	Values (@KeyName
	       ,@ConfigValue)

	--SET @ID = @@IDENTITY
END


	COMMIT TRAN
 END TRY 

 BEGIN CATCH
	ROLLBACK TRAN
	SELECT ERROR_MESSAGE() AS ErrorMessage;  
 END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[stpInsertUpdatetblSubject]    Script Date: 15/09/2019 11:33:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  exec stpInsertUpdatetblSubject Null,'SB6'

CREATE procedure [dbo].[stpInsertUpdatetblSubject] 
( 
@ID int,
@SubjectName varchar(100)
) 
AS 
BEGIN 
--DECLARE @FleetID int
 BEGIN TRY
    BEGIN TRAN
 IF @ID IS NULL
BEGIN   
	 print 'INSERT'
	INSERT INTO [tblSubject] 
	       (SubjectName)
	Values (@SubjectName)

	SET @ID = @@IDENTITY
	--SET @CompanyId  = @ID
END
ELSE
BEGIN
	print 'UPDATE'
	UPDATE [tblSubject]
	SET    SubjectName=@SubjectName
	Where Id=@ID
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
/****** Object:  StoredProcedure [dbo].[stpInsertUpdateTopic]    Script Date: 15/09/2019 11:33:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  exec stpInsertUpdateTopic 6,3,'5555-2'

CREATE procedure [dbo].[stpInsertUpdateTopic] 
( 
@ID int,
@SubjectId int,
@TopicName varchar(100)
) 
AS 
BEGIN 
--DECLARE @FleetID int
 BEGIN TRY
    BEGIN TRAN
 IF @ID IS NULL
BEGIN   
	 print 'INSERT'
	INSERT INTO [Topic] 
	       ([SubjectId]
		   ,TopicName)
	Values (@SubjectId
	       ,@TopicName)

	SET @ID = @@IDENTITY
	--SET @CompanyId  = @ID
END
ELSE
BEGIN
	print 'UPDATE'
	UPDATE [Topic]
	SET     SubjectId=@SubjectId
	       ,TopicName=@TopicName
	Where Id=@ID
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
/****** Object:  StoredProcedure [dbo].[stptblConfigByKey]    Script Date: 15/09/2019 11:33:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--  exec stptblConfigByKey KN1
create procedure [dbo].[stptblConfigByKey]
@KeyName varchar(50)
as
begin
delete from tblConfig where KeyName=@KeyName
end


GO
