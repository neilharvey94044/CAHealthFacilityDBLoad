#Requires -Version 7.0
# Downloads files from the California Health and Human Services (CHHS) Open Data Portal
# The URLs are likely to change and can be easily updated in this file to the new values.

# California Healthcare Facility Locations File
$locationsURL = [URI]"https://data.chhs.ca.gov/dataset/3b5b80e8-6b8d-4715-b3c0-2699af6e72e5/resource/0a0476ba-442c-40ff-97dc-dc840fa7e907/download/healthcare_facility_locations.xlsx"
$locationsFileName = $locationsURL.LocalPath | Split-Path -Leaf
Invoke-WebRequest -URI $locationsURI -Outfile $locationsFileName


# California Healthcare Facility Services File
$servicesURL = [URI] "https://data.chhs.ca.gov/dataset/6dacdf5b-fde6-4d0e-ab83-4c062fd9c382/resource/96d94608-e9d7-4fa8-b818-db848432360f/download/healthcare_facility_services.xlsx"
$servicesFileName = $servicesURL.LocalPath | Split-Path -Leaf
Invoke-WebRequest -URI $servicesURI -Outfile $servicesFileName

# California Healthcare Facility Beds File
$bedsURL = [URI] "https://data.chhs.ca.gov/dataset/09b8ad0e-aca6-4147-b78d-bdaad872f30b/resource/0997fa8e-ef7c-43f2-8b9a-94672935fa60/download/healthcare_facility_beds.xlsx"
$bedsFileName = $bedsURL.LocalPath | Split-Path -Leaf
Invoke-WebRequest -URI $bedsURI -Outfile $bedsFileName

