#Requires -Version 7.0
Param ( [Parameter(Mandatory=$True)] [ValidateNotNull()] [string] $bedsfilename, `
        [Parameter(Mandatory=$False)] [ValidateNotNull()] [string] $filtercol, `
        [Parameter(Mandatory=$False)] [ValidateNotNull()] [string] $filterval `
       )

# Get SQL credentials
$sqlparms = ./Get-SQLCredential.ps1
$server = $sqlparms['server']
$user   = $sqlparms['userid']
$pswd   = $sqlparms['password']


# Process the CA Healthcare Beds datafile
python CleanXLSX.py $bedsfilename "tmp_beds.dat"

Write-Host "Loading CA Beds data into SQL Server using bcp..."
bcp NPPES.dbo.healthcare_facility_beds IN tmp_beds.dat -f beds_format.xml -e error.dat -m 10 -U $user -P $pswd -S $server
