GO
-- exec stpGetGradeForDrp
ALTER procedure [dbo].[stpGetGradeForDrp]

as
begin
Select ID
      ,Grade 
from Grade
end

 
GO
-- exec stpGetStudentForDrp
ALTER procedure [dbo].[stpGetStudentForDrp]

as
begin
Select ID
      ,FirstName + ' ' + LastName AS StudentName 
from StudentParticulars
end


GO
-- exec stpGetSectionForDrp
ALTER procedure [dbo].[stpGetSectionForDrp]

as
begin
Select ID
      ,Section 
from Section
end

GO
