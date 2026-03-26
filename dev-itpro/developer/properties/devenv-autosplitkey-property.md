---
title: "AutoSplitKey property"
description: "Sets whether a key is automatically created for a new record placed between the current record and the previous record."
ms.author: solsen
ms.date: 03/24/2026
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

When AutoSplitKey is enabled, a value is automatically calculated for the last field of the primary key when a new record is inserted between two existing records. The new key value is set to a value halfway between the keys of the surrounding records.

### Negative key values

[!INCLUDE[2025-releasewave1-later](../../includes/2025-releasewave1-later.md)]

If a new row is inserted before the first record in the list, a negative key value may generated so that the new record sorts before all existing records. Both 0 and negative values are allowed for numeric key fields, though `AutoSplitKey` doesn't currently generate 0 as a value.

## Related information  

[Properties](devenv-properties.md)