USE [MySchool]
GO
/****** Object:  StoredProcedure [dbo].[stpInsertUpdateSection]    Script Date: 16-08-2019 13:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stpInsertUpdateSection]
@ID int,
@GradeId int,
@Section varchar(500)
as
begin
	declare @countSection int
	set @countSection = 0
	if @id is null
	begin
		select @countSection=COUNT(*) from Section where RTRIM(LTRIM(upper(Section))) =RTRIM(LTRIM(upper(@Section))) and GradeId=@GradeId
		if @countSection>0 
			begin
				insert into Section (GradeId, Section) values (@GradeId, @Section)
			end
		else
			begin
				update Section set Section=@Section, GradeId=@GradeId where id=@ID
			end

	end

end