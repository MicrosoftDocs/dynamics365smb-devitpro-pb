---
title: Upgrading the Database
description: This article describes the tasks required for upgrading from the earlier versions of database to Dynamics 365 Business Central.
ms.custom: na
ms.date: 03/05/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
ms.prod: "dynamics-nav-2018"
---
# Upgrading the Data to [!INCLUDE[prodshort](../developer/includes/prodshort.md)]

This topic describes the tasks required for upgrading the following database versions to [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)]:

-   [!INCLUDE[nav7long](../developer/includes/nav7long_md.md)]
-   [!INCLUDE[navsicily](../developer/includes/navsicily_md.md)]
-   [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)]
-   [!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)]
-   [!INCLUDE[nav2017](../developer/includes/nav2017.md)]

You use data conversion tools provided with [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] to convert the old data with the old version’s table and field structure, so that it functions together with the new version’s table and field structure. Mainly, only table objects and table data are modified during the data upgrade process. Other objects, such as pages, reports, codeunits, and XMLports are upgraded as part of the application code upgrade process.

The data upgrade process described in this article leads you through the database conversion (technical upgrade) and then the upgrade of the actual data, which is achieved by using the upgrade toolkit/upgrade codeunits.

##  <a name="Prereqs"></a> Prerequisites  
Before you start the upgrade tasks, make sure you meet the following prerequisites:

1.  A [!INCLUDE[prodshort](../developer/includes/prodshort.md)] installation   with the upgraded application. 

    - A [!INCLUDE[server](../developer/includes/server.md)] connected to the application database.
    - [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] for [!INCLUDE[prodshort](../developer/includes/prodshort.md)]
    - [!INCLUDE[admintool](../developer/includes/admintool.md)]
    - [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)].

    For more information about upgrading the application code, see [Upgrading the Application Code](Upgrading-the-Application-Code.md).

2. Upgrade toolkit for the application version.

    The upgrade toolkit includes upgrade codeunits for handling the data upgrade.
    For more information about upgrading the application code, see [Upgrading the Application Code](Upgrading-the-Application-Code.md).

    For W1 versions, you can find the default upgrade toolkit objects in the  **UpgradeToolKit\Data Conversion Tools** folder on the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] installation media (DVD). Choose the FOB that matches the [!INCLUDE[navnow](../developer/includes/navnow_md.md)] version from which you are upgrading:

    |  Version  |  FOB  |  Remarks  |
    |-----------|-------|-----------|
    |[!INCLUDE[nav7long](../developer/includes/nav7long_md.md)]|Upgrade7001100.FOB|This file can be found on the [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] [Cumulative Update 2 installation media (DVD)](https://support.microsoft.com/en-us/help/4078580/cumulative-update-02-for-microsoft-dynamics-nav-2018-build-20348?preview). It is not available with later cumulative updates.|
    |[!INCLUDE[navsicily](../developer/includes/navsicily_md.md)]|Upgrade7101100.FOB and Upgrade710HF1100.FOB|This file can be found on the [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] [Cumulative Update 2 installation media (DVD)](https://support.microsoft.com/en-us/help/4078580/cumulative-update-02-for-microsoft-dynamics-nav-2018-build-20348?preview). It is not available with later cumulative updates.|
    | [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)]| Upgrade8001300.FOB||
    | [!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)]| Upgrade9001300.FOB||
    |[!INCLUDE[nav2017](../developer/includes/nav2017.md)]| Upgrade10001300.FOB||
    |[!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)]| Upgrade11001300.FOB||

    For local versions, you will find the upgrade toolkit objects in the **UpgradeToolKit\Local Objects** folder. The files follow the same naming convention except they include the 2-letter local version, such as **Upgrade11001300.DK.fob** for Denmark or **Upgrade11001300.DE.fob** for Germany.  

3.  Exported the permission sets (except SUPER) and permissions from the old tenant database.

    To exclude the SUPER permission set when running XMLPort 9171, add the filter `Role ID is <>SUPER`. 

    For more information, see [Exporting and Importing Permission Sets and Permissions](how-to--import-export-permission-sets-permissions.md#ExportPerms).

4. Custom V1 extensions used in [!INCLUDE[navnow](../developer/includes/navnow_md.md)] have been converted to V2 extensions.

5. Your computer uses the same codepage as the data that will be upgraded.

    If you use conflicting codepages, some characters will not display in captions, and you might not be able to access the upgraded database. This is because [!INCLUDE[prodshort](../developer/includes/prodshort.md)] must remove incorrect metadata characters to complete the data upgrade. In this case, after upgrade, you must open the database in the development environment on a computer with the relevant codepage and compile all objects. This adds the missing characters again.

    <!--Optionally, you can export the captions before the upgrade. For more information, see [How to: Add Translated Strings for Conflicting Text Encoding Formats](How-to--Add-Translated-Strings-for-Conflicting-Text-Encoding-Formats.md)-->.

6.   \(Optional\) Make a copy of the web.config file for all [!INCLUDE[nav_web_server_instance_md](../developer/includes/nav_web_server_instance_md.md)] instances for the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)]. With [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)], [!INCLUDE[nav_web_server_instance_md](../developer/includes/nav_web_server_instance_md.md)] instances run on Microsoft .NET Core. With this change, the instances now use a .json type file (called navsettings.json) instead of the web.config file.

7.   \(Optional\) If the old application uses data encryption, you exported the encryption key file that it used for the data encryption.  

    For more information, see [How to: Export and Import Encryption Keys](how-to-export-and-import-encryption-keys.md).  

<!-- 
7. Prepare for codeunit 1 removal

    With [!INCLUDE[prodshort](../developer/includes/prodshort.md)], codeunit 1 Application Management is no longer used and has been replaced. For more information, see [Transitioning from Codeunit 1](transition-from-codeunit1.md). To prepare for this change when doing a technical upgrade, if you have any custom code in codeunit 1, export the existing codeunit 1 as a .fob or .txt file.
-->
> [!NOTE]
> If the old [!INCLUDE[navnow](../developer/includes/navnow_md.md)] application uses Payment Services for Microsoft Dynamics ERP, be aware that this was discontinued in [!INCLUDE[nav2017](../developer/includes/nav2017.md)]. This means that most of the objects that are associated with this feature will be deleted during the upgrade. Some objects you will have to manually delete. 

##  <a name="SQLBackup"></a> Task 1: Create a full SQL backup of the old tenant database  

Create a full backup of the old database in the SQL Server. Alternatively, you can make a copy of the old database and perform the upgrade tasks on the copy.  

 For more information, see [Create a Full Database Backup \(SQL Server\)](http://msdn.microsoft.com/en-us/library/ms187510.aspx).

## Task 2 Make sure all V1 extensions from the old tenant

Open the [!INCLUDE[nav_shell_md](../developer/includes/nav_shell_md.md)] that matches to old database, and run these commands: 
1.  To get a list of the extensions that are installed, run this command:

    ```
    Get-NAVAppInfo -ServerInstance <ServerInstanceName> -Tenant <TenantID>
    ```
    
    V1 extensions are indicated by `CSIDE` in the `Extension Type` column.
2. For each extension, run this command to uninstall it:

    ```
    Uninstall-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
    ```
## Task 3: Dismount the tenant


##  <a name="ImportAppObj"></a> Task 4: Import the upgrade toolkit into the application database 
Using [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)] for  [!INCLUDE[prodshort](../developer/includes/prodshort.md)], import the upgrade toolkit objects FOB file.

For more information, see [How to: Import Objects](how-to--import-objects.md).



<!-- 
##  <a name="RunSync1"></a> Task 12: Recompile published extensions  
Use the [Repair-NAVApp cmdlet](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/repair-navappSynchronize) of the [!INCLUDE[navnowlong_md](../developer/includes/navnowlong_md.md)] Administration Shell to compile the published extensions to make sure they are work with the new platform and application.

For example, you can run the following command to recompile all extensions:

```
Get-NAVAppInfo -ServerInstance <ServerInstanceName> | Repair-NAVApp
```

efejfefjejf   
-->
## Publish V2 extensions that you want to uses on the tenant


## Mount the on the server


##  <a name="RunSync1"></a> Task 13: Run the schema synchronization on the imported objects (mount-tenant, then run sync)
<!--
1. Recompile published V1 extensions.

    Use the [Repair-NAVApp cmdlet](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/repair-navappSynchronize) of the [!INCLUDE[navnowlong_md](../developer/includes/navnowlong_md.md)] Administration Shell to compile the published extensions to make sure they are work with the new platform and application.

    For example, you can run the following command to recompile all extensions:

    ```
    Get-NAVAppInfo -ServerInstance <ServerInstanceName> | Repair-NAVApp
 2. Mount-navtenant Mount-NAVTenant -ServerInstance DynamicsNAV130 -Tenant MyTenant1 -DatabaseName "Demo Database NA
V (11-0)" -OverwriteTenantIdInDatabase
-->
Synchronize the database schema with validation. You can run the schema synchronization from the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] or [!INCLUDE[adminshell](../developer/includes/adminshell.md)].  

For more information, see [Synchronizing the Tenant Database and Application Database](../adminsitration/synchronize-tenant-database-and application-database.md).

##  <a name="RunStartNavUpgrade"></a> Task 13: Run the data upgrade process  
A data upgrade runs the upgrade toolkit objects, such as upgrade codeunits and upgrade tables, to migrate business data from the old table structure to the new table structure. You can start the data upgrade from the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] or [!INCLUDE[adminshell](../developer/includes/adminshell.md)].  

> [!NOTE]  
>  In the last phase of data upgrade, all companies will be initialized by running codeunit 2 Company Initialization. This is done automatically. If you want to skip company initialization, then use the Start-NavDataUpgrade cmdlet and set the *-SkipCompanyIntitialization* parameter.  

**From the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)]**:  

Open [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] as an administrator. On the **Tools** menu, choose **Data Upgrade**, and then choose **Start** and follow the instructions.  

To view the progress of the data upgrade, on the **Tools** menu, choose **Data Upgrade**, and then choose **Show Progress**.  

**From the [!INCLUDE[adminshell](../developer/includes/adminshell.md)]:**  

Open the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator, and then run Start-NavDataUpgrade cmdlet as follows:  

```  
Start-NavDataUpgrade -ServerInstance <ServerInstanceName> -Force  
```  

Replace `<ServerInstanceName>` with the name of the [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)] instance that is connected to the database.  

To view the progress of the data upgrade, you can run Get-NavDataUpgrade cmdlet with the `–Progress` switch.  

The data upgrade process runs `CheckPreconditions` and `Upgrade` functions in the upgrade codeunits. If any of the preconditions are not met or an upgrade function fails, you must correct the error and resume the data upgrade process. If CheckPreconditions and Upgrade functions are executed successfully, codeunit 2 is automatically run to initialize all companies in the database unless you set the `-SkipCompanyIntitialization` parameter.  

##  <a name="ImportPerms"></a> Task 14: Import upgraded permission sets and permissions by using the Roles and Permissions XMLports  
You import the permission sets and permissions XML files.

1.  Delete all permission sets in the database except the SUPER permission set.  

    In Object Designer, run page 9802 **Permission Sets**, and then delete the permission sets.  

2.  Run XMLport 9171 and XMLport 9172 to import the permission sets and permission XML files.

    For more information, see [How to: Export and Import Permission Sets and Permissions](how-to--import-export-permission-sets-permissions.md#ImportPerms).

##  <a name="SetLang"></a> Task 15: Set the language of the customer database  
 In the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)], choose **Tools**, choose **Language**, and then select the language of the original customer database.  

##  <a name="AddControlAddins"></a> Task 16: Register client control add-ins  
 The database is now fully upgraded and is ready for use. However, [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] includes the following client control add-ins.
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

To use these add-ins, they must be registered in table **2000000069 Client Add-in**. Depending on the version that you upgraded from, all the add-ins might not be registered after the upgrade process. You can register missing control add-ins in the **Control Add-ins** page in the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)]. The assemblies (.dlls) for these add-ins are in subfolders to the **Add-ins** folder of the Dynamics NAV Server installation, which by default is  [!INCLUDE[navnow_install_md](../developer/includes/navnow_install_md.md)]\Service\Add-ins. For more information, see [How to: Register a Windows Client Control Add-in](How-to--Register-a-Windows-Client-Control-Add-in.md).  


##  <a name="AddExtensions"></a> Task 17: Publish and install/upgrade extensions
[!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] includes several extensions that you publish and install as part of the upgrade process. To enable these extensions, it is important that you follow the steps below.

1. Download the system and test symbols file from the *ModernDev* folder on the DVD and the application symbols from [here](http://download.microsoft.com/download/C/7/9/C79AF269-A67E-4EEF-B9F2-52FAFA43E026/Microsoft_Application_11.0.19738.0.app). Make a note of the path where you store the files. 

    <!-- CU6 remove the part about application symbol download>

    > [!NOTE]  
    > If you are upgrading to [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] RTM, the symbols are not included on the DVD, and you must download them here: [system symbols](https://go.microsoft.com/fwlink/?linkid=864045), [test symbols](http://download.microsoft.com/download/C/7/9/C79AF269-A67E-4EEF-B9F2-52FAFA43E026/Microsoft_Test_11.0.19680.0.app), and [application symbols](http://download.microsoft.com/download/C/7/9/C79AF269-A67E-4EEF-B9F2-52FAFA43E026/Microsoft_Application_11.0.19738.0.app).  
    If you are upgrading to [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] CU1, or higher, please use the symbols that you find in the *ModernDev* folder on the cumulative update DVD. 
    -->
  
2. Publish the platform, test, and application symbols one file at a time to the Dynamics NAV server instance:

    Open the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator, and run the following command for each of the symbol files:

    ```
    Publish-NAVApp -ServerInstance <ServerInstanceName> -Path <SymbolFilePath> -PackageType SymbolsOnly
    ```

   <!--  
    > [!NOTE]  
    > If you are upgrading to [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] RTM, you must also publish the application symbol file.

    -->

3. Make sure that **Enable loading application symbol references at server startup** (EnableSymbolLoadingAtServerStartup) is set on the Dynamics NAV server instance.

    For more information, see [Configuring Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).
4. Generate the application symbol references for running Running C/SIDE and AL Side-by-Side:

    1. Open a command prompt, change to the directory where the `finsql.exe` file has been installed as part of [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)], and then run the following command:

        ```
        finsql.exe Command=generatesymbolreference, Database=<MyDatabaseName>, ServerName=<DatabaseServerName>\<DatabaseInstance>
        ```

        Replace values for the `Database` and `ServerName` settings to suit.

        > [!NOTE]  
        >  This command does not generate a file. It populates the **Object Metadata** table in the database.
    2. When you run the command, the console returns to an empty command prompt, and does not display or provide any indication about the status of the run. However, the finsql.exe may still be running in the background. It can take several minutes for the run to complete, and the symbols will not be generated until such time.  You can see whether the finsql.exe is still running by using Task Manager and looking on the **Details** tab for **finsql.exe**. 
    
        When the process ends, a file named **navcommandresult.txt** is saved to the [!INCLUDE[nav_windows_md](../developer/includes/nav_windows_md.md)] installation folder. If the command succeeded, the file will contain text like `[0] [06/12/17 14:36:17] The command completed successfully in '177' seconds.` If the command failed, another file named **naverrorlog.txt** will be generated. This file contains details about the error(s) that occurred. 
            
    For more information about generation symbols, see [Running C/SIDE and AL Side-by-Side](developer/devenv-running-cside-and-al-side-by-side.md).

5. Publish all the extensions from the `\Extensions` folder of the [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] installation media (DVD):

    1. From the [!INCLUDE[adminshell](../developer/includes/adminshell.md)], run the following command for each extension.

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

6.  Upgrade the V1 extensions that you uninstalled previously in Task 3 by reinstalling them. From the [!INCLUDE[adminshell](../developer/includes/adminshell.md)], run the following commands: 

    1. To get a list of the published extensions on the server instance, run this command:
    
        ```
        Get-NAVAppInfo -ServerInstance <ServerInstanceName>
        ```

    2. To determine which V1 extensions to install, inspect the list that appears, and compare it with the list that you gathered in Task 3. V1 extensions are indicated by `Extension Type : CSIDE`.
    
        -   If there is only one version of an extension, which matches the version in the old list, then go to step 6c to reinstall the version. 
        -   If there is a newer version of an extension and its `Extension Type` is also `CSIDE`, then go to step 6c to install and upgrade to the newer V1 extension. 
        -   If there is a newer version of an extension but its `Extension Type` is `ModernDev`, then go to step 6d to upgrade the old V1 extension to the V2 extension. 

    3. For each V1 Extension that you want to reinstall or upgrade, run this command:
    
        ```  
        Install-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N> –Tenant <TenantID>
        ```
    
        Replace `<Name>` and `<N.N.N.N>` with the name and version of the Extension V1 as it appeared in the previous step. For `<TenantID>`, in single-tenant deployments, you either specify `default` or you omit the `–Tenant` parameter.
        
        This will upgrade the V1 extensions.

        Optionally, if you installed a newer version of an extension, unpublish the old version: 
         
        ```
        Unpublish-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
        ```
    4.  For each V1 Extension that you want to upgrade to a V2 Extension, run these commands:

        ```
        Sync-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
        Start-NAVAppDataUpgrade -ServerInstance DynamicsNAV -Name ProswareStuff -Version <N.N.N.N>
        ``` 
        This will upgrade the V2 extensions.

        Optionally, unpublish the V1 extension.
          
        ```
        Unpublish-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
        ```

7. For the Denmark (DK) local version of [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)], you must install the following new V2 extensions to get all the local functionality.

    |Name|Publisher|Version|
    |----|---------|-------|
    |Payroll Data Import Definitions (DK)|    Microsoft| 1.0.19502.0 (or later)|
    |Payment and Reconciliation Formats (DK)| Microsoft| 1.0.19502.0 (or later)|
    |Tax File Formats (DK)| Microsoft| 1.0.19502.0 (or later)|

    For each Extension V2, run this command:

    ```
    Install-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N> 
    ```
8. Recompile published V1 extensions.

    Use the [Repair-NAVApp cmdlet](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/repair-navappSynchronize) of the [!INCLUDE[navnowlong_md](../developer/includes/navnowlong_md.md)] Administration Shell to compile the published extensions to make sure they are work with the new platform and application.

    For example, you can run the following command to recompile all extensions:

    ```
    Get-NAVAppInfo -ServerInstance <ServerInstanceName> | Repair-NAVApp
    ```
   
## Task 18: Update the Dynamics NAV Web client configuration file (navsettings.json)
If you have installed the [!INCLUDE[nav_web_server_md](../developer/includes/nav_web_server_md.md)], populate the navsettings.json file for the [!INCLUDE[nav_web_server_instance_md](../developer/includes/nav_web_server_instance_md.md)] instance with the settings of the old web.config file.

For more information, see [Configuring Microsoft Dynamics NAV Web Client by Modifying the NavSettings.json File](configure-web-server.md.md).  

<!-- deprecated ##  <a name="UploadEncryptionKeys"></a> Task 16: Import Payment Services and Data Encryption Key \(Optional\)  

-   If you want to set up Payment Services for Microsoft Dynamics ERP as before, you must upload the payment service encryption key file that was downloaded previously.  

     You upload the encryption key from the **DO Payment Connection Setup** window in the [!INCLUDE[navnow](../developer/includes/navnow_md.md)] client. For more information, see [DO Payment Connection Setup](assetId:///58e1ceda-e705-41f4-9f28-a027d8b816f9).  

-   If you want to use data encryption as before, you must import the data encryption key file that was exported previously.  

     For more information, see [How to: Export and Import Encryption Keys](How-to--Export-and-Import-Encryption-Keys.md).  -->


## Task 19: Configure pages and reports included in the MenuSuite to be searchable in the [!INCLUDE[d365fin_web_md.md](../developer/includes/d365fin_web_md.md)]

The MenuSuite is no longer used to control whether a page or report can be found in the search feature of the Web client. This is now determined by specific properties on the page and report objects.  For more information, see [Making Pages and Reports Searchable After an Upgrade](upgrade-pages-reports-for-search.md).

## Task 20. Transition the custom code in the old codeunit 1 to use the new system event implentation. 

##  <a name="DeleteUpgCodeunits"></a> Task 21: Delete the upgrade objects
At this point, you have upgraded the database to [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)]. Now, you can delete the upgrade codeunits and upgrade table objects that you imported in task 9. This task is recommended but not required.  

When you delete tables, on the **Delete** dialog box, set the **Synchronize Schema** option to **Force**.  


<!-- 
7.  Upgrade V2 extensions that are currently installed: 

    1. To get a list of the installed V2 extensions, run this command:
    
        ```
        Get-NAVAppInfo -ServerInstance <ServerInstanceName> -Tenant <TenantID>
        ```
        
        Replace `<ServerInstanceName>` with the name of the [!INCLUDE[nav_server_md](../developer/includes/nav_server_md.md)] instance that the database connects to. Replace `<TenantID>` with the tenant ID of the database. If you do not have a multitenant server instance, use `default`.
        
        V2 extensions are indicated by `Extension Type : ModernDev`.
    2. For each Extension V2 that you want to upgrade, run these commands:

        ```
        Sync-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
        Start-NAVAppDataUpgrade -ServerInstance DynamicsNAV -Name ProswareStuff -Version <N.N.N.N>
        ``` 
    
        This will upgrade the V2 extensions.
-->

## See Also  
 [Upgrading the Application Code](Upgrading-the-Application-Code.md)   
 [Automating the Upgrade Process using Sample Windows PowerShell Scripts](Automating-the-Upgrade-Process-using-Sample-Windows-PowerShell-Scripts.md)   
 [Synchronizing Table Schemas](Synchronizing-Table-Schemas.md)   
 [Upgrading to Microsoft Dynamics NAV](Upgrading-to-Microsoft-Dynamics-NAV.md)
