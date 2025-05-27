---
title: System Tables 
description: The information in System Tables are stored in the database, closely related to DBMS, which uses to manage system security and permissions.
ms.date: 10/01/2018
ms.topic: article
ms.assetid: 6e9be5ec-3b61-4054-97fe-56cc24299c16
caps.latest.revision: 12
---
# System Tables in Microsoft Dynamics NAV
System tables are stored in the database just like other database tables. However, unlike other database tables, they are created automatically. The information in system tables is closely related to the Database Management System \(DBMS\), which uses the system tables to manage, for example, system security and permissions.  
  
 You can read, write, modify, and delete the information in system tables.  
  
> [!IMPORTANT]  
>  The system tables are required for [!INCLUDE[navnow](includes/navnow_md.md)] to work as intended. If you modify a system table, programmatically or otherwise, you risk damaging the behavior of [!INCLUDE[navnow](includes/navnow_md.md)]. Also, any changes that you make to a system table may be not valid in a future version of [!INCLUDE[navnow](includes/navnow_md.md)].  
  
 If you change data in the **Object** table programmatically, such as changing a table definition in your C/AL code, the changes will not take effect. If you want to change an existing object, you must do so in the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)]. For more information, see [Designing Application Objects](Designing-Application-Objects.md).  
  
## See Also  
 [Special Tables](Special-Tables.md)   
 [Data Security](Data-Security.md)   
 [Object-Level Security](Object-Level-Security.md)   
 [Development](Development.md)