---
title: "AutoSplitKey Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AutoSplitKey Property
> **Version**: _Available from runtime version 1.0._

Sets whether a key is automatically created for a new record placed between the current record and the previous record.

## Applies to
-   Page
-   Request Page


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


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