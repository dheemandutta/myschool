USE [master]
GO
/****** Object:  Database [MySchool]    Script Date: 06-Aug-19 11:07:32 PM ******/
CREATE DATABASE [MySchool]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'School', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\School.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'School_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\School_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MySchool] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MySchool].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MySchool] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MySchool] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MySchool] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MySchool] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MySchool] SET ARITHABORT OFF 
GO
ALTER DATABASE [MySchool] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MySchool] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MySchool] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MySchool] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MySchool] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MySchool] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MySchool] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MySchool] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MySchool] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MySchool] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MySchool] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MySchool] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MySchool] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MySchool] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MySchool] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MySchool] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MySchool] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MySchool] SET RECOVERY FULL 
GO
ALTER DATABASE [MySchool] SET  MULTI_USER 
GO
ALTER DATABASE [MySchool] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MySchool] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MySchool] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MySchool] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MySchool] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MySchool', N'ON'
GO
USE [MySchool]
GO
/****** Object:  Table [dbo].[Admission]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[AdmissionDetails]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[AdmissionForm]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[Announcement]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[Campaign]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[DayOfWeek]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[Donar]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[Donation]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[Event]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[EventInvitees]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[Exam]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[ExamSubject]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[Grade]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[GradeGroup]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[RuleMaster]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[RuleSubject]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[Student]    Script Date: 06-Aug-19 11:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GradeID] [int] NOT NULL,
	[YearID] [int] NOT NULL,
	[AdmissionID] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentAttendent]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[StudentContact]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[StudentHealth]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[StudentParticulars]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[StudentResult]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[StudentResultDetails]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[Subject]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[Teacher]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[TeacherGrade]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[TeacherQual]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
	[QualCompletionDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TeacherQual] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TeacherSubject]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[TimeTable]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  Table [dbo].[Year]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
SET IDENTITY_INSERT [dbo].[Grade] ON 

INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (3, N'Lower Nursery', 1)
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (4, N'Upper Nursery', 1)
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (5, N'Class - I', 2)
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (6, N'Class - II', 2)
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (7, N'Class - III', 2)
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (8, N'Class - IV', 3)
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (9, N'Class - V', 3)
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (10, N'Class - VI', 3)
INSERT [dbo].[Grade] ([ID], [Grade], [GradeGroupID]) VALUES (11, N'Class - VII', 3)
SET IDENTITY_INSERT [dbo].[Grade] OFF
SET IDENTITY_INSERT [dbo].[GradeGroup] ON 

INSERT [dbo].[GradeGroup] ([ID], [GradeGroup]) VALUES (1, N'Nursery')
INSERT [dbo].[GradeGroup] ([ID], [GradeGroup]) VALUES (2, N'Primary')
INSERT [dbo].[GradeGroup] ([ID], [GradeGroup]) VALUES (3, N'Upper Primary')
INSERT [dbo].[GradeGroup] ([ID], [GradeGroup]) VALUES (4, N'Secondary')
INSERT [dbo].[GradeGroup] ([ID], [GradeGroup]) VALUES (5, N'Higher Secondary')
SET IDENTITY_INSERT [dbo].[GradeGroup] OFF
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
/****** Object:  StoredProcedure [dbo].[usp_Get_Grade_All]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Get_Grade_All_PageWise]    Script Date: 06-Aug-19 11:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[usp_Get_Grade_All_PageWise]
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
/****** Object:  StoredProcedure [dbo].[usp_Get_GradeGroup]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Get_GradeGroup_By_GradeGroupID]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Insert_Grade]    Script Date: 06-Aug-19 11:07:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Update_Grade_By_GradeID]    Script Date: 06-Aug-19 11:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_Update_Grade_By_GradeID]
@id int,
@Grade varchar(100),
@GradeGroupID int
as
begin
declare @gradeCount int
set @gradeCount = 0
if @gradeCount is null
begin
select @gradeCount=COUNT(*) from Grade where RTRIM(LTRIM(UPPER(grade)))=RTRIM(LTRIM(@grade)) and GradeGroupID=@GradeGroupID
if @gradeCount=0
begin
	update Grade set Grade=@Grade, GradeGroupID=@GradeGroupID where id =@id
end 

end
end
GO
USE [master]
GO
ALTER DATABASE [MySchool] SET  READ_WRITE 
GO
