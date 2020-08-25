---
title: "LinkedInTransaction Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 15821f83-34c0-4135-bcfd-095a6783ebf6
caps.latest.revision: 7
author: SusanneWindfeldPedersen
---

 

# LinkedInTransaction Property
Gets and sets data from linked server data sources, such as Microsoft Office Excel, Access, or another SQL Server.  
  
## Applies To  
 Tables  

## Syntax
```
LinkedInTransaction = false;
```
 
## Remarks  
 This property is available when the [LinkedObject Property](devenv-linkedobject-property.md) is set to **true**.  
  
 Set the **LinkedInTransaction** property to **false** when the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] table description refers to an object outside the current database or on a linked server.  
  
 The access to linked server data sources is not under [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] transaction control. This means that if a [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] transaction is aborted, then any changes that were made to a linked object that is outside the current database or on a linked server during this transaction will remain in effect.  
  
## See Also  
 <!-- [Creating Table Definitions from SQL Server Objects \(Linked Objects\)](Creating-Table-Definitions-from-SQL-Server-Objects--Linked-Objects-.md)  --> 
 [LinkedObject Property](devenv-linkedobject-property.md)