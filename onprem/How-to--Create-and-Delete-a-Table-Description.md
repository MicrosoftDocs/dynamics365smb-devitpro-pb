---
title: Create and Delete Table Description
description: You can create different kinds of Dynamics NAV table descriptions, depending on the LinkedObject and LinkedTrasaction table property values.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6658eace-4f06-4ddb-b21a-9e9ef97021e4
caps.latest.revision: 10
---
# How to: Create and Delete a Table Description
You can create different kinds of [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] table descriptions, depending on the **LinkedObject** and **LinkedInTransaction** table property values. You must be a member of the db\_owner fixed database role to create a table description.  
  
### To create a non-linked table  
  
1.  Set the value of the **LinkedObject** property to **No**.  
  
     When you save this table, a SQL Server table that is owned by the db\_owner fixed database role is created with the name you have specified \(including the company name, if necessary\).  
  
     If an object with this name already exists, an error message is displayed and the table is not saved.  
  
### To create a linked object that is under transaction control  
  
1.  Set the **LinkedObject** property to **Yes**.  
  
2.  Set the **LinkedInTransaction** property to **Yes**.  
  
     The table is saved without checking its validity. [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] will check that the corresponding SQL Server object exists and that it is compatible with the [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] table description when the table is accessed.  
  
### To create a linked object that is not under transaction control  
  
1.  Set the **LinkedObject** property to **Yes**.  
  
2.  Set the **LinkedInTransaction** property to **No**. Set the **LinkedInTransaction property** to **No** when the Microsoft Dynamics NAV table description refers to an object outside of the current database or on a linked server.  
  
### To delete a table description  
  
1.  Set the **LinkedObject** property to **No**.  
  
 When the **LinkedObject** property is set to **No**, the SQL Server object is deleted if it is a user table. The SQL Server object is not deleted if it is a system table or a view. It can only be a system table or a view if it has been changed to one of these object types with the aid of an external tool. The **LinkedObject** property must be set to **Yes** in order to be able to link to a system table or a view.  
  
 When the **LinkedObject** property is set to **Yes**, the SQL Server object is not deleted. This means that if you create a [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] table with the **LinkedObject** property set to **No** and then change it to **Yes**, its corresponding SQL Server object is not deleted.  
  
 When you modify the **LinkedInTransaction** property of a [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] table, all access to the linked SQL Server object will be made under or outside transaction control, depending on the setting you choose.  
  
-   When you access data in a linked object, if the **LinkedInTransaction** property is set to **Yes**, all access to the linked object will be performed under transaction control, within [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] transactions. If the **LinkedInTransaction** property is set to **No**, all access to the linked object will be performed outside transaction control, independent of [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] transactions.
