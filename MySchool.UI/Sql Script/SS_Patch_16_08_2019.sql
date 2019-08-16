Go
create procedure stpInsertUpdateSection
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

Go
create procedure stpDeleteSectionByID
@ID int
as
begin
delete from Section where ID=@ID
end

Go
create procedure stpGetSectionBySectionID

@ID int
as
begin
select id, section, GradeId from Section where ID=@ID
end

Go
create PROCEDURE [dbo].[stpGetSectionAllPageWise]
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
	   
		dbo.Section.ID,
		dbo.Section.Section,
		dbo.Section.GradeId,
		Grade.ID

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

Go
create procedure stpSelectSectionByGradeID
@GradeID INT
as
begin
	select id, section from Section where GradeId=@GradeID
end


