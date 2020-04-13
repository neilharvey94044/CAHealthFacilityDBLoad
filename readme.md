# California Health and Human Services Data Load
### **Project:** Batch Process for Loading CA HHS Data Into SQL Server
### **Author**:     [Neil Harvey](https://www.linkedin.com/in/neil-harvey-07009a2a/)
### **Date**:       April 2020 (during Covid-19 Shelter In Place Order)
### **Tools**:    Powershell 7 scripts, Python 3.7, Openpyxlsx, Transact-SQL, bcp, SQL Server 2019
### **What is CA HHS Data**?
The data loaded by this project contains health care facilities information, including locations, services provided, numbers and types of beds, etc..  This project downloads and loads these files into a SQL Server Database.  As of October 2019, this California specific data can be combined with NPPES data using the National Provider ID for integrated queries of California Provider and Facilities information.  
Additional information at [CHHS](https://data.chhs.ca.gov/).

The SQL Server I used is running in Docker desktop with image "mcr.microsoft.com/mssql/server:2019-CU3-ubuntu-18.04".  You can target any SQL Server instance by specifying the desired server name when you run the Put-SQLCredential.ps1 script - see below.  


#### Project Goals:
- Each step should be scripted, requiring minimal or no human intervention
- Download and unzipping of the following data files:
  - Healthcare Facilities Locations
  - Healthcare Facilities Services
  - Healthcare Facilities Beds
- Wrangle the .xlsx files into a format that can be loaded using bcp
- Create required database and tables in SQL Server
- bcp load into the SQL Server tables

#### Files and Steps
- **Put-SQLCredential.ps1**
  - Run this first; captures your credentials and server name.
- **RunRefresh.ps1**
    - Runs all child scripts required to download, clean, format, create tables, and load data to the database.  Assumes you have already executed Put-SQLCredential.ps1 to capture your SQL server name, user ID, and password - stored encrypted in password.json.
    Review the steps and ensure the ones you need are uncommented.  For example, starting SQL Server is a step that is commented out.



  #### Related Projects
  ### NPPES-Data-Load - National Provider data load to SQL server.
  ### CAHealthQueries  - C# queries against healthcare data.
  ### CAHealthREST - a REST API for the npidata.  Written in C# using ASP.NET Core.
