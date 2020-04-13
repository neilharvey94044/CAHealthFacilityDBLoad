import csv, sys, openpyxl

# Input file is a .xlsx file.  The output file is a .csv file that does not quote columns and uses the pipe delimiter.
# Unconditionally skips the first record, assumed to be the csv header record, and skips records with null in
# the first column.
# This script optionally filters the input file by a value in a specified column.
# Command line as follows:
# python CleanXLSX.py <input file name> <output file name> <filter col number> <filter value>


inputfile, outputfile = sys.argv[1], sys.argv[2]
if len(sys.argv) > 3:
	filtercol=(int) (sys.argv[3])
	filterval=sys.argv[4]
	filter=True
else:
	filtercol = 0
	filterval = '*'
	filter = False

writecount, readcount, rejectcount = 0, 0, 0
rejectfile = "xlsx_rejects.dat"

print("Input File :", inputfile)
print("Output File:", outputfile)
print("Reject File:", rejectfile)

workbook = openpyxl.load_workbook(inputfile, read_only=True) 
sheet = workbook.active
with    open(outputfile, mode='w', newline='') as csvoutfile, \
	open(rejectfile, mode='w', newline='') as rejects:
	datawriter = csv.writer(csvoutfile, delimiter='|', quoting=csv.QUOTE_NONE, escapechar='\\')
	rejectwriter = csv.writer(rejects, delimiter='|', quoting=csv.QUOTE_NONE, escapechar='\\')
	for row in sheet.iter_rows(values_only=True):
		readcount += 1
		if readcount == 1 or row[0] == None: # skip the header record and null first column
			rejectwriter.writerow(row)
			rejectcount += 1
			continue
		elif readcount % 100000 == 0:
			print("Records read:   ", readcount, "\nRecords written:", writecount)
		elif filter: 
			if (row[filtercol] == filterval):
				datawriter.writerow(row)
				writecount += 1
			else:
				rejectwriter.writerow(row)
				rejectcount += 1

		else:
			datawriter.writerow(row)
			writecount += 1

print("Records read:    ", readcount, "\nRecords written: ", writecount, "\nRecords rejected:", rejectcount)
