---
title: "InitValue Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# InitValue Property
Sets the initial value of this field when a user creates a new record.  
  
## Applies to  
Fields  

## Syntax
```
InitValue = 1;
```
 
## Remarks  
This attribute is only important if you create the record in a window or by using the AL methods [CLEAR Method](../methods-auto/system/system-clear-joker-method.md), or [CLEARALL Method](../methods-auto/system/system-clearall-method.md). For example, this attribute is commonly used in Boolean fields when you want either **true** or **false** to be the default.  
  
## See Also  
[CLEAR Function](../methods-auto/system/system-clear-joker-method.md)  
[CLEARALL Function](../methods-auto/system/system-clearall-method.md)