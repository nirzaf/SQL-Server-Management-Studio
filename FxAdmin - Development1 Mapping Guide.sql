select * from Product
select * from HoldingCompany
select * from [Group]
select * from Property
-- Property <> Product Map Table Missing 
Select * from LinkedProductsWithProperty

select * from [User]
-- User <> Property Group Map Table Missing
-- User <> Property Map Table Missing
select * from UserProduct


select * from sso_Products
select * from holdingcompany where holdcompany = 39
select * from GroupCompany where groupcompany = 40749
select * from HotelInfo where pmscustcode = 7520
select * from sso_ProductLicenses where pmscustomercode = 7520
select * from sso_users where defaultpmscode = 7520  and loginid = 'user3@idsnext.com'
select * from sso_userPropertyGroups where loginid = 'user3@idsnext.com'
select * from sso_userProperties where loginid = 'user3@idsnext.com'
select * from sso_userProducts where loginid = 'user3@idsnext.com'
