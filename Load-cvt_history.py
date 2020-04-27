from datetime import datetime
import pyodbc, csv, sys

# Non-generic python program to load the Covid Tracking Project historical data into
# the NPPES database.  

inputfile = sys.argv[1]
userid = sys.argv[2]
password = sys.argv[3]
server = sys.argv[4]
writecount, readcount, fldnum = 0, 0, 0

connstr = f'Driver=ODBC Driver 17 for SQL Server;Server={server};UID={userid};PWD={password};Database=NPPES;'

sqlinsert1 = """
insert into dbo.cvt_history(
date,
state,
positive,
negative,
pending,
hospitalizedCurrently,
hospitalizedCumulative,
inIcuCurrently,
inIcuCumulative,
onVentilatorCurrently,
onVentilatorCumulative,
recovered,
hash,
dateChecked,
death,
hospitalized,
total,
totalTestResults,
posNeg,
fips,
deathIncrease,
hospitalizedIncrease,
negativeIncrease,
positiveIncrease,
totalTestResultsIncrease

)
values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )
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
			date_object = datetime.strptime(row[0], "%Y%m%d")
			row[0] = date_object.strftime("%Y-%m-%d")
			writecount += 1
			cursor.execute(sqlinsert1, row)
conn.commit()
conn.close()
print("Records read:   ", readcount, "\nRecords written:", writecount)
