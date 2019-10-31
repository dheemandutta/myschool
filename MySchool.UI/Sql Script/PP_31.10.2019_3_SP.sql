-- stpGetAllGradeForDrp_New 

CREATE procedure [dbo].[stpGetAllGradeForDrp_New]
--@ID int
as
begin
select ID,Grade
from Grade
end
----------------------------------------------------------------------
-- stpGetAllSectionByGradeIdForDrp_New 3

alter procedure [dbo].[stpGetAllSectionByGradeIdForDrp_New]
@ID int
as
begin
select S.ID, S.Section
from Section S
inner JOIN Grade G 
ON G.ID = S.GradeId
WHERE G.ID = @ID
END
----------------------------------------------------------------------
-- stpGetAllStudentBySectionIdForDrp_New 3

alter procedure [dbo].[stpGetAllStudentBySectionIdForDrp_New]
@ID int
as
begin
select S.ID        ,S.AdmissionID          --,StudentName
from Student S
INNER JOIN Section SE
ON SE.ID = S.SectionID
WHERE SE.ID = @ID
end