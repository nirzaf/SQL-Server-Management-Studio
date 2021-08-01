ALTER PROCEDURE GetTargetProductLicensesByPropertyCode
(
    @PropertyCode nvarchar(50) 
)
AS
BEGIN
      SELECT 
	  0 AS ID,
	  0 AS PMSCustomerCode,
	  [dbo].[LinkedProductsWithProperty].[PropertyCode] AS PropertyGroupCode,
	  0 AS KepslaGroupID,
	  0 AS KepslaPropertyID,
	  Convert(int, [dbo].[LinkedProductsWithProperty].[Code]) AS ProductID,
	  Convert(bit, 0) AS Notification,
	  Convert(bit, 0) AS Status,
	  getdate() AS LiveDate,
	  getdate() AS ExpiryDate,
	  'CreatedBy' AS CreatedBy,
	  getdate() AS CreatedDate,
	  'ModifiedBy' AS ModifiedBy,
	  getdate() AS ModifiedDate,
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
	  getdate() AS SyncDHBTransDateTime,
	  Convert(bit, 0) AS IsDeleted,
	  Null AS DeletedDateTime,
	  null AS DeletedBy
	  FROM [dbo].[LinkedProductsWithProperty]
	  WHERE  [dbo].[LinkedProductsWithProperty].[PropertyCode]  = @PropertyCode
END
GO
