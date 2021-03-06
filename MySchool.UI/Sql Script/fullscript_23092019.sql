
USE [MySchool]
GO
/****** Object:  UserDefinedTableType [dbo].[AnswerTVT]    Script Date: 9/23/2019 10:13:48 PM ******/
CREATE TYPE [dbo].[AnswerTVT] AS TABLE(
	[Ans] [varchar](max) NULL,
	[IsAns] [bit] NULL
)
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_CSVToTable]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[ufn_CSVToTable] ( @StringInput VARCHAR(8000), @Delimiter nvarchar(1))
RETURNS @OutputTable TABLE ( [String] VARCHAR(10) )
AS
BEGIN

    DECLARE @String    VARCHAR(10)

    WHILE LEN(@StringInput) > 0
    BEGIN
        SET @String      = LEFT(@StringInput, 
                                ISNULL(NULLIF(CHARINDEX(@Delimiter, @StringInput) - 1, -1),
                                LEN(@StringInput)))
        SET @StringInput = SUBSTRING(@StringInput,
                                     ISNULL(NULLIF(CHARINDEX(@Delimiter, @StringInput), 0),
                                     LEN(@StringInput)) + 1, LEN(@StringInput))

        INSERT INTO @OutputTable ( [String] )
        VALUES ( @String )
    END

    RETURN
END




GO
/****** Object:  Table [dbo].[Admission]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admission](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YearID] [int] NOT NULL,
	[GradeID] [int] NOT NULL,
	[AdmAmt] [decimal](12, 2) NOT NULL,
	[AdmissonNumber] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Admission] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AdmissionDetails]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdmissionDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AdmissionID] [int] NOT NULL,
	[FName] [varchar](500) NOT NULL,
	[LName] [varchar](500) NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[DOB] [datetime] NOT NULL,
	[GFName] [varchar](500) NOT NULL,
	[GLName] [varchar](500) NOT NULL,
	[FatherFName] [varchar](500) NOT NULL,
	[FatherLName] [varchar](500) NOT NULL,
	[FatherOccupation] [varchar](500) NULL,
	[PrevSchoolCent] [varchar](500) NULL,
	[MotherTongue] [varchar](50) NULL,
	[isAdmitted] [bit] NOT NULL,
 CONSTRAINT [PK_AdmissionDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AdmissionForm]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdmissionForm](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FormNumber] [varchar](50) NOT NULL,
	[SFName] [varchar](50) NOT NULL,
	[SMName] [varchar](50) NULL,
	[SLNAme] [varchar](50) NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[DOB] [date] NOT NULL,
	[FFName] [varchar](50) NOT NULL,
	[FMName] [varchar](50) NULL,
	[FLName] [varchar](50) NOT NULL,
	[MFName] [varchar](50) NOT NULL,
	[MMName] [varchar](50) NULL,
	[GFName] [varchar](50) NOT NULL,
	[GMName] [varchar](50) NOT NULL,
	[GLName] [varchar](50) NULL,
	[Address] [varchar](50) NOT NULL,
	[MoutherTounge] [varchar](50) NOT NULL,
	[FatherQualification] [varchar](50) NOT NULL,
	[MotherQualification] [varchar](50) NOT NULL,
	[FatherOccupation] [varchar](50) NOT NULL,
	[FatherAnnualIncome] [decimal](18, 0) NOT NULL,
	[MotherOccupation] [varchar](50) NULL,
	[MotherAnnualIncome] [decimal](18, 0) NULL,
	[GradeID] [int] NOT NULL,
	[YearID] [int] NOT NULL,
	[isSelectedForInterview] [bit] NULL,
	[IdentificationMarks] [varchar](50) NOT NULL,
	[SpecialMedicalProblem] [varchar](50) NOT NULL,
	[isSelectedForAdmission] [bit] NULL,
 CONSTRAINT [PK_AdmissionForm] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Announcement]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Announcement](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AnnouncementDesc] [varchar](500) NULL,
	[Announcement] [varchar](500) NULL,
	[ValitUntilDate] [datetime] NULL,
	[CreatedBy] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Announcement] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Campaign]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Campaign](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NOT NULL,
	[Description] [varchar](500) NULL,
	[Target] [decimal](18, 0) NULL,
	[Collected] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Campaign] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Choice]    Script Date: 9/23/2019 10:13:48 PM ******/
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
/****** Object:  Table [dbo].[DayOfWeek]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DayOfWeek](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WeekDay] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DayOfWeek] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Donar]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Donar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DonarName] [varchar](500) NOT NULL,
	[Donation] [decimal](12, 2) NULL,
	[Amt] [decimal](12, 2) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Donar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Donation]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CampaignID] [int] NOT NULL,
	[DonetionAmt] [decimal](12, 2) NOT NULL,
	[Date] [datetime] NOT NULL,
	[RefundAmt] [decimal](12, 2) NULL,
 CONSTRAINT [PK_Donation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Event]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Event](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [varchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[FromTime] [datetime] NOT NULL,
	[ToTime] [datetime] NOT NULL,
	[TeacherID] [int] NOT NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EventInvitees]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventInvitees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
 CONSTRAINT [PK_EventInvitees] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Exam]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Exam](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ExamName] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExamSubject]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamSubject](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ExamID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[GradeID] [int] NOT NULL,
	[ExamDate] [datetime] NOT NULL,
	[YearID] [int] NOT NULL,
	[PassPercentage] [decimal](12, 2) NOT NULL,
 CONSTRAINT [PK_ExamSubject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Grade]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grade](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Grade] [varchar](100) NOT NULL,
	[GradeGroupID] [int] NOT NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GradeGroup]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GradeGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GradeGroup] [varchar](100) NOT NULL,
 CONSTRAINT [PK_GradeGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Question]    Script Date: 9/23/2019 10:13:48 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 9/23/2019 10:13:48 PM ******/
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
/****** Object:  Table [dbo].[RuleMaster]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RuleMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GradeID] [int] NOT NULL,
	[CutOffMarks] [int] NOT NULL,
 CONSTRAINT [PK_RuleMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RuleSubject]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RuleSubject](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RuleID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
 CONSTRAINT [PK_RuleSubject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Section]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Section](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GradeId] [int] NOT NULL,
	[Section] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Section] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GradeID] [int] NOT NULL,
	[YearID] [int] NOT NULL,
	[AdmissionID] [int] NOT NULL,
	[SectionID] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentAttendent]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentAttendent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[IsPresents] [varchar](50) NULL,
 CONSTRAINT [PK_StudentAttendent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentContact]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentContact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[FatherFName] [varchar](500) NULL,
	[FatherLName] [varchar](500) NULL,
	[FatherAddress] [varchar](500) NULL,
	[FPh1] [varchar](20) NULL,
	[FPh2] [varchar](20) NULL,
	[MotherFName] [varchar](500) NULL,
	[MotherLName] [varchar](500) NULL,
	[MotherAddress] [varchar](500) NULL,
	[MPh1] [varchar](20) NULL,
	[MPh2] [varchar](20) NULL,
	[GFName] [varchar](500) NULL,
	[GLName] [varchar](500) NULL,
	[GAddress] [varchar](500) NULL,
	[GPh1] [varchar](20) NULL,
	[GPh2] [varchar](20) NULL,
	[RelationWithStudent] [varchar](1000) NULL,
 CONSTRAINT [PK_StudentContact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentHealth]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentHealth](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[BloodGroup] [varchar](50) NULL,
	[KnownMadicalProblems] [varchar](500) NULL,
	[DoctorName] [varchar](500) NULL,
 CONSTRAINT [PK_StudentHealth] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentParticulars]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentParticulars](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[FirstName] [varchar](500) NULL,
	[LastName] [varchar](500) NULL,
	[DOB] [datetime] NULL,
	[GradeID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[LeavingReason] [varchar](500) NULL,
	[Gender] [varchar](20) NULL,
	[Photo] [varchar](1000) NULL,
 CONSTRAINT [PK_StudentParticulars] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentResult]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentResult](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentResultDetailsID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[TotalMarks] [int] NOT NULL,
	[MarksObtained] [int] NOT NULL,
	[NoOfSubjectsFails] [int] NOT NULL,
	[ResultStatus] [int] NOT NULL,
 CONSTRAINT [PK_StudentResult_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentResultDetails]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentResultDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[Marks] [decimal](12, 2) NOT NULL,
	[ExamSubjectID] [int] NOT NULL,
	[TeacherComments] [varchar](50) NULL,
	[GuardianComments] [varchar](50) NULL,
	[Status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StudentResult] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Subject](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [varchar](500) NOT NULL,
	[GradeID] [int] NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblAnswer]    Script Date: 9/23/2019 10:13:48 PM ******/
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
/****** Object:  Table [dbo].[tblConfig]    Script Date: 9/23/2019 10:13:48 PM ******/
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
/****** Object:  Table [dbo].[tblSubject]    Script Date: 9/23/2019 10:13:48 PM ******/
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
/****** Object:  Table [dbo].[Teacher]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FName] [varchar](500) NOT NULL,
	[LName] [varchar](500) NOT NULL,
	[Photo] [varchar](500) NULL,
	[Gender] [varchar](50) NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[Ph1] [varchar](20) NOT NULL,
	[Ph2] [varchar](20) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Comments] [varchar](500) NULL,
	[Designation] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TeacherGrade]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherGrade](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TeacherID] [int] NOT NULL,
	[YearID] [int] NOT NULL,
	[GradeID] [int] NOT NULL,
	[IsClassTeacher] [bit] NOT NULL,
	[SubjectID] [int] NOT NULL,
 CONSTRAINT [PK_TeacherGrade] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TeacherQual]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TeacherQual](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TeacherID] [int] NOT NULL,
	[QualName] [varchar](500) NOT NULL,
	[QualCertPath] [varchar](5000) NULL,
	[QualStatus] [varchar](100) NOT NULL,
	[QualCompletionDate] [datetime] NULL,
 CONSTRAINT [PK_TeacherQual] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TeacherSubject]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherSubject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[isPrimarySubject] [bit] NULL,
 CONSTRAINT [PK_TeacherSubject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TempAnswer]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempAnswer](
	[Id] [int] NULL,
	[QuestionId] [int] NULL,
	[ChoiceText] [varchar](2000) NULL,
	[IsAnswer] [bit] NULL,
	[IsUserAnswer] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempQuestion]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempQuestion](
	[Id] [int] NULL,
	[QuestionText] [varchar](2000) NULL,
	[Marks] [decimal](12, 2) NULL,
	[RowNo] [int] NULL,
	[UserId] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TimeTable]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GradeID] [int] NOT NULL,
	[YearID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[DayOfWeekID] [int] NOT NULL,
 CONSTRAINT [PK_TimeTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Topic]    Script Date: 9/23/2019 10:13:48 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 9/23/2019 10:13:48 PM ******/
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
/****** Object:  Table [dbo].[Year]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Year](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [varchar](50) NOT NULL,
	[YearDesc] [varchar](50) NULL,
 CONSTRAINT [PK_Year] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Admission] ON 

GO
INSERT [dbo].[Admission] ([ID], [YearID], [GradeID], [AdmAmt], [AdmissonNumber]) VALUES (3, 1, 3, CAST(5000.00 AS Decimal(12, 2)), N'AdNo90001')
GO
INSERT [dbo].[Admission] ([ID], [YearID], [GradeID], [AdmAmt], [AdmissonNumber]) VALUES (5, 2, 4, CAST(4500.00 AS Decimal(12, 2)), N'AdNo90002')
GO
SET IDENTITY_INSERT [dbo].[Admission] OFF
GO
SET IDENTITY_INSERT [dbo].[Choice] ON 

GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (7, 9, N'Dheeman', 1)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (8, 9, N'Prasenjit', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (9, 9, N'Snehashis', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (10, 9, N'Anirban', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (16, 14, N'Bengal Tiger', 1)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (17, 14, N'Dog', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (18, 14, N'Pig', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (19, 14, N'Cat', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (20, 15, N'apple ', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (21, 15, N'banana ', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (22, 15, N'blackberry ', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (23, 15, N'blackberry ', 1)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (24, 16, N'garlic ', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (25, 16, N'onion', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (26, 16, N'potato ', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (27, 16, N'Pumpkin ', 1)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (28, 17, N'Jana Gana Mana', 1)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (29, 17, N'Sare Jaha Se', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (30, 17, N'Vande MaaTaram', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (31, 17, N'Ham Honge Kamiyab', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (32, 18, N'Jana Gana Mana', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (33, 18, N'Sare Jaha Se', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (34, 18, N'Vande MaaTaram', 1)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (35, 18, N'Ham Honge Kamiyab', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (36, 19, N'hockey', 1)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (37, 19, N'cricket', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (38, 19, N'football', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (39, 19, N'Kabaddi', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (40, 20, N'Himalayan Monal', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (41, 20, N'Indian Pitta', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (42, 20, N'Oriental Dwarf Kingfisher', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (43, 20, N'peacock ', 1)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (44, 21, N'sandesh', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (45, 21, N'Gulabgamun', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (46, 21, N'Jalebi', 1)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (47, 21, N'Malpoa', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (48, 22, N'New Delhi', 1)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (49, 22, N'Kolkata', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (50, 22, N'Bihar', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (51, 22, N'Odisa', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (52, 23, N'Assam', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (53, 23, N'Sikkim', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (54, 23, N'Mumbai', 1)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (55, 23, N'Ladakh', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (56, 24, N'The keys in each file must match for the value to be used.', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (57, 24, N'If the keys match, either value can be used.', 1)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (58, 24, N'No value is set. The user will be prompted for the correct value.', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (59, 24, N'No value is set. The user will be prompted for the correct value.', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (60, 25, N'DiskMan', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (61, 25, N'DiskPerf', 1)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (62, 25, N'DiskPart', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (63, 25, N'DiskCom', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (64, 26, N'E-mail distribution groups', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (65, 26, N'Fax groups', 1)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (66, 26, N'Name resolution groups', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (67, 26, N'None of the above', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (68, 27, N'Washington DC', 1)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (69, 27, N'Seattle', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (70, 27, N'Los Angeles', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (71, 27, N'None of the above', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (72, 28, N'Storage Mechanism', 1)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (73, 28, N'Memory management', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (74, 28, N'Sharepoint List', 0)
GO
INSERT [dbo].[Choice] ([Id], [QuestionId], [ChoiceText], [IsAnswer]) VALUES (75, 28, N'Azure Cloud', 0)
GO
SET IDENTITY_INSERT [dbo].[Choice] OFF
GO
SET IDENTITY_INSERT [dbo].[Grade] ON 

GO
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (3, N'Lower Nursery', 1)
GO
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (4, N'Upper Nursery', 1)
GO
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (5, N'Class - I', 2)
GO
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (6, N'Class - II', 2)
GO
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (7, N'Class - III', 2)
GO
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (8, N'Class - IV', 3)
GO
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (9, N'Class - V', 3)
GO
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (10, N'Class - VI', 3)
GO
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (11, N'Class - I', 3)
GO
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (12, N'Class - II Section - B', 2)
GO
SET IDENTITY_INSERT [dbo].[Grade] OFF
GO
SET IDENTITY_INSERT [dbo].[GradeGroup] ON 

GO
INSERT [dbo].[GradeGroup] ([ID], [GradeGroup]) VALUES (1, N'Nursery')
GO
INSERT [dbo].[GradeGroup] ([ID], [GradeGroup]) VALUES (2, N'Primary')
GO
INSERT [dbo].[GradeGroup] ([ID], [GradeGroup]) VALUES (3, N'Upper Primary')
GO
INSERT [dbo].[GradeGroup] ([ID], [GradeGroup]) VALUES (4, N'Secondary')
GO
INSERT [dbo].[GradeGroup] ([ID], [GradeGroup]) VALUES (5, N'Higher Secondary')
GO
SET IDENTITY_INSERT [dbo].[GradeGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

GO
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (9, 3, N'<p>what is your name?&nbsp;&nbsp;&nbsp;&nbsp;</p>', NULL, CAST(3.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (14, 1, N'<p>What is the national animal of India ?</p>', NULL, CAST(2.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (15, 1, N'<p>What is the national fruit of India ?</p>', NULL, CAST(2.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (16, 1, N'<p>What is the national Vegetable of India ?</p>', NULL, CAST(2.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (17, 1, N'<p>What is the national anthem of India ?</p>', NULL, CAST(2.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (18, 1, N'<p>What is the national song of India ?</p>', NULL, CAST(2.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (19, 1, N'<p>What is the national game of India ?</p>', NULL, CAST(2.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (20, 1, N'<p>What is the national bird of India ?</p>', NULL, CAST(2.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (21, 1, N'<p>What is the national sweet of India ?</p>', NULL, CAST(2.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (22, 1, N'<p>What is the capital of India ?</p>', NULL, CAST(2.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (23, 1, N'<p>What is the financial capital of India ?</p>', NULL, CAST(2.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (24, 2, N'<h5>During Setup, keys and values are drawn from the Answer file and the UDF. If a key is specified in both the Answer File and the UDF, what is the outcome?</h5>', NULL, CAST(3.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (25, 2, N'<p><span style="color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16px;">_________ is a command-line tool that enables you to manage objects, such as disks, partitions, and volumes from the command-line.</span><br></p>', NULL, CAST(5.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (26, 3, N'<p><span style="color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16px;">In Windows Server 2003, a group denotes a set of users, computers, contacts, and other groups that can be used as Security groups and</span><strong style="color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16px;"> _______________.</strong><br></p>', NULL, CAST(5.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (27, 7, N'<p>what is the capital of USA?</p>', NULL, CAST(5.00 AS Decimal(12, 2)), NULL)
GO
INSERT [dbo].[Question] ([Id], [TopicId], [QuestionText], [ImagePath], [Marks], [HasMultipleAnswers]) VALUES (28, 8, N'<p><b>What </b>is <b>Session </b>in ASP.NET ?&nbsp;</p>', NULL, CAST(5.00 AS Decimal(12, 2)), NULL)
GO
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

GO
INSERT [dbo].[Role] ([ID], [RoleName]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Role] ([ID], [RoleName]) VALUES (2, N'User')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Section] ON 

GO
INSERT [dbo].[Section] ([ID], [GradeId], [Section]) VALUES (2, 3, N'A')
GO
INSERT [dbo].[Section] ([ID], [GradeId], [Section]) VALUES (3, 3, N'B')
GO
INSERT [dbo].[Section] ([ID], [GradeId], [Section]) VALUES (4, 3, N'C')
GO
INSERT [dbo].[Section] ([ID], [GradeId], [Section]) VALUES (6, 4, N'A')
GO
INSERT [dbo].[Section] ([ID], [GradeId], [Section]) VALUES (7, 4, N'B')
GO
INSERT [dbo].[Section] ([ID], [GradeId], [Section]) VALUES (8, 4, N'C')
GO
INSERT [dbo].[Section] ([ID], [GradeId], [Section]) VALUES (9, 5, N'A')
GO
INSERT [dbo].[Section] ([ID], [GradeId], [Section]) VALUES (10, 5, N'B')
GO
INSERT [dbo].[Section] ([ID], [GradeId], [Section]) VALUES (11, 5, N'C')
GO
INSERT [dbo].[Section] ([ID], [GradeId], [Section]) VALUES (12, 6, N'new')
GO
SET IDENTITY_INSERT [dbo].[Section] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

GO
INSERT [dbo].[Student] ([ID], [GradeID], [YearID], [AdmissionID], [SectionID]) VALUES (1, 3, 1, 3, NULL)
GO
INSERT [dbo].[Student] ([ID], [GradeID], [YearID], [AdmissionID], [SectionID]) VALUES (3, 4, 2, 5, NULL)
GO
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentAttendent] ON 

GO
INSERT [dbo].[StudentAttendent] ([ID], [StudentID], [Date], [IsPresents]) VALUES (2, 1, CAST(N'2019-05-06 00:00:00.000' AS DateTime), N'1')
GO
INSERT [dbo].[StudentAttendent] ([ID], [StudentID], [Date], [IsPresents]) VALUES (5, 3, CAST(N'2019-05-06 00:00:00.000' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[StudentAttendent] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentContact] ON 

GO
INSERT [dbo].[StudentContact] ([ID], [StudentID], [FatherFName], [FatherLName], [FatherAddress], [FPh1], [FPh2], [MotherFName], [MotherLName], [MotherAddress], [MPh1], [MPh2], [GFName], [GLName], [GAddress], [GPh1], [GPh2], [RelationWithStudent]) VALUES (1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Shamaldas ', N'Chanchad ', N'Shimla
, Himachal Pradesh', N'990365455', NULL, NULL)
GO
INSERT [dbo].[StudentContact] ([ID], [StudentID], [FatherFName], [FatherLName], [FatherAddress], [FPh1], [FPh2], [MotherFName], [MotherLName], [MotherAddress], [MPh1], [MPh2], [GFName], [GLName], [GAddress], [GPh1], [GPh2], [RelationWithStudent]) VALUES (2, 3, N'Mr.', N'Qureshi', N'Delhi', N'9215455450', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[StudentContact] ([ID], [StudentID], [FatherFName], [FatherLName], [FatherAddress], [FPh1], [FPh2], [MotherFName], [MotherLName], [MotherAddress], [MPh1], [MPh2], [GFName], [GLName], [GAddress], [GPh1], [GPh2], [RelationWithStudent]) VALUES (8, 3, N'fghfhhhhh22222', N'fhfh', N'gkh', N'g', N'gjg', N'gjhg', N'hgg', N'ghg', N'ghg', N'gjhg', N'jhgjhg', N'uhkj', N'kghk', N'hghj', N'jghkg', NULL)
GO
SET IDENTITY_INSERT [dbo].[StudentContact] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentHealth] ON 

GO
INSERT [dbo].[StudentHealth] ([ID], [StudentID], [BloodGroup], [KnownMadicalProblems], [DoctorName]) VALUES (1, 3, N'O+', N'fdgf', N'dfgfdgdffg')
GO
INSERT [dbo].[StudentHealth] ([ID], [StudentID], [BloodGroup], [KnownMadicalProblems], [DoctorName]) VALUES (3, 1, N'B+', N'dfdfd', N'dfdfdfd')
GO
INSERT [dbo].[StudentHealth] ([ID], [StudentID], [BloodGroup], [KnownMadicalProblems], [DoctorName]) VALUES (5, 1, N'A+', N'fddf', N'sfsdfsdfsd')
GO
INSERT [dbo].[StudentHealth] ([ID], [StudentID], [BloodGroup], [KnownMadicalProblems], [DoctorName]) VALUES (6, 3, N'B+', N'cxzxcz22', N'cxzzxcz22')
GO
INSERT [dbo].[StudentHealth] ([ID], [StudentID], [BloodGroup], [KnownMadicalProblems], [DoctorName]) VALUES (7, 3, N'AB+', N'ghhgh new', N'hfghfg new')
GO
SET IDENTITY_INSERT [dbo].[StudentHealth] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentParticulars] ON 

GO
INSERT [dbo].[StudentParticulars] ([ID], [StudentID], [FirstName], [LastName], [DOB], [GradeID], [StartDate], [EndDate], [LeavingReason], [Gender], [Photo]) VALUES (1, 1, N'Fungsug', N'Vangru', CAST(N'2019-05-06 00:00:00.000' AS DateTime), 3, CAST(N'2019-05-06 00:00:00.000' AS DateTime), CAST(N'2019-05-06 00:00:00.000' AS DateTime), N'xyz', N'Male', N'\StudentIMG\Fungsug Vangru.png')
GO
INSERT [dbo].[StudentParticulars] ([ID], [StudentID], [FirstName], [LastName], [DOB], [GradeID], [StartDate], [EndDate], [LeavingReason], [Gender], [Photo]) VALUES (3, 3, N'Farhan', N'Qureshi', CAST(N'2019-05-06 00:00:00.000' AS DateTime), 4, CAST(N'2019-05-06 00:00:00.000' AS DateTime), CAST(N'2019-05-06 00:00:00.000' AS DateTime), N'ok', N'Male', N'\StudentIMG\Farhan Qureshi.png')
GO
INSERT [dbo].[StudentParticulars] ([ID], [StudentID], [FirstName], [LastName], [DOB], [GradeID], [StartDate], [EndDate], [LeavingReason], [Gender], [Photo]) VALUES (8, NULL, N'First 22', N'gfgf', CAST(N'2019-05-06 00:00:00.000' AS DateTime), 3, CAST(N'2019-05-06 00:00:00.000' AS DateTime), CAST(N'2019-05-06 00:00:00.000' AS DateTime), N'ghfghgh', N'm', N'null')
GO
INSERT [dbo].[StudentParticulars] ([ID], [StudentID], [FirstName], [LastName], [DOB], [GradeID], [StartDate], [EndDate], [LeavingReason], [Gender], [Photo]) VALUES (9, NULL, N'aaaa2', N'aaa22', CAST(N'2011-11-11 00:00:00.000' AS DateTime), 5, CAST(N'2011-11-11 00:00:00.000' AS DateTime), CAST(N'2011-11-11 00:00:00.000' AS DateTime), N'aaaaa', N'Female', NULL)
GO
SET IDENTITY_INSERT [dbo].[StudentParticulars] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 

GO
INSERT [dbo].[Subject] ([ID], [SubjectName], [GradeID]) VALUES (1, N'FirstSubjectSubject22', 3)
GO
INSERT [dbo].[Subject] ([ID], [SubjectName], [GradeID]) VALUES (2, N'ss2', 12)
GO
INSERT [dbo].[Subject] ([ID], [SubjectName], [GradeID]) VALUES (3, N'uuu2', 6)
GO
INSERT [dbo].[Subject] ([ID], [SubjectName], [GradeID]) VALUES (4, N'maths', 4)
GO
INSERT [dbo].[Subject] ([ID], [SubjectName], [GradeID]) VALUES (5, N'maths', 6)
GO
INSERT [dbo].[Subject] ([ID], [SubjectName], [GradeID]) VALUES (6, N'maths', 8)
GO
INSERT [dbo].[Subject] ([ID], [SubjectName], [GradeID]) VALUES (7, N'English', 5)
GO
INSERT [dbo].[Subject] ([ID], [SubjectName], [GradeID]) VALUES (8, N'English', 6)
GO
INSERT [dbo].[Subject] ([ID], [SubjectName], [GradeID]) VALUES (9, N'English', 7)
GO
INSERT [dbo].[Subject] ([ID], [SubjectName], [GradeID]) VALUES (10, N'English', 8)
GO
INSERT [dbo].[Subject] ([ID], [SubjectName], [GradeID]) VALUES (11, N'English', 9)
GO
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
SET IDENTITY_INSERT [dbo].[tblConfig] ON 

GO
INSERT [dbo].[tblConfig] ([KeyName], [ConfigValue], [Id]) VALUES (N'KN1', N'CV1', 1)
GO
INSERT [dbo].[tblConfig] ([KeyName], [ConfigValue], [Id]) VALUES (N'KN2', N'CV2', 2)
GO
INSERT [dbo].[tblConfig] ([KeyName], [ConfigValue], [Id]) VALUES (N'KN3', N'CV-fghhdy', 3)
GO
INSERT [dbo].[tblConfig] ([KeyName], [ConfigValue], [Id]) VALUES (N'dfdf', N'dddd', 4)
GO
INSERT [dbo].[tblConfig] ([KeyName], [ConfigValue], [Id]) VALUES (N'555', N'555', 5)
GO
INSERT [dbo].[tblConfig] ([KeyName], [ConfigValue], [Id]) VALUES (N'kn555', N'cv555', 6)
GO
INSERT [dbo].[tblConfig] ([KeyName], [ConfigValue], [Id]) VALUES (N'Key1', N'dfdfdf', 7)
GO
SET IDENTITY_INSERT [dbo].[tblConfig] OFF
GO
SET IDENTITY_INSERT [dbo].[tblSubject] ON 

GO
INSERT [dbo].[tblSubject] ([Id], [SubjectName]) VALUES (2, N'SB2')
GO
INSERT [dbo].[tblSubject] ([Id], [SubjectName]) VALUES (3, N'SB3')
GO
INSERT [dbo].[tblSubject] ([Id], [SubjectName]) VALUES (4, N'SB4')
GO
INSERT [dbo].[tblSubject] ([Id], [SubjectName]) VALUES (5, N'SB5')
GO
INSERT [dbo].[tblSubject] ([Id], [SubjectName]) VALUES (6, N'SB6')
GO
SET IDENTITY_INSERT [dbo].[tblSubject] OFF
GO
SET IDENTITY_INSERT [dbo].[Topic] ON 

GO
INSERT [dbo].[Topic] ([Id], [SubjectId], [TopicName]) VALUES (1, 2, N'TN2')
GO
INSERT [dbo].[Topic] ([Id], [SubjectId], [TopicName]) VALUES (2, 3, N'TN3')
GO
INSERT [dbo].[Topic] ([Id], [SubjectId], [TopicName]) VALUES (3, 4, N'TN4')
GO
INSERT [dbo].[Topic] ([Id], [SubjectId], [TopicName]) VALUES (4, 5, N'TN5')
GO
INSERT [dbo].[Topic] ([Id], [SubjectId], [TopicName]) VALUES (5, 6, N'TN6')
GO
INSERT [dbo].[Topic] ([Id], [SubjectId], [TopicName]) VALUES (6, 3, N'5555')
GO
INSERT [dbo].[Topic] ([Id], [SubjectId], [TopicName]) VALUES (7, 2, N'Azure')
GO
INSERT [dbo].[Topic] ([Id], [SubjectId], [TopicName]) VALUES (8, 3, N'ASP.NET')
GO
SET IDENTITY_INSERT [dbo].[Topic] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

GO
INSERT [dbo].[User] ([ID], [Password], [FirstName], [LastName], [RoleID], [UserName], [ExamId]) VALUES (1, N'12345', NULL, NULL, 1, N'Admin', NULL)
GO
INSERT [dbo].[User] ([ID], [Password], [FirstName], [LastName], [RoleID], [UserName], [ExamId]) VALUES (2, N'12345', N'FirstName', N'LastName', 2, N'FasLas', 1)
GO
INSERT [dbo].[User] ([ID], [Password], [FirstName], [LastName], [RoleID], [UserName], [ExamId]) VALUES (3, N'password', N'Dheeman ', N'Dutta', 2, N'dhedutta', 0)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[Year] ON 

GO
INSERT [dbo].[Year] ([ID], [Year], [YearDesc]) VALUES (1, N'2019', N'2019-2020')
GO
INSERT [dbo].[Year] ([ID], [Year], [YearDesc]) VALUES (2, N'2020', N'2020-2021')
GO
INSERT [dbo].[Year] ([ID], [Year], [YearDesc]) VALUES (3, N'2021', N'2021-2022')
GO
INSERT [dbo].[Year] ([ID], [Year], [YearDesc]) VALUES (16, N'2022', N'2022-2023')
GO
INSERT [dbo].[Year] ([ID], [Year], [YearDesc]) VALUES (17, N'2023', N'2023-2024')
GO
INSERT [dbo].[Year] ([ID], [Year], [YearDesc]) VALUES (18, N'2024', N'2024-2025')
GO
SET IDENTITY_INSERT [dbo].[Year] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_User]    Script Date: 9/23/2019 10:13:48 PM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [IX_User] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Admission]  WITH CHECK ADD  CONSTRAINT [FK_Admission_Grade] FOREIGN KEY([GradeID])
REFERENCES [dbo].[Grade] ([ID])
GO
ALTER TABLE [dbo].[Admission] CHECK CONSTRAINT [FK_Admission_Grade]
GO
ALTER TABLE [dbo].[Admission]  WITH CHECK ADD  CONSTRAINT [FK_Admission_Year] FOREIGN KEY([YearID])
REFERENCES [dbo].[Year] ([ID])
GO
ALTER TABLE [dbo].[Admission] CHECK CONSTRAINT [FK_Admission_Year]
GO
ALTER TABLE [dbo].[AdmissionDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdmissionDetails_Admission] FOREIGN KEY([AdmissionID])
REFERENCES [dbo].[Admission] ([ID])
GO
ALTER TABLE [dbo].[AdmissionDetails] CHECK CONSTRAINT [FK_AdmissionDetails_Admission]
GO
ALTER TABLE [dbo].[AdmissionForm]  WITH CHECK ADD  CONSTRAINT [FK_AdmissionForm_Year] FOREIGN KEY([YearID])
REFERENCES [dbo].[Year] ([ID])
GO
ALTER TABLE [dbo].[AdmissionForm] CHECK CONSTRAINT [FK_AdmissionForm_Year]
GO
ALTER TABLE [dbo].[Choice]  WITH CHECK ADD  CONSTRAINT [FK_Choice_Question] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([Id])
GO
ALTER TABLE [dbo].[Choice] CHECK CONSTRAINT [FK_Choice_Question]
GO
ALTER TABLE [dbo].[Donation]  WITH CHECK ADD  CONSTRAINT [FK_Donation_Campaign] FOREIGN KEY([CampaignID])
REFERENCES [dbo].[Campaign] ([ID])
GO
ALTER TABLE [dbo].[Donation] CHECK CONSTRAINT [FK_Donation_Campaign]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([ID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Teacher]
GO
ALTER TABLE [dbo].[EventInvitees]  WITH CHECK ADD  CONSTRAINT [FK_EventInvitees_Event] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[EventInvitees] CHECK CONSTRAINT [FK_EventInvitees_Event]
GO
ALTER TABLE [dbo].[EventInvitees]  WITH CHECK ADD  CONSTRAINT [FK_EventInvitees_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[EventInvitees] CHECK CONSTRAINT [FK_EventInvitees_Student]
GO
ALTER TABLE [dbo].[ExamSubject]  WITH CHECK ADD  CONSTRAINT [FK_ExamSubject_Exam] FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exam] ([ID])
GO
ALTER TABLE [dbo].[ExamSubject] CHECK CONSTRAINT [FK_ExamSubject_Exam]
GO
ALTER TABLE [dbo].[ExamSubject]  WITH CHECK ADD  CONSTRAINT [FK_ExamSubject_Grade] FOREIGN KEY([GradeID])
REFERENCES [dbo].[Grade] ([ID])
GO
ALTER TABLE [dbo].[ExamSubject] CHECK CONSTRAINT [FK_ExamSubject_Grade]
GO
ALTER TABLE [dbo].[ExamSubject]  WITH CHECK ADD  CONSTRAINT [FK_ExamSubject_Subject] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subject] ([ID])
GO
ALTER TABLE [dbo].[ExamSubject] CHECK CONSTRAINT [FK_ExamSubject_Subject]
GO
ALTER TABLE [dbo].[ExamSubject]  WITH CHECK ADD  CONSTRAINT [FK_ExamSubject_Year] FOREIGN KEY([YearID])
REFERENCES [dbo].[Year] ([ID])
GO
ALTER TABLE [dbo].[ExamSubject] CHECK CONSTRAINT [FK_ExamSubject_Year]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_GradeGroup] FOREIGN KEY([GradeGroupID])
REFERENCES [dbo].[GradeGroup] ([ID])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_GradeGroup]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Topic] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topic] ([Id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Topic]
GO
ALTER TABLE [dbo].[RuleMaster]  WITH CHECK ADD  CONSTRAINT [FK_RuleMaster_Grade] FOREIGN KEY([GradeID])
REFERENCES [dbo].[Grade] ([ID])
GO
ALTER TABLE [dbo].[RuleMaster] CHECK CONSTRAINT [FK_RuleMaster_Grade]
GO
ALTER TABLE [dbo].[RuleSubject]  WITH CHECK ADD  CONSTRAINT [FK_RuleSubject_Subject] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subject] ([ID])
GO
ALTER TABLE [dbo].[RuleSubject] CHECK CONSTRAINT [FK_RuleSubject_Subject]
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD  CONSTRAINT [FK_Section_Grade] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([ID])
GO
ALTER TABLE [dbo].[Section] CHECK CONSTRAINT [FK_Section_Grade]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Admission] FOREIGN KEY([AdmissionID])
REFERENCES [dbo].[Admission] ([ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Admission]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Grade] FOREIGN KEY([GradeID])
REFERENCES [dbo].[Grade] ([ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Grade]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Year] FOREIGN KEY([YearID])
REFERENCES [dbo].[Year] ([ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Year]
GO
ALTER TABLE [dbo].[StudentAttendent]  WITH CHECK ADD  CONSTRAINT [FK_StudentAttendent_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[StudentAttendent] CHECK CONSTRAINT [FK_StudentAttendent_Student]
GO
ALTER TABLE [dbo].[StudentContact]  WITH CHECK ADD  CONSTRAINT [FK_StudentContact_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[StudentContact] CHECK CONSTRAINT [FK_StudentContact_Student]
GO
ALTER TABLE [dbo].[StudentHealth]  WITH CHECK ADD  CONSTRAINT [FK_StudentHealth_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[StudentHealth] CHECK CONSTRAINT [FK_StudentHealth_Student]
GO
ALTER TABLE [dbo].[StudentParticulars]  WITH CHECK ADD  CONSTRAINT [FK_StudentParticulars_Grade] FOREIGN KEY([GradeID])
REFERENCES [dbo].[Grade] ([ID])
GO
ALTER TABLE [dbo].[StudentParticulars] CHECK CONSTRAINT [FK_StudentParticulars_Grade]
GO
ALTER TABLE [dbo].[StudentParticulars]  WITH CHECK ADD  CONSTRAINT [FK_StudentParticulars_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[StudentParticulars] CHECK CONSTRAINT [FK_StudentParticulars_Student]
GO
ALTER TABLE [dbo].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_Student1] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_Student1]
GO
ALTER TABLE [dbo].[StudentResultDetails]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_ExamSubject] FOREIGN KEY([ExamSubjectID])
REFERENCES [dbo].[ExamSubject] ([ID])
GO
ALTER TABLE [dbo].[StudentResultDetails] CHECK CONSTRAINT [FK_StudentResult_ExamSubject]
GO
ALTER TABLE [dbo].[StudentResultDetails]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[StudentResultDetails] CHECK CONSTRAINT [FK_StudentResult_Student]
GO
ALTER TABLE [dbo].[Subject]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Grade] FOREIGN KEY([GradeID])
REFERENCES [dbo].[Grade] ([ID])
GO
ALTER TABLE [dbo].[Subject] CHECK CONSTRAINT [FK_Subject_Grade]
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
ALTER TABLE [dbo].[TeacherGrade]  WITH CHECK ADD  CONSTRAINT [FK_TeacherGrade_Grade] FOREIGN KEY([GradeID])
REFERENCES [dbo].[Grade] ([ID])
GO
ALTER TABLE [dbo].[TeacherGrade] CHECK CONSTRAINT [FK_TeacherGrade_Grade]
GO
ALTER TABLE [dbo].[TeacherGrade]  WITH CHECK ADD  CONSTRAINT [FK_TeacherGrade_Subject] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subject] ([ID])
GO
ALTER TABLE [dbo].[TeacherGrade] CHECK CONSTRAINT [FK_TeacherGrade_Subject]
GO
ALTER TABLE [dbo].[TeacherGrade]  WITH CHECK ADD  CONSTRAINT [FK_TeacherGrade_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([ID])
GO
ALTER TABLE [dbo].[TeacherGrade] CHECK CONSTRAINT [FK_TeacherGrade_Teacher]
GO
ALTER TABLE [dbo].[TeacherGrade]  WITH CHECK ADD  CONSTRAINT [FK_TeacherGrade_Year] FOREIGN KEY([YearID])
REFERENCES [dbo].[Year] ([ID])
GO
ALTER TABLE [dbo].[TeacherGrade] CHECK CONSTRAINT [FK_TeacherGrade_Year]
GO
ALTER TABLE [dbo].[TeacherQual]  WITH CHECK ADD  CONSTRAINT [FK_TeacherQual_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([ID])
GO
ALTER TABLE [dbo].[TeacherQual] CHECK CONSTRAINT [FK_TeacherQual_Teacher]
GO
ALTER TABLE [dbo].[TeacherSubject]  WITH CHECK ADD  CONSTRAINT [FK_TeacherSubject_Subject] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subject] ([ID])
GO
ALTER TABLE [dbo].[TeacherSubject] CHECK CONSTRAINT [FK_TeacherSubject_Subject]
GO
ALTER TABLE [dbo].[TeacherSubject]  WITH CHECK ADD  CONSTRAINT [FK_TeacherSubject_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([ID])
GO
ALTER TABLE [dbo].[TeacherSubject] CHECK CONSTRAINT [FK_TeacherSubject_Teacher]
GO
ALTER TABLE [dbo].[TimeTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTable_DayOfWeek] FOREIGN KEY([DayOfWeekID])
REFERENCES [dbo].[DayOfWeek] ([ID])
GO
ALTER TABLE [dbo].[TimeTable] CHECK CONSTRAINT [FK_TimeTable_DayOfWeek]
GO
ALTER TABLE [dbo].[TimeTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTable_Grade] FOREIGN KEY([GradeID])
REFERENCES [dbo].[Grade] ([ID])
GO
ALTER TABLE [dbo].[TimeTable] CHECK CONSTRAINT [FK_TimeTable_Grade]
GO
ALTER TABLE [dbo].[TimeTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTable_Subject] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subject] ([ID])
GO
ALTER TABLE [dbo].[TimeTable] CHECK CONSTRAINT [FK_TimeTable_Subject]
GO
ALTER TABLE [dbo].[TimeTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTable_Year] FOREIGN KEY([YearID])
REFERENCES [dbo].[Year] ([ID])
GO
ALTER TABLE [dbo].[TimeTable] CHECK CONSTRAINT [FK_TimeTable_Year]
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_Topic_tblSubject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[tblSubject] ([Id])
GO
ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK_Topic_tblSubject]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
/****** Object:  StoredProcedure [dbo].[stpDeleteChoiceByID]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  exec stpChoiceByID 1
CREATE procedure [dbo].[stpDeleteChoiceByID]
@ID int,
@Output  VARCHAR(100) OUTPUT
as
begin
delete from Choice where Id=@ID
end

GO
/****** Object:  StoredProcedure [dbo].[stpDeleteGradeByGradeID]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stpDeleteGradeByGradeID]
@id int
as
begin
	Delete  from Grade where ID =@id
end 






GO
/****** Object:  StoredProcedure [dbo].[stpDeleteQuestionByID]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  exec stpDeleteQuestionByID 1
CREATE procedure [dbo].[stpDeleteQuestionByID]
@ID int,
@Output  VARCHAR(100) OUTPUT
as
begin
delete from Question where Id=@ID
end

GO
/****** Object:  StoredProcedure [dbo].[stpDeleteSectionByID]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stpDeleteSectionByID]
@ID int
as
begin
delete from Section where ID=@ID
end





GO
/****** Object:  StoredProcedure [dbo].[stpDeleteSectionBySectionID]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stpDeleteSectionBySectionID]
@ID int
as
begin
delete from Section where ID=@ID
end





GO
/****** Object:  StoredProcedure [dbo].[stpDeletetblConfigByID]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--  exec stpDeletetblConfigByID 1
CREATE procedure [dbo].[stpDeletetblConfigByID]
@KeyName int
as
begin
delete from tblConfig where KeyName=@KeyName
end





GO
/****** Object:  StoredProcedure [dbo].[stpDeletetblSubjectByID]    Script Date: 9/23/2019 10:13:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[stpDeleteTopicByID]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  exec stpDeleteTopicByID 1
CREATE procedure [dbo].[stpDeleteTopicByID]
@ID int,
@Output  VARCHAR(100) OUTPUT
as
begin
delete from Topic where Id=@ID
end

GO
/****** Object:  StoredProcedure [dbo].[stpGetAllGradeForDrp]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stpGetAllGradeForDrp]
as
begin
select Grade.ID,Grade.Grade,Grade.GradeGroupID,GradeGroup.GradeGroup
from Grade
inner join GradeGroup on Grade.GradeGroupID=GradeGroup.ID
end






GO
/****** Object:  StoredProcedure [dbo].[stpGetAllQuestion]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec stpGetAllQuestion
CREATE procedure [dbo].[stpGetAllQuestion]
(
	@QuestionCount int OUTPUT
)
as
begin

select @QuestionCount = COUNT(*)
from Question

SELECT Id FROM TempAnswer
WHERE IsUserAnswer = 1

end







GO
/****** Object:  StoredProcedure [dbo].[stpGetAlltblSubjectForDrp]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  exec stpGetAlltblSubjectForDrp 
CREATE procedure [dbo].[stpGetAlltblSubjectForDrp]
as
begin
select Id,SubjectName
from tblSubject
end






GO
/****** Object:  StoredProcedure [dbo].[stpGetChoiceByID]    Script Date: 9/23/2019 10:13:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[stpGetChoicePageWise]    Script Date: 9/23/2019 10:13:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[stpGetExamAllPageWise]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stpGetExamAllPageWise]
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
			ORDER BY ID ASC
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
		-- ORDER BY [Order] ASC
		DROP TABLE #Results
END






GO
/****** Object:  StoredProcedure [dbo].[stpGetExamForDrp]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stpGetExamForDrp]

as
begin
Select ID
      ,ExamName
from Exam
end

GO
/****** Object:  StoredProcedure [dbo].[stpGetGradeAll]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stpGetGradeAll]
as
begin
select Grade.ID,Grade.Grade,Grade.GradeGroupID,GradeGroup.GradeGroup
from Grade
inner join GradeGroup on Grade.GradeGroupID=GradeGroup.ID
end






GO
/****** Object:  StoredProcedure [dbo].[stpGetGradeAllPageWise]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stpGetGradeAllPageWise]
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
            ORDER BY [Grade] ASC
      )AS RowNumber,
	   
      dbo.Grade.ID,
	  dbo.Grade.Grade,
	  Grade.GradeGroupID,
	  GradeGroup.GradeGroup

     INTO #Results

FROM Grade
LEFT JOIN GradeGroup ON Grade.GradeGroupID =  GradeGroup.ID



	 	    --Where IsActive=1
		 
      SELECT @RecordCount = COUNT(*)
      FROM #Results
      SELECT * FROM #Results
      WHERE RowNumber BETWEEN(@PageIndex -1) * @PageSize + 1 AND(((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1
	 --ORDER BY  GradeGroup, Grade ASC
      DROP TABLE #Results
END






GO
/****** Object:  StoredProcedure [dbo].[stpGetGradeByGradeID]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[stpGetGradeByGradeID]
@ID int

as
begin
select id, grade,GradeGroupID from [dbo].[Grade] where id=@ID
end




GO
/****** Object:  StoredProcedure [dbo].[stpGetGradeForDrp]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec stpGetGradeForDrp
create procedure [dbo].[stpGetGradeForDrp]

as
begin
Select ID
      ,Grade 
from Grade
end



GO
/****** Object:  StoredProcedure [dbo].[stpGetGradeGroup]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stpGetGradeGroup]

as
begin
Select ID,GradeGroup from GradeGroup
end






GO
/****** Object:  StoredProcedure [dbo].[stpGetNextQuestion]    Script Date: 9/23/2019 10:13:48 PM ******/
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

	SELECT [Id],[QuestionId],[ChoiceText],[IsAnswer],ISNULL([IsUserAnswer],0) AS IsUserAnswer FROM TempAnswer 
	WHERE QuestionId = @QuestionId

	SELECT @QuestionCount = COUNT(*)
	FROM Question

	SELECT TQ.Id FROM TempAnswer TA
	INNER JOIN TempQuestion TQ
	ON TA.QuestionId = TQ.Id
	WHERE TA.IsUserAnswer = 1

END


GO
/****** Object:  StoredProcedure [dbo].[stpGetQuestion]    Script Date: 9/23/2019 10:13:48 PM ******/
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

	delete from TempAnswer WHERE QuestionId IN ( SELECT Id FROM TempQuestion WHERE UserId = @UserId)
	delete from TempQuestion WHERE UserId = @UserId
	
	
	--CREATE TABLE #Questiontab
	--(
	--	qId int,
	--	QuestionText varchar(1000),
	--	Marks decimal(12,2)
	--)

	
	
	INSERT INTO TempQuestion(Id,QuestionText,Marks,UserId)
	SELECT TOP 5  Id,QuestionText,Marks,@UserId 
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
	AND Q.UserId = @UserId
	
	--ORDER BY QuestionId

	

	--drop table #Questiontab
	




END




GO
/****** Object:  StoredProcedure [dbo].[stpGetQuestionByID]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  exec stpGetQuestionByID 1

CREATE procedure [dbo].[stpGetQuestionByID]
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
/****** Object:  StoredProcedure [dbo].[stpGetQuestionForDrp]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec stpGetQuestionForDrp
CREATE procedure [dbo].[stpGetQuestionForDrp]

as
begin
Select ID
      ,QuestionText
from Question
end







GO
/****** Object:  StoredProcedure [dbo].[stpGetQuestionPageWise]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  declare @x int Exec stpGetQuestionPageWise 1,15, @x out
CREATE PROCEDURE [dbo].[stpGetQuestionPageWise]
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
/****** Object:  StoredProcedure [dbo].[stpGetSectionAllPageWise]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stpGetSectionAllPageWise]
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
			ORDER BY [Section] ASC
		)AS RowNumber,
	   
		Section.ID,
		Section.Section,
		Section.GradeId,
		Grade.Grade

		INTO #Results

FROM Section
LEFT JOIN Grade ON Section.GradeId =  Grade.ID



	 		--Where IsActive=1
		 
		SELECT @RecordCount = COUNT(*)
		FROM #Results
		SELECT * FROM #Results
		WHERE RowNumber BETWEEN(@PageIndex -1) * @PageSize + 1 AND(((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1
		-- ORDER BY [Order] ASC
		DROP TABLE #Results
END






GO
/****** Object:  StoredProcedure [dbo].[stpGetSectionBySectionID]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stpGetSectionBySectionID]
@ID int
as
begin
select id, section, GradeId from Section where ID=@ID
end






GO
/****** Object:  StoredProcedure [dbo].[stpGetSectionForDrp]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec stpGetSectionForDrp
create procedure [dbo].[stpGetSectionForDrp]

as
begin
Select ID
      ,Section 
from Section
end



GO
/****** Object:  StoredProcedure [dbo].[stpGetStudentAttendentPageWise]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  declare @x int Exec stpGetStudentAttendentPageWise 1,15, @x out
CREATE PROCEDURE [dbo].[stpGetStudentAttendentPageWise]
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
            ORDER BY [Date] ASC
      )AS RowNumber
      ,SA.ID
      --,SA.StudentID
	  ,SP.FirstName + ' ' + SP.LastName AS StudentName
	  ,SA.IsPresents

     INTO #Results
      FROM StudentAttendent SA
	  inner join Student S
	  On S.ID = SA.StudentID
      left outer join StudentParticulars SP 
      ON S.ID = SP.StudentID
	  	 
	    --Where IsActive=1		 
      SELECT @RecordCount = COUNT(*)
      FROM #Results
      SELECT * FROM #Results
      WHERE RowNumber BETWEEN(@PageIndex -1) * @PageSize + 1 AND(((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1
	 -- ORDER BY [Order] ASC
      DROP TABLE #Results
END
















GO
/****** Object:  StoredProcedure [dbo].[stpGetStudentContactByID]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  exec stpGetStudentContactByID 1

CREATE procedure [dbo].[stpGetStudentContactByID]
@ID int
as
begin
SELECT [ID]
      ,[StudentID]
      ,[FatherFName]
      ,[FatherLName]
      ,[FatherAddress]
      ,[FPh1]
      ,[FPh2]
      ,[MotherFName]
      ,[MotherLName]
      ,[MotherAddress]
      ,[MPh1]
      ,[MPh2]
      ,[GFName]
      ,[GLName]
      ,[GAddress]
      ,[GPh1]
      ,[GPh2]
  FROM [dbo].[StudentContact]
 where ID=@ID
end



GO
/****** Object:  StoredProcedure [dbo].[stpGetStudentContactPageWise]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  declare @x int Exec stpGetStudentContactPageWise 1,15, @x out
CREATE PROCEDURE [dbo].[stpGetStudentContactPageWise]
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
           ORDER BY [GFName] ASC
      )AS RowNumber
      ,SC.ID
	   ,SP.FirstName + ' ' + SP.LastName AS StudentName
	    ,GFName + ' ' + GLName AS GName
      ,[GAddress]
      ,[GPh1]
      --,[GPh2]

     INTO #Results
      FROM StudentContact SC
	  	 
	 inner join StudentParticulars SP
	 ON SP.StudentID = SC.StudentID

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
/****** Object:  StoredProcedure [dbo].[stpGetStudentForDrp]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec stpGetStudentForDrp
create procedure [dbo].[stpGetStudentForDrp]

as
begin
Select ID
      ,FirstName + ' ' + LastName AS StudentName 
from StudentParticulars
end







GO
/****** Object:  StoredProcedure [dbo].[stpGetStudentHealthByID]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  exec stpGetStudentHealthByID 1

create procedure [dbo].[stpGetStudentHealthByID]
@ID int
as
begin
SELECT [ID]
      ,[StudentID]
      ,BloodGroup
      ,KnownMadicalProblems
      ,DoctorName
  FROM [dbo].StudentHealth
 where ID=@ID
end



GO
/****** Object:  StoredProcedure [dbo].[stpGetStudentHealthPageWise]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  declare @x int Exec stpGetStudentHealthPageWise 1,15, @x out
create PROCEDURE [dbo].[stpGetStudentHealthPageWise]
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
           ORDER BY [FirstName] ASC
      )AS RowNumber
      ,SH.ID
      ,SP.FirstName + ' ' + SP.LastName AS StudentName
	  ,BloodGroup
      ,KnownMadicalProblems
      ,DoctorName

     INTO #Results
      FROM StudentHealth SH
	  	 
	 inner join StudentParticulars SP
	 ON SP.StudentID = SH.StudentID

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
/****** Object:  StoredProcedure [dbo].[stpGetStudentParticularsByID]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  exec stpGetStudentParticularsByID 3

create procedure [dbo].[stpGetStudentParticularsByID]
@ID int
as
begin
SELECT [ID]
      --,[StudentID]
      ,[FirstName]
      ,[LastName]
      ,[DOB]
      ,[GradeID]
      ,[StartDate]
      ,[EndDate]
      ,[LeavingReason]
      ,[Gender]
      --,[Photo]
  FROM [dbo].[StudentParticulars]
 where ID=@ID
end





GO
/****** Object:  StoredProcedure [dbo].[stpGetStudentParticularsPageWise]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  declare @x int Exec stpGetStudentParticularsPageWise 1,15, @x out
CREATE PROCEDURE [dbo].[stpGetStudentParticularsPageWise]
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
            ORDER BY [FirstName] ASC
      )AS RowNumber
      ,SP.ID
	  ,FirstName + ' ' + LastName AS StudentName
	   ,CONVERT(varchar(12),DOB,103) DOB
	  ,G.Grade
	  --,StartDate
	  --,EndDate
	  --,LeavingReason
	  ,Gender
	  ,Photo

     INTO #Results
      FROM StudentParticulars SP
	  	 

		  inner join Grade G
	  ON G.ID = SP.GradeID

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
/****** Object:  StoredProcedure [dbo].[stpGetStudentSearchByName]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  exec stpGetStudentSearchByName 'Farhan'

CREATE procedure [dbo].[stpGetStudentSearchByName]
@FirstName varchar(500)
as
Begin
SELECT 
       SP.ID
	  ,FirstName + ' ' + LastName AS StudentName
	  ,CONVERT(varchar(12),DOB,103) DOB
	  ,G.Grade
	  ,Gender
FROM StudentParticulars SP

Inner Join Grade G
ON G.ID = SP.GradeID
Where FirstName=@FirstName
End




GO
/****** Object:  StoredProcedure [dbo].[stpGetStudentSearchByNamePageWise]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  declare @x int Exec stpGetStudentSearchByNamePageWise 1,10, @x out, 'fu'
CREATE PROCEDURE [dbo].[stpGetStudentSearchByNamePageWise]
 (
      @PageIndex INT = 1,
      @PageSize INT = 15,
      @RecordCount INT OUTPUT,
	  @SearchValue varchar(500)
)
AS
BEGIN
      SET NOCOUNT ON;
	  if LEN(LTRIM(RTRIM(@SearchValue)))>0 or @SearchValue is not null 
	  BEGIN 
	  SET @SearchValue=LTRIM(RTRIM(Upper(@SearchValue)))
	  END

	  DECLARE @TempTab TABLE
	  (
		ID int,
		FirstName varchar(500),
		LastName varchar(500),
		DOB varchar(500),
		Grade varchar(500),
		Gender varchar(500)
	  )

	  INSERT INTO @TempTab(ID,FirstName,LastName,DOB,Grade,Gender)
	  SELECT  DISTINCT SP.ID
	  ,FirstName
	  ,LastName
	  ,CONVERT(varchar(12),DOB,103) DOB
      ,Grade
	  ,Gender
	 FROM StudentParticulars SP

Inner Join Grade G
ON G.ID = SP.GradeID
	  where (LTRIM(RTRIM(Upper(SP.FirstName)))Like '%' + @SearchValue + '%' or @SearchValue is null)

	  --SELECT * FROM @TempTab

      SELECT ROW_NUMBER() OVER
      (
            ORDER BY [FirstName] ASC   
      )AS RowNumber
      ,ID,
	  --FirstName,
	  --LastName,
	  FirstName + ' ' + LastName AS StudentName,
	  DOB,
	  Grade,
	  Gender
	  INTO #Results
	  FROM @TempTab
		 
      SELECT @RecordCount = COUNT(*)
      FROM #Results

      SELECT * FROM #Results
      WHERE RowNumber BETWEEN(@PageIndex -1) * @PageSize + 1 AND(((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1
	 
      DROP TABLE #Results
END




GO
/****** Object:  StoredProcedure [dbo].[stpGetSubjectByID]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  exec stpGetSubjectByID 1

CREATE procedure [dbo].[stpGetSubjectByID]
@ID int
as
begin
SELECT [ID]
      ,[SubjectName]
      ,[GradeID]
  FROM [dbo].[Subject]
 where ID=@ID
end





GO
/****** Object:  StoredProcedure [dbo].[stpGetSubjectPageWise]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  declare @x int Exec stpGetSubjectPageWise 1,15, @x out
create PROCEDURE [dbo].[stpGetSubjectPageWise]
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
      ,S.ID
	  ,SubjectName
	  ,G.Grade

     INTO #Results
      FROM [Subject] S
	  	 

		  inner join Grade G
	  ON G.ID = S.GradeID

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
/****** Object:  StoredProcedure [dbo].[stpGettblAnswerPageWise]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------------------------------------------------------------------------------------------


--  declare @x int Exec stpGettblAnswerPageWise 12, 1,10, @x out
create PROCEDURE [dbo].[stpGettblAnswerPageWise]
 (
      @QuestionId int,
      @PageIndex INT = 1,
      @PageSize INT = 10,
      @RecordCount INT OUTPUT
)
AS
BEGIN
      SET NOCOUNT ON;
      SELECT ROW_NUMBER() OVER
      (
            ORDER BY [Id] ASC
      )AS RowNumber
      ,Id
      ,ChoiceText
	  ,IsAnswer
     INTO #Results
      FROM Choice
    where QuestionId=@QuestionId
      SELECT @RecordCount = COUNT(*)
      FROM #Results
      SELECT * FROM #Results
      WHERE RowNumber BETWEEN(@PageIndex -1) * @PageSize + 1 AND(((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1
      DROP TABLE #Results
END








GO
/****** Object:  StoredProcedure [dbo].[stpGettblConfigByKey]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  exec stpGettblConfigByKey KN1

CREATE procedure [dbo].[stpGettblConfigByKey]
@KeyName varchar(100)
as
begin
SELECT KeyName
      ,ConfigValue
  FROM tblConfig
 where KeyName=@KeyName
end



GO
/****** Object:  StoredProcedure [dbo].[stpGettblConfigByKeyName]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--  exec stpGettblConfigByKeyName 3
create procedure [dbo].[stpGettblConfigByKeyName]
--@KeyName varchar(50)
@ID int
as
begin
SELECT [Id],
       KeyName
      ,ConfigValue
  FROM tblConfig
-- where KeyName=@KeyName
   where Id=@ID
end






GO
/****** Object:  StoredProcedure [dbo].[stpGettblConfigPageWise]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--  declare @x int Exec stpGettblConfigPageWise 1,15, @x out
CREATE PROCEDURE [dbo].[stpGettblConfigPageWise]
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
/****** Object:  StoredProcedure [dbo].[stpGettblSubjectByID]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  exec stpGettblSubjectByID 2

CREATE procedure [dbo].[stpGettblSubjectByID]
@ID int
as
begin
SELECT [Id]
       ,SubjectName
  FROM tblSubject
 where Id=@ID
end



GO
/****** Object:  StoredProcedure [dbo].[stpGettblSubjectForDrp]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[stpGettblSubjectPageWise]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  declare @x int Exec stpGettblSubjectPageWise 1,15, @x out
CREATE PROCEDURE [dbo].[stpGettblSubjectPageWise]
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
/****** Object:  StoredProcedure [dbo].[stpGetTopicByID]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  exec stpGetTopicByID 1
CREATE procedure [dbo].[stpGetTopicByID]
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
/****** Object:  StoredProcedure [dbo].[stpGetTopicForDrp]    Script Date: 9/23/2019 10:13:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[stpGetTopicPageWise]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  declare @x int Exec stpGetTopicPageWise 1,15, @x out
CREATE PROCEDURE [dbo].[stpGetTopicPageWise]
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
/****** Object:  StoredProcedure [dbo].[stpGetUserByIDAndPass]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stpGetUserByIDAndPass]
@UserName varchar(500),
@Password varchar(100)
as
begin
SELECT *
  FROM [User]
 where UserName=@UserName and [Password]=@Password
end


GO
/****** Object:  StoredProcedure [dbo].[stpGetYearPageWise]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  declare @x int Exec stpGetYearPageWise 1,15, @x out
CREATE PROCEDURE [dbo].[stpGetYearPageWise]
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
            ORDER BY [Year] ASC
      )AS RowNumber,
       [Year],
	   YearDesc

     INTO #Results

FROM [Year]
	 
	    --Where IsActive=1
		 
      SELECT @RecordCount = COUNT(*)
      FROM #Results
      SELECT * FROM #Results
      WHERE RowNumber BETWEEN(@PageIndex -1) * @PageSize + 1 AND(((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1
	 -- ORDER BY [Order] ASC
      DROP TABLE #Results
END


























GO
/****** Object:  StoredProcedure [dbo].[stpInsertUpdateChoice]    Script Date: 9/23/2019 10:13:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[stpInsertUpdateGrade]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stpInsertUpdateGrade]
@ID int,
@Grade varchar(100),
@GradeGroupID int
as
begin
	DECLARE @GradeCnt int
	SET @GradeCnt = 0
	if @ID IS NULL
		BEGIN
			SELECT @GradeCnt = COUNT(*) from Grade where RTRIM(LTRIM(UPPER(Grade)))=RTRIM(LTRIM(UPPER(@Grade)))
				print @GradeCnt
				if @GradeCnt = 0
					begin
						insert into Grade(Grade,GradeGroupID) values (@Grade,@GradeGroupID)
					END
				
		end
	ELSE
		BEGIN
			UPDATE Grade SET Grade=@Grade, GradeGroupID=@GradeGroupID WHERE ID=@ID
		END

END






GO
/****** Object:  StoredProcedure [dbo].[stpInsertUpdateQuestion]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------------------------------------------------------------------------------

--  exec stpInsertUpdateQuestion 5,2,'deep', 5665.00

CREATE procedure [dbo].[stpInsertUpdateQuestion] 
( 
@ID int,
@TopicId int,
@QuestionText varchar(500),
--@ImagePath varchar(500),
@Marks decimal(12,2),
@AnswerList AnswerTVT READONLY
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

	INSERT INTO Choice (QuestionId,ChoiceText,IsAnswer)
	Select @ID,Ans,IsAns from @AnswerList


	--SET @CompanyId  = @ID
END
ELSE
BEGIN
	print 'UPDATE'
	IF @QuestionText IS NOT NULL
	BEGIN
		UPDATE [Question]
		SET     TopicId=@TopicId
			   ,QuestionText=@QuestionText
			   --,ImagePath=@ImagePath
			   ,Marks=@Marks
		Where Id=@ID
	END
	ELSE IF @QuestionText IS NULL
	BEGIN
		DELETE FROM Choice WHERE QuestionId= @ID

		INSERT INTO Choice (QuestionId,ChoiceText,IsAnswer)
		Select @ID,Ans,IsAns from @AnswerList
	END
END
	COMMIT TRAN
 END TRY 

 BEGIN CATCH
	ROLLBACK TRAN
	SELECT ERROR_MESSAGE() AS ErrorMessage  
 END CATCH
END






GO
/****** Object:  StoredProcedure [dbo].[stpInsertUpdateSection]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stpInsertUpdateSection]
@ID int,
@Section varchar(500),
@GradeID int
as
begin
	DECLARE @SectionCnt int
	SET @SectionCnt = 0
	if @ID IS NULL
		BEGIN
			SELECT @SectionCnt= COUNT(*) from Section where RTRIM(LTRIM(UPPER(Section)))=RTRIM(LTRIM(UPPER(@Section))) and ltrim(rtrim(GradeId))=ltrim(rtrim(@GradeID))
				print @SectionCnt
				if @SectionCnt = 0
					begin
						insert into Section(Section,GradeId) values (@Section,@GradeID)
					END
				
		end
	ELSE
		BEGIN
			UPDATE Section SET Section=@Section, GradeId=@GradeID where id=@ID
		END

END







GO
/****** Object:  StoredProcedure [dbo].[stpInsertUpdateStudentContact]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  exec stpInsertUpdateStudentContact Null,3, 'First', 'Second','Address XXXXXX', '900000000', Null, Null,  Null, Null, Null, Null, Null, Null, Null, Null,Null

CREATE procedure [dbo].[stpInsertUpdateStudentContact] 
( 
@ID int,
@StudentID int,
@FatherFName varchar(500),
@FatherLName varchar(500),
@FatherAddress varchar(500),
@FPh1 varchar(20),
@FPh2 varchar(20),
@MotherFName varchar(500),
@MotherLName varchar(500),
@MotherAddress varchar(500),
@MPh1 varchar(20),
@MPh2 varchar(20),
@GFName varchar(500),
@GLName varchar(500),
@GAddress varchar(500),
@GPh1 varchar(20),
@GPh2 varchar(20)
) 
AS 
BEGIN 
--DECLARE @FleetID int
 BEGIN TRY
    BEGIN TRAN
 IF @ID IS NULL
BEGIN   
	 print 'INSERT'
	INSERT INTO [StudentContact] 
	       ([StudentID]
		   ,[FatherFName]
           ,[FatherLName]
           ,[FatherAddress]
           ,[FPh1]
           ,[FPh2]
           ,[MotherFName]
           ,[MotherLName]
           ,[MotherAddress]
           ,[MPh1]
           ,[MPh2]
           ,[GFName]
           ,[GLName]
           ,[GAddress]
           ,[GPh1]
           ,[GPh2])
	Values (@StudentID
	       ,@FatherFName
           ,@FatherLName
           ,@FatherAddress
           ,@FPh1
           ,@FPh2
           ,@MotherFName
           ,@MotherLName
           ,@MotherAddress
           ,@MPh1
           ,@MPh2
           ,@GFName
           ,@GLName
           ,@GAddress
           ,@GPh1
           ,@GPh2)

	SET @ID = @@IDENTITY
	--SET @CompanyId  = @ID
END
ELSE
BEGIN
	print 'UPDATE'
	UPDATE [StudentContact]
	SET     StudentID=@StudentID
	       ,FatherFName=@FatherFName
           ,FatherLName=@FatherLName
           ,FatherAddress=@FatherAddress
           ,FPh1=@FPh1
           ,FPh2=@FPh2
           ,MotherFName=@MotherFName
           ,MotherLName=@MotherLName
           ,MotherAddress=@MotherAddress
           ,MPh1=@MPh1
           ,MPh2=@MPh2
           ,GFName=@GFName
           ,GLName=@GLName
           ,GAddress=@GAddress
           ,GPh1=@GPh1
           ,GPh2=@GPh2
	Where ID=@ID
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
/****** Object:  StoredProcedure [dbo].[stpInsertUpdateStudentHealth]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  exec stpInsertUpdateStudentHealth Null,3,'A+', 'Fever', 'Dr.A.Paul'

Create procedure [dbo].[stpInsertUpdateStudentHealth] 
( 
@ID int,
@StudentID int,
@BloodGroup varchar(500),
@KnownMadicalProblems varchar(500),
@DoctorName varchar(500)
) 
AS 
BEGIN 
--DECLARE @FleetID int
 BEGIN TRY
    BEGIN TRAN
 IF @ID IS NULL
BEGIN   
	 print 'INSERT'
	INSERT INTO [StudentHealth] 
	       ([StudentID]
		   ,BloodGroup
           ,KnownMadicalProblems
           ,DoctorName)
	Values (@StudentID
	       ,@BloodGroup
           ,@KnownMadicalProblems
           ,@DoctorName)

	SET @ID = @@IDENTITY
	--SET @CompanyId  = @ID
END
ELSE
BEGIN
	print 'UPDATE'
	UPDATE [StudentHealth]
	SET     StudentID=@StudentID
	       ,BloodGroup=@BloodGroup
		   ,KnownMadicalProblems=@KnownMadicalProblems
		   ,DoctorName=@DoctorName
	Where ID=@ID
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
/****** Object:  StoredProcedure [dbo].[stpInsertUpdateStudentParticulars]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  exec stpInsertUpdateStudentParticulars Null, 'First', 'gfgf','2019-05-06 00:00:00.000',3, '2019-05-06 00:00:00.000','2019-05-06 00:00:00.000','ghfghgh', 'm'

CREATE procedure [dbo].[stpInsertUpdateStudentParticulars] 
( 
@ID int,
--@StudentID int,
@FirstName varchar(500),
@LastName varchar(500),
@DOB datetime,
@GradeID int,
@StartDate datetime,
@EndDate datetime,
@LeavingReason varchar(500),
@Gender varchar(20)
--@Photo varchar(1000)

) 
AS 
BEGIN 
--DECLARE @FleetID int
 BEGIN TRY
    BEGIN TRAN
 IF @ID IS NULL
BEGIN   
	 print 'INSERT'
	INSERT INTO [StudentParticulars] 
		   (FirstName,LastName,DOB,GradeID,StartDate,EndDate,LeavingReason,Gender)
	Values (@FirstName,@LastName,@DOB,@GradeID,@StartDate,@EndDate,@LeavingReason,@Gender)

	SET @ID = @@IDENTITY
	--SET @CompanyId  = @ID
END
ELSE
BEGIN
	print 'UPDATE'
	UPDATE [StudentParticulars]
	SET FirstName=@FirstName,LastName=@LastName,DOB=@DOB,GradeID=@GradeID,StartDate=@StartDate,
	    EndDate=@EndDate,LeavingReason=@LeavingReason,Gender=@Gender
	Where ID=@ID
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
/****** Object:  StoredProcedure [dbo].[stpInsertUpdateSubject]    Script Date: 9/23/2019 10:13:48 PM ******/
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
       (SubjectName,GradeID)
       SELECT @SubjectName,String FROM ufn_CSVToTable(@GradeID,',')






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
/****** Object:  StoredProcedure [dbo].[stpInsertUpdatetblConfig]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--  exec stpInsertUpdatetblConfig 'dfdf-1', 'dddd-2'

create procedure [dbo].[stpInsertUpdatetblConfig] 
( 
@KeyName varchar(50),
@ConfigValue varchar(100)
) 
AS 
BEGIN 
--DECLARE @FleetID int
DECLARE @reccount int 
SELECT @reccount = COUNT(*) FROM tblConfig WHERE KeyName = @KeyName
 BEGIN TRY
    BEGIN TRAN
 --IF @KeyName IS NULL
 IF @reccount  = 0 OR @reccount IS NULL
BEGIN   
	 print 'INSERT'
	INSERT INTO [tblConfig] 
	         (KeyName
		   ,ConfigValue)
	Values (@KeyName
	       ,@ConfigValue)

	SET @KeyName = @@IDENTITY
	--SET @CompanyId  = @ID
END
ELSE
BEGIN
	print 'UPDATE'
	UPDATE [tblConfig]
	SET     KeyName=@KeyName
	       ,ConfigValue=@ConfigValue
	Where KeyName=@KeyName
	--SET @CompanyId  = @ID
END
	COMMIT TRAN
 END TRY 

 BEGIN CATCH
	ROLLBACK TRAN
	SELECT ERROR_MESSAGE() AS ErrorMessage;  
 END CATCH
END


---------------------------------------------------------------------------------------------------------------





GO
/****** Object:  StoredProcedure [dbo].[stpInsertUpdatetblSubject]    Script Date: 9/23/2019 10:13:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[stpInsertUpdateTeacher]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stpInsertUpdateTeacher]
(
-- For Teach Master table
@ID	int,
@FName	varchar(500),
@LName	varchar(500),
@Photo	varchar(500),
@Gender	varchar(50),
@Address	varchar(500),
@Ph1	varchar(500),
@Ph2	varchar(500),
@StartDate	date,
@EndDate	date,
@Comments	varchar(500),
@Designation	varchar(50),

-- For Teach Qualification table
@QualificationID	int,
--@TeacherID	int,
@QualName	varchar(500),
@QualCertPath	varchar(1000),
@QualStatus	varchar(100),
@QualCompletionDate	date,

-- For Teach Subject table
@TeacherSubjectId	int,
--@TeacherIDinQualification	int,
@SubjectID	int,
@isPrimarySubject bit
)
as
begin
	declare @intCount int
	set @intCount = 0

	if @ID is null
		begin
			select @intCount =  count(*) from Teacher where rtrim(ltrim(UPPER(FName))) = RTRIM(LTRIM(UPPER(@FName))) and 
			RTRIM(LTRIM(UPPER(LName))) = RTRIM(LTRIM(UPPER(@LName))) and
			(RTRIM(LTRIM(UPPER(Ph1))) = RTRIM(LTRIM(UPPER(@Ph1))) or RTRIM(LTRIM(UPPER(Ph1))) = RTRIM(LTRIM(UPPER(@Ph2)))) and 
			(RTRIM(LTRIM(UPPER(Ph2))) = RTRIM(LTRIM(UPPER(@Ph1))) or RTRIM(LTRIM(UPPER(Ph2))) = RTRIM(LTRIM(UPPER(@Ph2))))

			if @intCount>0 
				begin try
					insert into Teacher (FName, LName, Photo, Gender, Address, Ph1, Ph2, StartDate, EndDate, Comments, Designation) values
					(@FName, @LName, @Photo, @Gender, @Address, @Ph1, @Ph2, @StartDate, @EndDate, @Comments, @Designation)

					--Select @ID=SCOPE_IDENTITY()

					SET @ID = @@IDENTITY

					insert into TeacherQual (TeacherID, QualName, QualCertPath, QualStatus, QualCompletionDate) values
					(@ID, @QualName, @QualCertPath, @QualStatus, @QualCompletionDate)

					--Select @TeacherIDinQualification =SCOPE_IDENTITY()

					insert into TeacherSubject (TeacherID, SubjectID, isPrimarySubject) values
					(@ID, @SubjectID, @isPrimarySubject)
					commit tran
				end try
				begin catch
					rollback tran
				end catch
			else
				begin try
					update Teacher set FName=@FName, LName=@LName, Photo=@Photo, Gender=@Gender, Address=@Address, Ph1=@Ph1, Ph2=@Ph2, StartDate=@StartDate, EndDate=@EndDate, Comments=@Comments, Designation=@Designation where ID=@ID

					update TeacherQual set TeacherID=@ID, QualName=@QualName, QualCertPath=@QualCertPath, QualStatus=@QualStatus, QualCompletionDate=@QualCompletionDate where id=@QualificationID
					
					update TeacherSubject set TeacherID=@ID, SubjectID=@SubjectID, isPrimarySubject=@isPrimarySubject where ID=@TeacherSubjectId
					commit tran
				end try
				begin catch
					rollback tran
				end catch
		end
end







GO
/****** Object:  StoredProcedure [dbo].[stpInsertUpdateTopic]    Script Date: 9/23/2019 10:13:48 PM ******/
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
/****** Object:  StoredProcedure [dbo].[stpInsertUser]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stpInsertUser] 
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
/****** Object:  StoredProcedure [dbo].[stpSaveUserAnswer]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stpSaveUserAnswer]
(
	@AnswerId int,
	@Id int
)
AS
BEGIN
	UPDATE TempAnswer 
	SET IsUserAnswer = @AnswerId
	WHERE Id=@Id
END


GO
/****** Object:  StoredProcedure [dbo].[stpSaveYear]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec stpSaveYear Null,'2019-20', 'First'
CREATE procedure [dbo].[stpSaveYear] 
( 
@ID int,
@Year varchar(50),
@YearDesc varchar(50)
) 
AS 
BEGIN 
--DECLARE @FleetID int
 BEGIN TRY
    BEGIN TRAN
 IF @ID IS NULL
BEGIN   
	 print 'INSERT'
	INSERT INTO [Year] 
		   ([Year], YearDesc)
	Values(@Year, @YearDesc)

	SET @ID = @@IDENTITY
	--SET @CompanyId  = @ID
END
ELSE
BEGIN
	print 'UPDATE'
	UPDATE [Year]
	SET [Year]=@Year, YearDesc=@YearDesc
	Where ID=@ID
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
/****** Object:  StoredProcedure [dbo].[stpSelectSectionByGradeID]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stpSelectSectionByGradeID]
@GradeID INT
as
begin
	select id, section from Section where GradeId=@GradeID
end







GO
/****** Object:  StoredProcedure [dbo].[stptblConfigByKey]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--  exec stptblConfigByKey KN1
CREATE procedure [dbo].[stptblConfigByKey]
@KeyName varchar(50)
as
begin
delete from tblConfig where KeyName=@KeyName
end





GO
/****** Object:  StoredProcedure [dbo].[usp_Get_GradeGroup_By_GradeGroupID]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_Get_GradeGroup_By_GradeGroupID]
@id int
as
begin
Select ID,GradeGroup from GradeGroup where id =@id
end








GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllGradeForDrp]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec usp_GetAllGradeForDrp
CREATE procedure [dbo].[usp_GetAllGradeForDrp]
--( 
--@GradeID int
--) 
AS
Begin
Select ID, Grade

from Grade

--Where ID=@GradeID
End






GO
/****** Object:  StoredProcedure [dbo].[usp_Insert_Grade]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_Insert_Grade]
@Grade varchar(100),
@GradeGroupID int
as
begin
	
						insert into Grade(Grade,GradeGroupID) values (@Grade,@GradeGroupID)

end






GO
/****** Object:  StoredProcedure [dbo].[usp_Update_Grade_By_GradeID]    Script Date: 9/23/2019 10:13:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_Update_Grade_By_GradeID]
@id int,
@Grade varchar(100),
@GradeGroupID int
as
begin
	update Grade set Grade=@Grade, GradeGroupID=@GradeGroupID where ID =@id
end 





GO
USE [master]
GO
ALTER DATABASE [MySchool] SET  READ_WRITE 
GO
