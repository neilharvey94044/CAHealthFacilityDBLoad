USE [NPPES]
GO

DROP TABLE [dbo].[cvt_current];
GO
CREATE TABLE [dbo].[cvt_current](
	[state] [varchar](2) NULL,
	[positive] [int] NULL,
	[positiveScore] [smallint] NULL,
	[negativeScore] [smallint] NULL,
	[negativeRegularScore] [smallint] NULL,
	[commercialScore] [smallint] NULL,
	[grade] [varchar](1) NULL,
	[score] [smallint] NULL,
	[negative] [int] NULL,
	[pending] [smallint] NULL,
	[hospitalizedCurrently] [smallint] NULL,
	[hospitalizedCumulative] [int] NULL,
	[inIcuCurrently] [smallint] NULL,
	[inIcuCumulative] [smallint] NULL,
	[onVentilatorCurrently] [smallint] NULL,
	[onVentilatorCumulative] [smallint] NULL,
	[recovered] [smallint] NULL,
	[lastUpdateEt] [varchar](11) NULL,
	[checkTimeEt] [varchar](11) NULL,
	[death] [smallint] NULL,
	[hospitalized] [int] NULL,
	[total] [int] NULL,
	[totalTestResults] [int] NULL,
	[posNeg] [int] NULL,
	[fips] [smallint] NULL,
	[dateModified] [datetime] NULL,
	[dateChecked] [datetime] NULL,
	[notes] [varchar](81) NULL,
	[hash] [varchar](44) NULL
) ON [PRIMARY]
GO


