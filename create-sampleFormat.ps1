#Requires -Version 7.0
# Provided in case someone needs to create a format file for bcp
# bcp is VERY finicky, difficult to get the parms correct

# Get SQL credentials
$sqlparms = ./Get-SQLCredential.ps1
$server = $sqlparms['server']
$user   = $sqlparms['userid']
$pswd   = $sqlparms['password']

bcp NPPES.dbo.healthcare_facility_beds format nul -f beds_format.xml -x -c -t '|' -S $server -U $user -P $pswd 

