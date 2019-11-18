---
title: "Upgrade Codeunits"
author: jswymer
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: fe535add-bf26-45dc-93bb-d356acd2e751
caps.latest.revision: 20
---
# Upgrade Codeunits
You use upgrade codeunits when you make changes to a table definition, either from the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] or during an upgrade. Upgrade codeunits migrate existing business data from the old table structure into the new table structure. An upgrade codeunit serves the following purposes:  

-   Provides instructions for how to handle data changes to a table during schema synchronization. For more information, see [Synchronizing Table Schemas](Synchronizing-Table-Schemas.md).  

-   Provides the logic for migrating existing data in the business data table from the old format to the new format after schema synchronization.  

-   Provides instructions for updating custom report layouts to dataset changes. For more information, see [Updating Custom Report Layouts by Using Upgrade Codeunits](Updating-Custom-Report-Layouts-by-Using-Upgrade-Codeunits.md).  

A typical example of when to use an upgrade codeunit is when you remove a field from a table definition and you do not want to lose the existing data in the business data table. Instead, you want to use it somewhere else in the new application.  

You implement upgrade codeunits when you make destructive changes to tables in [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)]. For more information about destructive changes, see [Handling Destructive Changes With Table Schema Synchronization](Synchronizing-Table-Schemas.md#HandlingDestChanges). After you have created an upgrade codeunit to handle table changes, you can use it when you upgrade data from an earlier version of [!INCLUDE[navnow](includes/navnow_md.md)] to the current version. A single upgrade codeunit will typically contain table schema synchronization instructions and data migration logic for multiple tables that have changed from one version of [!INCLUDE[navnow](includes/navnow_md.md)] to another.  

> [!NOTE]  
>  For an example that explains how to create and implement upgrade codeunits, see the [!INCLUDE[navnow](includes/navnow_md.md)] Upgrade Demo Script document at [https://go.microsoft.com/fwlink/?LinkID=509977](https://go.microsoft.com/fwlink/?LinkID=509977). This document provides step-by-step instructions that support the concepts discussed in this topic.  

## Upgrade Codeunits Overview  
 An upgrade codeunit consists of three sections that are defined by specific function types:  

1.  Instructions for synchronizing schema changes for tables. These instructions are included in a **TableSyncSetup** function.  

2.  Logic for checking conditions that must be met in order for the data upgrade process is started. This logic is included in a **CheckPrecondition** function.  

3.  Logic for migrating the data from the old table structure into the new table structure and any additional data upgrade logic as required. This logic is included in an upgrade functions, which are functions of the type **UpgradePerCompany** and **UpgradePerDatabase**.  

To create an upgrade codeunit, you set the [SubType Property \(Codeunit\)](SubType-Property--Codeunit-.md) of a codeunit to **Upgrade**. You can create multiple upgrade codeunits.  

### Upgrade Codeunit Design and Flow  
 Upgrade codeunits are used by [!INCLUDE[nav_server](includes/nav_server_md.md)] when you synchronize table schemas and when you start the data upgrade process. The following describes the upgrade codeunit process for these operations.  

**Table Schema Synchronization**  

 When [!INCLUDE[nav_server](includes/nav_server_md.md)] detects an update to a table definition \(metadata\) that changes the table schema in the database in SQL Server, it will search the **TableSyncSetup** functions in the upgrade codeunits to collect the schema synchronization instructions for changed tables.  

-   If there are instructions for the table, then [!INCLUDE[nav_server](includes/nav_server_md.md)] handles the data according to the instructions. Depending on the synchronization mode, [!INCLUDE[nav_server](includes/nav_server_md.md)] can:  

    -   Move or copy the data from the old tables into upgrade tables.  

    -   Delete data in the table fields that are affected by the changes and apply schema changes forcefully.  

    -   Check whether there is data in the affected fields and then apply schema changes only if they do not contain data.  

     For more information about the synchronization modes, see [TableSyncSetup Modes](Upgrade-Codeunits.md#TblModes).  

-   If there are no instructions for the table in the **TableSyncSetup** functions, then [!INCLUDE[nav_server](includes/nav_server_md.md)] checks whether the changes are destructive.  

    -   If the changes are destructive, the schema synchronization is cancelled.  

    -   If the changes are not destructive, they will be applied to the table.  

**Data Upgrade**  

After schema synchronization is completed, you must run the data upgrade process to remap any data that was saved in upgrade tables to the new application. If no data was saved during table schema synchronization, then running the data upgrade is not required.  

You can start the data upgrade from the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] or by using the data upgrade cmdlets from the [!INCLUDE[nav_shell](includes/nav_shell_md.md)]. Data upgrade process consists of two phases: running the CheckPrecondition functions and running the upgrade functions \(**UpgradePerCompany** and **UpgradePerDatabase** type functions\). These phases migrate data from the upgrade tables into the new locations in the application and perform other data upgrade manipulations that are required by the new version of the application, according to the following:  

1.  Running the CheckPrecondition functions.  

    When you start the data upgrade, [!INCLUDE[nav_server](includes/nav_server_md.md)] runs the **CheckPrecondition** functions in upgrade codeunits for all companies in the database. By default, the functions are run in parallel mode, which means that they are run at the same time. If none of the **CheckPrecondition** functions return errors, then [!INCLUDE[nav_server](includes/nav_server_md.md)] proceeds to run the **Upgrade** functions in the upgrade codeunit.  

2.  Running Upgrade functions.  

    After the **CheckPrecondition** functions are run, the upgrade functions are run as follows:  

    -   **UpgradePerCompany** functions are run for all companies in the database, where each function is executed within its own system session on [!INCLUDE[nav_server](includes/nav_server_md.md)] that connects to the company.  

    -   **UpgradePerDatabase** functions are executed once, in a single system session on [!INCLUDE[nav_server](includes/nav_server_md.md)] that does not open any company.  

    For more information about these two function types, see [Upgrade Function Types](Upgrade-Codeunits.md#upgradedunctions).  

By default, like the **CheckPrecondition** functions, the **UpgradePerCompany** and **UpgradePerDatabase** functions are run in parallel mode. Because these functions run in parallel, you should design them so that they are independent of each other and do not write to the same table. Running data upgrade functions in parallel can significantly improve the upgrade performance, especially when you have multiple companies in your database. If the functions must be run in a specific order or they write to the same tables, you can change the functions to **Normal** function types within the upgrade codeunit. Then, create a single **UpgradePerCompany** or **UpgradePerDatabase** function that calls the **Normal** functions in the desired order. With this implementation, you can achieve the same performance level as running multiple upgrade  functions in parallel.  

You can choose to run the data upgrade in serial mode, where all functions will be executed one after another. This can be useful, for example, when you are debugging the data upgrade code. For more information about parallel and serial function execution, see [Parallel and Serial Execution Modes for Upgrade Codeunit Functions](Upgrading-Data.md#ParallelSerial).  

> [!NOTE]  
>  You cannot run upgrade codeunits directly. Upgrade codeunits can only be invoked by [!INCLUDE[nav_server](includes/nav_server_md.md)] during a data upgrade.  
>   
>  You can only run the data upgrade process on a database that is in operational state.  

 For more information about how to run the data upgrade process, see [Upgrading Data](Upgrading-Data.md).  

## TableSyncSetup Functions  
 The **TableSyncSetup** function type provides instructions to [!INCLUDE[nav_server](includes/nav_server_md.md)] about how to process a table for which schema changes have been detected. [!INCLUDE[nav_server](includes/nav_server_md.md)] uses the virtual table **2000000135 Table Synch. Setup** to collect the instructions for each table it detects as being changed. Whenever [!INCLUDE[nav_server](includes/nav_server_md.md)] detects an update in the table definition \(metadata\), it will populate that virtual table with the IDs of the changed tables.  

 To set up a **TableSyncSetup** function type, you add a C/AL function and set the **FunctionType** property of a function to **TableSyncSetup**. A **TableSyncSetup** function must have the following signature:  

 `<function name>(VAR <record name> : Record "Table Synch. Setup")`  

 For each table that has been changed, you provide synchronization instructions as C/AL code in the **TableSyncSetup** function. The instructions specify a mode for handling the data in the changed table. For more information about the modes, see [TableSyncSetup Modes](Upgrade-Codeunits.md#TblModes). The [!INCLUDE[demolong](includes/demolong_md.md)] \(Demo Database NAV \(10-0\) demonstration database\) includes codeunit **9900 Data Upgrade Mgt.** that you can use to populate table **2000000135 Table Synch. Setup** with the modes for each changed table. In this codeunit, you can add instructions in **SetTableSyncSetup** function as shown in the following example:  

```  
DataUpgradeMgt.SetTableSyncSetup(DATABASE::"Change Log Entry",50000,TableSynchSetup.Mode::Copy);  
```  

 If fields are removed from the table definition, the data is copied to the specified upgrade table, and then the changes are applied to the table in SQL Server.  

> [!IMPORTANT]  
>  Do not add any code to this function other than table synchronization instructions. The **TableSyncSetup** type function is called automatically by [!INCLUDE[nav_server](includes/nav_server_md.md)] during the schema synchronization process and it is only meant for populating the **Table Synch. Setup** table with the synchronization instructions.  

 The **TableSyncSetup** function is called under the following circumstances:  

1.  From the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], when you save, compile, or delete a table and set the **Synchronize Schema** option to **Now - with validation**.  

2.  From the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], when you synchronize schemas for all tables and choose the **Check Only** or **With Validation** options.  

3.  When you run the Sync-NAVTenant cmdlet and set to *Mode* parameter to **CheckOnly** or **Sync**.  

###  <a name="TblModes"></a> TableSyncSetup Modes  
 There are four modes that specify how to synchronize the changes and handle existing data in the SQL table.  

|Mode|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|----------|---------------------------------------|  
|**Check**|Before applying the schema changes to the business data table, the [!INCLUDE[nav_server](includes/nav_server_md.md)] checks whether there is data in the field of the business data table that is affected by the change. If there is data in the field, then an error occurs, and the schema changes are not applied to the business data table. If there no data in the field, then the changes are applied to the business data table.<br /><br /> This is the default mode.|  
|**Move**|This mode uses an upgrade table to store existing data from the business data table. You must create the upgrade table manually in advance before introducing the change. To create the upgrade table, you save the table you are about to change as another table with another ID. Then, you remove the C/AL code from the triggers, and clean up the properties referencing other tables without the field specification, because all the data will be moved. **Note:**  The upgrade table must be identical to the existing business data table, including the primary key and the fields. <br /><br /> When the schema is synchronized, if there is data in the field of business data table that is affected by the table definition change, then the data is deleted from the business data table and moved to the upgrade table. Then, the schema changes are applied to the business data table. When the synchronization is completed, the business data table will be empty but its schema will match the table definition. If there is no data in the field that is affected by the table definition change, then the changes are simply applied to the business data table.<br /><br /> If required, you can then write code to copy necessary data from the upgrade table into the new table.|  
|**Copy**|This mode also uses an upgrade table to store existing data from the business data table. You must create the upgrade table manually in advance before introducing the change. **Note:**  The upgrade table can only contain the primary key and the fields of the existing business data table that are affected by the data schema change for which you want to preserve the data. <br /><br /> When the schema is synchronized, if there is data in field of business data table that is affected by the table definition change, then data in the business data table is replicated in the upgrade table. Then, the schema changes are applied to the business data table. If no error occurs, then the changes are applied to the SQL table.|  
|**Force**|The [!INCLUDE[nav_server](includes/nav_server_md.md)] will force the changes on the table and delete any data in fields that are affected by the change. This option is intended to be used for the tables and fields that you want to discontinue. If you want to save the data from this table, you should use the **Copy** or **Move** mode.|  

##  <a name="checkpreconfunctions"></a> CheckPreconditions Function Type  
 **CheckPreconditions** functions resemble upgrade functions that were used in earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)]. In **CheckPreconditions** functions, you write C/AL code to verify whether certain upgrade conditions have been fulfilled before the **Upgrade** type functions are run.  

 Before [!INCLUDE[nav_server](includes/nav_server_md.md)] calls the **Upgrade** functions, it executes the **CheckPrecondition** functions for all companies in the database.  

 To set up a **CheckPrecondition** function in the upgrade codeunit, you add a C/AL function and set the **FunctionType** property of the function to **CheckPrecondition**.  

##  <a name="upgradedunctions"></a> Upgrade Function Types  
 There are two types of upgrade functions: **UpgradePerCompany** and **UpgradePerDatabase**. These functions are similar to upgrade functions that were used in earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)]. These functions enable you to write C/AL code to migrate data from the upgrade tables into new tables. Additionally, you can add code to perform other operations that are required to align the existing data in tables to the requirements of the new application. The following describes and usage of the upgrade function types.  

|Function type|Description|  
|-------------------|-----------------|  
|UpgradePerCompany|When you perform a data upgrade, these functions are run for all companies in the database, where each function is executed within its own system session on [!INCLUDE[nav_server](includes/nav_server_md.md)] that connects to the specific company. Depending on the number of companies in the database, an **UpgradePerCompany** function can be executed multiple times during an upgrade process. If the upgrade function execution mode is parallel, this can cause locking errors when the data in the table that you are updating is not company-specific, as specified by the table's [DataPerCompany Property](DataPerCompany-Property.md). Therefore, you typically use this type of function when the data in the table that you upgrading is company-specific, as specified by the table's [DataPerCompany Property](DataPerCompany-Property.md).|  
|UpgradePerDatabase|These functions are executed once during an upgrade process, in a single system session on [!INCLUDE[nav_server](includes/nav_server_md.md)] that does not open any company. You typically use an **UpgradePerDatabase** function when the data in the table that you are upgrading is not company-specific. Using an **UpgradePerDatabase** function can prevent table locking issues when upgrade functions are run in parallel mode. This is the case, for example, with when upgrading custom report layouts in table 9560 Custom Report Layout. For more information, see [Updating Custom Report Layouts by Using Upgrade Codeunits](Updating-Custom-Report-Layouts-by-Using-Upgrade-Codeunits.md).|  

 To set up an upgrade function in the upgrade codeunit, you add a C/AL function and set the **FunctionType** property of the function to **UpgradePerCompany** or UpgradePerDatabase.  

> [!NOTE]  
>  You can call **Normal** type functions from the upgrade functions. However, do not call upgrade functions from other upgrade functions. This is because [!INCLUDE[nav_server](includes/nav_server_md.md)] will execute all the upgrade functions in the upgrade codeunit, which can result in some functions being called more than one time.  

## See Also  
[Synchronizing Table Schemas](Synchronizing-Table-Schemas.md)   
[FunctionType Property \(Upgrade Codeunits\)](FunctionType-Property--Upgrade-Codeunits-.md)   
[SubType Property \(Codeunit\)](SubType-Property--Codeunit-.md)   
[Upgrading Data](Upgrading-Data.md)
