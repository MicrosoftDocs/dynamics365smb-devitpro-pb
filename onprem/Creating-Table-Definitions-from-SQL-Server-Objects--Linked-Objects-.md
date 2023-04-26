---
title: "Creating Table Definitions from SQL Server Objects (Linked Objects)"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ec40f4cb-5106-4311-ae44-90886ef0fb3d
caps.latest.revision: 6
---
# Creating Table Definitions from SQL Server Objects (Linked Objects)
With [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)], you can create a table definition for a SQL Server object \(user table, system table, or view\) that already exists in the current database.  
  
## Defining Linked Object Table Properties  
 You use the **LinkedObject** table property to link to SQL Server objects by changing the value to **Yes** when creating or modifying a table description in the table designer. When you change this value to **Yes**, the **LinkedInTransaction** property becomes available.  
  
 The **LinkedInTransaction** property must be set to **No** when the [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] table description refers to a view that depends on objects that are outside the current database or on a linked server.  
  
 The **LinkedInTransaction** property allows you to read and modify data from linked server data sources, such as Microsoft Office Excel, Access, or another SQL Server. This access is not under [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] transaction control. This means that if a [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] transaction is stopped, any changes that were made during this transaction to a linked object that is outside the current database or on a linked server will remain in effect.  
  
## See Also  
 [Accessing Objects in Other Databases or on Linked Servers](Accessing-Objects-in-Other-Databases-or-on-Linked-Servers.md)
