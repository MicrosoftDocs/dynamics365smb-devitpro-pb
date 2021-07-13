---
title: Upgrading the Database
description: This article describes the tasks required for upgrading from the earlier versions of database to the Microsoft Dynamics NAV 2018.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
ms.prod: "dynamics-nav-2018"
---
# Upgrading the Data to [!INCLUDE[nav2018_md](includes/nav2018_md.md)]

**Applies to:** [!INCLUDE[nav2018_md](includes/nav2018_md.md)]. [See [!INCLUDE[nav2017](includes/nav2017.md)] version](Upgrading-the-Data-2017.md).

This topic describes the tasks required for upgrading the following database versions to [!INCLUDE[nav2018_md](includes/nav2018_md.md)]:

-   [!INCLUDE[nav7long](includes/nav7long_md.md)]
-   [!INCLUDE[navsicily](includes/navsicily_md.md)]
-   [!INCLUDE[navcrete](includes/navcrete_md.md)]
-   [!INCLUDE[navcorfu](includes/navcorfu_md.md)]
-   [!INCLUDE[nav2017](includes/nav2017.md)]

You use data conversion tools provided with [!INCLUDE[nav2018](includes/nav2018_md.md)] to convert the old data with the old version’s table and field structure, so that it functions together with the new version’s table and field structure. Mainly, only table objects and table data are modified during the data upgrade process. Other objects, such as pages, reports, codeunits, and XMLports are upgraded as part of the application code upgrade process.

The data upgrade process described in this article leads you through the database conversion (technical upgrade) and then the upgrade of the actual data, which is achieved by using the upgrade toolkit/upgrade codeunits.

##  <a name="Prereqs"></a> Prerequisites  
Before you start the upgrade tasks, make sure you meet the following prerequisites:
1.  Your computer uses the same codepage as the data that will be upgraded.

    If you use conflicting codepages, some characters will not display in captions, and you might not be able to access the upgraded database. This is because [!INCLUDE[navnow_md](includes/navnow_md.md)] must remove incorrect metadata characters to complete the data upgrade. In this case, after upgrade, you must open the database in the development environment on a computer with the relevant codepage and compile all objects. This adds the missing characters again.

    Optionally, you can export the captions before the upgrade. For more information, see [How to: Add Translated Strings for Conflicting Text Encoding Formats](How-to--Add-Translated-Strings-for-Conflicting-Text-Encoding-Formats.md).

2.  You have a FOB file(s) that contains the upgraded application code and upgrade toolkit. The upgrade toolkit includes upgrade codeunits for handling the data upgrade. The upgrade toolkit can be in the same FOB file as the application code or in a separate FOB file.  

    For more information about upgrading the application code, see [Upgrading the Application Code](Upgrading-the-Application-Code.md).

    You can find the default upgrade toolkit objects in the  **UpgradeToolKit\Data Conversion Tools** folder on the [!INCLUDE[nav2018_md](includes/nav2018_md.md)] installation media (DVD). Choose the FOB that matches the [!INCLUDE[navnow](includes/navnow_md.md)] version from which you are upgrading:

    -   Upgrade7001100.FOB for [!INCLUDE[nav7long](includes/nav7long_md.md)]
    -   Upgrade7101100.FOB and Upgrade710HF1100.FOB for [!INCLUDE[navsicily](includes/navsicily_md.md)]
    -   Upgrade8001100.FOB for [!INCLUDE[navcrete](includes/navcrete_md.md)]
    -   Upgrade9001100.FOB for [!INCLUDE[navcorfu](includes/navcorfu_md.md)]
    -   Upgrade10001100.FOB for [!INCLUDE[nav2017](includes/nav2017.md)]
3.   You have exported the permission sets and permissions as XML files. 

    For more information, see [How to: Export and Import Permission Sets and Permissions](how-to--import-export-permission-sets-permissions.md#ExportPerms).

4.   \(Optional\) Make a copy of the web.config file for all [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instances for the [!INCLUDE[nav_web_md](includes/nav_web_md.md)]. With [!INCLUDE[nav2018_md](includes/nav2018_md.md)], [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instances run on Microsoft .NET Core. With this change, the instances now use a .json type file (called navsettings.json) instead of the web.config file.

5.   \(Optional\) If the old [!INCLUDE[navnow](includes/navnow_md.md)] application uses data encryption, you exported the encryption key file that it used for the data encryption.  

    For more information, see [How to: Export and Import Encryption Keys](how-to-export-and-import-encryption-keys.md).  

> [!NOTE]
>If the old [!INCLUDE[navnow](includes/navnow_md.md)] application uses Payment Services for Microsoft Dynamics ERP, be aware that this was discontinued in [!INCLUDE[nav2017](includes/nav2017.md)]. This means that most of the objects that are associated with this feature will be deleted during the upgrade. Some objects you will have to manually delete.

## Task 1: Prepare the old database

1. Use the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] that matches the old database to build all application objects.  

    For more information, see [How to: Build Server Application Objects](How-to--Build-Server-Application-Objects.md).  

2.  Unlock all application objects.  

    For more information, see [How to: Unlock an Object](How-to--Unlock-an-Object.md).  

3.  Synchronize the database schema by using the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] or Dynamics NAV Administration Shell that matches the old database.  

    For more information, see [How to: Synchronize the Tenant Database with the Application Database](How-to--Synchronize-the-Tenant-Database-with-the-Application-Database.md).

4.  ([!INCLUDE[navcorfu](includes/navcorfu_md.md)] and earlier only) If the old database includes test runner codeunits, modify the signature of the OnBeforeTestRun and OnAfterTestRun triggers of the test runner codeunits to include the *TestPermission* parameter

    For more information, see [Resolving OnBeforeTestRun and OnAfterTestRun Trigger Errors When Converting a Database](Resolve-OnBeforeTestRun-OnAfterTestRun-Compile-Errors.md).

    The triggers for codeunit **130400 CAL Test Runner** and **130402 CAL Command Line Test Runner** will be updated for you during the data upgrade.

##  <a name="SQLBackup"></a> Task 2: Create a full SQL backup of the old database on SQL Server  
 You must create a full backup of the old database in the SQL Server. Alternatively, you can make a copy of the old database and perform the upgrade tasks on the copy.  

 For more information, see [Create a Full Database Backup \(SQL Server\)](https://msdn.microsoft.com/library/ms187510.aspx).  

## Task 3 Uninstall all V1 extensions in old database
Open the [!INCLUDE[nav_shell_md](includes/nav_shell_md.md)] that matches to old database, and run these commands: 
1.  To get a list of the V1 extensions that are installed, run this command:

    ```
    Get-NAVAppInfo -ServerInstance <ServerInstanceName> -Tenant <TenantID> |ft
    ```
    
    Replace `<ServerInstanceName>` with the name of the [!INCLUDE[nav_server_md](includes/nav_server_md.md)] instance that the database connects to. Replace `<TenantID>` with the tenant ID of the database. If you do not have a multitenant server instance, use `default`.

    In the table that appears, V1 extensions are indicated by `CSIDE` in the `Extension Type` column.

    Make a note of the V1 extensions that you will uninstall because you will reinstall these later, after you upgrade the database.
2. For each Extension V1, run this command to uninstall it:

    ```
    Uninstall-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
    ```
  
    Replace `<Name>` and `<N.N.N.N>` with the name and version of the Extension V1 as it appeared in the previous step.

> [!IMPORTANT]
> Do not uninstall V2 extensions (ModernDev type).

##  <a name="UploadLicense"></a> Task 4: Upload the [!INCLUDE[nav2018_md](includes/nav2018_md.md)] license to the old database  
By using the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] that matches the old database, upload the [!INCLUDE[nav2018_md](includes/nav2018_md.md)] license to the database.

For more information, see [Uploading a License File for a Specific Database](How-to--Upload-the-License-File.md#UploadtoDatabase).  

##  <a name="DeleteObjects"></a> Task 5: Delete all objects except tables from the old database   
In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] version that matches the database, open the old database, open Object Designer, select all objects except tables, and then choose **Delete**.

You can also use the [DeleteObjects](DeleteObjects.md) command of the finsql.exe.

##  <a name="UninstallOldProduct"></a> Task 6: Uninstall (optional) the old product and install the new product
Uninstall the old [!INCLUDE[navnow_md](includes/navnow_md.md)], and then install [!INCLUDE[nav2018_md](includes/nav2018_md.md)].  

As a minimum, you must install the following [!INCLUDE[nav2018_md](includes/nav2018_md.md)] components: Client (with the Development Environment), Modern Development Environment, Administration Tools, Server, and SQL Server Components. You can install these components by choosing the **Custom** option during Setup. For more information, see [Custom Option](Custom-option.md).

## Task 7: Clear Dynamics NAV Server instance records from old database
Clear all [!INCLUDE[nav_server](includes/nav_server_md.md)] instance records from the **dbo.Server Instance** table in the database in SQL Server.  

1.  If you did not uninstall the old [!INCLUDE[navnow_md](includes/navnow_md.md)], make sure that you stop the old [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, and close any tools that connect to the database, such as the Dynamics NAV Administration Tool and [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)].
2.  Using SQL Server Management Studio, open and clear the **dbo.Server Instance** table of the old database. For example, you can run the following SQL query:

    ```
    DELETE FROM [My NAV Database Name].[dbo].[Server Instance]
    ```

##  <a name="ConvertDb"></a> Task 8: Convert the old database to the [!INCLUDE[nav2018_md](includes/nav2018_md.md)] format  

If the database is on Azure SQL Database, you must first add your user account to the **dbmanager** database role on master database. This membership is only required for converting the database, and can be removed afterwards. 

To convert the old database to the [!INCLUDE[nav2018_md](includes/nav2018_md.md)] format, open the old database in the [!INCLUDE[nav2018_md](includes/nav2018_md.md)] [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], and follow the conversion instructions.

> [!IMPORTANT]
> Do not run schema synchronization at this time.

<!-- did this later, after import
##  <a name="ConnectToServer"></a> Task 6: Connect a [!INCLUDE[nav2017](includes/nav2017.md)] Server instance to the converted database  
You use the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] to connect a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to the converted database.  

In addition, you must add the service account that is used by the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance as a member of the **db\_owner** role in the [!INCLUDE[navnow](includes/navnow_md.md)] database on SQL Server.  

> [!IMPORTANT]  
>  When upgrading a large database, you should increase the **SQL Command Timeout** setting for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, to avoid timeouts during schema synchronization. The default setting is 30 minutes.  

For more information, see [How to: Connect a Microsoft Dynamics NAV Server Instance to a Database](How-to--Connect-a-Microsoft-Dynamics-NAV-Server-Instance-to-a-Database.md) and [Giving the account necessary database privileges in SQL Server](Provisioning-the-Microsoft-Dynamics-NAV-Server-Account.md#dbo).  
-->

<!-- skipped this until after import
##  <a name="CompSysTables"></a> Task 7: Compile all tables to complete the database conversion

Use the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] to compile all tables without running schema validation. <!--System tables have IDs in the 2000000000 range.

In Object Designer, choose **Tools**, choose **Compile**, set the **Synchronize Schema** to **Later**, and then choose **OK**.
-->

##  <a name="ImportAppObj"></a> Task 9: Import the upgraded application objects and upgrade toolkit objects into the converted database  
Using the [!INCLUDE[nav2018_md](includes/nav2018_md.md)] [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], import the application objects that you want in the [!INCLUDE[nav2018_md](includes/nav2018_md.md)] database. This includes the application objects FOB file (from the application code upgrade) and the upgrade toolkit objects FOB file.

1. Import the application objects FOB file first, and then import the upgrade toolkit FOB file.

    For more information, see [How to: Import Objects](how-to--import-objects.md).

2. When you import the FOB file, if you experience metadata conflicts, the **Import Worksheet** windows appears.

    Review the Worksheet page. For more information, see [Import Worksheet](Import-Worksheet.md).
    
    Choose **Replace All** to continue.

3. **IMPORTANT** When prompted about table synchronization, set the **Synchronize Schema** option to **Later**.  

##  <a name="ConnectToServer"></a> Task 10: Connect a [!INCLUDE[nav2018_md](includes/nav2018_md.md)] Server instance to the converted database
You use the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] for [!INCLUDE[nav2018_md](includes/nav2018_md.md)] or [Set-NAVServerConfiguration cmdlet](https://go.microsoft.com/fwlink/?linkid=401394) in the [!INCLUDE[nav_shell_md](includes/nav_shell_md.md)] to connect a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to the converted database.  

In addition, you must add the service account that is used by the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance as a member of the **db\_owner** role in the [!INCLUDE[navnow](includes/navnow_md.md)] database on SQL Server.  

> [!IMPORTANT]  
>  When upgrading a large database, you should increase the **SQL Command Timeout** setting for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, to avoid timeouts during schema synchronization. The default setting is 30 minutes.  

For more information, see [How to: Connect a Microsoft Dynamics NAV Server Instance to a Database](How-to--Connect-a-Microsoft-Dynamics-NAV-Server-Instance-to-a-Database.md) and [Giving the account necessary database privileges in SQL Server](Provisioning-the-Microsoft-Dynamics-NAV-Server-Account.md#dbo).

##  <a name="CompSysTables"></a> Task 11: Compile all objects that are not already compiled
1. In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], set it to use the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that connects to the database.

    For more information, see [How to: Change the Microsoft Dynamics NAV Server Instance](How-to--Change-the-Microsoft-Dynamics-NAV-Server-Instance.md) or [Database Information](uiref/-$-S_2349-Database-Information-$-.md).  

2. Use the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] or finsql.exe to compile all objects that are not already compiled. This includes the imported application objects, data tables, and system tables. 

    > [!IMPORTANT]
    >Choose to run schema synchronization later. For example, in Object Designer, choose **Tools**, choose **Compile**, set the **Synchronize Schema** option to **Later**, and then choose **OK**. For more information, see [Compiling Objects](compiling-objects.md).

3. ([!INCLUDE[navcorfu](includes/navcorfu_md.md)] and earlier only) If you get errors on the following table objects, use the Object Designer to delete the objects because they are no longer used.

    -   Table 470 Job Queue (replaced by the [Task Scheduler](Task-Scheduler.md))
    -   Table 824 DO Payment Connection Details
    -   Table 825 DO Payment Connection Setup
    -   Table 827 DO Payment Credit Card
    -   Table 828 DO Payment Credit Card Number
    -   Table 829 DO Payment Trans. Log Entry
    -   Table 1510 Notification Template

    When you delete a table object, in the **Delete** confirmation dialog box, set the **Synchronize Schema** option to **Force**. **Important** At this point, it is very important that you do not use the **Sync. Schema For All Tables** option from the **Tools** menu. 

##  <a name="RunSync1"></a> Task 12: Recompile published extensions  
Use the [Repair-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/repair-navappSynchronize) of the [!INCLUDE[navnowlong_md](includes/navnowlong_md.md)] Administration Shell to compile the published extensions to make sure they are work with the new platform and application.

For example, you can run the following command to recompile all extensions:

```
Get-NAVAppInfo -ServerInstance <ServerInstanceName> | Repair-NAVApp
```   

##  <a name="RunSync1"></a> Task 13: Run the schema synchronization on the imported objects  
Synchronize the database schema with validation. You can run the schema synchronization from the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] or [!INCLUDE[nav_shell](includes/nav_shell_md.md)].  

For more information, see [How to: Synchronize the Tenant Database with the Application Database](How-to--Synchronize-the-Tenant-Database-with-the-Application-Database.md).

##  <a name="RunStartNavUpgrade"></a> Task 14: Run the data upgrade process  
A data upgrade runs the upgrade toolkit objects, such as upgrade codeunits and upgrade tables, to migrate business data from the old table structure to the new table structure. You can start the data upgrade from the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] or [!INCLUDE[nav_shell](includes/nav_shell_md.md)].  

> [!NOTE]  
>  In the last phase of data upgrade, all companies will be initialized by running codeunit 2 Company Initialization. This is done automatically. If you want to skip company initialization, then use the Start-NavDataUpgrade cmdlet and set the *-SkipCompanyIntitialization* parameter.  

**From the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]**:  

Open [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] as an administrator. On the **Tools** menu, choose **Data Upgrade**, and then choose **Start** and follow the instructions.  

To view the progress of the data upgrade, on the **Tools** menu, choose **Data Upgrade**, and then choose **Show Progress**.  

**From the [!INCLUDE[nav_shell](includes/nav_shell_md.md)]:**  

Open the [!INCLUDE[nav_shell](includes/nav_shell_md.md)] as an administrator, and then run Start-NavDataUpgrade cmdlet as follows:  

```  
Start-NavDataUpgrade -ServerInstance <ServerInstanceName> -Force  
```  

Replace `<ServerInstanceName>` with the name of the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that is connected to the database.  

To view the progress of the data upgrade, you can run Get-NavDataUpgrade cmdlet with the `–Progress` switch.  

The data upgrade process runs `CheckPreconditions` and `Upgrade` functions in the upgrade codeunits. If any of the preconditions are not met or an upgrade function fails, you must correct the error and resume the data upgrade process. If CheckPreconditions and Upgrade functions are executed successfully, codeunit 2 is automatically run to initialize all companies in the database unless you set the `-SkipCompanyIntitialization` parameter.  

##  <a name="DeleteUpgCodeunits"></a> Task 15: Delete the upgrade objects  
At this point, you have upgraded the database to [!INCLUDE[nav2018_md](includes/nav2018_md.md)]. Now, you can delete the upgrade codeunits and upgrade table objects that you imported in task 8.  

When you delete tables, on the **Delete** dialog box, set the **Synchronize Schema** option to **Force**.  

##  <a name="ImportPerms"></a> Task 16: Import upgraded permission sets and permissions by using the Roles and Permissions XMLports  
You import the permission sets and permissions XML files.

1.  Delete all permission sets in the database except the SUPER permission set.  

    In Object Designer, run page 9802 **Permission Sets**, and then delete the permission sets.  

2.  Run XMLport 9171 and XMLport 9172 to import the permission sets and permission XML files.

    For more information, see [How to: Export and Import Permission Sets and Permissions](how-to--import-export-permission-sets-permissions.md#ImportPerms).

##  <a name="SetLang"></a> Task 17: Set the language of the customer database  
 In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], choose **Tools**, choose **Language**, and then select the language of the original customer database.  

##  <a name="AddControlAddins"></a> Task 18: Register client control add-ins  
 The database is now fully upgraded and is ready for use. However, [!INCLUDE[nav2018_md](includes/nav2018_md.md)] includes the following client control add-ins.
-   Microsoft.Dynamics.Nav.Client.BusinessChart  
-   Microsoft.Dynamics.Nav.Client.DynamicsOnlineConnect
-   Microsoft.Dynamics.Nav.Client.FlowIntegration
-   Microsoft.Dynamics.Nav.Client.OAuthIntegration
-   Microsoft.Dynamics.Nav.Client.PageReady  
-   Microsoft.Dynamics.Nav.Client.PingPong  
-   Microsoft.Dynamics.Nav.Client.SocialListening  
-   Microsoft.Dynamics.Nav.Client.TimelineVisualization
-   Microsoft.Dynamics.Nav.Client.VideoPlayer  
-   Microsoft.Dynamics.Nav.Client.WebPageViewer

To use these add-ins, they must be registered in table **2000000069 Client Add-in**. Depending on the version that you upgraded from, all the add-ins might not be registered after the upgrade process. You can register missing control add-ins in the **Control Add-ins** page in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. The assemblies (.dlls) for these add-ins are located in subfolders to the **Add-ins** folder of the Dynamics NAV Server installation, which by default is  [!INCLUDE[navnow_install_md](includes/navnow_install_md.md)]\Service\Add-ins. For more information, see [How to: Register a Windows Client Control Add-in](How-to--Register-a-Windows-Client-Control-Add-in.md).  


##  <a name="AddExtensions"></a> Task 19: Publish and install/upgrade extensions
[!INCLUDE[nav2018_md](includes/nav2018_md.md)] includes a number of extensions that you publish and install as part of the upgrade process. To enable these extensions, it is important that you follow the steps below.

1. Download the system and test symbols file from the *ModernDev* folder on the DVD, and make a note of the path where you store the files.  
    > [!NOTE]  
    > If you are upgrading to [!INCLUDE[nav2018_md](includes/nav2018_md.md)] RTM, the symbols are not included on the DVD, and you must download them here: [system symbols](https://go.microsoft.com/fwlink/?linkid=864045), [test symbols](https://download.microsoft.com/download/C/7/9/C79AF269-A67E-4EEF-B9F2-52FAFA43E026/Microsoft_Test_11.0.19680.0.app), and [application symbols](https://download.microsoft.com/download/C/7/9/C79AF269-A67E-4EEF-B9F2-52FAFA43E026/Microsoft_Application_11.0.19738.0.app).  
    If you are upgrading to [!INCLUDE[nav2018_md](includes/nav2018_md.md)] CU1, or higher, please use the symbols that you find in the *ModernDev* folder on the cumulative update DVD. 
  
2. Publish the platform symbols and the test symbols one file at a time to the Dynamics NAV server instance:

    Open the [!INCLUDE[nav_shell](includes/nav_shell_md.md)] as an administrator, and run the following command for each of the symbol files:

    ```
    Publish-NAVApp -ServerInstance <ServerInstanceName> -Path <SymbolFilePath> -PackageType SymbolsOnly
    ```
    
    > [!NOTE]  
    > If you are upgrading to [!INCLUDE[nav2018_md](includes/nav2018_md.md)] RTM, you must also publish the application symbol file.

3. Make sure that **Enable loading application symbol references at server startup** (EnableSymbolLoadingAtServerStartup) is set on the Dynamics NAV server instance.

    For more information, see [Configuring Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).
4. Generate the application symbol references:

    Open a command prompt, change to the directory where the `finsql.exe` file has been installed as part of [!INCLUDE[nav2018_md](includes/nav2018_md.md)], and then run the following command:

    ```
    finsql.exe Command=generatesymbolreference, Database=<MyDatabaseName>, ServerName=<DatabaseServerName>\<DatabaseInstance>
    ```

    Replace values for the `Database` and `ServerName` settings to suit.

    > [!NOTE]  
    >  This command does not generate a file. It populates the **Object Metadata** table in the database.
    
    For more information about generation symbols, see [Running C/SIDE and AL Side-by-Side](developer/devenv-running-cside-and-al-side-by-side.md).

5. Publish all the extensions from the `\Extensions` folder of the [!INCLUDE[nav2018_md](includes/nav2018_md.md)] installation media (DVD):

    1. From the [!INCLUDE[nav_shell](includes/nav_shell_md.md)], run the following command for each extension.

        ```
        Publish-NAVApp -ServerInstance <ServerInstanceName> -Path <ExtensionFileName> 
        ```
    
        V1 extensions have the file type `.navx`. V2 extensions have the file type `.app`. 

    2.  For each Extension V2, run the following command to synchronize its schema with the tenant database:
    <!-- I got message that application and tenant database were not synched, so I had to sync to go futher-->

        ```    
        Sync-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
        ```

    For more information about publishing extensions, see [How to: Publish and Install an Extension](developer/devenv-how-publish-and-install-an-extension-v2.md).

6.  Upgrade the V1 extensions that you uninstalled previously in Task 3 by reinstalling them. From the [!INCLUDE[nav_shell](includes/nav_shell_md.md)], run the following commands: 

    1. To get a list of the published extensions on the server instance, run this command:
    
        ```
        Get-NAVAppInfo -ServerInstance <ServerInstanceName>
        ```

    2. To determine which V1 extensions to install, inspect the list that appears, and compare it with the list that you gathered in Task 3. V1 extensions are indicated by `Extension Type : CSIDE`. If there is a newer version of an Extension V1, you should install the newer version.
    3. For each Extension V1 that you want to install, run this command:
    
        ```  
        Install-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N> –Tenant <TenantID>
        ```
    
        Replace `<Name>` and `<N.N.N.N>` with the name and version of the Extension V1 as it appeared in the previous step. For `<TenantID>`, in single-tenant deployments, you either specify `default`or you omit the `–Tenant` parameter.
        
        This will upgrade the V1 extensions.
7.  Upgrade V2 extensions that are currently installed: 

    1. To get a list of the installed V2 extensions, run this command:
    
        ```
        Get-NAVAppInfo -ServerInstance <ServerInstanceName> -Tenant <TenantID>
        ```
        
        Replace `<ServerInstanceName>` with the name of the [!INCLUDE[nav_server_md](includes/nav_server_md.md)] instance that the database connects to. Replace `<TenantID>` with the tenant ID of the database. If you do not have a multitenant server instance, use `default`.
        
        V2 extensions are indicated by `Extension Type : ModernDev`.
    2. For each Extension V2 that you want to upgrade, run these commands:

        ```
        Sync-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
        Start-NAVAppDataUpgrade -ServerInstance DynamicsNAV -Name ProswareStuff -Version <N.N.N.N>
        ``` 
        
        This will upgrade the V2 extensions.
8. For the Denmark (DK) local version of [!INCLUDE[nav2018_md](includes/nav2018_md.md)], you must install the following new V2 extensions in order to get all the local functionality.

    |Name|Publisher|Version|
    |----|---------|-------|
    |Payroll Data Import Definitions (DK)|    Microsoft| 1.0.19502.0 (or later)|
    |Payment and Reconciliation Formats (DK)| Microsoft| 1.0.19502.0 (or later)|
    |Tax File Formats (DK)| Microsoft| 1.0.19502.0 (or later)|

    For each Extension V2, run this command:

        ```
        Install-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N> 
        ```

## Task 20: Update the Dynamics NAV Web client configuration file (navsettings.json)
If you have installed the [!INCLUDE[nav_web_server_md](includes/nav_web_server_md.md)], populate the navsettings.json file for the [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instance with the settings of the old web.config file.

For more information, see [Configuring Microsoft Dynamics NAV Web Client by Modifying the NavSettings.json File](Configuring-Microsoft-Dynamics-NAV-Web-Client-by-Modifying-the-Web.config-File.md).  

<!-- deprecated ##  <a name="UploadEncryptionKeys"></a> Task 16: Import Payment Services and Data Encryption Key \(Optional\)  

-   If you want to set up Payment Services for Microsoft Dynamics ERP as before, you must upload the payment service encryption key file that was downloaded previously.  

     You upload the encryption key from the **DO Payment Connection Setup** window in the [!INCLUDE[navnow](includes/navnow_md.md)] client. For more information, see [DO Payment Connection Setup](assetId:///58e1ceda-e705-41f4-9f28-a027d8b816f9).  

-   If you want to use data encryption as before, you must import the data encryption key file that was exported previously.  

     For more information, see [How to: Export and Import Encryption Keys](How-to--Export-and-Import-Encryption-Keys.md).  -->

## See Also  
 [Upgrading the Application Code](Upgrading-the-Application-Code.md)   
 [Automating the Upgrade Process using Sample Windows PowerShell Scripts](Automating-the-Upgrade-Process-using-Sample-Windows-PowerShell-Scripts.md)   
 [Synchronizing Table Schemas](Synchronizing-Table-Schemas.md)   
 [Upgrading to Microsoft Dynamics NAV](Upgrading-to-Microsoft-Dynamics-NAV.md)
