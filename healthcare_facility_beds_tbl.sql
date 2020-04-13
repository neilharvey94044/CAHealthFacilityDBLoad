USE NPPES
DROP TABLE [dbo].[healthcare_facility_beds];
GO
CREATE TABLE [dbo].[healthcare_facility_beds] (
	[FACID] numeric not null,
	[FACNAME] nvarchar(100) not null,
	[FAC_FDR] nvarchar(50) not null,
	[BED_CAPACITY_TYPE] nvarchar(50) not null,
	[COUNT_BEDS] int not null,
	[COUNTY_NAME] nvarchar(50) not null
);
GO
