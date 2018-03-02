---
title: "Object-Level Security"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 5b42467f-61bd-4931-8bc7-6b0561db3081
caps.latest.revision: 17
manager: edupont
---
# Object-Level Security
When you open a company in [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)], your ability to access information is determined by the security system.  
  
## Object-Level Security  
 Object-level security is the set of permissions on [!INCLUDE[navnow](includes/navnow_md.md)] objects that constitute a permission set. Permission sets determine the access that users have and the tasks that users can perform on objects in the database.  
  
### Security System Database Objects  
 You can define permissions for all types of objects in a [!INCLUDE[navnow](includes/navnow_md.md)] database.  
  
|Object Type|Description|  
|-----------------|-----------------|  
|Table Data|The actual data that is stored in the tables.|  
|Table|The tables themselves.|  
|Pages|The pages that are used to view and enter data.|  
|Report|The reports that are used to present the data.|  
|Codeunit|The codeunits that are used in the database.|  
|XMLport|The XMLports that are used to import and export data.|  
|MenuSuite|The object that contains the menus that are displayed in the navigation pane.|  
|Query|The object that you use to specify a dataset from the database.|  
|System|The system tables in the database that allow the user to make backups, change license files, and so on.|  
  
 The various permission sets that exist in [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] determine the actions that you can perform on these objects. For more information about permissions, see [Permissions on Database Objects](Permissions-on-Database-Objects.md).  
  
## See Also  
 [Data Security](Data-Security.md)   
 [Business Areas and Granules](Business-Areas-and-Granules.md)   
 [Permissions on Database Objects](Permissions-on-Database-Objects.md)