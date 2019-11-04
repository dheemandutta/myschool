--  EXEC stpGetAdmissionOfMaxIdByID

create procedure [dbo].[stpGetAdmissionOfMaxIdByID]
--(
--@ID int
--)
as
begin
Select MAX([ID]) AS AdmissionFormMaxId
	  FROM dbo.AdmissionForm
			--where ID=@ID
end
