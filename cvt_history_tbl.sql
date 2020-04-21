USE [NPPES]
GO
DROP TABLE [dbo].[cvt_history];
GO
CREATE TABLE [dbo].[cvt_history](
	[date] [date] NULL,
	[state] [varchar](2) NULL,
	[positive] [int] NULL,
	[negative] [int] NULL,
	[pending] [int] NULL,
	[hospitalizedCurrently] [int] NULL,
	[hospitalizedCumulative] [int] NULL,
	[inIcuCurrently] [int] NULL,
	[inIcuCumulative] [int] NULL,
	[onVentilatorCurrently] [int] NULL,
	[onVentilatorCumulative] [int] NULL,
	[recovered] [int] NULL,
	[hash] [varchar](40) NULL,
	[dateChecked] [datetimeoffset](0) NULL,
	[death] [int] NULL,
	[hospitalized] [int] NULL,
	[total] [int] NULL,
	[totalTestResults] [int] NULL,
	[posNeg] [int] NULL,
	[fips] [int] NULL,
	[deathIncrease] [int] NULL,
	[hospitalizedIncrease] [int] NULL,
	[negativeIncrease] [int] NULL,
	[positiveIncrease] [int] NULL,
	[totalTestResultsIncrease] [int] NULL
); 
GO


