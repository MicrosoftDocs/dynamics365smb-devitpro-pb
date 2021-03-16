---
title: Creating and Altering Business Central Databases in CSIDE
description: Create a new database in the development environment and by using the New-NAVDatabase cmdlet in the Administration Shell. 
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Creating and Altering [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Databases

[!INCLUDE[2019_Spring](../includes/2019_Spring.md)]

You can create new [!INCLUDE[prod_short](../developer/includes/prod_short.md)] databases in the [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)] and by using the [New-NAVDatabase](https://go.microsoft.com/fwlink/?LinkID=401374) cmdlet in the [!INCLUDE[devshell](../developer/includes/devshell.md)].  

>[!NOTE]
> [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)] is [!INCLUDE[2019_releasewave2_deprecated](../includes/2019_releasewave2_deprecated.md)].

When you create a database you must specify the SQL Server instance for the database and the authentication type.  

<!-- 
### To download symbols


Before you create a database, you must make sure to download symbols first.

1. Download the [platform symbols](https://go.microsoft.com/fwlink/?linkid=864045), the [test symbols](https://download.microsoft.com/download/C/7/9/C79AF269-A67E-4EEF-B9F2-52FAFA43E026/Microsoft_Test_11.0.19680.0.app), and the [application symbols](https://download.microsoft.com/download/C/7/9/C79AF269-A67E-4EEF-B9F2-52FAFA43E026/Microsoft_Application_11.0.19738.0.app).  
Make a note of the location where you store the files. 
2. Publish the symbol files, one file at a time to the Dynamics NAV Server instance:  
Open the [!INCLUDE[nav_shell](../developer/includes/nav_shell_md.md)] as an administrator, and run the following command for each of the symbol files:

    ```
    Publish-NAVApp -ServerInstance <ServerInstanceName> -Path <SymbolFilePath> -PackageType SymbolsOnly
    ```

-->
## Create a database  

1.  In the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)], on the **File** menu, choose **Database**, and then choose **New**.  

2.  In the **Server Name** field, enter the name of the SQL Server instance. You can choose the up arrow to select the server from a list of available servers or you can enter the server name manually.  

3.  In the **Authentication** field, select the type of authentication that you require. Choose the drop-down arrow to select **Database Server Authentication** or **Windows Authentication**.  

    -   If you select **Database Server Authentication**, then authentication is performed by the SQL Server instance that you have selected.  

    -   If you select **Windows Authentication**, then authentication is performed by the Windows domain controller.  

4.  In the **User ID** field, enter your User ID if you have selected **Database Server Authentication**.  

5.  In the **Password** field, enter your password if you have selected **Database Server Authentication**.  

6.  To set the network type to be used when connecting to the server, choose the **Advanced** tab and select the net type from the drop down list box in the **Net Type** field. However, it is not usually necessary to change the network type from the default setting. The **Default** net type setting allows [!INCLUDE[prod_short](../developer/includes/prod_short.md)] to connect to a server using the default client network type assigned by SQL Server. You can change the net type with the Client Network Utility, which is part of the SQL Server Client Utilities, if they have been installed on the client computer.  

7.  Choose **OK** to connect to the server and open the **New Database** window.  

    In the **New Database** window, enter the information about the database that you want to create. The window contains the same tabs as the **Alter Database** window. For more information, see sections in this article for the different tabs.  

8. Now that you have created a new database, you must configure your [!INCLUDE[server](../developer/includes/server.md)] instance to access the database and then restart the service. For more information, see [Configuring a Business Central Server Instance](../administration/configure-server-instance.md).
 
9. You must synchronize the schema for all tables of the new database.
 
    <!--From the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Sync. Schema For All Tables**, and then **With Validation**.  For more information, see [Synchronizing Table Schemas](Synchronizing-Table-Schemas.md).-->

    You cannot use the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] in this case. You must use the [Sync-NAVTenant cmdlet](/powershell/module/microsoft.dynamics.nav.management/sync-navtenant) of the [!INCLUDE[adminshell](../developer/includes/adminshell.md)], for example:

    ```
    Sync-NAVTenant -ServerInstance BC140 
    ```

> [!WARNING]  
>  You can always enlarge a database later on, but you cannot make it smaller.  

 After you have created the database, you can enter program objects and company data. Before you can create company data, you must import some basic data from another [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database. The imported data must at least include **Data Common to All Companies** and **Application Objects**. <!-- For more information, see [Exporting and Importing Companies and Other Data](Exporting-and-Importing-Companies-and-Other-Data.md).-->  

## Alter a Database

The changes will not take effect until you restart the [!INCLUDE[server](../developer/includes/server.md)] instance.

> [!NOTE]  
>  You cannot alter a database by using the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] if the database is deployed on Azure SQL Database.
  
## Database Files Tab

Increases the size of the database by either increasing the size of one or more of the database files or adding new data files to the database.  
  
 If you use secondary data files, then you must increase the size of the primary data file only when the catalog that it contains has become too large. When the catalog has become too large, new SQL Server objects, such as tables, cannot be created until you increase the size of the primary data file.  
  
 When you use secondary data files, you cannot create more space for storing [!INCLUDE[navnow](../developer/includes/navnow_md.md)] data by just increasing the size of the primary data file. You can create more space for storing data by increasing the size of the secondary data files that contain [!INCLUDE[navnow](../developer/includes/navnow_md.md)] information. You can also add new secondary data files in order to store more data.  
  
 To open this window, on the **File** menu, choose **Database**, choose **Alter**, and then choose the **Database Files** tab.  
  
> [!NOTE]  
>  The first data file that is listed on the **Database Files** tab is the primary file.  

## Transaction Log Files Tab

Increases the size of the existing transaction log files or adds new files to enable more transactions to be performed in the database. The transaction log grows as new transactions are performed in the database. SQL Server truncates the log after it performs a successful database or transaction log backup.  
  
 To open this window, on the **File** menu, choose **Database**, choose **Alter**, and then choose the **Transaction Log Files** tab.  
  
 You can also delete existing transaction log files that are empty. The first transaction log file that is listed is the primary file. You cannot delete the primary transaction log file.

## Collation Tab

You use this tab to set the collation when you are creating a new database.

> [!IMPORTANT]
> Do not use this tab to change the collation of an existing database. To change the collation, you must create a new database that uses the correct collation, and then export the data from the old database and import it to the new database. For more information, see [Changing Collation of Existing Database](../cside/cside-change-database-collation.md).
  
<!--  
###  <a name="ChangeCollation"></a> Changing the Collation of a [!INCLUDE[navnow](../developer/includes/navnow_md.md)] Database
  

If you change the database collation, then the collation of objects in the database is changed except for tables that have the **LinkedObject** property set to **Yes**. You must manually re-create these objects. For example, you can script them in SQL Server Management Studio.

If you change the collation from a case-sensitive to a case-insensitive collation or from an accent-sensitive to an accent-insensitive collation, then duplicates can occur in the primary keys of the tables. Duplicates can be caused by the values of the character data stored in the primary keys. If duplicates occur, then you receive an error message and the database collation change is stopped. We recommend that you do not change these attributes of a collation.  
  
> [!NOTE]  
> Changing the collation can be a lengthy process that depends on the size of the database and the number of companies in the database. The system tables and all user table indexes that contain character data must be rebuilt.  
-->

The **Language** drop-down list displays the friendly name of the language, not the full Windows collation name. For some languages, there are multiple collations that sort characters differently. For example, the Windows collation languages include multiple Scandinavian languages, some of which sort Aa after Z, Æ, Ø, and some of which sort Aa after A and before B. If you upgrade from [!INCLUDE[nav2009](../developer/includes/nav2009_md.md)] to [!INCLUDE[prod_short](../developer/includes/prod_short.md)], you upgrade the database to the Windows collations. If you used SQL collation in earlier versions of [!INCLUDE[navnow](../developer/includes/navnow_md.md)], then after you upgrade, verify that the Windows collation sorts characters in the way that you expect.  
  
If you set the **Validate Collation** check box, then collation languages that run with a different non-Unicode code page from your system non-Unicode code page are filtered out of the **Language** drop-down list. An example scenario of when you might want to choose a collation language that has a different code page from your system code page is if you want to prepare a Japanese database on a Danish computer.
  
## Options Tab

Specifies database options that you set when you created the database. For example, you must select the **Single User** option before you perform any database tests. You must clear this option when the tests are completed.  
  
 To open this window, on the **File** menu, choose **Database**, choose **Alter**, and then choose the **Options** tab.  
  
### Access Section  
  
|[!INCLUDE[bp_tablefield](../developer/includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Single user**|Specifies that only one user can access the database at a time. You can use this setting when you are performing administrative functions such as testing or restoring the database. By limiting access to the database to one user, you make sure that the database is not changed when you are testing it.<br /><br /> **Important:** Clear this check box when you are finished to give other users to access the database.|  
  
### Settings Section  
  
|[!INCLUDE[bp_tablefield](../developer/includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Recovery Model**|Determines the kind of information that is written to the transaction log and therefore the kind of recovery model that you want to use in this database.<br /><br /> **Note:** The **Full** and **Bulk-logged** recovery models are similar, and many users of the **Full** recovery model will use the **Bulk-logged** recovery model occasionally.<br /><br /> [!INCLUDE[bp_tableoption](../developer/includes/bp_tableoption_md.md)]: <br />                        **Bulk-logged**<br /><br /> [!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]:<br /><br /> The transaction log will contain only limited information about certain large-scale or bulk copy operations. The **Bulk-logged** recovery model provides protection against media failure combined with the best performance and the minimal use of log space for certain large-scale or bulk copy operations.<br /><br /> The backup strategy for bulk-logged recovery consists of:<br /><br /> \* Database backups.<br /><br /> \* Differential backups \(optional\).<br /><br /> [!INCLUDE[bp_tableoption](../developer/includes/bp_tableoption_md.md)]: <br />                        **Full**<br /><br /> [!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]:<br /><br /> The details of every transaction are stored in the transaction log. This information can be used when you apply transaction log backups. The **Full** recovery model uses database backups and transaction log backups to provide complete protection against media failure. If one or more data files are damaged, media recovery can restore all the committed transactions. Incomplete transactions are rolled back.<br /><br /> Full recovery lets you recover the database to the point of failure or to a specific point in time. All operations are fully logged to guarantee that the database is recoverable. This includes bulk operations such as SELECT INTO, CREATE INDEX, and bulk loading data.<br /><br /> The backup strategy for full recovery consists of:<br /><br /> \* Database backups.<br /><br /> \* Differential backups \(optional\).<br /><br /> \* Transaction log backups.<br /><br /> [!INCLUDE[bp_tableoption](../developer/includes/bp_tableoption_md.md)]: <br />                      **Simple**<br /><br /> [!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]:<br /><br /> The database can be recovered to the point at which the last backup was made. However, you cannot restore the database to the point of failure or to a specific point in time. To do that, select either the **Full** or **Bulk-logged** recovery model.<br /><br /> The backup strategy for simple recovery consists of:<br /><br /> \* Database backups.<br /><br /> \* Differential backups \(optional\).|  
|**ANSI NULL default**|Specifies whether the database default NULL settings for column definitions and user-defined data types are to be applied. When you select this option, all user-defined data types or columns that have not been explicitly defined as NOT NULL are set to allow NULL entries. Columns that have been defined by using constraints follow the constraint rules, regardless of this setting.|  
|**Recursive triggers**|Specifies recursive trigger settings. Triggers can have direct recursion or indirect recursion. Direct recursion occurs when a trigger occurs and performs an action that causes the same trigger to be fired again. Indirect recursion occurs when a trigger occurs and performs an action that causes a trigger on another table to occur. This second trigger updates the original table which causes the first trigger to occur again.|  
|**Torn page detection**|Enables SQL Server to detect incomplete input/output operations that have been caused by power failures or other system outages.|  
|**Auto shrink**|Specifies whether SQL Server can periodically shrink data files and transaction log files.|  

## Integration Tab
Specifies database settings that determine how [!INCLUDE[navnow](../developer/includes/navnow_md.md)] integrates with SQL Server and external tools.  
  
 To open this window, on the **File** menu, choose **Database**, choose **Alter**, and then choose the **Integration** tab.  
  
### Objects Options  
  
|[!INCLUDE[bp_tablefield](../developer/includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Convert Identifiers**|Defines characters that you want to map to the underscore character in the names of all SQL Server objects, such as tables, columns, and constraints. If these characters occur in tables or fields in [!INCLUDE[navnow](../developer/includes/navnow_md.md)], then they are converted to underscores in the SQL Server names.<br /><br /> When the conversion is complete, you must close and reopen the database before you can use the new identifiers.|  
  
### License Options  
  
|[!INCLUDE[bp_tablefield](../developer/includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Save license in database**|Specifies that the license file is uploaded and stored in the database instead of on the server. This is useful if you are hosting several databases with separate license files on the same server.| 

## Advanced Tab
Specifies how locking is handled in the database and specifies the start ID for elements on new objects.  
  
### Locking Options
  
|[!INCLUDE[bp_tablefield](../developer/includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Lock timeout**|Specifies whether a session waits to place a lock on a resource that has already been locked by another session.<br /><br /> If you clear this field, then the session waits indefinitely.|  
|**Timeout duration \(sec\)**|Specifies the maximum length of time that a session waits to place a lock on a resource that has already been locked by another session. The default value is 10 seconds.|  
  
### Designer Options  
  
|[!INCLUDE[bp_tablefield](../developer/includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Start ID \(UidOffset\)**|Specifies the start ID for elements on new objects. When you create a new table, page, report, codeunit, query, or XMLport, the elements have IDs that are offset by the **Start ID \(UidOffset\)** value that you specify. Object elements include containers, groups, fields, parts, DataItems, columns, filters, variables, functions, or text constants.<br /><br /> You must specify an Integer that is greater than or equal to 0.<br /><br /> The default value is 1.|  