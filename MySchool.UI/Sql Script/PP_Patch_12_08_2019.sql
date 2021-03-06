USE [MySchool]
GO
SET IDENTITY_INSERT [dbo].[Admission] ON 

INSERT [dbo].[Admission] ([ID], [YearID], [GradeID], [AdmAmt], [AdmissonNumber]) VALUES (3, 1, 3, CAST(5000.00 AS Decimal(12, 2)), N'AdNo90001')
INSERT [dbo].[Admission] ([ID], [YearID], [GradeID], [AdmAmt], [AdmissonNumber]) VALUES (5, 2, 4, CAST(4500.00 AS Decimal(12, 2)), N'AdNo90002')
SET IDENTITY_INSERT [dbo].[Admission] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([ID], [GradeID], [YearID], [AdmissionID]) VALUES (1, 3, 1, 3)
INSERT [dbo].[Student] ([ID], [GradeID], [YearID], [AdmissionID]) VALUES (3, 4, 2, 5)
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[StudentAttendent] ON 

INSERT [dbo].[StudentAttendent] ([ID], [StudentID], [Date], [IsPresents]) VALUES (2, 1, CAST(N'2019-05-06 00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[StudentAttendent] ([ID], [StudentID], [Date], [IsPresents]) VALUES (5, 3, CAST(N'2019-05-06 00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[StudentAttendent] OFF
SET IDENTITY_INSERT [dbo].[StudentParticulars] ON 

INSERT [dbo].[StudentParticulars] ([ID], [StudentID], [FirstName], [LastName], [DOB], [GradeID], [StartDate], [EndDate], [LeavingReason], [Gender], [Photo]) VALUES (1, 1, N'Fungsug', N'Vangru', CAST(N'2019-05-06 00:00:00.000' AS DateTime), 3, CAST(N'2019-05-06 00:00:00.000' AS DateTime), CAST(N'2019-05-06 00:00:00.000' AS DateTime), N'xyz', N'M', NULL)
INSERT [dbo].[StudentParticulars] ([ID], [StudentID], [FirstName], [LastName], [DOB], [GradeID], [StartDate], [EndDate], [LeavingReason], [Gender], [Photo]) VALUES (3, 3, N'Farhan', N'Qureshi', CAST(N'2019-05-06 00:00:00.000' AS DateTime), 4, CAST(N'2019-05-06 00:00:00.000' AS DateTime), CAST(N'2019-05-06 00:00:00.000' AS DateTime), N'ok', N'M', NULL)
SET IDENTITY_INSERT [dbo].[StudentParticulars] OFF

GO

--  declare @x int Exec stpGetStudentAttendentPageWise 1,15, @x out
create PROCEDURE [dbo].[stpGetStudentAttendentPageWise]
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


-- exec usp_GetAllGradeForDrp
create procedure [dbo].[usp_GetAllGradeForDrp]
--( 
--@GradeID int
--) 
AS
Begin
Select ID, Grade

from Grade

--Where ID=@GradeID
End