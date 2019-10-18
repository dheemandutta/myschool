USE [MySchool]
GO
/****** Object:  StoredProcedure [dbo].[stpUpdateAdmissionFormSelectionStatus]    Script Date: 18-Oct-19 11:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stpUpdateAdmissionFormSelectionStatus] 
(
@ID int,
@isSelectedForAdmission bit
)
AS
BEGIN
UPDATE AdmissionForm SET isSelectedForAdmission=@isSelectedForAdmission WHERE ID=@ID
END