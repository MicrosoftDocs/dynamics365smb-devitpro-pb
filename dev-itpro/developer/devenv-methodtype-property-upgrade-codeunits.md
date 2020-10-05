---
title: "MethodType Property (Upgrade Codeunits)"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---

# MethodType Property (Upgrade Codeunits)
Sets the type of method in an upgrade codeunit.  

## Applies To  
 AL methods on upgrade codeunits. An upgrade codeunit is codeunit that has the [SubType Property \(Codeunit\)](properties/devenv-subtype-property-codeunit.md) set to **Upgrade**.  

## Property Value  

|Value|Description|  
|-----------|-----------------|  
|**Normal**|Acts as normal method.|  
|**UpgradePerCompany**|Provides instructions for upgrading data in a business data table.<br /><br /> When you perform a data upgrade, these methods are run for all companies in the database, where each method is executed within its own system session on [!INCLUDE[d365fin_server_md](includes/d365fin_server_md.md)] that connects to the specific company. You typically use this type of method when the data in the table that you upgrading is company-specific, as specified by the table's [DataPerCompany Property](properties/devenv-datapercompany-property.md).|  
|**UpgradePerDatabase**|Provides instructions for upgrading data in a business data table.<br /><br /> These methods are executed once during an upgrade process, in a single system session on [!INCLUDE[d365fin_server_md](includes/d365fin_server_md.md)] that does not open any company. You typically use an **UpgradePerDatabase** method when the data in the table that you are upgrading is not company-specific. This can prevent locking issues when upgrade methods are run in parallel mode.|  
|**TableSyncSetup**|Provides instructions about how to synchronize the table schemas in the business database with the table definitions.|  
|**CheckPrecondition**|Provides logic that checks conditions that must be met in order for the data upgrade process to continue and start running the **Upgrade** methods.|  

## See Also  
[SubType Property \(Codeunit\)](properties/devenv-subtype-property-codeunit.md)