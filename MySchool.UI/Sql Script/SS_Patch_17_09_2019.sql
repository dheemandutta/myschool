USE [MySchool]
GO
/****** Object:  StoredProcedure [dbo].[stpDeleteSubjecyByID]    Script Date: 18-Sep-19 12:27:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[stpDeleteSubjecyByID] 
	-- Add the parameters for the stored procedure here
	@ID int
AS
BEGIN



    -- Insert statements for procedure here
	delete  from Subject where ID=@ID
END
