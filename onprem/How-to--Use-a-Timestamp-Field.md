---
title: "How to: Use a Timestamp Field"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: d551118d-e8fd-40ab-bc08-c920b611ef8f
caps.latest.revision: 4
---
# How to: Use a Timestamp Field
Each table in [!INCLUDE[navnow](includes/navnow_md.md)] includes a hidden timestamp field. The timestamp field contains row version numbers for records as maintained in SQL Server. You can expose the timestamp field in a table, and then write code against it, add filters, and so on, similar to any other field in a table. However, you cannot write to the timestamp field.  
  
 A typical use of the timestamp field is for synchronizing data changes in tables, when you want to identify records that have changed since the last synchronization. For example, you can read all the records in a table, and then store the highest timestamp value. Later, you can query and retrieve records that have a higher timestamp value than the stored value.  
  
### To set up a timestamp field in a table  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], open the table, and then add a field of the data type **BigInteger**.  
  
     Specify a name for the field, such as **Record Time Stamp**. You can specify any valid name for field, but you cannot use **timestamp** because this is a reserved name.  
  
2.  Open the field properties, and then set the **SQL Timestamp** property to **Yes**.  
  
## See Also  
 [How to: Create a Table](How-to--Create-a-Table.md)   
 [How to: Add Fields to a Table](How-to--Add-Fields-to-a-Table.md)   
 [SQL Timestamp Property](SQL-Timestamp-Property.md)
