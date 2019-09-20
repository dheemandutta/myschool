

GO
/****** Object:  StoredProcedure [dbo].[stpInsertUpdateSubject]    Script Date: 17/09/2019 11:48:34 PM ******/
DROP PROCEDURE [dbo].[stpInsertUpdatetblConfig]
GO
/****** Object:  StoredProcedure [dbo].[stpInsertUpdateSubject]    Script Date: 17/09/2019 11:48:34 PM ******/
DROP PROCEDURE [dbo].[stpGettblConfigByKeyName]
GO
/****** Object:  StoredProcedure [dbo].[stpInsertUpdateSubject]    Script Date: 17/09/2019 11:48:34 PM ******/
DROP PROCEDURE [dbo].[stpInsertUpdateQuestion]
GO
/****** Object:  StoredProcedure [dbo].[stpInsertUpdateSubject]    Script Date: 17/09/2019 11:48:34 PM ******/
DROP PROCEDURE [dbo].[stpGettblAnswerPageWise]
GO







------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------

GO

--  exec stpInsertUpdatetblConfig 'dfdf-1', 'dddd-2'

create procedure [dbo].[stpInsertUpdatetblConfig] 
( 
@KeyName varchar(50),
@ConfigValue varchar(100)
) 
AS 
BEGIN 
--DECLARE @FleetID int
DECLARE @reccount int 
SELECT @reccount = COUNT(*) FROM tblConfig WHERE KeyName = @KeyName
 BEGIN TRY
    BEGIN TRAN
 --IF @KeyName IS NULL
 IF @reccount  = 0 OR @reccount IS NULL
BEGIN   
	 print 'INSERT'
	INSERT INTO [tblConfig] 
	         (KeyName
		   ,ConfigValue)
	Values (@KeyName
	       ,@ConfigValue)

	SET @KeyName = @@IDENTITY
	--SET @CompanyId  = @ID
END
ELSE
BEGIN
	print 'UPDATE'
	UPDATE [tblConfig]
	SET     KeyName=@KeyName
	       ,ConfigValue=@ConfigValue
	Where KeyName=@KeyName
	--SET @CompanyId  = @ID
END
	COMMIT TRAN
 END TRY 

 BEGIN CATCH
	ROLLBACK TRAN
	SELECT ERROR_MESSAGE() AS ErrorMessage;  
 END CATCH
END


---------------------------------------------------------------------------------------------------------------


GO


--  exec stpGettblConfigByKeyName 3
create procedure [dbo].[stpGettblConfigByKeyName]
--@KeyName varchar(50)
@ID int
as
begin
SELECT [Id],
       KeyName
      ,ConfigValue
  FROM tblConfig
-- where KeyName=@KeyName
   where Id=@ID
end



GO



-----------------------------------------------------------------------------------------------------------------


ALTER TABLE tblConfig
   ADD Id int IDENTITY
       CONSTRAINT PK_tblConfig PRIMARY KEY CLUSTERED







GO



---------------------------------------------------------------------------------------------------------------
GO
/****** Object:  UserDefinedTableType [dbo].[AnswerTVT]    Script Date: 17/09/2019 11:23:39 PM ******/
CREATE TYPE [dbo].[AnswerTVT] AS TABLE(
	[Ans] [varchar](max) NULL,
	[IsAns] [bit] NULL
)
GO




------------------------------------------------------------------------------------------------------------------------

--  exec stpInsertUpdateQuestion 5,2,'deep', 5665.00

create procedure [dbo].[stpInsertUpdateQuestion] 
( 
@ID int,
@TopicId int,
@QuestionText varchar(500),
--@ImagePath varchar(500),
@Marks decimal(12,2),
@AnswerList AnswerTVT READONLY
) 
AS 
BEGIN 
--DECLARE @FleetID int
 BEGIN TRY
    BEGIN TRAN
 --IF @ID IS NULL
BEGIN   
	 print 'INSERT'
	INSERT INTO [Question] 
	       ([TopicId]
		   ,QuestionText
           --,ImagePath
           ,Marks)
	Values (@TopicId
	       ,@QuestionText
           --,@ImagePath
           ,@Marks)

	SET @ID = @@IDENTITY

	INSERT INTO Choice (QuestionId,ChoiceText,IsAnswer)
	Select @ID,Ans,IsAns from @AnswerList




	--SET @CompanyId  = @ID
END
--ELSE
--BEGIN
--	print 'UPDATE'
--	UPDATE [Question]
--	SET     TopicId=@TopicId
--	       ,QuestionText=@QuestionText
--		   --,ImagePath=@ImagePath
--		   ,Marks=@Marks
--	Where Id=@ID
--	--SET @CompanyId  = @ID
--END
	COMMIT TRAN
 END TRY 

 BEGIN CATCH
	ROLLBACK TRAN
	SELECT ERROR_MESSAGE() AS ErrorMessage;  
 END CATCH
END



GO

----------------------------------------------------------------------------------------------------------------------------------


--  declare @x int Exec stpGettblAnswerPageWise 12, 1,10, @x out
create PROCEDURE [dbo].[stpGettblAnswerPageWise]
 (
      @QuestionId int,
      @PageIndex INT = 1,
      @PageSize INT = 10,
      @RecordCount INT OUTPUT
)
AS
BEGIN
      SET NOCOUNT ON;
      SELECT ROW_NUMBER() OVER
      (
            ORDER BY [Id] ASC
      )AS RowNumber
      ,Id
      ,ChoiceText
	  ,IsAnswer
     INTO #Results
      FROM Choice
    where QuestionId=@QuestionId
      SELECT @RecordCount = COUNT(*)
      FROM #Results
      SELECT * FROM #Results
      WHERE RowNumber BETWEEN(@PageIndex -1) * @PageSize + 1 AND(((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1
      DROP TABLE #Results
END





GO