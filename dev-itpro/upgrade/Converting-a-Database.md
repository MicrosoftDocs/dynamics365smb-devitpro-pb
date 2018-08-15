---
title: "Converting a Database to Dynamics 365 Business Central - Technical Upgrade"
ms.custom: na
ms.date: 10/07/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
ms.prod: "dynamics365-business-central"
author: jswymer
---
# Converting a Database to [!INCLUDE[d365_bus_cent_short_md](../developer/includes/d365_bus_cent_short_md.md)] - Technical Upgrade

This article describes how to convert a [!INCLUDE[navnow](../developer/includes/navnow_md.md)] database from one of the following versions to [!INCLUDE[d365_bus_cent_short_md.md](../developer/includes/d365_bus_cent_short_md.md)]:

-   [!INCLUDE[nav7long](../developer/includes/nav7long_md.md)]
-   [!INCLUDE[navsicily](../developer/includes/navsicily_md.md)]
-   [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)]
-   [!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)]
-   [!INCLUDE[nav2017](../developer/includes/nav2017.md)] 
-   Dynamics NAV 2018 

This article can also be used to update you current [!INCLUDE[d365_bus_cent_short_md.md](../developer/includes/d365_bus_cent_short_md.md)] database to the latest cumulative update. 

[See quick reference](technical-upgrade-checklist.md)

## About database conversion
Converting a database, which is often referred to as a *technical upgrade*, changes the database so that it works on the latest [!INCLUDE[d365_bus_cent_short_md.md](../developer/includes/d365_bus_cent_short_md.md)] platform. The conversion updates the system tables of the old database to the new schema (data structure), and upgrades of all reports to support Report Viewer 2015. It provides you with the latest platform features and performance enhancements.

<!--You typically convert a database, as described in this article, when you want to upgrade an existing [!INCLUDE[nav2017](../developer/includes/nav2017.md)] database to a new platform version that does not include application changes. A database conversion is typically what is required for a cumulative update.

Converting a database does not upgrade the application objects (like pages, reports, and codeunits) or the business data to [!INCLUDE[nav2017](../developer/includes/nav2017.md)]. Therefore, performing a database conversion alone is usually not sufficient when upgrading from an earlier version of [!INCLUDE[navnow](../developer/includes/navnow_md.md)] to [!INCLUDE[nav2017](../developer/includes/nav2017.md)] or when upgrading an existing [!INCLUDE[nav2017](../developer/includes/nav2017.md)] installation to new platform and application versions. For these upgrade scenarios, you should perform a full upgrade by completing the tasks [Upgrading the Application Code](Upgrading-the-Application-Code.md) and [Upgrading the Data](Upgrading-the-Data.md), which will also cover the database conversion. You can choose to convert the old database and not upgrade your application. However, we recommend that you upgrade the application objects as well so that your solution includes important application fixes and new functionality that is introduced in [!INCLUDE[nav2017](../developer/includes/nav2017.md)]. Upgrading the application will also reduce the amount of merging required to upgrade to the next major version of [!INCLUDE[navnow](../developer/includes/navnow_md.md)], bringing you to the latest version of the product faster.  
-->
<!--
> [!IMPORTANT]  
>  Before you start, make sure that you have applied the changes that are described in KB 2804640 [Code corrections for some Microsoft Dynamics NAV 2013 reports to prevent compilation errors with Report Viewer 2012 when upgrading to later versions of Microsoft Dynamics NAV](https://mbs.microsoft.com/knowledgebase/KBDisplay.aspx?scid=kb;EN-US;2804640).
-->


## Task 1: Convert V1 Extensions to V2 extensions
[!INCLUDE[d365_bus_cent_short_md.md](../developer/includes/d365_bus_cent_short_md.md)] does not support V1 extensions. If you are updating a [!INCLUDE[navnow](../developer/includes/navnow_md.md)] database that includes V1 extensions and you want to continue to use them, you have to convert them to V2 extensions. For more information, see [Converting Extensions V1 to Extensions V2](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-upgrade-v1-to-v2-overview). 

## Task 2: Preparing the Old Database  
To convert the old database to a [!INCLUDE[d365_bus_cent_short_md.md](../developer/includes/d365_bus_cent_short_md.md)] database, the first task is to back up the old database and then prepare to convert it.

> [!NOTE]  
>  Do not perform this task if you are converting the database from one cumulative update of [!INCLUDE[d365_bus_cent_short_md.md](../developer/includes/d365_bus_cent_short_md.md)] to the next cumulative update. In this case, you only have to complete task 2.

#### To prepare the old database  

1.  Make a copy of the old database or create full database backup. 

    <!-- in multitnenta, both the application and tenant dbs>

     For more information, see [Create a Full Database Backup \(SQL Server\)](http://go.microsoft.com/fwlink/?LinkID=296465).

2.  Uninstall all extensions.

    <!-- This tep is not required for multitenant -->

    You can do this from **Extension Management** page in the [!INCLUDE[navnow](../developer/includes/navnow_md.md)] client or by using the [Uninstall-NAVApp](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/uninstall-navapp) cmdlet of the [!INCLUDE[nav_shell](../developer/includes/nav_shell_md.md)]. 

    To get a list of the extensions that are installed, run this command:

    ```
    Get-NAVAppInfo -ServerInstance <ServerInstanceName> -Tenant <TenantID>
    ```

    For each extension, run this command to uninstall it:

    ```
    Uninstall-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
    ```

    Alternately, to remove them all at once, you can run this command:

    ```
    Get-NAVAppInfo -ServerInstance <ServerInstanceName> -Tenant default | % { Uninstall-NAVApp -ServerInstance <ServerInstanceName> -Name $_.Name -Version $_.Version }
    ```  

2.  Open the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] that matches the [!INCLUDE[navnow](../developer/includes/navnow_md.md)] version of the old database, and then connect to the old <!-- for multitenenat, this is the application database-->database.  

     For more information, see [How to: Open Databases](How-to--Open-Databases.md).  

3.  In Object Designer, verify that all objects are compiled and no objects are locked.  

     For more information about compiling objects, see [Compiling Objects](compiling-objects.md).

     If one or more objects are locked, the conversion process cannot update the database version number. As a result, the conversion does not complete. For more information, see [Locking and Unlocking Objects](Locking-and-Unlocking-Objects.md).

4.  On the **Tools** menu, choose **Build Server Application Objects**, and then choose the **Yes** button.  

5.  If any errors occur, they are shown in the **Error List** window. Make sure that you address all compilation errors before you continue.  

6.  Upload the [!INCLUDE[d365_bus_cent_short_md](../developer/includes/d365_bus_cent_short_md.md)] Partner license to the database.  

     For more information, see [Uploading a License File for a Specific Database](How-to--Upload-the-License-File.md#UploadtoDatabase).  

    > [!IMPORTANT]  
    >  The license that you upload must be a developer license. During the conversion, the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] will convert the report objects that are stored in the old database to the RDL format.  

7.  Run the schema synchronization with validation to synchronize the database schema changes.  

    For more information, see [How to: Synchronize the Tenant Database with the Application Database](How-to--Synchronize-the-Tenant-Database-with-the-Application-Database.md).

    <!-- for multitenancy you cannot use the dev env, only admin tool or shell, but check. Do you have to sync all tenants?>


8.  Stop the [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)] instance, and close the [!INCLUDE[nav_dev_short_md](../developer/includes/nav_dev_short_md.md)].

    You can use the [!INCLUDE[nav_admin](../developer/includes/nav_admin_md.md)] or [Set-NAVServerInstance](https://go.microsoft.com/fwlink/?linkid=401395) cmdlet of the [!INCLUDE[nav_shell_md](../developer/includes/nav_shell_md.md)].

    For information about the [!INCLUDE[nav_admin](../developer/includes/nav_admin_md.md)], see [How to: Start, Stop, Restart, or Remove a Dynamics NAV Server Instance](How-to--Start--Stop--Restart--or-Remove-a-Microsoft-Dynamics-NAV-Server-Instance.md).

    To use the Set-NAVServerInstance cmdlet, run the following command:
    ```
    Set-NAVServerInstance –ServerInstance <ServerInstanceName> -Stop
    ```
9. Clear all records from the **dbo.Server Instance** and  **dbo.Debugger Breakpoint** tables in the old database in SQL Server.  

    Using SQL Server Management Studio, open and clear the **dbo.Server Instance** and  **dbo.Debugger Breakpoint** tables of the old database. For example, you can run the following SQL query:

    ```
    DELETE FROM [<My NAV Database Name>].[dbo].[Server Instance]
    DELETE from [<My NAV Database Name>].[dbo].[Debugger Breakpoint]
    ```

10.  (Optional) Before you start the following procedure, you can uninstall the old version of [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)]. When you uninstall [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)], the database is still attached to the instance of SQL Server, which you can verify using SQL Server Management Studio.

<!-- for multitenancy, should you dismount tenants here?-->
## Task 3: Converting the Old Database  
Next, you will convert the old database so that it can be used with [!INCLUDE[d365_bus_cent_short_md](../developer/includes/d365_bus_cent_short_md.md)].

> [!TIP]  
>  If you want to write a script that helps you convert databases, you can use the Invoke-NAVDatabaseConversion function in the [!INCLUDE[nav_dev_shell](../developer/includes/nav_dev_shell_md.md)].  

### To convert the database  

1.  If the database is on Azure SQL Database, add your user account to the **dbmanager** database role on the master database.

    This membership is only required for converting the database, and can be removed afterwards. 

2. Install [!INCLUDE[d365_bus_cent_short_md](../developer/includes/d365_bus_cent_short_md.md)].  

     Run the [!INCLUDE[d365_bus_cent_short_md](../developer/includes/d365_bus_cent_short_md.md)] Setup, and install the following components as a minimum:
     -  Server
     -  SQL Server Database Components
     -  Administration Tool
     -  [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)

3.  Run the newly installed [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)] as an administrator.

    -   If the [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)] is already connected to the old <!-- for multitenancy, the old application db-->database, a dialog box about converting the database appears. Go to the next step.
    
    -   Otherwise, connect to the old database<!-- for multitenancy, the old application db--> that you prepared in the previous task, and then go to the next step.
    
        For more information, see [How to: Open Databases](How-to--Open-Databases.md).

4.  In the dialog box that appears, read the instructions about converting the database carefully because this action cannot be reversed. When you are ready, choose the **OK** button, and then choose the **OK** button to confirm that you want to convert the database.  

    [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)] will now convert the database. This includes an upgrade of system tables and reports.  

5.  When you are notified that the conversion was successful, choose the **OK** button.

6.  If the database references any assemblies \(such as client control add-ins\) that are not included on the [!INCLUDE[d365_bus_cent_short_md](../developer/includes/d365_bus_cent_short_md.md)] installation media \(DVD\), then add the assemblies to the Add-ins folder on [!INCLUDE[server](../developer/includes/server.md)] <!--or [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)] computers-->.  

    <!-- 
     For the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)], the default path is [!INCLUDE[prodx86installpath](../developer/includes/prodinstallpath.md)]\\RoleTailored Client\\Add-ins folder.
     -->  

     For [!INCLUDE[server](../developer/includes/server.md)], the default path is the [!INCLUDE[prodinstallpath](../developer/includes/prodinstallpath.md)]\\Service\\Add-ins folder.

7.  <!-- for multitenant, you have to configure the server for multitenancy first. Howvever, i ran the admin tool and the tenant automatically tried to mount. it failed. I could not sync. The only way was to dismount-navtenant using applicationdatabasename-->Connect a [!INCLUDE[server.md](../developer/includes/server.md)] instance to the converted database. 

    Use the [!INCLUDE[admintool](../developer/includes/admintool.md)] or the [Set-NAVServerConfiguration cmdlet](https://go.microsoft.com/fwlink/?linkid=401394) to connect a [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)] instance to the converted database.  

    > [!IMPORTANT]
    > The service account that is used by the [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)] instance must be a member of the **db\_owner** role in the [!INCLUDE[navnow](../developer/includes/navnow_md.md)] database on SQL Server or Azure SQL Database.

     For more information, see [How to: Connect a Microsoft Dynamics NAV Server Instance to a Database](How-to--Connect-a-Microsoft-Dynamics-NAV-Server-Instance-to-a-Database.md) and [Giving the account necessary database privileges in SQL Server](Provisioning-the-Microsoft-Dynamics-NAV-Server-Account.md#dbo).  
     
8.  Go to the [!INCLUDE[nav_dev_short_md](../developer/includes/nav_dev_short_md.md)], and set it to use the [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)] instance that connects to the database.  

     For more information, see [How to: Change the Microsoft Dynamics NAV Server Instance](How-to--Change-the-Microsoft-Dynamics-NAV-Server-Instance.md) or [Database Information](uiref/-$-S_2349-Database-Information-$-.md).  

9.  Compile all objects without table schema synchronizing (**Synchronize Schema** set to **Later**); you will do this later.  

    For more information, see [Compiling Objects](compiling-objects.md).

10. Fix compilation errors.  

    If any errors occur, they are shown in the **Error List** window. For help on resolving the errors, see the following:


    -   [Resolving Compilation Errors When Converting a Dynamics NAV 2015 Database](Resolve-Compile-Errors-When-Converting-Dynamics-NAV-2015-Database.md). 

    -   [Resolving Compilation Errors When Converting a Dynamics NAV 2016 Database](Resolve-Compile-Errors-When-Converting-Dynamics-NAV-2016-Database.md). 

    -   [Resolving Compilation Errors When Converting a Dynamics NAV 2017 Database](Resolve-Compile-Errors-When-Converting-Dynamics-NAV-2017-Database.md). 


    You can find all objects which did not compile in the **Object Designer** window, by setting a field filter on the **Compiled** field. 

<!-- 10. With a multitenant server, mount the tenant: Mount-NAVTenant -ServerInstance dynamicsnav130 -Tenant MyTenant1 -DatabaseName "Demo Database NA
V (11-0)"--> 

11.  Run the schema synchronization with validation to complete the database conversion.  

        For more information, see [How to: Synchronize the Tenant Database with the Application Database](How-to--Synchronize-the-Tenant-Database-with-the-Application-Database.md). 

        <!--> 

12. <!-- for multitenancy, I had to do this before I could mount and sync tenant-->Recompile and install the V2 extensions that you uninstalled previously.

    1.  Use the [Repair-NAVApp cmdlet](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/repair-navappSynchronize) of the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] to compile the published extensions to make sure they are work with the new platform.

        For example, you can run the following command to recompile all extensions:

        ```
        Get-NAVAppInfo -ServerInstance <ServerInstanceName> | Repair-NAVApp
        ```
    2.  For each V2 extension, run the following command to install it:

        ```
        Install-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N> 
        ```
        

13.  If you converted a [!INCLUDE[navcorfu_md](../developer/includes/navcorfu_md.md)], you will have to modify C/AL code to ensure that the **My Settings** page works properly in the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)]. For more information, see [Resolving My Settings Page Implementation After a Database Conversion](Resolve-MySettings-Page-After-Upgrade.md).

14. If you converted a [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] database, configure pages and reports included in the MenuSuite to be searchable in the [!INCLUDE[d365fin_web_md.md](../developer/includes/d365fin_web_md.md)].

    The MenuSuite is no longer used to control whether a page or report can be found in the search feature of the Web client. This is now determined by specific properties on the page and report objects.  For more information, see [Making Pages and Reports Searchable in [!INCLUDE[d365fin_web_md.md](../developer/includes/d365fin_web_md.md)] After an Upgrade](upgrade-pages-report-for-search.md).

15. Upload the customer license to the converted database.  

    For more information, see [Uploading a License File for a Specific Database](How-to--Upload-the-License-File.md#UploadtoDatabase).  

    You have now completed the conversion of the database to be accessed from [!INCLUDE[d365_bus_cent_short_md.md](../developer/includes/d365_bus_cent_short_md.md)]. To test the converted database, you can connect it to the [!INCLUDE[d365_bus_cent_short_md.md](../developer/includes/d365_bus_cent_short_md.md)] Server instance that is used by [!INCLUDE[navnow](../developer/includes/navnow_md.md)] clients, and then open a client.  

## Database and Windows collations  
Starting from SQL Server 2008, SQL Server collations are fully aligned with the collations in Windows Server. If you upgrade to [!INCLUDE[d365_bus_cent_short_md.md](../developer/includes/d365_bus_cent_short_md.md)] from [!INCLUDE[nav_2009_long](../developer/includes/nav_2009_long_md.md)], the step to convert the database includes upgrading the database from using SQL collations to using Windows collation. This collation change provides users with the most up-to-date and linguistically accurate cultural sorting conventions. For more information, see [Collation and Unicode Support](http://go.microsoft.com/fwlink/?LinkID=247971).  


## See Also  
[Upgrading the Application Code](Upgrading-the-Application-Code.md)   
[Upgrading the Data](Upgrading-the-Data.md)   
[Upgrading to Microsoft Dynamics NAV 2017](Upgrading-to-Microsoft-Dynamics-NAV-2017.md)   
[Automating the Upgrade Process using Sample Windows PowerShell Scripts](Automating-the-Upgrade-Process-using-Sample-Windows-PowerShell-Scripts.md)
