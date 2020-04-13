import csv, sys, openpyxl

# This script filters an .xlsx file by the value in a specified column.
# The output file is a .csv file that does not quote columns and uses the pipe delimiter.
# Command line as follows:
# python CleanXLSX.py <input file name> <output file name> <col number> <filter value>


inputfile, outputfile = sys.argv[1], sys.argv[2]
if len(sys.argv) > 3:
	filtercol=(int) (sys.argv[3])
	filterval=sys.argv[4]
	filter=True
else:
	filtercol = 0
	filterval = '*'
	filter = False

writecount, readcount, fldnum = 0, 0, 0

print("Input File :", inputfile)
print("Output File:", outputfile)

workbook = openpyxl.load_workbook(inputfile, read_only=True) 
sheet = workbook.active
with open(outputfile, mode='w', newline='') as csvoutfile:
	datawriter = csv.writer(csvoutfile, delimiter='|', quoting=csv.QUOTE_NONE, escapechar='\\')
	for row in sheet.iter_rows(values_only=True):
		readcount += 1
		if readcount == 1: # skip the header record
			continue
		elif readcount % 100000 == 0:
			print("Records read:   ", readcount, "\nRecords written:", writecount)
		elif filter: 
			if (row[filtercol] == filterval):
				datawriter.writerow(row)
				writecount += 1
		else:
			datawriter.writerow(row)
			writecount += 1

print("Records read:   ", readcount, "\nRecords written:", writecount)
