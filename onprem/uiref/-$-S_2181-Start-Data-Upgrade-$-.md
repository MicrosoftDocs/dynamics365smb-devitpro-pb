---
title: "Start Data Upgrade"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 683e7fbe-d29d-4556-b743-f72d34edbecb
caps.latest.revision: 2
manager: edupont
---
# Start Data Upgrade
Specifies how to run the data upgrade.  

 To open this window, on the **Tools** menu, choose  **Data Upgrade**, and then choose the **Start**.  

 The following table describes the options in the **Start Data Upgrade** window.  

|[!INCLUDE[bp_tableoption](../includes/bp_tableoption_md.md)]|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|----------------------------------|---------------------------------------|  
|**Execution mode**|Specifies how to run the Upgrade functions in upgrade codeunits.<br /><br /> -   **Parallel** runs the **Upgrade** functions at the same time. This is the default setting.<br />-   **Serial** runs the **Upgrade** functions one after the other \(sequentially\).<br /><br /> For more information, see [Parallel and Serial Execution Modes for Upgrade Codeunit Functions](../Upgrading-Data.md#ParallelSerial).|  
|**Continue on Error**|Specifies whether the [!INCLUDE[nav_server](../includes/nav_server_md.md)] instance continues to execute other **Upgrade** functions in the Upgrade codeunits when an error occurs while executing an upgrade function.<br /><br /> If you clear this check box, when an error occurs, the [!INCLUDE[nav_server](../includes/nav_server_md.md)] instance will suspend the data upgrade process. It will cancel the execution of upgrade functions currently in progress and roll back any changes that were applied. Completed functions will not be rolled back. This is the default setting.|  
|**Show Progress**|Specifies whether to display the progress window during the data update process. The progress windows provides the state of the database, details about the current operation, such as errors, and a<br /><br /> You can always view the progress from the **Tools** menu by selecting **Data Upgrade**, and then **Show Progress**.|  

## See Also  
 [Upgrading Data](../Upgrading-Data.md)   
 [Upgrade Codeunits](../Upgrade-Codeunits.md)
