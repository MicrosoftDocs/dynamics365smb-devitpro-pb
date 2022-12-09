---
title: "InitValue Property"
description: "Sets the initial value of this field when a user creates a new record."
ms.author: solsen
ms.custom: na
ms.date: 06/15/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# InitValue Property
> **Version**: _Available or changed with runtime version 1.0._

Sets the initial value of this field when a user creates a new record.

## Applies to
-   Table Field

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Syntax

```AL
InitValue = 1;
```
 
## Remarks

This attribute is only important if you create the record in a window or by using the AL methods [Clear Method](../methods-auto/system/system-clear-joker-method.md), or [ClearAll Method](../methods-auto/system/system-clearall-method.md). For example, this attribute is commonly used in Boolean fields when you want either **true** or **false** to be the default. 

> [!NOTE]  
> For a new field added in the table, values are initialized by default according to the data type or they are initialized by the value given in the `InitValue` property for all new records. If you want to change the `InitValue` for existing records, you have to specify it in the code and run an upgrade because the value you've set in the `InitValue` property for the new record doesn't set the values for already existing records.
  
## See Also

[Clear Method](../methods-auto/system/system-clear-joker-method.md)  
[ClearAll Method](../methods-auto/system/system-clearall-method.md)