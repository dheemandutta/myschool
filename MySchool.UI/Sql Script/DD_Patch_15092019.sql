USE [MySchool]
GO
IF OBJECT_ID('dbo.TempQuestion', 'U') IS NOT NULL
DROP TABLE dbo.TempQuestion;
GO

GO
/****** Object:  Table [dbo].[TempQuestion]    Script Date: 9/19/2019 2:53:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempQuestion](
	[Id] [int] NULL,
	[QuestionText] [varchar](2000) NULL,
	[Marks] [decimal](12, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
