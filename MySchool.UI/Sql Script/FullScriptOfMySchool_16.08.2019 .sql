USE [MySchool]
GO
/****** Object:  Table [dbo].[Admission]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[AdmissionDetails]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[AdmissionForm]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[Announcement]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[Campaign]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[DayOfWeek]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[Donar]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[Donation]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[Event]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[EventInvitees]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[Exam]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[ExamSubject]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[Grade]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[GradeGroup]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[RuleMaster]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[RuleSubject]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[Section]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[Student]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[StudentAttendent]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[StudentContact]    Script Date: 16/08/2019 9:13:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentContact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
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
 CONSTRAINT [PK_StudentContact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentHealth]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[StudentParticulars]    Script Date: 16/08/2019 9:13:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentParticulars](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[FirstName] [varchar](500) NOT NULL,
	[LastName] [varchar](500) NOT NULL,
	[DOB] [datetime] NOT NULL,
	[GradeID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[LeavingReason] [varchar](500) NULL,
	[Gender] [varchar](20) NOT NULL,
	[Photo] [varchar](1000) NULL,
 CONSTRAINT [PK_StudentParticulars] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentResult]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[StudentResultDetails]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[Subject]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[Teacher]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[TeacherGrade]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[TeacherQual]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[TeacherSubject]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[TimeTable]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  Table [dbo].[Year]    Script Date: 16/08/2019 9:13:27 AM ******/
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

INSERT [dbo].[Admission] ([ID], [YearID], [GradeID], [AdmAmt], [AdmissonNumber]) VALUES (3, 1, 3, CAST(5000.00 AS Decimal(12, 2)), N'AdNo90001')
INSERT [dbo].[Admission] ([ID], [YearID], [GradeID], [AdmAmt], [AdmissonNumber]) VALUES (5, 2, 4, CAST(4500.00 AS Decimal(12, 2)), N'AdNo90002')
SET IDENTITY_INSERT [dbo].[Admission] OFF
SET IDENTITY_INSERT [dbo].[Grade] ON 

INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (3, N'Lower Nursery', 1)
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (4, N'Upper Nursery', 1)
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (5, N'Class - I', 2)
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (6, N'Class - II', 2)
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (7, N'Class - III', 2)
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (8, N'Class - IV', 3)
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (9, N'Class - V', 3)
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (10, N'Class - VI', 3)
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (11, N'Class - I', 3)
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (12, N'Class - II Section - B', 2)
SET IDENTITY_INSERT [dbo].[Grade] OFF
SET IDENTITY_INSERT [dbo].[GradeGroup] ON 

INSERT [dbo].[GradeGroup] ([ID], [GradeGroup]) VALUES (1, N'Nursery')
INSERT [dbo].[GradeGroup] ([ID], [GradeGroup]) VALUES (2, N'Primary')
INSERT [dbo].[GradeGroup] ([ID], [GradeGroup]) VALUES (3, N'Upper Primary')
INSERT [dbo].[GradeGroup] ([ID], [GradeGroup]) VALUES (4, N'Secondary')
INSERT [dbo].[GradeGroup] ([ID], [GradeGroup]) VALUES (5, N'Higher Secondary')
SET IDENTITY_INSERT [dbo].[GradeGroup] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([ID], [GradeID], [YearID], [AdmissionID], [SectionID]) VALUES (1, 3, 1, 3, NULL)
INSERT [dbo].[Student] ([ID], [GradeID], [YearID], [AdmissionID], [SectionID]) VALUES (3, 4, 2, 5, NULL)
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[StudentAttendent] ON 

INSERT [dbo].[StudentAttendent] ([ID], [StudentID], [Date], [IsPresents]) VALUES (2, 1, CAST(N'2019-05-06 00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[StudentAttendent] ([ID], [StudentID], [Date], [IsPresents]) VALUES (5, 3, CAST(N'2019-05-06 00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[StudentAttendent] OFF
SET IDENTITY_INSERT [dbo].[StudentParticulars] ON 

INSERT [dbo].[StudentParticulars] ([ID], [StudentID], [FirstName], [LastName], [DOB], [GradeID], [StartDate], [EndDate], [LeavingReason], [Gender], [Photo]) VALUES (1, 1, N'Fungsug', N'Vangru', CAST(N'2019-05-06 00:00:00.000' AS DateTime), 3, CAST(N'2019-05-06 00:00:00.000' AS DateTime), CAST(N'2019-05-06 00:00:00.000' AS DateTime), N'xyz', N'M', NULL)
INSERT [dbo].[StudentParticulars] ([ID], [StudentID], [FirstName], [LastName], [DOB], [GradeID], [StartDate], [EndDate], [LeavingReason], [Gender], [Photo]) VALUES (3, 3, N'Farhan', N'Qureshi', CAST(N'2019-05-06 00:00:00.000' AS DateTime), 4, CAST(N'2019-05-06 00:00:00.000' AS DateTime), CAST(N'2019-05-06 00:00:00.000' AS DateTime), N'ok', N'M', NULL)
SET IDENTITY_INSERT [dbo].[StudentParticulars] OFF
SET IDENTITY_INSERT [dbo].[Year] ON 

INSERT [dbo].[Year] ([ID], [Year], [YearDesc]) VALUES (1, N'2019', N'2019-2020')
INSERT [dbo].[Year] ([ID], [Year], [YearDesc]) VALUES (2, N'2020', N'2020-2021')
INSERT [dbo].[Year] ([ID], [Year], [YearDesc]) VALUES (3, N'2021', N'2021-2022')
INSERT [dbo].[Year] ([ID], [Year], [YearDesc]) VALUES (16, N'2022', N'2022-2023')
INSERT [dbo].[Year] ([ID], [Year], [YearDesc]) VALUES (17, N'2023', N'2023-2024')
INSERT [dbo].[Year] ([ID], [Year], [YearDesc]) VALUES (18, N'2024', N'2024-2025')
SET IDENTITY_INSERT [dbo].[Year] OFF
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
/****** Object:  StoredProcedure [dbo].[stpGetStudentAttendentPageWise]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[stpGetYearPageWise]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[stpSaveYear]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Delete_Grade_By_GradeID]    Script Date: 16/08/2019 9:13:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_Delete_Grade_By_GradeID]
@id int
as
begin
	Delete  from Grade where ID =@id
end 



GO
/****** Object:  StoredProcedure [dbo].[usp_Get_Grade_All]    Script Date: 16/08/2019 9:13:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_Get_Grade_All]
as
begin
select Grade.ID,Grade.Grade,Grade.GradeGroupID,GradeGroup.GradeGroup
from Grade
inner join GradeGroup on Grade.GradeGroupID=GradeGroup.ID
end

GO
/****** Object:  StoredProcedure [dbo].[usp_Get_Grade_All_PageWise]    Script Date: 16/08/2019 9:13:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Get_Grade_All_PageWise]
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
	 -- ORDER BY [Order] ASC
      DROP TABLE #Results
END



GO
/****** Object:  StoredProcedure [dbo].[usp_Get_Grade_By_GradeID]    Script Date: 16/08/2019 9:13:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_Get_Grade_By_GradeID]
@ID int

as
begin
select id, grade,GradeGroupID from [dbo].[Grade] where id=@ID
end

GO
/****** Object:  StoredProcedure [dbo].[usp_Get_GradeGroup]    Script Date: 16/08/2019 9:13:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_Get_GradeGroup]

as
begin
Select ID,GradeGroup from GradeGroup
end



GO
/****** Object:  StoredProcedure [dbo].[usp_Get_GradeGroup_By_GradeGroupID]    Script Date: 16/08/2019 9:13:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_Get_GradeGroup_By_GradeGroupID]
@id int
as
begin
Select ID,GradeGroup from GradeGroup where id =@id
end



GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllGradeForDrp]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Insert_Grade]    Script Date: 16/08/2019 9:13:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Insert_Update_Grade]    Script Date: 16/08/2019 9:13:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec usp_Insert_Update_Grade 14, 'ABC IX', 4
CREATE procedure [dbo].[usp_Insert_Update_Grade]
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
/****** Object:  StoredProcedure [dbo].[usp_Update_Grade_By_GradeID]    Script Date: 16/08/2019 9:13:27 AM ******/
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
