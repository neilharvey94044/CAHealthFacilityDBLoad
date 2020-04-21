#Requires -Version 7.0
Param ( [Parameter(Mandatory=$True)] [ValidateNotNull()] [string] $cvtfilename)
       

# Get SQL credentials
$sqlparms = ./Get-SQLCredential.ps1
$server = $sqlparms['server']
$user   = $sqlparms['userid']
$pswd   = $sqlparms['password']


# Load the Covid Tracking Project Current Data to the NPPES Database
python Load-cvt_current.py $cvtfilename $user $pswd $server

