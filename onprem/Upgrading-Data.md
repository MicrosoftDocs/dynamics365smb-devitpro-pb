---
title: Upgrade Data in Business Database
description: This article explains how to upgrade data in the business database for Microsoft Dynamics NAV.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6c8bb4a0-29b2-46fb-b268-3ebc16b4a80a
caps.latest.revision: 9
---
# Upgrading Data in Microsoft Dynamics NAV
This topic describes how to upgrade data in the business database. You perform a data upgrade:  

-   After you make changes to tables from the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] and synchronize the schemas in the database.  

-   When you upgrade the database from an earlier [!INCLUDE[navnow](includes/navnow_md.md)] version to [!INCLUDE[navnowlong](includes/navnowlong_md.md)].  

 The data upgrade process migrates data from upgrade tables to tables in the new or modified database based on the information that is contained in the upgrade codeunits that are available for the application. For more information about upgrade codeunits, see [Upgrade Codeunits](Upgrade-Codeunits.md).  

 You can run the data upgrade from the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] or the [!INCLUDE[nav_shell](includes/nav_shell_md.md)].  

##  <a name="DatUpgradeProcess"></a> Data Upgrade Process  
 The data upgrade process is controlled by the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that connects to the database. When you start a data upgrade, the [!INCLUDE[nav_server](includes/nav_server_md.md)] instances runs all upgrade codeunits that are available for the application and calls the **CheckPreconditions** and upgrade functions, that is **UpgradePerCompany** and **UpgradePerDatabase** function types, that are contained in the upgrade codeunits. These functions provide instructions about how to migrate data from the upgrade tables to locations in the business database.  

> [!NOTE]  
>  In this topic, **UpgradePerCompany** and **UpgradePerDatabase** functions are referred to as **Upgrade** functions.  

 The **CheckPreconditions** and **Upgrade** functions are called in the following order:  

1.  **CheckPreconditions** functions are called in random order.  

2.  **Upgrade** functions are called in random order.  

 By default, Upgrade functions are executed in parallel mode \(at the same time\) unless you choose a different mode. For more information see, [Parallel and Serial Execution Modes for Upgrade Codeunit Functions](Upgrading-Data.md#ParallelSerial).  

> [!IMPORTANT]  
>  Depending on how many tables that must be modified in the business database, the data upgrade process can take several minutes to several hours to finish.  
>   
>  When upgrading a large database, you should increase the **SQL Command Timeout** setting for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that connects to the database to avoid timeouts during schema synchronization. The default setting is 30 minutes. For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).  

###  <a name="ParallelSerial"></a> Parallel and Serial Execution Modes for Upgrade Codeunit Functions  
 You can run a data upgrade to execute **CheckPrecondition** and **Upgrade** functions in upgrade codeunits in two modes: *Parallel* and *Serial*.  

 *Parallel* mode runs the **CheckPrecondition** functions and **Upgrade** functions for all companies at the same time. The **CheckPrecondition** functions are run in parallel first, and if this operation is completed successfully, then the Upgrade functions for all companies are run in parallel. This is the default mode. Running the functions in parallel mode can significantly improve the upgrade performance, especially when you have multiple companies in the database. Each function is run using a separate session on the [!INCLUDE[nav_server](includes/nav_server_md.md)].  

 *Serial* mode runs the **CheckPrecondition** functions and **Upgrade** functions for all companies one at a time. The **CheckPrecondition** functions are run first, followed by the **Upgrade** functions. Functions are run in the same [!INCLUDE[nav_server](includes/nav_server_md.md)] session. Running the functions in serial mode is useful, for example, when you are debugging the data upgrade code.  

### Error Handling During Data Upgrade  
 The following describes the process when an error occurs when executing functions in the upgrade codeunits:  

-   When an error occurs while executing a function, the execution of the function is stopped and changes that were made by the function are rolled back.  

    -   If the upgrade data process is set to continue on errors, then remaining functions are executed until the process is completed.  

    -   If the upgrade data process is not set to continue on errors, then the process is suspended. When functions are executed in parallel mode, functions that are still in progress will be canceled and the changes that were made by the functions will also be rolled back. Changes that were made by functions that were completed are not rolled back.  

 You can use the Get-NavDataUpgrade to obtain information about the functions that have been successfully executed and those that failed. You can use this information to fix any errors, and then resume the data upgrade to execute the failed and canceled functions.  

## Running From the Development Environment  
 The [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] includes several options that enable you to control the data upgrade process. On the **Tools** menu, choose **Data Upgrade**, and then choose one of the options that are described in the following table:  

|[!INCLUDE[bp_tableoption](includes/bp_tableoption_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|----------------------------------|---------------------------------------|  
|Start|Starts the data upgrade as described in [Data Upgrade Process](Upgrading-Data.md#DatUpgradeProcess).<br /><br /> On the **Start Data Upgrade** window, specify the options for running the data upgrade, and then choose the **OK** button. For more information about the start data upgrade options, see [Start Data Upgrade](uiref/-$-S_2181-Start-Data-Upgrade-$-.md).|  
|Resume|Restarts a data upgrade process that has been suspended because of an error that occurred when executing one or more functions in the upgrade codeunit.<br /><br /> On the **Resume Data Upgrade** window, specify whether to re-run all previously failed and canceled functions or a specific function only, and then choose the **OK** button to continue. For more information about the resume data upgrade options, see [Resume Data Upgrade](uiref/-$-S_2182-Resume-Data-Upgrade-$-.md).<br /><br /> Only functions that failed because of an error or were canceled while in-progress during the last data upgrade process will be run again.<br /><br /> You cannot resume a data upgrade process that was stopped. **Note:**  The resume operation will not execute **CheckPreconditions** or **Upgrade** functions that you added to upgrade codeunits while the upgrade process was suspended.|  
|Show Progress|Opens a window that displays information about the data upgrade process that is currently running or the last process that ran. The window provides the current state of the data upgrade and a progress bar that indicates the percentage of the process that has been completed.<br /><br /> The **State** field in the window indicates the current state of the upgrade process and has the following states:<br /><br /> -   **NotStarted** indicates that a data upgrade has not been started on the database.<br />-   **InProgress** indicates that a data upgrade is currently running in the database.<br />-   **Suspended** indicates that the data upgrade processed has been interrupted because an error occurred on a function in an upgrade codeunit.<br />-   **Stopped** indicates that the data upgrade was stopped by using the **Stop** action.<br />-   **Completed** indicates that the data upgrade process has been completed.|  
|Stop|Stops the data upgrade process whose state is in progress or suspended because of an error.<br /><br /> Changes that were made by functions that are still in progress will be rolled back.|  

## Running From [!INCLUDE[nav_shell](includes/nav_shell_md.md)]  
 You can run and manage a data upgrade from the [!INCLUDE[nav_shell](includes/nav_shell_md.md)] by using one of the following cmdlets:  

-   [Start-NAVDataUpgrade](https://go.microsoft.com/fwlink/?LinkID=401404)  

-   [Stop-NAVDataUpgrade](https://go.microsoft.com/fwlink/?LinkID=403853)  

-   [Resume-NAVDataUpgrade](https://go.microsoft.com/fwlink/?LinkID=403853)  

-   [Get-NAVDataUpgrade](https://go.microsoft.com/fwlink/?LinkID=403850)  

 For more information about [!INCLUDE[nav_shell](includes/nav_shell_md.md)], see [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md).  

## See Also  
 [Upgrading the Data](Upgrading-the-Data.md)   
 [Synchronizing Table Schemas](Synchronizing-Table-Schemas.md)   
 [Upgrade Codeunits](Upgrade-Codeunits.md)
