USE [MySchool]
GO
/****** Object:  StoredProcedure [dbo].[stpInsertUpdateDashboard]    Script Date: 27-11-2019 17:41:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[stpInsertUpdateDashboard]
(
	@id	int,
	@subject varchar(max),
	@description varchar(max),
	@releaseDate datetime,
	@expiryDate datetime,
	@importance varchar(50)
	--@filepath varchar(max) NULL
)
as
BEGIN
	Declare @coutnDashboard INT
	Set @coutnDashboard = 0
	BEGIN
		SELECT @coutnDashboard = COUNT(Subject) FROM Dashboard WHERE Subject=@subject AND releaseDate = @releaseDate AND expiryDate = @expiryDate
		IF @coutnDashboard > 0 
			BEGIN
				--INSERT INTO Dashboard (subject, Description, releaseDate, expiryDate, importance, filepath) VALUES
				--(@subject, @description, @releaseDate, @expiryDate, @importance, @filepath)
				INSERT INTO Dashboard (subject, Description, releaseDate, expiryDate, importance) VALUES
				(@subject, @description, @releaseDate, @expiryDate, @importance)
			END
		ELSE
			BEGIN
				--UPDATE Dashboard SET subject=@subject, description= @description, releaseDate = @releaseDate, 
				--expiryDate = @expiryDate, importance = @importance, filepath = @filepath
				--WHERE id=@id

				UPDATE Dashboard SET subject=@subject, description= @description, releaseDate = @releaseDate, 
				expiryDate = @expiryDate, importance = @importance
				WHERE id=@id
			END
	END
END