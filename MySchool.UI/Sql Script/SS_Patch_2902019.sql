
USE [MySchool]
GO
/****** Object:  UserDefinedTableType [dbo].[AnswerTVT]    Script Date: 9/19/2019 8:22:10 PM ******/
drop procedure [dbo].[stpGettblSubjectForDrp]

go
create procedure [dbo].[stpGetSubjectForDrp]
as
begin
Select Id
      ,SubjectName 
from tblSubject
end



