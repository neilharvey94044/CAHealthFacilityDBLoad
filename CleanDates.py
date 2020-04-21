from datetime import datetime
import csv, sys

# Takes the following parameters:
# 	inputfile - pipe delimited csv file with date fields to be reformated
#	outputfile - pipe delimited csv file with reformated dates
#	date reformat template    - contains zero based index to date column
#				  - input date template string, e.g. "%m/%d/%Y"
#				  - output date template string, e.g. "%Y-%m-%d'
#				each date to be reformated is separated by a pipe delimiter
#				each of the above are delimited by a ","
#				sample parameter string: "1,%m/%d/%Y,%Y-%m-%d|8,%m/%d/%Y,%Y-%m-%d"
#				reformats dates in columns 1 and 8.

inputfile, outputfile, dateparms = sys.argv[1], sys.argv[2], sys.argv[3]

d = dateparms.split('|')
parms = []
for col in d:
	parms.append(col.split(','))

writecount, readcount, fldnum = 0, 0, 0

print("Input File :", inputfile)
print("Output File:", outputfile)

with open(inputfile, mode='r') as csvinfile, \
	 open(outputfile, mode='w', newline='') as csvoutfile:
	datawriter = csv.writer(csvoutfile, delimiter='|', quoting=csv.QUOTE_NONE, escapechar='\\')
	datareader = csv.reader(csvinfile, delimiter='|')
	for row in datareader:
		readcount += 1
		if readcount % 100000 == 0:
			print("Records read:   ", readcount, "\nRecords written:", writecount)
		for i in range(len(parms)):
			date_object = datetime.strptime(row[int(parms[i][0])], parms[i][1] )
			row[int(parms[i][0])] = date_object.strftime(parms[i][2])
		datawriter.writerow(row)
		writecount += 1

print("Records read:   ", readcount, "\nRecords written:", writecount)
