#Requires -Version 7.0
Param ( [Parameter(Mandatory=$True)] [ValidateNotNull()] [string] $covidfilename, `
        [Parameter(Mandatory=$False)] [ValidateNotNull()] [string] $filtercol, `
        [Parameter(Mandatory=$False)] [ValidateNotNull()] [string] $filterval `
       )

# Get SQL credentials
$sqlparms = ./Get-SQLCredential.ps1
$server = $sqlparms['server']
$user   = $sqlparms['userid']
$pswd   = $sqlparms['password']


# Process the CA Healthcare Beds datafile
#python CleanCSV.py $covidfilename "tmp_covid.dat"

# Reformat the date column so it loads in bcp
$dateparms = '1,%m/%d/%Y,%Y-%m-%d' 
python CleanDates.py tmp_covid.dat tmp1_covid.dat $dateparms

Write-Host "Loading CA Covid data into SQL Server using bcp..."
bcp NPPES.dbo.ca_covid IN tmp1_covid.dat -f covid_format.xml -e error.dat -m 10 -U $user -P $pswd -S $server
