---
title: "Virtual Tables"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: da3a6da3-f4d5-4f06-ba1e-fd6d21ef1ab1
caps.latest.revision: 16
---
# Virtual Tables
A virtual table contains system information. You cannot change the data in virtual tables. You can only read the information. Virtual tables are not stored in the database but are computed by [!INCLUDE[navnow](includes/navnow_md.md)] at run time.  
  
## Using Virtual Tables  
 You can use the same methods to access information in virtual tables as you use when you are working with ordinary tables. For example, you can use filters to get subsets or ranges of integers or dates from the Integer virtual table or the Date virtual table.  
  
 A system administrator usually uses these virtual tables. These tables give the system administrator information about the users who are currently connected to the database and the current state of the system.  
  
 The virtual tables provide such information as:  
  
-   Integers in the range –1,000,000,000 to 1,000,000,000.  
  
-   Dates in a given period.  
  
-   Overview of the operating system files.  
  
-   Overview of the logical disk drives.  
  
-   Overview of the operating system files that store the database.  
  
 Because virtual tables are not stored in the database, you cannot view them directly. To view a virtual table, you must create a list page based on the virtual table. For more information, see [How to: Create a Page to View a Virtual Table](How-to--Create-a-Page-to-View-a-Virtual-Table.md).
