---
title: "Synchronizing Table Schemas"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: cadb24e9-13a6-440b-969f-8482f2e63b41
caps.latest.revision: 16
---
# Synchronizing Table Schemas
When you design a table in [!INCLUDE[navnow](includes/navnow_md.md)], you define the metadata for the table, such as the name and object ID, and the fields and their data types. This table definition describes the table that must be created in the SQL Server database to store business data. You create and modify the table definition by using the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)]. When you make changes to the table definition in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], or when you upgrade a [!INCLUDE[navnow](includes/navnow_md.md)] database to a newer version, you must synchronize the business database table schema with the new or changed table definition so that the two are the same. Table schema synchronization is performed by the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that connects to the business database.  

 Depending on the changes to a table definition, you might have to consider how to handle the existing data in the business data table when synchronizing the schema. For example, you must decide whether to keep or delete the data. Some table definition changes, such as adding and renaming a field, adding a new table, or modifying C/AL code to a table, do not affect data in the database table and are considered to be non-destructive changes. With non-destructive changes, you can synchronize the schema without any special data handling considerations. However, if you make destructive changes to the table definition, such as removing a field, then you will be warned by the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] when you try to save the changes, and you must specify how to handle the data when synchronizing the schema. For more information about destructive table changes, see [Handling Destructive Changes With Table Schema Synchronization](Synchronizing-Table-Schemas.md#HandlingDestChanges).  

##  <a name="SyncTable"></a> Synchronizing Table Schemas with SQL Server  
 You can synchronize table schemas from the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] or by using the Sync-NAVTenant cmdlet in the [!INCLUDE[nav_shell](includes/nav_shell_md.md)].  

 You typically use the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] to synchronize the table schema during development while you are making changes to a specific table. In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], you can synchronize table schema changes for a specific table or for all tables. During development, you synchronize the table definitions with a development database that has no active users. This means that you can make destructive changes and create upgrade codeunits to migrate the business data to the new database schema.  

 You typically use the Sync-NAVTenant cmdlet when you are upgrading the live database from an earlier version of [!INCLUDE[navnow](includes/navnow_md.md)]. For example, the Sync-NAVTenant cmdlet can be used by system administrators who automate the process of applying application updates and upgrades in a multitenant environment. When you apply a new database schema to a business database, you must make sure that existing data is migrated to new version. For example, during development, you have added two new fields to a table, and you have created upgrade codeunits to migrate data from another field in that table to the two new fields. So when you want to apply those changes to an existing business database, you upgrade the database. For more information about synchronizing table schemas by using the Sync-NAVTenant cmdlet, see [Sync-NavTenant](https://go.microsoft.com/fwlink/?LinkID=401399).  

> [!IMPORTANT]  
>  Depending on the size of the tables that you modify and the nature of changes, the schema synchronization process can take anywhere from several seconds to several hours \(for example. this can occur when you add multiple fields or keys to a large table\). Therefore, it is important that you control when schema synchronization is run.  
>   
>  When synchronizing large tables, you should increase the **SQL Command Timeout** setting for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that connects to the database to avoid timeouts during schema synchronization. The default setting is 30 minutes. For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).  

###  <a name="SyncSpecTableDevEnv"></a> Synchronizing the Table Schema for Specific Tables From the Development Environment  
 In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], you can synchronize the table schema for a specific table or for all tables. You have the option to synchronize a table schema when you perform one of the following operations on a table from the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]:  

-   Save  

-   Save As  

-   Compile \(This also pertains when you select multiple tables for compiling from Object Designer\).  

-   Delete \(This also pertains when you select multiple tables for deleting from Object Designer\).  

> [!IMPORTANT]  
>  Before you can perform table schema synchronization from the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], you must make sure that they you have a working connection to a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. You can see the currently connected  [!INCLUDE[nav_server](includes/nav_server_md.md)] instance and change as required in the **Database Information** window. For more information, see [Database Information](uiref/-$-S_2349-Database-Information-$-.md) or [How to: Change the Microsoft Dynamics NAV Server Instance](How-to--Change-the-Microsoft-Dynamics-NAV-Server-Instance.md).  

 **Schema Synchronization Options**  

 When you perform one of the operations on a table, you can choose from the following schema synchronization options:  

|[!INCLUDE[bp_tableoption](includes/bp_tableoption_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|----------------------------------|---------------------------------------|  
|**Now - with validation**|Before applying changes to the business data table, [!INCLUDE[nav_server](includes/nav_server_md.md)] validates the changes to the table definitions to check whether they are  destructive changes. This includes changes that will delete data in the fields of the business data table which are affected by the changes.<br /><br /> \* If there are no destructive changes to the table, then the schema changes are applied to the business data table immediately.<br /><br /> \* If there are destructive changes, [!INCLUDE[nav_server](includes/nav_server_md.md)] checks that there are table synchronization instructions in an upgrade codeunit. If there are instructions, then the schema changes are applied to the business database table according to the instructions. If there are no instructions, then an error message appears. The table definition changes are not saved and the schema changes are not applied.<br /><br /> For more information about how [!INCLUDE[nav_server](includes/nav_server_md.md)] validates changes, see [How Microsoft Dynamics NAV Server Validates Table Schema Changes](Synchronizing-Table-Schemas.md#ServerValidation).|  
|**Later**|Table definition changes are saved and compiled in the application but the changes are not validated or applied to the business data table. You synchronize the table schema later by doing one of the following:<br /><br /> \* Save or compile the table from Object Designer in [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] and choose either the **Now - with validation** or **Force** synchronization option.<br /><br /> \* Use the **Sync. Schema for All Tables** option on the **Tools** menu.<br /><br /> \* Run the Sync-NAVTenant cmdlet from the [!INCLUDE[nav_shell](includes/nav_shell_md.md)].|  
|**Force**|Table definition changes are applied to the business data table schema without validation. For destructive changes, data in columns of the business data table that are affected by changes will be deleted.<br /><br /> This option ignores any table synchronization instructions for the table in upgrade codeunits.|  

###  <a name="SyncAllTablesDevEnv"></a> Synchronizing All Table Schemas From the Development Environment  
 From the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], you can synchronize table schema changes for all tables in the database. This is useful when you upgrade from an earlier version of [!INCLUDE[navnow](includes/navnow_md.md)] or when you made changes to a table or multiple tables previously and chose to synchronize later.  

 To synchronize schema changes for all tables, on the **Tools** menu, under **Sync. Schema For All Tables**, you can choose one of the following options:  

|[!INCLUDE[bp_tableoption](includes/bp_tableoption_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|----------------------------------|---------------------------------------|  
|**Check Only**|[!INCLUDE[nav_server](includes/nav_server_md.md)] validates the table definition changes but does not apply the schema changes to the business database.<br /><br /> \* If there are no destructive changes to any of the tables, no errors occur.<br /><br /> \* If there are destructive changes, [!INCLUDE[nav_server](includes/nav_server_md.md)] checks that there are table synchronization instructions in an upgrade codeunit. If there are instructions, then no errors occur. If there are no instructions, an error occurs.<br /><br /> For more information about how [!INCLUDE[nav_server](includes/nav_server_md.md)] validates changes, see the [How Microsoft Dynamics NAV Server Validates Table Schema Changes](Synchronizing-Table-Schemas.md#ServerValidation) section.|  
|**With Validation**|Before applying changes to the business data table, [!INCLUDE[nav_server](includes/nav_server_md.md)] validates the table definition changes to check for destructive changes to the table.<br /><br /> \* If there are no destructive changes to the table, then the schema changes are applied to the business data table immediately.<br /><br /> \* If there are destructive changes, [!INCLUDE[nav_server](includes/nav_server_md.md)] checks that there are table synchronization instructions in an upgrade codeunit. If there are instructions, then the schema changes are applied to the business database table according to the instructions. If there are no instructions, then an error message appears. Table definition changes are not saved and the schema changes are not applied.<br /><br /> For more information, see [How Microsoft Dynamics NAV Server Validates Table Schema Changes](Synchronizing-Table-Schemas.md#ServerValidation).|  
|**Force**|Table definition changes are applied to the business data table schema without validation. For destructive changes, data in columns of the business data table that are affected by changes will be deleted.<br /><br /> This option ignores any table synchronization instructions for the table in upgrade codeunits. You should use this option only when you are sure that there is no risk of unwanted data loss.|  

> [!NOTE]  
>  [!INCLUDE[nav_server](includes/nav_server_md.md)] will only synchronize schemas for new tables and tables with changed table definitions.  

 When you synchronize schemas for all tables, the **Synchronize Schema Changes** window appears. In this window, you can see the state of the database. For example, whether it is operational or whether schema synchronization is pending or produced errors. If errors occur when you use the **Check Only** or **With Validation** synchronization options, the actual error messages are not displayed in the **Detailed State** field on the **Synchronize Schema Changes** window. This is because of text display limitations of the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]. To see the full list of the detected errors you can run the Sync-NAVTenant cmdlet from the [!INCLUDE[nav_shell](includes/nav_shell_md.md)] with *–Mode* parameter set to **CheckOnly**.  

###  <a name="SyncFOBImport"></a> Synchronizing Table Schemas When Importing FOB Files  
 You can import a FOB file, which contains [!INCLUDE[navnow](includes/navnow_md.md)] objects, into a database by using the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] or the Import-NAVApplicationObjects cmdlet that is available in the [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)].  

 When you import a FOB file that contains tables, you are prompted to choose a schema synchronization option to perform on tables after the import is finished. We recommend that you back up the application objects before importing the FOB file, and then choose the **Now – with validation** synchronization option on the confirmation dialog box. You can back up the application objects by exporting all objects to a FOB file or making a full SQL backup of the database.  

 If you choose to synchronize the schema with validation, after the import is finished, the [!INCLUDE[nav_server](includes/nav_server_md.md)] compares the table definitions that were imported from the FOB file with the table definitions that are currently stored in the database.  

-   If [!INCLUDE[nav_server](includes/nav_server_md.md)] detects destructive changes to tables, then it will check whether there is an upgrade codeunit in the application that handles the destructive changes.  

-   If an upgrade codeunit is not found in the application, then an error occurs.  

-   If there is an upgrade codeunit to handle destructive table changes, then the changes are applied.  

When you import objects in FOB files by using the Import-NAVApplicationObjects cmdlet, table schema synchronization is controlled by the *SynchronizeSchemaChanges* parameter of this cmdlet. By default, the *SynchronizeSchemaChanges* parameter is set to **Yes**. This means that during the import process, each table will be checked for destructive changes. If destructive changes are detected, the FOB file import will be canceled, even if an upgrade codeunit for handling the changes is included the FOB file. Therefore, if you want to import a FOB file that contains tables that have destructive changes and upgrade codeunits to handle the changes, you must set *SynchronizeSchemaChanges* parameter to **No**, and then call Sync-NAVTenant cmdlet that is available in the [!INCLUDE[nav_shell](includes/nav_shell_md.md)] to synchronize the changes.  

##  <a name="HandlingDestChanges"></a> Handling Destructive Changes With Table Schema Synchronization  
 Destructive changes to a table definition are changes that can potentially affect the existing data in the business data table. The following table definition changes are considered destructive changes.  

-   Deleting a table.
-   Deleting a field.
-   Changing a field's data type.
-   Changing a field's class.
-   Changing the SQL data type of a field.
-   Decreasing the length of data in a field.
-   Changing the primary key of a table, such as removing a field from the key.
-   Changing the ID of a table field.

To synchronize the business data table with destructive changes to table definition, you must do one of following:
-   Create or import an upgrade codeunit that includes synchronization instructions for the table. For more information, see [Upgrade Codeunits](Upgrade-Codeunits.md).  

-   Use the **Force** option to synchronize the schema. This will apply the table definition changes regardless of existing data the data. Data in fields that are affected by the table definition changes will be deleted.  

> [!TIP]  
>  When you synchronize destructive changes to a table by using the **Now – with validation** schema synchronization option, an error occurs and will not let you save the changes. The validation process for destructive change does not consider whether there is data in the fields that are affected by the changes. The validation process determines whether the change is destructive by analyzing actual metadata changes. This implementation helps prevent you from overlooking a destructive change and neglecting to create data upgrade codeunits to handle the changes when you work with development or test databases that do not contain data.  

##  <a name="ServerValidation"></a> How Microsoft Dynamics NAV Server Validates Table Schema Changes  
When you synchronize a table schema and choose a synchronization option that validates the changes, [!INCLUDE[nav_server](includes/nav_server_md.md)] verifies whether the changes can be applied to the business data table without affecting the data in changed columns that are affected by the changes.  

The following describes the [!INCLUDE[nav_server](includes/nav_server_md.md)] process for validating the table schema changes:  

1.  Compares the content of the **Object Metadata** and **Object Metadata Snapshot** system tables to identify differences in the database schemas.  

2.  Lists tables with schema changes in the **Table Synch. Setup** system table.  

3.  Identifies the upgrade codeunits with instructions for handling changes and adds the instructions to the **Table Synch. Setup** table.  

4.  Applies the relevant changes according to the upgrade instructions.  

During the schema synchronization, each change is applied based on the synchronization mode that was specified in the upgrade codeunits. For more information about the synchronization modes, see [TableSyncSetup Modes](Upgrade-Codeunits.md#TblModes).  

> [!NOTE]  
>  If the change is not a destructive change and has not been handled with an upgrade instruction in an upgrade codeunit, then the default mode is Check.  

##  <a name="MonitorDatabase"></a> Monitoring the Business \(Tenant\) Database State During and After Schema Synchronization  
 When you synchronize a table schema, the business database passes through various operational states, depending on the outcome of the synchronization. You can use the Get-NAVTenant cmdlet from the [!INCLUDE[nav_shell](includes/nav_shell_md.md)] to view the current state of the database during and after synchronization. For more information, see [Get-NAVTenant cmdlet](https://go.microsoft.com/fwlink/?LinkID=401366).  

 You can also view the state of the database from the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] in the **Synchronize Schema Changes** window that appears when you choose **Sync. Schema For All Tables** option on the **Tools** menu.  

 The following table describes the states of the database during and after table synchronization.  

|State|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|-----------|---------------------------------------|  
|Mounted|Indicates that the business \(tenant\) database is mounted on the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance but is not yet operational. This can occur when [!INCLUDE[nav_server](includes/nav_server_md.md)] is started or when the Mount-NavTenant cmdlet is run from the [!INCLUDE[nav_shell](includes/nav_shell_md.md)].<br /><br /> You should consider the **Mounted** state as an intermediate state that only exists right after mount operation is executed. The purpose of this state is to indicate that the [!INCLUDE[nav_server](includes/nav_server_md.md)] knows about this database but has not yet brought the database into an operational state, which includes verifying whether table schemas are synchronized.<br /><br /> With the exception running the Get-NavTenant and Dismount-NavTenant cmdlet, all other operations that access the database will initiate the process of bringing the database into the operational state. This means that the first operation on the database can take some time to complete while the database is validated. The result of the validation will be that the database will change state to **Operational**, **OperationalWithSyncPending**, or **OperationalWithSyncFailure**.<br /><br /> This design enables the [!INCLUDE[nav_server](includes/nav_server_md.md)] to start with multiple tenants. However, if there are only few tenants on the [!INCLUDE[nav_server](includes/nav_server_md.md)], then you should consider including the `Get-NavTenant &#124; Sync-NavTenant` command into the script that mounts the database to make sure all the databases reach the operational state at the same time.|  
|Operational|Indicates that the database is fully operational and the table schemas are up to date. This is the normal operating state of a database.|  
|OperationalWithSyncPending|Indicates that the database is operational but schema synchronization is pending on one or more tables. If a table that is pending schema synchronization is accessed by [!INCLUDE[nav_server](includes/nav_server_md.md)] \(for example, when user tries to access the table from the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]\) an error will be displayed. The error informs the user that the metadata for the table has not been synchronized.<br /><br /> To synchronize table schemas, you can run the Sync-NAVTenant cmdlet from the [!INCLUDE[nav_shell](includes/nav_shell_md.md)] or use the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], for example, by saving a table and choosing the **Now-with validation** synchronize schema option. Either of these operations will initiate the schema synchronization process. If the process is successful, the state will change to **Operational**. If the process is not successful, the state will change to **OperationWithSyncFailure**.<br /><br /> In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], the **Detailed State** field on the **Synchronize Schema Changes** window will contain the errors that occurred during synchronization. The Sync-NAVTenant cmdlet provides you a more detailed list of any synchronization errors.|  
|OperationalWithSyncInProgress|Indicates that table schemas in database are currently being synchronized. You can use the Get-NAVTenant from the [!INCLUDE[nav_shell](includes/nav_shell_md.md)] to track progress.<br /><br /> Users can continue to work with the application from the [!INCLUDE[navnow](includes/navnow_md.md)] clients. However, if they try to access a table whose schema has not been synchronized, an error will occur. While the synchronization process is running on a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, the following restrictions apply:<br /><ul><li>Other [!INCLUDE[nav_server](includes/nav_server_md.md)] instances will not be able to start the synchronization process on the same database.</li><li>If a user changes a table definition in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], theyy will not be able to save the changes until the synchronization process is finished.</li></ul>|  
|OperationalWithSyncFailure|Indicates that the database is operational but the last attempt to synchronize the table schemas failed.<br /><br />If [!INCLUDE[nav_server](includes/nav_server_md.md)] tries to access a table that has not been synchronized, an error occurs. For example, this can occur when destructive changes have been made to a table and there is no upgrade codeunit available to handle the changes.<br /><br /> You can run the Get-NAVTenant cmdlet to retrieve a list of all the destructive changes that were detected during the schema synchronization process. The changes are listed in the `Detailed State` field.<br /><br /> To get the database back to **Operational** state, you can do one of the following:<ul><li>Create an upgrade codeunit that has instructions for how to handle the data in the tables where destructive changes were made, then run Sync-NAVTenant cmdlet again.</li><li>Run the Sync-NavTenant cmdlet in the `Force` mode as follows:<br /><br /> `Sync-NavTenant <serverinstance> –Mode Force`<br /><br /> This operation will apply changes without validation and delete the data in the table columns that are affected by the changes.</li><li>Revert the table to its original structure, and then run the  Sync-NavTenant cmdlet.<br /><br /> `Sync-NavTenant <serverinstance> –Mode Sync`</li></ul>|  

 For more information about the Get-NAVTenant cmdlet and how to use the [!INCLUDE[nav_shell](includes/nav_shell_md.md)], see [Get-NAVTenant](https://go.microsoft.com/fwlink/?LinkID=401366) and [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md).  

## See Also  
 [Upgrade Codeunits](Upgrade-Codeunits.md)   
 [Upgrading Data](Upgrading-Data.md)   
 [Tables](Tables.md)   
 [Development](Development.md)   
 [Administration](Administration.md)   
 [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md)   
 [Sync-NAVTenant cmdlet](https://go.microsoft.com/fwlink/?LinkID=401399)
