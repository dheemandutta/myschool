
/****** Object:  Table [dbo].[Choice]    Script Date: 18/09/2019 7:47:23 PM ******/
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
	[IsAnswer] [bit] NULL,
 CONSTRAINT [PK_Choice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Question]    Script Date: 18/09/2019 7:47:23 PM ******/
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
/****** Object:  Table [dbo].[tblConfig]    Script Date: 18/09/2019 7:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblConfig](
	[KeyName] [varchar](50) NOT NULL,
	[ConfigValue] [varchar](100) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tblConfig] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO












SET IDENTITY_INSERT [dbo].[Choice] ON 

INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (16, 14, N'Bengal Tiger', 1)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (17, 14, N'Dog', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (18, 14, N'Pig', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (19, 14, N'Cat', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (20, 15, N'apple ', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (21, 15, N'banana ', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (22, 15, N'blackberry ', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (23, 15, N'blackberry ', 1)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (24, 16, N'garlic ', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (25, 16, N'onion', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (26, 16, N'potato ', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (27, 16, N'Pumpkin ', 1)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (28, 17, N'Jana Gana Mana', 1)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (29, 17, N'Sare Jaha Se', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (30, 17, N'Vande MaaTaram', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (31, 17, N'Ham Honge Kamiyab', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (32, 18, N'Jana Gana Mana', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (33, 18, N'Sare Jaha Se', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (34, 18, N'Vande MaaTaram', 1)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (35, 18, N'Ham Honge Kamiyab', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (36, 19, N'hockey', 1)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (37, 19, N'cricket', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (38, 19, N'football', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (39, 19, N'Kabaddi', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (40, 20, N'Himalayan Monal', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (41, 20, N'Indian Pitta', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (42, 20, N'Oriental Dwarf Kingfisher', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (43, 20, N'peacock ', 1)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (44, 21, N'sandesh', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (45, 21, N'Gulabgamun', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (46, 21, N'Jalebi', 1)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (47, 21, N'Malpoa', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (48, 22, N'New Delhi', 1)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (49, 22, N'Kolkata', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (50, 22, N'Bihar', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (51, 22, N'Odisa', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (52, 23, N'Assam', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (53, 23, N'Sikkim', 0)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (54, 23, N'Mumbai', 1)
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (55, 23, N'Ladakh', 0)
SET IDENTITY_INSERT [dbo].[Choice] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (14, 1, N'<p>What is the national animal of India ?</p>', NULL, CAST(2.00 AS Decimal(12, 2)), NULL)
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (15, 1, N'<p>What is the national fruit of India ?</p>', NULL, CAST(2.00 AS Decimal(12, 2)), NULL)
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (16, 1, N'<p>What is the national Vegetable of India ?</p>', NULL, CAST(2.00 AS Decimal(12, 2)), NULL)
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (17, 1, N'<p>What is the national anthem of India ?</p>', NULL, CAST(2.00 AS Decimal(12, 2)), NULL)
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (18, 1, N'<p>What is the national song of India ?</p>', NULL, CAST(2.00 AS Decimal(12, 2)), NULL)
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (19, 1, N'<p>What is the national game of India ?</p>', NULL, CAST(2.00 AS Decimal(12, 2)), NULL)
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (20, 1, N'<p>What is the national bird of India ?</p>', NULL, CAST(2.00 AS Decimal(12, 2)), NULL)
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (21, 1, N'<p>What is the national sweet of India ?</p>', NULL, CAST(2.00 AS Decimal(12, 2)), NULL)
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (22, 1, N'<p>What is the capital of India ?</p>', NULL, CAST(2.00 AS Decimal(12, 2)), NULL)
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (23, 1, N'<p>What is the financial capital of India ?</p>', NULL, CAST(2.00 AS Decimal(12, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[tblConfig] ON 

INSERT [dbo].[tblConfig] ([KeyName], [ConfigValue], [Id]) VALUES (N'Key1', N'5', 1)
INSERT [dbo].[tblConfig] ([KeyName], [ConfigValue], [Id]) VALUES (N'Key2', N'5', 2)
INSERT [dbo].[tblConfig] ([KeyName], [ConfigValue], [Id]) VALUES (N'Key3', N'5', 3)
SET IDENTITY_INSERT [dbo].[tblConfig] OFF
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
/****** Object:  StoredProcedure [dbo].[stpGetChoiceByID]    Script Date: 18/09/2019 7:47:23 PM ******/
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
     -- ,QuestionId
      ,ChoiceText
      ,IsAnswer
  FROM [dbo].Choice
 where Id=@ID
end
GO
/****** Object:  StoredProcedure [dbo].[stpGetQuestion]    Script Date: 18/09/2019 7:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec stpGetQuestion
CREATE procedure [dbo].[stpGetQuestion]

as
begin
Select TOP 1 Id
      ,QuestionText
from Question
end
GO


-- exec stpGettblSubjectForDrp
create procedure [dbo].[stpGettblSubjectForDrp]
as
begin
Select Id
      ,SubjectName 
from tblSubject
end


GO