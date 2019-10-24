USE [MySchool]
GO
/****** Object:  StoredProcedure [dbo].[stpUpdateSelectionForStatus]    Script Date: 24-Oct-19 10:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].stpUpdateAdmissionFormSelectionStatus
(
@FormNumber varchar(50)
)
as
begin
	Declare @SelectionStaus bit
	Set @SelectionStaus = 0
	Select @SelectionStaus = isSelectedForAdmission from AdmissionForm where FormNumber=@FormNumber
	if @SelectionStaus = 1
		begin
			update AdmissionForm set  isSelectedForAdmission = 0 where FormNumber =@FormNumber
		end
	else
		update AdmissionForm set  isSelectedForAdmission = 1 where FormNumber =@FormNumber
end
