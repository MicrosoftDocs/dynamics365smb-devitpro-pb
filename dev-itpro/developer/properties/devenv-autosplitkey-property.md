---
title: "AutoSplitKey Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: f4af0163-90aa-486c-a907-f04636499be3
caps.latest.revision: 8
author: SusanneWindfeldPedersen
---

# AutoSplitKey Property
Sets whether a key is automatically created for a new record placed between the current record and the previous record.  
  
## Applies to  
  
- Pages  
  
## Property Value  
 **True** if the key is automatically created for the new record; otherwise, **false**. The default value is **false**.  

## Syntax
```AL
AutoSplitKey = true;
```

## Remarks  
To set this property to a value of **true**, the following conditions must be met:  
  
- The current key must be the primary key.  
  
- The last field in the primary key must be an [Integer Data Type](../datatypes/devenv-integer-data-type.md), [BigInteger Data Type](../datatypes/devenv-biginteger-data-type.md), [GUID Data Type](../datatypes/devenv-guid-data-type.md), or [Decimal Data Type](../datatypes/devenv-decimal-data-type.md) field.  
  
## See Also  
[Properties](devenv-properties.md)