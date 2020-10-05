---
title: "UpdatePropagation Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 56b70fb2-c01f-4558-89f0-f991f2a24d78
caps.latest.revision: 5
author: SusanneWindfeldPedersen
---

 

# UpdatePropagation Property
Sets a value that specifies what happens when a main page with a subpage is updated. The **UpdatePropagation** property is available on part controls and has two options; **Subpage** and **Both**. If **UpdatePropagation** is set to **Subpage**, an update action will update the subpage only. If **UpdatePropagation** is set to **Both**, an update action will update both the main page and the subpage. This is useful if a value on the subpage changes, and you want a main page total to be refreshed automatically.  
  
## Applies to  
  
-   Page parts  

## Syntax
```
 UpdatePropagation = Both;
```
 
## Remarks  
 Use the **UpdatePropagation** property to update a main page total, when the amount on the subpage lines is updated. Add a `CurrPage.UPDATE();` call, for example, in the OnValidate trigger on the subpage to have the **UpdatePropagation** property take effect.

## See Also
[Properties](devenv-properties.md) 
