---
title: RecordID Data Type 
description: This data type contains the table number and the primary key of a table that can store a record ID in the database and set filters on partial values.
ms.custom: na
ms.date: 10/30/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 22b55f8c-90a1-47f7-a716-ff833ae33ccb
caps.latest.revision: 4
---
# RecordID Data Type in Dynamics NAV
This data type contains the table number and the primary key of a table.

You can store a RecordID in the database. You can set filters on the full RecordID values, but you cannot set filters on partial values, which means wildcard (*) filters are not supported.

> [!NOTE]  
> You cannot use the GET function to retrieve a record in a table by its primary key value if the primary key field in the table has the data type RecordID. In this case, you can retrieve the record by using  the Record.SETRANGE(FieldName, FieldValue) function.

## See Also  
 [GETRECORD Function \(RecordID\)](GETRECORD-Function--RecordID-.md)   
 [TABLENO Function \(RecordID\)](TABLENO-Function--RecordID-.md)
  [GET Function \(RecordID\)](GET-Function--Record-.md)   
