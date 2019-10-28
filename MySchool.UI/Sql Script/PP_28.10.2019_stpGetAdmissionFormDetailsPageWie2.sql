--declare @x int Exec stpGetAdmissionFormDetailsPageWie2 1,15, @x out

alter procedure [dbo].[stpGetAdmissionFormDetailsPageWie2]
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
      ,SPhoto
	  ,FormNumber
	  ,SFName + ' ' + SLNAme AS StudentName
	  ,MFName + ' ' + MLName AS MotherName
	  ,FFName + ' ' + FLName AS FatherName

     INTO #Results
      FROM [AdmissionForm] A
	  	where isSelectedForAdmission = 1

      SELECT @RecordCount = COUNT(*)
      FROM #Results
      SELECT * FROM #Results
      WHERE RowNumber BETWEEN(@PageIndex -1) * @PageSize + 1 AND(((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1
	 -- ORDER BY [Order] ASC
      DROP TABLE #Results
END

--where isSelectedForAdmission = 1 