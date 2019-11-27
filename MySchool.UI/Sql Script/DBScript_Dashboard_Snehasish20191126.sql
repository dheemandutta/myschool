USE [MySchool]
GO

/****** Object:  Table [dbo].[Dashboard]    Script Date: 26-11-2019 12:55:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Dashboard](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[subject] [varchar](max) NOT NULL,
	[description] [varchar](max) NULL,
	[releaseDate] [datetime] NOT NULL,
	[expiryDate] [datetime] NOT NULL,
	[importance] [varchar](50) NOT NULL,
	[filepath] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


USE [MySchool]
GO
/****** Object:  StoredProcedure [dbo].[stpInsertUpdateDashboard]    Script Date: 26-11-2019 13:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stpInsertUpdateDashboard]
(
	@id	int,
	@subject varchar(max),
	@description varchar(max),
	@releaseDate datetime,
	@expiryDate datetime,
	@importance varchar(50),
	@filepath varchar(max) NULL
)
as
BEGIN
	Declare @coutnDashboard INT
	Set @coutnDashboard = 0
	BEGIN
		SELECT @coutnDashboard = COUNT(Subject) FROM Dashboard WHERE Subject=@subject AND releaseDate = @releaseDate AND expiryDate = @expiryDate
		IF @coutnDashboard > 0 
			BEGIN
				INSERT INTO Dashboard (subject, Description, releaseDate, expiryDate, importance, filepath) VALUES
				(@subject, @description, @releaseDate, @expiryDate, @importance, @filepath)
			END
		ELSE
			BEGIN
				UPDATE Dashboard SET subject=@subject, description= @description, releaseDate = @releaseDate, 
				expiryDate = @expiryDate, importance = @importance, filepath = @filepath
				WHERE id=@id
			END
	END
END