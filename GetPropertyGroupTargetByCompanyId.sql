ALTER PROCEDURE GetPropertyGroupTargetByCompanyId
(
	@HoldingCompanyId bigint 
)
AS
BEGIN
	SELECT 
	Convert(int, [dbo].[Group].[GroupID]) AS GROUPCOMPANYID, 
	[dbo].[HoldingCompany].[Code] AS HOLDCOMPANY,
	[dbo].[HoldingCompany].[Code] AS GROUPCOMPANY,
	[dbo].[HoldingCompany].[Name] AS GROUPCOMPANYNAME,
	[dbo].[HoldingCompany].[Address] AS GRPOUPADDRESS,
	[dbo].[Country].[CountryName] AS GROUPCOUNTRY,
	[dbo].[State].[StateName] AS GROUPSTATE,
	[dbo].[City].[Name] AS GROUPCITY,
    [dbo].[Group].[ZipCode] AS GROUPZIPCODE,
	[dbo].[Group].[PhoneNumber] AS GROUPWEBSITE,
	[dbo].[Group].[CreatedBy] AS CREATEDBY,
	[dbo].[Group].[ModifiedBy] AS MODIFIEDBY,
	[dbo].[Group].[CreatedDateTime] AS CREATEDATETIME,
	[dbo].[Group].[ModifiedDateTime] AS MODIFIEDDATETIME,
	[dbo].[Group].[HoldingCompanyID] AS HOLDINGCOMPANYID,
	[dbo].[Group].[ModifiedDateTime] AS SyncDHBTransDateTime,
	[dbo].[Group].[PhoneNumber] AS RECORDSTATUS,
	'UTC' AS TIMEZONE,
	'U' AS UpdateType,
	NEWID() AS SyncDHBTransID,
	NEWID() AS SyncFCLTransID,
	Convert(nvarchar, getdate(),21) AS SyncMode,
	NEWID() AS SyncPMSTransID,
	Convert(smallint,0) AS SyncFCLTransStatus,
	Convert(smallint,0) AS SyncDHBTransStatus,
	Convert(smallint,0) AS SyncPMSTransStatus,
	getdate() AS SyncFCLTransDateTime,
	getdate() AS SyncPMSTransDateTime,
	[dbo].[Group].[IsDeleted] AS IsDeleted,
	[dbo].[Group].[DeletedDateTime] AS DeletedDateTime,
	[dbo].[Group].[DeletedBy] AS DeletedBy

	FROM [dbo].[Group]
	INNER JOIN [dbo].[HoldingCompany]
	ON [dbo].[Group].[HoldingCompanyID] = [dbo].[HoldingCompany].[HoldingCompanyID]
	INNER JOIN [dbo].[City] 
	ON [dbo].[Group].[CityID] = [dbo].[City].[CityID]    
	INNER JOIN [dbo].[State]
	ON [dbo].[Group].[StateID] = [dbo].[State].[StateID]
	INNER JOIN [dbo].[Country]
	ON [dbo].[Group].[CountryID] = [dbo].[Country].[CountryID]
	WHERE [dbo].[Group].[HoldingCompanyID] = @HoldingCompanyId
END
GO
