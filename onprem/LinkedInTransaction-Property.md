---
title: "LinkedInTransaction Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 15821f83-34c0-4135-bcfd-095a6783ebf6
caps.latest.revision: 7
manager: edupont
---
# LinkedInTransaction Property
Gets and sets data from linked server data sources, such as Microsoft Office Excel, Access, or another SQL Server.  
  
## Applies To  
 Tables  
  
## Remarks  
 This property is available when the [LinkedObject Property](LinkedObject-Property.md) is set to **Yes**.  
  
 Set the **LinkedInTransaction** property to **No** when the [!INCLUDE[navnow](includes/navnow_md.md)] table description refers to an object outside the current database or on a linked server.  
  
 The access to linked server data sources is not under [!INCLUDE[navnow](includes/navnow_md.md)] transaction control. This means that if a [!INCLUDE[navnow](includes/navnow_md.md)] transaction is aborted, then any changes that were made to a linked object that is outside the current database or on a linked server during this transaction will remain in effect.  
  
## See Also  
 [Creating Table Definitions from SQL Server Objects \(Linked Objects\)](Creating-Table-Definitions-from-SQL-Server-Objects--Linked-Objects-.md)   
 [LinkedObject Property](LinkedObject-Property.md)