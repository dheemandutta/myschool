--  declare @x int Exec stpGetAdmissionFormPageWise 1,15, @x out
ALTER PROCEDURE [dbo].[stpGetAdmissionFormPageWise]
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
            ORDER BY [FormNumber] ASC
      )AS RowNumber
      ,ID
	  ,FormNumber
	  ,SFName + ' ' + ISNULL(SMName,'') + ' ' + SLNAme AS StudentName
	   ,CONVERT(varchar(12),DOB,103) DOB
	  ,[Address]
	  ,IdentificationMarks
	  ,ISNULL(isSelectedForAdmission,0) isSelectedForAdmission
     INTO #Results
      FROM AdmissionForm
	    --Where IsActive=1		 
      SELECT @RecordCount = COUNT(*)
      FROM #Results
      SELECT * FROM #Results
      WHERE RowNumber BETWEEN(@PageIndex -1) * @PageSize + 1 AND(((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1
	 -- ORDER BY [Order] ASC
      DROP TABLE #Results
END
























