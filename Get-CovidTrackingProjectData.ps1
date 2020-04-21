#Requires -Version 7.0
# Downloads files from the Covid Tracking Project - https//covidtracking.com
# The URLs are likely to change and can be easily updated in this file to the new values.

# Gets the State Current Values
$cvtURI = [URI] "https://covidtracking.com/api/v1/states/current.csv"
$cvtFileName = $cvtURI.LocalPath | Split-Path -Leaf
Invoke-WebRequest -URI $cvtURI -Outfile ("cvt_"+ $cvtFileName)

