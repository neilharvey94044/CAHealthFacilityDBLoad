#Requires -Version 7.0
# Creates the CA Health Location tables
# CAUTION!!! - DROPS ALL THE EXISTING TABLES USED BY THIS DATA LOAD
$sqlparms = ./Get-SQLCredential.ps1
$user   = $sqlparms['userid']
$pswd   = $sqlparms['password']
$server = $sqlparms['server']

Write-Host "Processing nppes_database.sql"
sqlcmd -e -i nppes_database.sql -S $server -U $user -P $pswd 

Write-Host "Processing healthcare_facility_locations_tbl.sql"
sqlcmd -e -i healthcare_facility_locations_tbl.sql -S $server -U $user -P $pswd 

Write-Host "Processing healthcare_facility_beds_tbl.sql"
sqlcmd -e -i healthcare_facility_beds_tbl.sql -S $server -U $user -P $pswd 

Write-Host "Processing healthcare_facility_services_tbl.sql"
sqlcmd -e -i healthcare_facility_services_tbl.sql -S $server -U $user -P $pswd 
