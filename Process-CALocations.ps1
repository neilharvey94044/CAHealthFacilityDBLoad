#Requires -Version 7.0
Param ( [Parameter(Mandatory=$True)] [ValidateNotNull()] [string] $locfilename, `
        [Parameter(Mandatory=$False)] [ValidateNotNull()] [string] $filtercol, `
        [Parameter(Mandatory=$False)] [ValidateNotNull()] [string] $filterval `
       )

# Get SQL credentials
$sqlparms = ./Get-SQLCredential.ps1
$server = $sqlparms['server']
$user   = $sqlparms['userid']
$pswd   = $sqlparms['password']


# Process the CA Healthcare Locations datafile; cleans and filters for the state of California
python CleanXLSX.py $locfilename "tmp_locs.dat"

Write-Host "Loading CA Locations into SQL Server using bcp..."
bcp NPPES.dbo.healthcare_facility_locations IN tmp_locs.dat -f locs_format.xml -e error.dat -m 10 -U $user -P $pswd -S $server
