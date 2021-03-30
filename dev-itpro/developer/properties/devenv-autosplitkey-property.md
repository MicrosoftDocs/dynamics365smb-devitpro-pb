---
title: "AutoSplitKey Property"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
> **Version**: _Available or changed with runtime version 1.0._

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
  
- The last field in the primary key must be an [Integer Data Type](../methods-auto/library.md), [BigInteger Data Type](../methods-auto/library.md), [GUID Data Type](../methods-auto/library.md), or [Decimal Data Type](../methods-auto/library.md) field.  
  
## See Also  
[Properties](devenv-properties.md)