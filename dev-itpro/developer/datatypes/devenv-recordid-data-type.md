---
title: "RecordID Data Type"
ms.custom: na
ms.date: 06/08/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 22b55f8c-90a1-47f7-a716-ff833ae33ccb
caps.latest.revision: 4
author: SusanneWindfeldPedersen
---
# RecordID Data Type
This data type contains the table number and the primary key of a table.

You can store a RecordID in the database. You can set filters on the full RecordID values, but you cannot set filters on partial values, which means wildcard (*) filters are not supported.

> [!NOTE]  
> You cannot use the GET method to retrieve a record in a table by its primary key value if the primary key field in the table has the data type RecordID. In this case, you can retrieve the record by using  the Record.SETRANGE(FieldName, FieldValue) method.

## Methods
The following methods are supported for the RecordID data type:

[GETRECORD method (RecordID)](../methods/devenv-getrecord-method-recordid.md)   
[TABLENO method (RecordID)](../methods/devenv-tableno-method-recordid.md)
[GET method (RecordID)](../methods/devenv-get-method-record.md)   

## See Also  
[AL Data Types](devenv-al-data-types.md)  
[AL Method Reference](../methods/devenv-al-method-reference.md)  
