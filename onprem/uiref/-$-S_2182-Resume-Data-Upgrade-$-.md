---
title: "Resume Data Upgrade"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 2f7bcbf6-25b1-4e61-96b9-09d45e954100
caps.latest.revision: 2
manager: edupont
---
# Resume Data Upgrade
Specifies which **Upgrade** functions to rerun when you resume a data upgrade process that has been suspended.  

 To open this window, on the **Tools** menu, choose  **Data Upgrade**, and then choose the **Resume**.  

 The following table describes the options in the **Resume Data Upgrade** window.  

|[!INCLUDE[bp_tableoption](../includes/bp_tableoption_md.md)]|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|----------------------------------|---------------------------------------|  
|**Resume All**|Specifies to run all **Upgrade** functions that failed or where cancelled during the data upgrade.|  
|**Resume**|Specifies to run a specific **Upgrade** function in an upgrade codeunit. **Tip:**  To get a list of invoked functions, use the Get-NAVDataUpgrade cmdlet from the [!INCLUDE[nav_shell](../includes/nav_shell_md.md)].|  
|**Codeunit**|Specifies the ID of the upgrade codeunit to run.|  
|**Codeunit Method**|Specifies the name of the **Upgrade** function in the upgrade codeunit to run.|  
|Company|Specifies the name of the [!INCLUDE[navnow](../includes/navnow_md.md)] company for which to run the Upgrade function.|  

> [!NOTE]  
>  You can only rerun failed or canceled Upgrade functions.  

## See Also  
 [Upgrading Data](../Upgrading-Data.md)   
 [Upgrade Codeunits](../Upgrade-Codeunits.md)
