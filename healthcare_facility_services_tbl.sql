USE NPPES
DROP TABLE [dbo].[healthcare_facility_services];
GO
CREATE TABLE [dbo].[healthcare_facility_services] (
	[FACID] numeric not null,
	[FACNAME] nvarchar(100) not null,
	[FAC_TYPE_CODE] nvarchar(50) not null,
	[FAC_FDR] nvarchar(50) not null,
	[SERVICE_TYPE_CODE] nvarchar(50) not null,
	[SERVICE_TYPE_NAME] nvarchar(100) not null,
	[SERVICE_OTHER_NAME] nvarchar(50) null,
	[IS_OFFSITE_SERVICE] nvarchar(50) not null,
	[OFFSITE_NAME] nvarchar(100) null,
	[OFFSITE_ADDRESS1] nvarchar(50) null,
	[OFFSITE_CITY] nvarchar(50) null,
	[OFFSITE_STATE] nvarchar(50) null,
	[OFFSITE_ZIP] nvarchar(50) null,
	[COUNTY_NAME] nvarchar(50) not null,
	[START_DATE] date not null,
	[LONGITUDE] nvarchar(50) null,
	[LATITUDE] nvarchar(50) null,
	[LOCATION] nvarchar(50) not null
);
GO
	
