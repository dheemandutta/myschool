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

CREATE procedure [dbo].[stpGetAllSectionByGradeIdForDrp_New]
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
-- stpGetAllStudentBySectionIdForDrp_New 3, 1

ALTER procedure [dbo].[stpGetAllStudentBySectionIdForDrp_New]
@ID INT,
@YearID INT
as
begin
select S.ID,     SP.FirstName + ' ' + SP.LastName AS StudentName
from Student S

INNER JOIN Section SE
ON SE.ID = S.SectionID

INNER JOIN StudentParticulars SP
ON S.ID = SP.StudentID

INNER JOIN [Year] Y
ON Y.ID = S.YearID

WHERE SE.ID = @ID
end