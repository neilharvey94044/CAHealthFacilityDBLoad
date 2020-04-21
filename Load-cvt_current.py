import pyodbc, csv, sys

# Non-generic python program to load the Covid Tracking Project Current data into
# the NPPES database.  I was very pleased to discover how easy this is using
# python compared to bcp and SSIS.  I was especially surprised to discover how well
# the pyodbc package handled the conversion from csv text to SQL column types; no effort
# on my part.

inputfile = sys.argv[1]
userid = sys.argv[2]
password = sys.argv[3]
server = sys.argv[4]
writecount, readcount, fldnum = 0, 0, 0

connstr = f'Driver=ODBC Driver 17 for SQL Server;Server={server};UID={userid};PWD={password};Database=NPPES;'

sqlinsert1 = """
insert into dbo.cvt_current(
state, 
positive,
positiveScore,
negativeScore,
negativeRegularScore,
commercialScore,
grade,
score,
negative,
pending,
hospitalizedCurrently,
hospitalizedCumulative,
inIcuCurrently,
InIcuCumulative,
onVentilatorCurrently,
onVentilatorCumulative,
recovered,
lastupdateEt,
checkTimeEt,
death,
hospitalized,
total,
totalTestResults,
posNeg,
fips,
dateModified,
dateChecked,
notes,
hash)
values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
"""


print("Input File :", inputfile)
conn = pyodbc.connect(connstr)
cursor = conn.cursor()

with open(inputfile, mode='r') as csvinfile:
	datareader = csv.reader(csvinfile)
	for row in datareader:
		readcount += 1
		if readcount == 1: # skip the header record
			print('skipping header record')
			continue
		else:
			writecount += 1
			cursor.execute(sqlinsert1, row)
conn.commit()
conn.close()
print("Records read:   ", readcount, "\nRecords written:", writecount)
