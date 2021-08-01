ALTER PROCEDURE GetHoldingCompanyTargetById
(
	@HoldingCompanyId bigint 
)
AS
BEGIN
	SELECT 
	[dbo].[HoldingCompany].[HoldingCompanyID] AS HOLDINGCOMPANYID, 
	[dbo].[HoldingCompany].[Name] AS HOLDCOMPANYNAME,
	[dbo].[HoldingCompany].[Code] AS HOLDCOMPANY,
	[dbo].[HoldingCompany].[Address] AS HOLDADDRESS,
	[dbo].[Country].[CountryName] AS HOLDCOUNTRY,
	[dbo].[State].[StateName] AS HOLDSTATE,
	[dbo].[HoldingCompany].[PhoneNumber] AS HOLDWEBSITE,
	[dbo].[City].[Name] AS HOLDCITY,
    [dbo].[HoldingCompany].[ZipCode] AS HOLDZIPCODE,
	[dbo].[HoldingCompany].[CreatedBy] AS CREATEDBY,
	[dbo].[HoldingCompany].[ModifiedBy] AS MODIFIEDBY,
	[dbo].[HoldingCompany].[CreatedDateTime] AS CREATEDATETIME,
	[dbo].[HoldingCompany].[ModifiedDateTime] AS MODIFIEDDATETIME,
	[dbo].[HoldingCompany].[ModifiedDateTime] AS SyncDHBTransDateTime,
	[dbo].[HoldingCompany].[PhoneNumber] AS RECORDSTATUS,
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
	[dbo].[HoldingCompany].[IsDeleted] AS IsDeleted,
	[dbo].[HoldingCompany].[DeletedDateTime] AS DeletedDateTime,
	[dbo].[HoldingCompany].[DeletedBy] AS DeletedBy

	FROM [dbo].[HoldingCompany]
	INNER JOIN [dbo].[City] 
	ON [dbo].[HoldingCompany].[CityID] = [dbo].[City].[CityID]    
	INNER JOIN [dbo].[State]
	ON [dbo].[HoldingCompany].[StateID] = [dbo].[State].[StateID]
	INNER JOIN [dbo].[Country]
	ON [dbo].[HoldingCompany].[CountryID] = [dbo].[Country].[CountryID]
	WHERE [dbo].[HoldingCompany].[HoldingCompanyID] = @HoldingCompanyId

END
GO
