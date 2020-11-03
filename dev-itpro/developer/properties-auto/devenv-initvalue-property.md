---
title: "InitValue Property"
ms.author: solsen
ms.custom: na
ms.date: 10/29/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# InitValue Property
Sets the initial value of this field when a user creates a new record.

## Applies to
-   Field

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
InitValue = 1;
```
 
## Remarks

This attribute is only important if you create the record in a window or by using the AL methods [CLEAR Method](../methods-auto/system/system-clear-joker-method.md), or [CLEARALL Method](../methods-auto/system/system-clearall-method.md). For example, this attribute is commonly used in Boolean fields when you want either **true** or **false** to be the default.  
  
## See Also

[Clear Method](../methods-auto/system/system-clear-joker-method.md)   
[ClearAll Method](../methods-auto/system/system-clearall-method.md)