---
title: Create Databases
description: Create a new Dynamics NAV database in the development environment and by using the New-NAVDatabase cmdlet in the Administration Shell. 
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 2263326d-f1b1-459f-9c82-a94be9eaef6a
caps.latest.revision: 9
author: jswymer
---
# Creating Databases
You can create new [!INCLUDE[navnow](includes/navnow_md.md)] databases in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] and by using the [New-NAVDatabase](https://go.microsoft.com/fwlink/?LinkID=401374) cmdlet in the [!INCLUDE[nav_shell_md](includes/nav_shell_md.md)].  

 When you create a database you must specify the SQL Server instance for the database and the authentication type.  

### To download symbols
Before you create a database, you must make sure to download symbols first.

1. Download the [platform symbols](https://go.microsoft.com/fwlink/?linkid=864045), the [test symbols](https://download.microsoft.com/download/C/7/9/C79AF269-A67E-4EEF-B9F2-52FAFA43E026/Microsoft_Test_11.0.19680.0.app), and the [application symbols](https://download.microsoft.com/download/C/7/9/C79AF269-A67E-4EEF-B9F2-52FAFA43E026/Microsoft_Application_11.0.19738.0.app).  
Make a note of the location where you store the files. 
2. Publish the symbol files, one file at a time to the Dynamics NAV Server instance:  
Open the [!INCLUDE[nav_shell](includes/nav_shell_md.md)] as an administrator, and run the following command for each of the symbol files:

    ```
    Publish-NAVApp -ServerInstance <ServerInstanceName> -Path <SymbolFilePath> -PackageType SymbolsOnly
    ```


### To create a database  

1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **File** menu, choose **Database**, and then choose **New**.  

2.  In the **Server Name** field, enter the name of the SQL Server instance. You can choose the up arrow to select the server from a list of available servers or you can enter the server name manually.  

3.  In the **Authentication** field, select the type of authentication that you require. Choose the drop-down arrow to select **Database Server Authentication** or **Windows Authentication**.  

    -   If you select **Database Server Authentication**, then authentication is performed by the SQL Server instance that you have selected.  

    -   If you select **Windows Authentication**, then authentication is performed by the Windows domain controller.  

4.  In the **User ID** field, enter your User ID if you have selected **Database Server Authentication**.  

5.  In the **Password** field, enter your password if you have selected **Database Server Authentication**.  

6.  To set the network type to be used when connecting to the server, choose the **Advanced** tab and select the net type from the drop down list box in the **Net Type** field. However, it is not usually necessary to change the network type from the default setting. The **Default** net type setting allows [!INCLUDE[navnow](includes/navnow_md.md)] to connect to a server using the default client network type assigned by SQL Server. You can change the net type with the Client Network Utility, which is part of the SQL Server Client Utilities, if they have been installed on the client computer.  

7.  Choose **OK** to connect to the server and open the **New Database** window.  

     In the [New Database](uiref/-$-S_2338-New-Database-$-.md) window, enter the information about the database that you want to create. The window contains the same tabs as the **Alter Database** window. The tabs are the following:  

    -   [Altering Databases - General Tab](Altering-Databases---General-Tab.md)  

    -   [Altering Databases - Database Files Tab](Altering-Databases---Database-Files-Tab.md)  

    -   [Altering Databases - Transaction Log Files Tab](Altering-Databases---Transaction-Log-Files-Tab.md)  

    -   [Altering Databases - Collation Tab](Altering-Databases---Collation-Tab.md)  

    -   [Altering Databases - Options Tab](Altering-Databases---Options-Tab.md)  

    -   [Altering Databases - Integration Tab](Altering-Databases---Integration-Tab.md)  

    -   [Altering Databases - Advanced Tab](Altering-Databases---Advanced-Tab.md)  

 8. Now that you have created a new database, you must configure your [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to access the database and then restart the service. For more information, see [How to: Configure a Microsoft Dynamics NAV Server Instance](How-to--Configure-a-Microsoft-Dynamics-NAV-Server-Instance.md).
 
 9. You must synchronize the schema for all tables of the new database.
 
    From the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Sync. Schema For All Tables**, and then **With Validation**. For more information, see [Synchronizing Table Schemas](Synchronizing-Table-Schemas.md).

    You can also use the Sync-NAVTenant cmdlet of the [!INCLUDE[nav_shell_md](includes/nav_shell_md.md)].

> [!WARNING]  
>  You can always enlarge a database later on, but you cannot make it smaller.  

 After you have created the database, you can enter program objects and company data. Before you can create company data, you must import some basic data from another [!INCLUDE[navnow](includes/navnow_md.md)] database. The imported data must at least include **Data Common to All Companies** and **Application Objects**. For more information, see [Exporting and Importing Companies and Other Data](Exporting-and-Importing-Companies-and-Other-Data.md).  

## See Also  
 [How to: Create Companies](How-to--Create-Companies.md)   
 [How to: Select the Network Type of the Database](How-to--Select-the-Network-Type-of-the-Database.md)   
 [How to: Delete Databases](How-to--Delete-Databases.md)   
 [How to: Export and Import Companies and Other Data in Clients](How-to--Export-and-Import-Companies-and-Other-Data-in-Clients.md)
