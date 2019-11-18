---
title: "Exporting and Importing Companies and Other Data"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 5e56d72d-3b98-4f9c-b8ac-1617ed363d3e
caps.latest.revision: 13
---
# Exporting and Importing Companies and Other Data
You can export a company from a [!INCLUDE[navnow](includes/navnow_md.md)] database and import it into another database, and you can export and import other types of data such as global data, application data, and application objects.  
  
 In earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)], you exported and imported this type of data as part of backing up and restoring databases. In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], you can do this by using the **Export-NAVData** and **Import-NAVData** Windows PowerShell cmdlets. You can also import and export data in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and the [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
> [!IMPORTANT]  
>  If you want to back up data, we recommend that you use the SQL Server management tools.  
  
## Reuse of Companies, Data, and Applications  
 You can back up and restore databases using the SQL Server management tools, but sometimes you want to move only part of the data in a database to another database. For example, you can set up a test environment in a [!INCLUDE[navnow](includes/navnow_md.md)] database with a demonstration company. You can then export that demonstration company and import it in other databases so you can train users in your solution. In other cases, you want to export application objects and metadata in order to solve a problem in an existing customer's database without taking the customer offline, for example. In those cases, you can export the relevant data to a file and share the data that way.  
  
 When you export data from a [!INCLUDE[navnow](includes/navnow_md.md)] database, the data is stored in a file with the extension **.navdata**. This file cannot be modified in external tools. The data that you export is not deleted from the original database.  
  
> [!WARNING]  
>  When you export data to a .navdata file, you must import the data into a database that is compatible with the data in the .navdata file. For example, you cannot import a company into a database that has a different database schema, and you cannot import [!INCLUDE[nav7long](includes/nav7long_md.md)] data into a [!INCLUDE[navnowlong](includes/navnowlong_md.md)] database. Also, you must import a company into a database that contains the data and application that the company's data depends on.  
  
 This means that you must import a company into a database that is based on the same application as in the database that the company was exported from.  
  
> [!IMPORTANT]  
>  If you export companies and other data that is secured by data encryption, then remember to also export the encryption key so that you can access the data after you import it into another database, for example when you restore a backup. For more information, see <!-- [Manage Data Encryption](Manage-Data-Encryption.md). --> [Manage Data Encryption](https://msdn.microsoft.com/library/dn757244.aspx)
  
### What to Export  
 You can export specific sets of data, such as a company or other data. The following table describes what is exported depending on your choices.  
  
|Type of data|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|------------------|---------------------------------------|  
|Company|Exports the specified company or companies, or all companies in the database. This includes the company-specific business data but no other data.|  
|Global data|Exports data that is common to all companies in the database. This includes the report list, user IDs, and printer selections, but no company-specific business data.|  
|Application data|Exports the data that defines the application in the database. This includes the permissions, permission sets, profiles, and style sheets.|  
|Application|Exports all application objects. Data is not included.<br /><br /> This is similar to exporting all objects to an .fob file.|  
  
### What to Import  
 You can import all data from a .navdata file, or you can choose the data that you want to import. For example, if the file contains four companies, you can choose to import only one company. Similarly, if the file contains all data, you can choose to import only global data, for example. To import applications, you must use the **Import-NAVData** Windows PowerShell cmdlet. You can import other data, such as companies, in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and the [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
 You can export and import the four types of data in different combinations. However, you must maintain database integrity and not leave databases in a state when you cannot open [!INCLUDE[navnow](includes/navnow_md.md)].  
  
> [!IMPORTANT]  
>  If you import application data but not the application, you cannot access the database from [!INCLUDE[navnow](includes/navnow_md.md)]. Similarly, if you import global data into a database that does not contain a company, you cannot open [!INCLUDE[navnow](includes/navnow_md.md)].  
>   
>  Also, we recommend that you do not import an application into a database that users are accessing. A new application often defines a new database schema that changes the structure of the business data.  
  
### Windows PowerShell Cmdlets  
 You can import and export data in the [!INCLUDE[nav_shell](includes/nav_shell_md.md)]. The following table describes the available Windows PowerShell cmdlets. For more information, see [Administration Cmdlets for Microsoft Dynamics NAV](https://go.microsoft.com/fwlink/?LinkID=296818).  
  
|Name|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|----------|---------------------------------------|  
|**Export-NAVData**|Exports data from a [!INCLUDE[navnow](includes/navnow_md.md)] database. You can export company-specific data, and you can choose to include global data, application data, or application objects.|  
|**Import-NAVData**|Imports data into a [!INCLUDE[navnow](includes/navnow_md.md)] database from a file. You can import all data in the file, or you can choose to include specific companies, global data, application data, or application objects.<br /><br /> You can only import an application into an empty database.|  
|**Get-NAVDataFile**|Gets information from a file that has been exported from a [!INCLUDE[navnow](includes/navnow_md.md)] database.<br /><br /> The extracted information includes the types of data that the file contains and any company names.|  
  
 The cmdlets take different parameter sets depending on how you connect to the database that you want to export data from or import data into. You can access the database through the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, or you can access the database directly as described in the following table.  
  
|Access|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|------------|---------------------------------------|  
|Through the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.|Use parameter sets that include *–ServerInstance* when the database that you want to access is mounted against a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.<br /><br /> The user account for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance must have access to write to the location that is specified by the *–FilePath* parameter.|  
|Through a direct connection to the database.|Use parameter sets that include *–DatabaseServer* and *–DatabaseName* when the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is stopped or not available. For example, if you want to import an updated application into a database, you stop the service so that users cannot access the database.<br /><br /> You must have access to write to the location that is specified by the *–FilePath* parameter.|  
  
 In multitenant deployments of [!INCLUDE[navnow](includes/navnow_md.md)], if you export or import business data, you must specify the ID of the tenant database. If you export or import applications, you must specify the application database and database server. You can only import application data if the specified tenant is mounted with the *–AllowAppDatabaseWrite* parameter.  
  
### C/AL Functions  
 You can use the following C/AL functions to handle export and import of data programmatically:  
  
-   [EXPORTDATA Function \(Database\)](EXPORTDATA-Function--Database-.md)  
  
-   [IMPORTDATA Function \(Database\)](IMPORTDATA-Function--Database-.md)  
  
-   [DATAFILEINFORMATION Function \(Database\)](DATAFILEINFORMATION-Function--Database-.md)  
  
 For examples of how to use these functions, see page 9900 and 9901 in the [!INCLUDE[demolong](includes/demolong_md.md)].  
  
## See Also  
 [How to: Export and Import Companies and Other Data using Windows PowerShell Cmdlets](How-to--Export-and-Import-Companies-and-Other-Data-using-Windows-PowerShell-Cmdlets.md)   
 [How to: Export and Import Companies and Other Data in Clients](How-to--Export-and-Import-Companies-and-Other-Data-in-Clients.md)   
 [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md)