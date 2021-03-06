GO
--  declare @x int Exec stpGetStudentContactPageWise 1,15, @x out
ALTER PROCEDURE [dbo].[stpGetStudentContactPageWise]
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





--  declare @x int Exec stpGetStudentParticularsPageWise 1,15, @x out
ALTER PROCEDURE [dbo].[stpGetStudentParticularsPageWise]
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








