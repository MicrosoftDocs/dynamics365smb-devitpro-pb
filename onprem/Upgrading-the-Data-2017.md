---
title: "Upgrading the Data"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
manager: edupont
ms.prod: "dynamics-nav-2017"
---
# Upgrading the Data to Dynamics NAV 2017

**Applies to:** [!INCLUDE[nav2017](includes/nav2017.md)]. [See [!INCLUDE[nav2018_md](includes/nav2018_md.md)] version](Upgrading-the-Data.md).

This topic describes the tasks required for upgrading the following database versions to [!INCLUDE[nav2017](includes/nav2017.md)]:
-   [!INCLUDE[nav7long](includes/nav7long_md.md)]
-   [!INCLUDE[navsicily](includes/navsicily_md.md)]
-   [!INCLUDE[navcrete](includes/navcrete_md.md)]
-   [!INCLUDE[navcorfu](includes/navcorfu_md.md)]

You use data conversion tools provided with [!INCLUDE[nav2017](includes/nav2017.md)] to convert the old data with the old version’s table and field structure, so that it functions together with the new version’s table and field structure. Mainly, only table objects and table data are modified during the data upgrade process. Other objects, such as pages, reports, codeunits, and XMLports are upgraded as part of the application code upgrade process.

The data upgrade process described in this article leads you through the database conversion (technical upgrade) and then the upgrade of the actual data, which is achieved by using the upgrade toolkit/upgrade codeunits.

##  <a name="Prereqs"></a> Prerequisites  
Before you start the upgrade tasks, make sure you meet the following prerequisites:
1.  Your computer uses the same codepage as the data that will be upgraded.

    If you use conflicting codepages, some characters will not display in captions, and you might not be able to access the upgraded database. This is because [!INCLUDE[navnowlong_md](includes/navnowlong_md.md)]  must remove incorrect metadata characters to complete the data upgrade. In this case, after upgrade, you must open the database in the development environment on a computer with the relevant codepage and compile all objects. This adds the missing characters again.

    Optionally, you can export the captions before the upgrade. For more information, see [How to: Add Translated Strings for Conflicting Text Encoding Formats](How-to--Add-Translated-Strings-for-Conflicting-Text-Encoding-Formats.md).

2.  You have a FOB file that contains the upgraded application code and upgrade toolkit. The upgrade toolkit can also be in a separate FOB file.  

    For more information about upgrading the application code, see [Upgrading the Application Code](Upgrading-the-Application-Code.md).

    You can find the default upgrade toolkit objects in the  **UpgradeToolKit\Data Conversion Tools** folder on the [!INCLUDE[nav2017](includes/nav2017.md)] installation media (DVD). Choose the FOB that matches the [!INCLUDE[navnow](includes/navnow_md.md)] version from which you are upgrading:

    -   Upgrade7001000.FOB for [!INCLUDE[nav7long](includes/nav7long_md.md)]
    -   Upgrade7101000.FOB and Upgrade710HF1000.FOB for [!INCLUDE[navsicily](includes/navsicily_md.md)]
    -   Upgrade8001000.FOB for [!INCLUDE[navcrete](includes/navcrete_md.md)]
    -   Upgrade9001000.FOB for [!INCLUDE[navcorfu](includes/navcorfu_md.md)]

3.   You have exported the permission sets and permissions as XML files.

    For more information, see [How to: Export and Import Permission Sets and Permissions](how-to--import-export-permission-sets-permissions.md#ExportPerms).

4.   \(Optional\) If the old [!INCLUDE[navnow](includes/navnow_md.md)] application uses data encryption, you exported the encryption key file that it used for the data encryption.  

    For more information, see [How to: Export and Import Encryption Keys](how-to-export-and-import-encryption-keys.md).  

> [!NOTE]
>If the old Microsoft Dynamics NAV application uses Payment Services for Microsoft Dynamics ERP, be aware that this is discontinued in [!INCLUDE[navnowlong_md](includes/navnowlong_md.md)]. This means that most of the objects that are associated with this feature will be deleted during the upgrade. Some objects you will have to manually delete.

## Task 1: Prepare the old database

1. Use the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] that matches the old database to build all application objects.  

    For more information, see [How to: Build Server Application Objects](How-to--Build-Server-Application-Objects.md).  

2.  Unlock all application objects.  

    For more information, see [How to: Unlock an Object](How-to--Unlock-an-Object.md).  

3.  Synchronize the database schema by using the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] or Dynamics NAV Administration Shell that matches the old database.  

    For more information, see [How to: Synchronize the Tenant Database with the Application Database](How-to--Synchronize-the-Tenant-Database-with-the-Application-Database.md).

4.   If the old database includes test runner codeunits, you have modified the signature of the OnBeforeTestRun and OnAfterTestRun triggers of the test runner codeunits to include the *TestPermission* parameter

    For more information, see [Resolving OnBeforeTestRun and OnAfterTestRun Trigger Errors When Converting a Database](Resolve-OnBeforeTestRun-OnAfterTestRun-Compile-Errors.md).

    The triggers for codeunit **130400 CAL Test Runner** and **130402 CAL Command Line Test Runner** will be updated for you during the data upgrade.

##  <a name="SQLBackup"></a> Task 2: Create a full SQL backup of the old database on SQL Server  
 You must create a full backup of the old database in the SQL Server. Alternatively, you can make a copy of the old database and perform the upgrade tasks on the copy.  

 For more information, see [Create a Full Database Backup \(SQL Server\)](http://msdn.microsoft.com/en-us/library/ms187510.aspx).  

##  <a name="UploadLicense"></a> Task 3: Upload the [!INCLUDE[nav2017](includes/nav2017.md)] license to the old database  
By using the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] that matches the old database, upload the [!INCLUDE[nav2017](includes/nav2017.md)] license to the database.

For more information, see [Uploading a License File for a Specific Database](How-to--Upload-the-License-File.md#UploadtoDatabase).  

##  <a name="DeleteObjects"></a> Task 4: Delete all objects except tables from the old database   
In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] version that matches the database, open the old database, open Object Designer, select all objects except tables, and then choose **Delete**.

You can also use the [DeleteObjects](DeleteObjects.md) command of the finsql.exe.

##  <a name="UninstallOldProduct"></a> Task 5: Uninstall the old product and install the new product (Optional)
 Uninstall the old [!INCLUDE[navnow_md](includes/navnow_md.md)], and then install [!INCLUDE[nav2017](includes/nav2017.md)].  

During installation of [!INCLUDE[nav2017](includes/nav2017.md)], you can either choose the **Install Demo** option, for which you will discard the Demo database afterwards, or choose the **Custom** option, where you then select to install the Client \(with the Development Environment\), Server, and Administration Tool components.  

## Task 6: Clear Dynamics NAV Server instance records from old database
Clear all [!INCLUDE[nav_server](includes/nav_server_md.md)] instance records from the **dbo.Server Instance** table in the  database in SQL Server.  

1.  Make sure that you stop the old [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, and close any tools that connect to the database, such as the Dynamics NAV Administration Tool and [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)].
2.  Using SQL Server Management Studio, open and clear the **dbo.Server Instance** table of the old database. For example, you can run the following SQL query:
    ```
    DELETE FROM [My NAV Database Name].[dbo].[Server Instance]
    ```

##  <a name="ConvertDb"></a> Task 7: Convert the old database to the [!INCLUDE[nav2017](includes/nav2017.md)] format  
 To convert the old database to the [!INCLUDE[nav2017](includes/nav2017.md)] format, open the old database in the [!INCLUDE[nav2017](includes/nav2017.md)] [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], and follow the conversion instructions.

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

##  <a name="ImportAppObj"></a> Task 8: Import the application objects to the converted database and compile  
In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], import all the application objects that you want in the [!INCLUDE[nav2017](includes/nav2017.md)] database. This includes the FOB file that contains all the [!INCLUDE[nav2017](includes/nav2017.md)] objects from the application code upgrade and upgrade toolkit objects.

1. If the upgrade toolkit objects are stored in a separate FOB file, then import the upgrade toolkit FOB file after the application objects are imported. For more information, see [How to: Import Objects](how-to--import-objects.md).

2. When you import the FOB file, if you experience metadata conflicts, the **Import Worksheet** windows appears. Use this window to handle these conflicts. For more information, see [Import Worksheet](Import-Worksheet.md).

3. When prompted, set the **Synchronize Schema** option to **Later**.  

##  <a name="ConnectToServer"></a> Task 9: Connect a [!INCLUDE[nav2017](includes/nav2017.md)] Server instance to the converted database  
You use the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] to connect a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to the converted database.  

In addition, you must add the service account that is used by the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance as a member of the **db\_owner** role in the [!INCLUDE[navnow](includes/navnow_md.md)] database on SQL Server.  

> [!IMPORTANT]  
>  When upgrading a large database, you should increase the **SQL Command Timeout** setting for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, to avoid timeouts during schema synchronization. The default setting is 30 minutes.  

For more information, see [How to: Connect a Microsoft Dynamics NAV Server Instance to a Database](How-to--Connect-a-Microsoft-Dynamics-NAV-Server-Instance-to-a-Database.md) and [Giving the account necessary database privileges in SQL Server](Provisioning-the-Microsoft-Dynamics-NAV-Server-Account.md#dbo).

##  <a name="CompSysTables"></a> Task 10: Compile all objects that are not already compiled

Use the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] or finsql.exe to compile all objects that are not already compiled. This includes the imported application objects, data tables, and system tables. Choose to run schema synchronization later.

For example, in Object Designer, choose **Tools**, choose **Compile**, set the **Synchronize Schema** option to **Later**, and then choose **OK**. For more information, see [Compiling Objects](compiling-objects.md).

If you get errors on the following table objects, use the Object Designer to delete the objects because they are no longer used.

-   Table 470 Job Queue (replaced by the [Task Scheduler](Task-Scheduler.md))
-   Table 824 DO Payment Connection Details
-   Table 825 DO Payment Connection Setup
-   Table 827 DO Payment Credit Card
-   Table 828 DO Payment Credit Card Number
-   Table 829 DO Payment Trans. Log Entry
-   Table 1510 Notification Template

When you delete a table object, in the **Delete** confirmation dialog box, set the **Synchronize Schema** option to **Force**. At this point, it is very important that you do not use the **Sync. Schema For All Tables** option from the **Tools** menu.  

##  <a name="RunSync1"></a> Task 11: Run the schema synchronization on the imported objects  
You can run the schema synchronization from the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] or [!INCLUDE[nav_shell](includes/nav_shell_md.md)].  

For more information, see [How to: Synchronize the Tenant Database with the Application Database](How-to--Synchronize-the-Tenant-Database-with-the-Application-Database.md).  

##  <a name="RunStartNavUpgrade"></a> Task 12: Run the data upgrade process  
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

To view the progress of the data upgrade, you can run Get-NavDataUpgrade cmdlet with the –Progress switch.  

The data upgrade process runs CheckPreconditions and Upgrade functions in the upgrade codeunits. If any of the preconditions are not met or an upgrade function fails, you must correct the error and resume the data upgrade process. If CheckPreconditions and Upgrade functions are executed successfully, codeunit 2 is automatically run to initialize all companies in the database unless you set the *SkipCompanyIntitialization* parameter.  

##  <a name="DeleteUpgCodeunits"></a> Task 13: Delete the upgrade objects  
At this point, you have upgraded the database to [!INCLUDE[nav2017](includes/nav2017.md)]. Now, you can delete the upgrade codeunits and upgrade table objects that you imported in task 9.  

When you delete tables, on the **Delete** dialog box, set the **Synchronize Schema** option to **Force**.  

##  <a name="ImportPerms"></a> Task 14: Import upgraded permission sets and permissions by using the Roles and Permissions XMLports  
You import the permission sets and permissions XML files.

1.  Delete all permission sets in the database except the SUPER permission set.  

    In Object Designer, run page 9802 **Permission Sets**, and then delete the permission sets.  

2.  Run XMLport 9171 and XMLport 9172 to import the permission sets and permission XML files.

    For more information, see [How to: Export and Import Permission Sets and Permissions](how-to--import-export-permission-sets-permissions.md#ImportPerms).

##  <a name="SetLang"></a> Task 15: Set the language of the customer database  
 In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], choose **Tools**, choose **Language**, and then select the language of the original customer database.  

##  <a name="AddControlAddins"></a> Task 16: Register client control add-ins  
 The database is now fully upgraded and is ready for use. However, [!INCLUDE[navnowlong](includes/navnowlong_md.md)] includes the following client control add-ins.
-   Microsoft.Dynamics.Nav.Client.BusinessChart  
-   Microsoft.Dynamics.Nav.Client.CodeViewer
-   Microsoft.Dynamics.Nav.Client.DynamicsOnlineConnect
-   Microsoft.Dynamics.Nav.Client.OAuthIntegration
-   Microsoft.Dynamics.Nav.Client.PageReady  
-   Microsoft.Dynamics.Nav.Client.PingPong  
-   Microsoft.Dynamics.Nav.Client.SocialListening  
-   Microsoft.Dynamics.Nav.Client.TimelineVisualization
-   Microsoft.Dynamics.Nav.Client.VideoPlayer  
-   Microsoft.Dynamics.Nav.Client.WebPageViewer

To use these add-ins, they must be registered in table **2000000069 Client Add-in**. Depending on the version that you upgraded from, all the add-ins might not be registered after the upgrade process. You can register missing control add-ins in the **Control Add-ins** page in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. The assemblies (.dlls) for these add-ins are located in subfolders to the **Add-ins** folder of the Dynamics NAV Server installation, which by default is  [!INCLUDE[navnow_install_md](includes/navnow_install_md.md)]\Service\Add-ins. For more information, see [How to: Register a Windows Client Control Add-in](How-to--Register-a-Windows-Client-Control-Add-in.md).  

<!-- deprecated ##  <a name="UploadEncryptionKeys"></a> Task 16: Import Payment Services and Data Encryption Key \(Optional\)  

-   If you want to set up Payment Services for Microsoft Dynamics ERP as before, you must upload the payment service encryption key file that was downloaded previously.  

     You upload the encryption key from the **DO Payment Connection Setup** window in the [!INCLUDE[navnow](includes/navnow_md.md)] client. For more information, see [DO Payment Connection Setup](assetId:///58e1ceda-e705-41f4-9f28-a027d8b816f9).  

-   If you want to use data encryption as before, you must import the data encryption key file that was exported previously.  

     For more information, see [How to: Export and Import Encryption Keys](How-to--Export-and-Import-Encryption-Keys.md).  -->

## See Also  
 [Upgrading the Application Code](Upgrading-the-Application-Code.md)   
 [Automating the Upgrade Process using Sample Windows PowerShell Scripts](Automating-the-Upgrade-Process-using-Sample-Windows-PowerShell-Scripts.md)   
 [Synchronizing Table Schemas](Synchronizing-Table-Schemas.md)   
 [Upgrading to Microsoft Dynamics NAV 2017](Upgrading-to-Microsoft-Dynamics-NAV-2017.md)
