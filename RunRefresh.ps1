#Requires -Version 7.0
# This script is a master that executes all the required scripts.
# Put along with all other scripts into a single directory.  Clean
# out old .dat, .csv, .zip files ahead of time.
# Rather than thinking of it as the one and only way to refresh
# the California Healthcare Facility data, think of it as a model to follow for running the
# scripts for a full data refresh.  Comment out the scripts you don't need to run.
# The following tables are loaded:
# 	NPPES.dbo.healthcare_facility_locations
#	NPPES.dbo.healthcare_facility_services
#	NPPES.dbo.healthcare_facility_beds
#
# This script assumes you have already captured your SQL Server credentials
# into password.json by running the script Put-SQLCredential.ps1


# Step 1 - Download the necessary data
#TODO: edit this file
#./Get-CAData.ps1 

# Step 2 - Start the SQL Server instance in Docker
#./Start-SQLServer.ps1

# Step 3 - Create the required tables
#./Create-CATables.ps1

# Step 4 - Filter and load the CA Locations data
#$locfilename = "healthcare_facility_locations.xlsx"
#./Process-CALocations.ps1 $locfilename

# Step 5 - Filter and load the CA Services data
#$svcfilename = "healthcare_facility_services.xlsx"
#./Process-CAServices.ps1 $svcfilename

# Step 6 - Filter and load the CA Beds data
$bedsfilename = "healthcare_facility_beds.xlsx"
./Process-CABeds.ps1 $bedsfilename
