---
title: "AutoSplitKey property"
description: "Sets whether a key is automatically created for a new record placed between the current record and the previous record."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AutoSplitKey Property
> **Version**: _Available or changed with runtime version 1.0._

Sets whether a key is automatically created for a new record placed between the current record and the previous record.

## Applies to
-   Request Page
-   Page

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
  
## Related information  
[Properties](devenv-properties.md)