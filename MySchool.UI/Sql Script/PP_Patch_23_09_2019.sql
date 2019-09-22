GO

--  exec stpChoiceByID 1
ALTER procedure [dbo].[stpDeleteChoiceByID]
@ID int,
@Output  VARCHAR(100) OUTPUT
as
begin
delete from Choice where Id=@ID
end

GO

--  exec stpDeleteQuestionByID 1
ALTER procedure [dbo].[stpDeleteQuestionByID]
@ID int,
@Output  VARCHAR(100) OUTPUT
as
begin
delete from Question where Id=@ID
end


GO


--  exec stpDeleteTopicByID 1
ALTER procedure [dbo].[stpDeleteTopicByID]
@ID int,
@Output  VARCHAR(100) OUTPUT
as
begin
delete from Topic where Id=@ID
end


GO


-- exec stpGetExamForDrp
create procedure [dbo].[stpGetExamForDrp]

as
begin
Select ID
      ,ExamName
from Exam
end



GO