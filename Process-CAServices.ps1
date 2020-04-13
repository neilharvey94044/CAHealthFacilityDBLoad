#Requires -Version 7.0
Param ( [Parameter(Mandatory=$True)] [ValidateNotNull()] [string] $svcfilename, `
        [Parameter(Mandatory=$False)] [ValidateNotNull()] [string] $filtercol, `
        [Parameter(Mandatory=$False)] [ValidateNotNull()] [string] $filterval `
       )

# Get SQL credentials
$sqlparms = ./Get-SQLCredential.ps1
$server = $sqlparms['server']
$user   = $sqlparms['userid']
$pswd   = $sqlparms['password']


# Process the CA Healthcare Services datafile
python CleanXLSX.py $svcfilename "tmp_svc.dat"

Write-Host "Loading CA Services into SQL Server using bcp..."
bcp NPPES.dbo.healthcare_facility_services IN tmp_svc.dat -f svc_format.xml -e error.dat -m 10 -U $user -P $pswd -S $server
