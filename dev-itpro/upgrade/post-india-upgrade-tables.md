---
    title: Publish, Synchronize and Install the ‘IndiaUpgradeTables’ extension
    description: Specifies Basic Process for Publishing, Synchronizing and Installing the ‘IndiaUpgradeTables’ extension

    author: v-debapd

    ms.service: dynamics365-business-central
    ms.topic: article
    ms.devlang: na
    ms.tgt_pltfrm: na
    ms.workload: na
    ms.search.keywords: India, local, IN, English
    ms.date: 09/01/2021
    ms.author: v-debapd

---
# Publish, Synchronize and Install the ‘IndiaUpgradeTables’ extension

1. Publish, Synchronize and Install the ‘IndiaUpgradeTables’ extension available under the Extension folder in DVD.

	> [!Note]
   >
   > For any Customer specific customization in these tables, the customized fields must be merged in the ‘IndiaUpgradeTables’ extension. 

   This only required the customer specific fields to be merged, without code. When the schema synchronization run at the later stage, it will transfer the data to the ‘IndiaUpgradeTables’ extension tables.


      a) Publish the ‘IndiaUpgradeTables’ extension by running the Publish-NAVApp cmdlet:
   
      ```Powershell
      Publish-NAVApp -ServerInstance <ServerInstanceName> -Path <ExtensionFileName> 
      ```

      b) Synchronize the extension with the database by running the Sync-NAVApp cmdlet for ‘IndiaUpgradeTables’ extension:
      
      ```Powershell
      Sync-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
      ``` 
     c) Run the following command to install it:
     
      ```Powershell
      Install-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N> 
      ```
2. Delete the India localized objects tables in the range between 13000 to 16599, with Schema Synchronization as ‘Later’

3. Delete all objects except tables in the database.
4. Import the Business Central April 2019 releaseW1 objects (all objects), with ‘Replace all’ option in import worksheet and schema synchronization as later.

  > [!Note]
  >    
  > Any customer specific fields created in the W1 Tables, has to be merged in the Business Central14 W1 tables.

   This only requires the customized fields to be added in the table, without code.

5. Import the Upgrade Toolkit objects available under the folder, \\UpgradeToolKit\Local Objects\Upgrade90014x.IN.fob, with ‘Replace all’ option in import worksheet and schema synchronization as later.

  > [!Note]
  >    
  > Any customer specific fields created in the below tables, has to be merged in the Upgrade90014x.IN.fob.

>    ```Powershell
>      - Custom Report Layout
>      - Custom Report Selection
>      - Item
>      - Nonstock Item
>      - Product Group
>      - Document Sending Profile
>      - Company Information
>      - Approval Comment Line
>      - SMTP Mail Setup
>      - Report Layout Selection
>      - Job
>      - Sales Invoice Header
>      - Sales Cr. Memo Header
>      - Purch. Inv. Header
>      - Purch. Cr. Memo Hdr.
>      - Item Category
>    ```

6.	Run the schema synchronization with validation to synchronize the database schema changes

7.	Run the Data Upgrade.
8.	Generate the application symbol references by using the finsql.exe file.

      Open a command prompt as an administrator, change to the directory where the finsql.exe file has been installed as part of Dynamics NAV Development Environment, and then run the following command:
  
       ```Powershell
       finsql.exe Command=generatesymbolreference,  ServerName=<DatabaseServerName>\<DatabaseInstance>, Database="<MyDatabaseName>"
       ``` 
    Replace values for the Database and ServerName settings to suit.
  
  > [!Note]
  >    
  > This command does not generate a file. It populates the Object Metadata table in the database.

9.	 Publish Sync & Install the below extension available in the DVD under the Extension folder in DVD.
     - IndiaTaxBase - Path {..\Extension\ IndiaTaxBase.app}
     - IndiaTaxEngine-Path {..\Extension\ IndiaTaxEngine.app}
     - IndiaTaxGST-Path {..\Extension\ IndiaTaxGST.app}
     - IndiaUPGTCS-Path {..\Extension\ IndiaUPGTCS.app}
     - IndiaUPGTDS-Path {..\Extension\ IndiaUPGTDS.app}
     - INFADepreciation-Path {..\Extension\ INFADepreciation.app}
     - INGateEntry-Path {..\Extension\ INGateEntry.app}
     - INVoucherInterface-Path {..\Extension\ INVoucherInterface.app}
     - UPGIndia -Path {..\Extension\ UPGIndia.app}

10. Custom Extensions created for Business Central 2021 release wave 2, must be Published in Business Central April 2019 release with Tables and tables extensions.  
11.	Publisher is provided for each of the Upgrade tables, these publishers must be subscribed for migrating the data. Using these subscriber, customized fields data has to be migrated to the Custom extension created in Business Central April 2019 release.
12.	Run the client and open the ‘Transfer Data’ Page. Run the ‘Start Data Migration’ process for each company.

  > [!Note]
  >
  > ‘Start Data Migration’ process has to be run separately for each company. In case of any error message (error text will be logged and displayed in the ‘Error Text’), correct the error and run the process again. Process will start again after the last known error.

13.	Delete data - After the completion of ‘Start Data Migration’ activity, run the ‘Delete upgrade table data for each company. This will clean the data from the temporary tables created for migration purpose.


## See Also 
[Upgrading to Business Central](Upgrading-to-business-central.md)
 
