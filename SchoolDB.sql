USE [School]
GO
/****** Object:  Table [dbo].[Admission]    Script Date: 03/08/2019 7:35:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admission](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YearID] [int] NOT NULL,
	[GradeID] [int] NOT NULL,
	[AdmAmt] [decimal](12, 2) NOT NULL,
 CONSTRAINT [PK_Admission] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AdmissionDetails]    Script Date: 03/08/2019 7:35:25 PM ******/
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
 CONSTRAINT [PK_AdmissionDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Announcement]    Script Date: 03/08/2019 7:35:25 PM ******/
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
/****** Object:  Table [dbo].[Campaign]    Script Date: 03/08/2019 7:35:25 PM ******/
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
	[Target] [varchar](500) NULL,
	[Collected] [varchar](100) NULL,
 CONSTRAINT [PK_Campaign] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DayOfWeek]    Script Date: 03/08/2019 7:35:25 PM ******/
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
/****** Object:  Table [dbo].[Donar]    Script Date: 03/08/2019 7:35:25 PM ******/
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
/****** Object:  Table [dbo].[Donation]    Script Date: 03/08/2019 7:35:25 PM ******/
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
/****** Object:  Table [dbo].[Event]    Script Date: 03/08/2019 7:35:25 PM ******/
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
/****** Object:  Table [dbo].[EventInvitees]    Script Date: 03/08/2019 7:35:25 PM ******/
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
/****** Object:  Table [dbo].[Exam]    Script Date: 03/08/2019 7:35:25 PM ******/
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
/****** Object:  Table [dbo].[ExamSubject]    Script Date: 03/08/2019 7:35:25 PM ******/
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
/****** Object:  Table [dbo].[Grade]    Script Date: 03/08/2019 7:35:25 PM ******/
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
/****** Object:  Table [dbo].[GradeGroup]    Script Date: 03/08/2019 7:35:25 PM ******/
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
/****** Object:  Table [dbo].[Student]    Script Date: 03/08/2019 7:35:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GradeID] [int] NOT NULL,
	[YearID] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentAttendent]    Script Date: 03/08/2019 7:35:25 PM ******/
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
/****** Object:  Table [dbo].[StudentContact]    Script Date: 03/08/2019 7:35:25 PM ******/
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
/****** Object:  Table [dbo].[StudentHealth]    Script Date: 03/08/2019 7:35:25 PM ******/
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
/****** Object:  Table [dbo].[StudentParticulars]    Script Date: 03/08/2019 7:35:25 PM ******/
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
	[EndDate] [datetime] NOT NULL,
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
/****** Object:  Table [dbo].[StudentResult]    Script Date: 03/08/2019 7:35:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentResult](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[Marks] [decimal](12, 2) NOT NULL,
	[ExamSubjectID] [int] NOT NULL,
 CONSTRAINT [PK_StudentResult] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subject]    Script Date: 03/08/2019 7:35:25 PM ******/
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
/****** Object:  Table [dbo].[Teacher]    Script Date: 03/08/2019 7:35:25 PM ******/
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
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TeacherGrade]    Script Date: 03/08/2019 7:35:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TeacherGrade](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TeacherID] [int] NOT NULL,
	[YearID] [int] NOT NULL,
	[GradeID] [int] NOT NULL,
	[IsClassTeacher] [varchar](20) NOT NULL,
	[SubjectID] [int] NOT NULL,
 CONSTRAINT [PK_TeacherGrade] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TeacherQual]    Script Date: 03/08/2019 7:35:25 PM ******/
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
	[QualCertPath] [varchar](5000) NOT NULL,
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
/****** Object:  Table [dbo].[TeacherSubject]    Script Date: 03/08/2019 7:35:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TeacherSubject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[isPrimarySubject] [varchar](500) NULL,
 CONSTRAINT [PK_TeacherSubject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TimeTable]    Script Date: 03/08/2019 7:35:25 PM ******/
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
/****** Object:  Table [dbo].[Year]    Script Date: 03/08/2019 7:35:25 PM ******/
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
ALTER TABLE [dbo].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_ExamSubject] FOREIGN KEY([ExamSubjectID])
REFERENCES [dbo].[ExamSubject] ([ID])
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_ExamSubject]
GO
ALTER TABLE [dbo].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_Student]
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
