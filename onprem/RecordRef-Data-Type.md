---
title: RecordRef Data Type
description: A RecordRef object references a record in a table. RecordRef object in functions apply to more than one table, not to a specific table. 
ms.custom: na
ms.date: 10/30/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 38be0545-2499-46f6-bfec-77f218ba0045
caps.latest.revision: 9
---
# RecordRef Data Type in Dynamics NAV
A RecordRef object references a record in a table. Typically, you use a RecordRef object in functions that must apply to more than one table, not to a specific table. For example, you could use a RecordRef object in a function that loops through several tables or as a parameter of a function that is called for records of different tables.  
  
 The RecordRef object can refer to any table in the database. Use the [OPEN Function \(RecordRef\)](OPEN-Function--RecordRef-.md) to use the table number to select the table that you want to access, or use the [GETTABLE Function \(RecordRef\)](GETTABLE-Function--RecordRef-.md) to use another record variable to select the table that you want to access.  
  
 If one RecordRef variable is assigned to another RecordRef variable, then they both refer to the same table instance.  
  
## See Also  
 [FieldRef Data Type](FieldRef-Data-Type.md)