---
title: "BREAKUNBOUND Method (XMLport)"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: de9cafb6-ece1-4578-90b3-197f5036df46
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# BREAKUNBOUND Method (XMLport)
Exits from a loop on records in an XMLport trigger.  

## Syntax  

```  
BREAKUNBOUND  
```  

## Remarks  
 BREAKUNBOUND causes the current trigger to end. If you are looping over columns in an export where the **Unbound** property is set to **true**, use BREAKUNBOUND to indicate when the record is fully processed.  

 For example, your XMLport supports two different file formats. One format contains 5 columns, and the other contains 10 columns. Instead of duplicating the maximum number of columns and writing code that skips any redundant columns, you can set up a single column, make it unbound, and then specify in code when to break to the next element.  

## See Also  
 [Unbound Property](../properties/devenv-unbound-property.md)
