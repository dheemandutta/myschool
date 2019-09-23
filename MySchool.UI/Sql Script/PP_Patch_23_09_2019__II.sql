GO
--  exec stpChoiceByID 1
ALTER procedure [dbo].[stpDeleteChoiceByID]
@ID int,
@Output  VARCHAR(100) OUTPUT
as
begin
delete from Choice where Id=@ID
end

GO
--  exec stpDeleteQuestionByID 1
ALTER procedure [dbo].[stpDeleteQuestionByID]
@ID int,
@Output  VARCHAR(100) OUTPUT
as
begin
delete from Question where Id=@ID
end


GO
--  exec stpDeleteTopicByID 1
ALTER procedure [dbo].[stpDeleteTopicByID]
@ID int,
@Output  VARCHAR(100) OUTPUT
as
begin
delete from Topic where Id=@ID
end


GO
-- exec stpGetExamForDrp
create procedure [dbo].[stpGetExamForDrp]

as
begin
Select ID
      ,ExamName
from Exam
end



GO
-- exec stpInsertUser Null,'FirstName','LastName','FasLas',12345,1

Create procedure [dbo].[stpInsertUser] 
( 
@ID int,
-- @RoleID int, ------------------[ hard coded 2 ]------------------
@FirstName varchar(500),
@LastName varchar(500),
@UserName varchar(500),
@Password varchar(100),
@ExamId int
) 
AS 
BEGIN 
--DECLARE @FleetID int
 BEGIN TRY
    BEGIN TRAN
   IF @ID IS NULL
BEGIN   
	 print 'INSERT'
	INSERT INTO [User] 
		   (RoleID,FirstName,LastName,UserName,[Password],ExamId)
	Values (2,@FirstName,@LastName,@UserName,@Password,@ExamId)

--	SET @ID = @@IDENTITY
END
--ELSE
--BEGIN
--	print 'UPDATE'
--	UPDATE [StudentParticulars]
--	SET FirstName=@FirstName,LastName=@LastName,DOB=@DOB,GradeID=@GradeID,StartDate=@StartDate,
--	    EndDate=@EndDate,LeavingReason=@LeavingReason,Gender=@Gender
--	Where ID=@ID
	--SET @CompanyId  = @ID
--END
	COMMIT TRAN
 END TRY 

 BEGIN CATCH
	ROLLBACK TRAN
	SELECT ERROR_MESSAGE() AS ErrorMessage;  
 END CATCH
END



GO


---------------------------------------------------------------------------------------------------------



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 23/09/2019 3:51:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[FirstName] [varchar](500) NULL,
	[LastName] [varchar](500) NULL,
	[RoleID] [int] NULL,
	[UserName] [varchar](500) NULL,
	[ExamId] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([ID], [RoleName]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Password], [FirstName], [LastName], [RoleID], [UserName], [ExamId]) VALUES (1, N'12345', NULL, NULL, 1, N'Admin', NULL)
INSERT [dbo].[User] ([ID], [Password], [FirstName], [LastName], [RoleID], [UserName], [ExamId]) VALUES (2, N'12345', N'FirstName', N'LastName', 2, N'FasLas', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_User]    Script Date: 23/09/2019 3:51:00 PM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [IX_User] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Exam] FOREIGN KEY([ExamId])
REFERENCES [dbo].[Exam] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Exam]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
