GO
/****** Object:  StoredProcedure [dbo].[usp_Update_Grade_By_GradeID]    Script Date: 09-08-2019 17:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[usp_Update_Grade_By_GradeID]
@id int,
@Grade varchar(100),
@GradeGroupID int
as
begin
	update Grade set Grade=@Grade, GradeGroupID=@GradeGroupID where ID =@id
end 

Go

ALTER procedure [dbo].[usp_Get_Grade_By_GradeID]
@ID int

as
begin
select id, grade,GradeGroupID from [dbo].[Grade] where id=@ID
end

ALTER PROCEDURE [dbo].[usp_Get_Grade_All_PageWise]
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


Go
ALTER procedure [dbo].[usp_Delete_Grade_By_GradeID]
@id int
as
begin
	Delete  from Grade where ID =@id
end 


Go
ALTER procedure [dbo].[usp_Update_Grade_By_GradeID]
@id int,
@Grade varchar(100),
@GradeGroupID int
as
begin
	update Grade set Grade=@Grade, GradeGroupID=@GradeGroupID where ID =@id
end 












