---
title: "SQLTimestamp Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 615d15ba-5d0e-4071-bfa2-c262c1dccbf4
caps.latest.revision: 3
author: SusanneWindfeldPedersen
---

# SQLTimestamp Property
Specifies a field to be a timestamp field.  

## Applies to  
 Table Fields  

## Property Value  
 **True** if the field is the timestamp field; otherwise, **false**. The default value is **false**.  

## Syntax
```
SQLTimestamp = true;
```

## Remarks  
Each table includes a hidden timestamp field. The timestamp field contains row version numbers for records as maintained in SQL Server. This property exposes the timestamp field in the table object, and enables you to write code against it. This property only applies to fields that have the data type `BigInteger`. For more information, see [Timestamp Field](../devenv-table-object.md#timestamp).

## See Also  
 [Properties](devenv-properties.md)   
 [Table and Table Extension Properties](devenv-table-properties.md)  
