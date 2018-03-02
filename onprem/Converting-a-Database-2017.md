---
title: "Converting a Database - Technical Upgrade"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
manager: edupont
ms.prod: "dynamics-nav-2017"
author: jswymer
---
# Converting a Database - Technical Upgrade

**Applies to:** [!INCLUDE[nav2017](includes/nav2017.md)]. [See [!INCLUDE[nav2018_md](includes/nav2018_md.md)] version](Converting-a-Database.md).

This article describes how to convert a  [!INCLUDE[navnow](includes/navnow_md.md)] database from one of the following versions to [!INCLUDE[nav2017](includes/nav2017.md)]:

-   [!INCLUDE[nav7long](includes/nav7long_md.md)]
-   [!INCLUDE[navsicily](includes/navsicily_md.md)]
-   [!INCLUDE[navcrete](includes/navcrete_md.md)]
-   [!INCLUDE[navcorfu](includes/navcorfu_md.md)]
-   [!INCLUDE[nav2017](includes/nav2017.md)] (cumulative update)

## About database conversion
Converting a database, which is often referred to as a *technical upgrade*, changes the database so that it works on the new [!INCLUDE[nav2017](includes/nav2017.md)] platform. The conversion updates the system tables of the old database to the new schema (data structure), and upgrades of all reports to support Report Viewer 2015. It provides you with the latest platform features and performance enhancements.

<!--You typically convert a database, as described in this article, when you want to upgrade an existing [!INCLUDE[nav2017](includes/nav2017.md)] database to a new platform version that does not include application changes. A database conversion is typically what is required for a cumulative update.

Converting a database does not upgrade the application objects (like pages, reports, and codeunits) or the business data to [!INCLUDE[nav2017](includes/nav2017.md)]. Therefore, performing a database conversion alone is usually not sufficient when upgrading from an earlier version of [!INCLUDE[navnow](includes/navnow_md.md)] to [!INCLUDE[nav2017](includes/nav2017.md)] or when upgrading an existing [!INCLUDE[nav2017](includes/nav2017.md)] installation to new platform and application versions. For these upgrade scenarios, you should perform a full upgrade by completing the tasks [Upgrading the Application Code](Upgrading-the-Application-Code.md) and [Upgrading the Data](Upgrading-the-Data.md), which will also cover the database conversion. You can choose to convert the old database and not upgrade your application. However, we recommend that you upgrade the application objects as well so that your solution includes important application fixes and new functionality that is introduced in [!INCLUDE[nav2017](includes/nav2017.md)]. Upgrading the application will also reduce the amount of merging required to upgrade to the next major version of [!INCLUDE[navnow](includes/navnow_md.md)], bringing you to the latest version of the product faster.  
-->
<!--
> [!IMPORTANT]  
>  Before you start, make sure that you have applied the changes that are described in KB 2804640 [Code corrections for some Microsoft Dynamics NAV 2013 reports to prevent compilation errors with Report Viewer 2012 when upgrading to later versions of Microsoft Dynamics NAV](https://mbs.microsoft.com/knowledgebase/KBDisplay.aspx?scid=kb;EN-US;2804640).
-->

## Task 1: Preparing the Old Database  
To convert the old database to a [!INCLUDE[nav2017](includes/nav2017.md)] database, the first task is to back up the old database and then prepare to convert it.

> [!NOTE]  
>  Do not perform this task if you are converting the database from one cumulative update of [!INCLUDE[nav2017](includes/nav2017.md)] to the next cumulative update. In this case, you only have to complete task 2.

#### To prepare the old database  

1.  Make a copy of the old database or create full database backup.  

     For more information, see [Create a Full Database Backup \(SQL Server\)](http://go.microsoft.com/fwlink/?LinkID=296465).  

2.  Open the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] that matches the [!INCLUDE[navnow](includes/navnow_md.md)] version of the old database, and then connect to the old database.  

     For more information, see [How to: Open Databases](How-to--Open-Databases.md).  

3.  In Object Designer, verify that no objects are locked.  

     If one or more objects are locked, the conversion process cannot update the database version number. As a result, the conversion does not complete.  

4.  On the **Tools** menu, choose **Build Server Application Objects**, and then choose the **Yes** button.  

    > [!NOTE]  
    >  This step does not compile objects in the old database that have not been compiled before.  

5.  If any errors occur, they are shown in the **Error List** window. Make sure that you address all compilation errors before you continue.  

6.  Upload the [!INCLUDE[nav2017](includes/nav2017.md)] Partner license to the database  

     For more information, see [Uploading a License File for a Specific Database](How-to--Upload-the-License-File.md#UploadtoDatabase).  

    > [!IMPORTANT]  
    >  The license that you upload must be a developer license. During the conversion, the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] will convert the report objects that are stored in the old database to the RDL 2012 format.  

7.  Run the schema synchronization with validation to synchronize the database schema changes.  

    For more information, see [How to: Synchronize the Tenant Database with the Application Database](How-to--Synchronize-the-Tenant-Database-with-the-Application-Database.md).  

8.  Stop the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.

    You can use the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] or [Set-NAVServerInstance](https://go.microsoft.com/fwlink/?linkid=401395) cmdlet of the [!INCLUDE[nav_shell](includes/nav_shell_md.md)].

    For information about the [!INCLUDE[nav_admin](includes/nav_admin_md.md)], see [How to: Start, Stop, Restart, or Remove a Dynamics NAV Server Instance](How-to--Start--Stop--Restart--or-Remove-a-Microsoft-Dynamics-NAV-Server-Instance.md).

    To use the Set-NAVServerInstance cmdlet, run the following command:
    ```
    Set-NAVServerInstance –ServerInstance <ServerInstanceName> -Stop
    ```
9.  Clear all [!INCLUDE[nav_server](includes/nav_server_md.md)] instance records from the **dbo.Server Instance** table in the database on SQL Server.  

    You can do this by using SQL Server Management Studio to clear the table. For example, you can run the following SQL query:
    ```
    DELETE FROM [My NAV Database Name].[dbo].[Server Instance]
    ```

10.  (Optional) Before you start the following procedure, you can uninstall the old version of [!INCLUDE[navnow_md](includes/navnow_md.md)]. When you uninstall [!INCLUDE[navnow_md](includes/navnow_md.md)], the database is still attached to the instance of SQL Server, which you can verify using SQL Server Management Studio.

## Task 2: Converting the Old Database  
Next, you will convert the old database so that it can be used in [!INCLUDE[nav2017](includes/nav2017.md)].

> [!TIP]  
>  If you want to write a script that helps you convert databases, you can use the Invoke-NAVDatabaseConversion function in the [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)].  

#### To convert the database  

1.  Install [!INCLUDE[nav2017](includes/nav2017.md)].  

     Run the [!INCLUDE[nav2017](includes/nav2017.md)] Setup, and choose to install the **Developer** option.  

2.  Run the [!INCLUDE[nav2017](includes/nav2017.md)] development environment as an administrator, and then connect to the database that you prepared in the previous task.  

     For more information, see [How to: Open Databases](How-to--Open-Databases.md).  

3.  In the dialog box that appears, read the instructions carefully because this action cannot be reversed. When you are ready, choose the **OK** button, and then choose the **OK** button to confirm that you want to convert the database.  

     [!INCLUDE[navnow](includes/navnow_md.md)] will now convert the database. This includes an upgrade of system tables, and an upgrade of all reports to support Report Viewer 2012.  

4.  When you are notified that the conversion was successful, choose the **OK** button.  

5.  Connect a [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Server instance to the converted database.  

     You use the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] to connect a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to the converted database.  

     In addition, you must add the service account that is used by the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance as a member of the **db\_owner** role in the [!INCLUDE[navnow](includes/navnow_md.md)] database on SQL Server.  

     For more information, see [How to: Connect a Microsoft Dynamics NAV Server Instance to a Database](How-to--Connect-a-Microsoft-Dynamics-NAV-Server-Instance-to-a-Database.md) and [Giving the account necessary database privileges in SQL Server](Provisioning-the-Microsoft-Dynamics-NAV-Server-Account.md#dbo).  

6.  Go to the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], and set it to use the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that connects to the database.  

     For more information, see [How to: Change the Microsoft Dynamics NAV Server Instance](How-to--Change-the-Microsoft-Dynamics-NAV-Server-Instance.md) or [Database Information](uiref/-$-S_2349-Database-Information-$-.md).  

7.  Run the schema synchronization with validation to complete the database conversion.  

    For more information, see [How to: Synchronize the Tenant Database with the Application Database](How-to--Synchronize-the-Tenant-Database-with-the-Application-Database.md).  

8.  If the database references any assemblies \(such as client control add-ins\) that are not included on the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] installation media \(DVD\), then add the assemblies to the Add-ins folder on [!INCLUDE[nav_server](includes/nav_server_md.md)] or [!INCLUDE[nav_windows](includes/nav_windows_md.md)] computers.  

     For the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], the default path is [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\RoleTailored Client\\Add-ins folder.  

     For [!INCLUDE[nav_server](includes/nav_server_md.md)], the default path is the [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\Service\\Add-ins folder  

9. In the development environment, on the **Tools** menu, choose **Build Server Application Objects**, and then, in the dialog box, choose the **Yes** button.  

10. Fix compilation errors.  

    If any errors occur, they are shown in the **Error List** window.

    For information about compilation errors when you are converting a [!INCLUDE[nav7long](includes/nav7long_md.md)] database, see [Resolving Compilation Errors When Converting a Microsoft Dynamics NAV 2013 Database](Compilation-Errors-When-Converting-a-Microsoft-Dynamics-NAV-2013-Database.md).  

    For information about compilation errors when you are converting a [!INCLUDE[navcorfu_md](includes/navcorfu_md.md)] database, see [Resolving Compilation Errors When Converting a Microsoft Dynamics NAV 2016 Database](Resolve-Compile-Errors-When-Converting-Dynamics-NAV-2016-Database.md).  

    You can find all objects which did not compile in the **Object Designer** window, by setting a field filter on the **Compiled** field.  

11.  If you converted a [!INCLUDE[navcorfu_md](includes/navcorfu_md.md)], you will have to modify C/AL code to ensure that the **My Settings** page works properly in the [!INCLUDE[nav_web_md](includes/nav_web_md.md)]. For more information, see [Resolving My Settings Page Implementation After a Database Conversion](Resolve-MySettings-Page-After-Upgrade.md).

12. Upload the customer license to the converted database.  

    For more information, see [Uploading a License File for a Specific Database](How-to--Upload-the-License-File.md#UploadtoDatabase).  

 You have now completed the conversion of the database to be accessed from [!INCLUDE[nav2017](includes/nav2017.md)]. To test the converted database, you can connect it to the [!INCLUDE[nav2017](includes/nav2017.md)] Server instance that is used by [!INCLUDE[navnow](includes/navnow_md.md)] clients, and then open a client.  

## Database and Windows collations  
 Starting from SQL Server 2008, SQL Server collations are fully aligned with the collations in Windows Server. If you upgrade to [!INCLUDE[navnow](includes/navnow_md.md)] from [!INCLUDE[nav_2009_long](includes/nav_2009_long_md.md)], the step to convert the database includes upgrading the database from using SQL collations to using Windows collation. This collation change provides users with the most up-to-date and linguistically accurate cultural sorting conventions. For more information, see [Collation and Unicode Support](http://go.microsoft.com/fwlink/?LinkID=247971).  


## See Also  
 [Upgrading the Application Code](Upgrading-the-Application-Code.md)   
 [Upgrading the Data](Upgrading-the-Data.md)   
 [Upgrading to Microsoft Dynamics NAV 2017](Upgrading-to-Microsoft-Dynamics-NAV-2017.md)   
 [Automating the Upgrade Process using Sample Windows PowerShell Scripts](Automating-the-Upgrade-Process-using-Sample-Windows-PowerShell-Scripts.md)
