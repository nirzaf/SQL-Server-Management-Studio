/****** Object:  StoredProcedure [dbo].[GetUsersTargetByCompanyId]    Script Date: 01/08/2021 18:09:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetUsersTargetByCompanyId]
(
	@HoldingCompanyId bigint 
)
AS
BEGIN
	SELECT 
	Convert(int, [dbo].[User].[UserID]) AS ID, 
	Convert(int, [dbo].[HoldingCompany].HoldingCompanyID) AS HoldingCompanyID,
	[dbo].[HoldingCompany].[Code] AS DefaultHoldingCompanyCode,
	Convert(int, [dbo].[User].[DefaultGroupID]) AS DefaultGroupID,
	Convert(int, [dbo].[User].[DefaultPropertyID]) AS DefaultPropertyID,
	1 AS DefaultPMSCode,
	[dbo].[UserType].[Name] AS UserType, 
	[dbo].[User].[LoginID] AS LoginID,
	Convert(nvarchar, getdate(),21) AS LoginPassword,
	Convert(nvarchar, getdate(),21) AS TransactionPassword,
    Convert(bit,0) AS IsLocked,
	Convert(bit,0) AS IsFirstLogin,
	0 AS RetryCount,
	[dbo].[User].[ValidFrom] AS ValidFrom,
	[dbo].[User].[ValidTo] AS ValidTo,
	0 AS ForcePasswordResetPeriod,
	getdate() AS LastPasswordChangedDate,
	Convert(bit,0) AS ForcePasswordReset,
	'dd/MM/yyyy' AS DateFormat,
	'hh:mm:ss:ms' AS TimeFormat,
	'EN' AS PreferredLanguage,
	'UTC' AS UTCOffset,
	Convert(varchar, [dbo].[User].[TitleID]) AS Title, 
	[dbo].[User].[FirstName] AS FirstName,
	[dbo].[User].[MiddleName] AS MiddleName,
	[dbo].[User].LastName AS LastName,
	Convert(varchar, [dbo].[User].[GenderID]) AS Gender,
	Convert(int, [dbo].[User].[DesignationID]) AS DesignationID,
	[dbo].[Designation].Name AS Designation,
	Convert(int, [dbo].[Department].[DepartmentID]) AS DepartmentID,
	[dbo].[User].[ImagePhysicalPath] AS Photo,
	[dbo].[User].[BirthDate] AS DateOfBirth,
	getdate() AS AnniversaryDate,
	[dbo].[User].[OfficeMobile] AS OfficialMobile,
	[dbo].[User].[OfficePhone] AS OfficialPhone,
	[dbo].[User].[OfficeExtension] AS OfficialExtention,
	[dbo].[User].[OfficeEmail] AS OfficialMailID,
	[dbo].[User].[OfficeAddress] AS OfficialAddress,
	cn1.CountryName AS OfficialCountry,
	s1.StateName AS OfficialState,
	c1.Name AS OfficialCity,
	[dbo].[User].[OfficeZipCode] AS OfficialZip,
	[dbo].[User].[PersonalMobileNo] As PersonalMobile,
	[dbo].[User].[PersonalPhoneNumber] AS PersonalPhone,
	[dbo].[User].[PersonalEmail] AS PersonalMailID,
	[dbo].[User].[PersonalAddress] AS PersonalAddress,
	cn2.CountryName AS PersonalCountry,
	s2.StateName AS PersonalState,
	c2.Name AS PersonalCity,
	[dbo].[User].[PersonalZipCode] AS PersonalZip,
	[dbo].[User].[Remarks] AS Remarks,
	'HintQuestionOne' AS HintQuestionOne,
	'HintQuestionTwo' AS HintQuestionTwo,
	'HintQuestionThree' AS HintQuestionThree,
	'AnswerOne' AS AnswerOne,
	'AnswerTwo' AS AnswerTwo,
	'AnswerThree' AS AnswerThree,
	getdate() AS LastSuccessfullLoginDate,
	getdate() AS LastFailureLoginDate,
	getdate() AS LastPasswordResetDate,
	Convert(bit,0) AS Status,
	Convert(bit,0) AS UnsubscribedProducts,
	[dbo].[User].[CreatedBy] AS CreatedBy,
	[dbo].[User].[CreatedDateTime] AS CreatedDateTime,
	[dbo].[User].[ModifiedBy] AS ModifiedBy,
	[dbo].[User].[ModifiedDateTime] AS ModifiedDateTime,
	[dbo].[User].[ModifiedDateTime] AS SyncDHBTransDateTime,
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
	[dbo].[User].[IsDeleted] AS IsDeleted,
	[dbo].[User].[DeletedDateTime] AS DeletedDateTime,
	[dbo].[User].[DeletedBy] AS DeletedBy,
	[dbo].[User].[IPAddress] AS IpAdress,
	Convert(nvarchar, getdate(),21) AS IpLog
	FROM [dbo].[User]
	INNER JOIN [dbo].[UserType]
	ON [dbo].[User].UserTypeID = [dbo].[UserType].[UserTypeID]
	INNER JOIN [dbo].[HoldingCompany]
	ON [dbo].[User].[HoldingCompanyID] = [dbo].[HoldingCompany].[HoldingCompanyID]
	JOIN [dbo].[City] c1 
	ON [dbo].[User].[OfficeCityID] = c1.[CityID]    
	INNER JOIN [dbo].[State] s1
	ON [dbo].[User].[OfficeStateID] = s1.[StateID]
	INNER JOIN [dbo].[Country] cn1
	ON [dbo].[User].[OfficeCountryID] = cn1.[CountryID]
	INNER JOIN [dbo].[Designation]
	ON [dbo].[User].[DesignationID] = [dbo].[Designation].[DesignationID]
	INNER JOIN [dbo].[Department]
	ON [dbo].[User].DepartmentID = [dbo].[Department].[DepartmentID]
	INNER JOIN [dbo].[City] c2 
	ON [dbo].[User].[PersonalCityID] = c2.[CityID]
	INNER JOIN [dbo].[State] s2
	ON [dbo].[User].[PersonalStateID] = s2.StateID
	INNER JOIN [dbo].[Country] cn2
	ON [dbo].[User].[PersoanlCountryID] = cn2.CountryID 

	WHERE [dbo].[User].[HoldingCompanyID] = @HoldingCompanyId
END
