
-- exec stpGetAllQuestion
create procedure [dbo].[stpGetAllQuestion]
as
begin
select count (*)As QuestionCount 
from Question
end




