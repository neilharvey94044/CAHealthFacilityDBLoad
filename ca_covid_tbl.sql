USE NPPES
DROP TABLE [dbo].[ca_covid];
GO
CREATE TABLE [dbo].[ca_covid] (
	[COUNTY_NAME] nvarchar(50) not null,
	[DATE] date not null,
	[TOTAL_COUNT_CONFIRMED] int null,
	[TOTAL_COUNT_DEATHS] int null,
	[COVID_19_POSITIVE_PATIENTS] int null,
	[SUSPECTED_COVID_19_POSITIVE_PATIENTS] int null,
	[ICU_COVID_19_POSITIVE_PATIENTS] int null,
	[ICU_COVID_19_SUSPECTED_PATIENTS] int null
);
GO
