---
title: "LinkedObject Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 7b633d2b-5833-47e8-aa92-9e6eb1238cb2
caps.latest.revision: 6
author: SusanneWindfeldPedersen
---

# LinkedObject Property

Use this property to link to SQL Server objects.  
  
## Applies to  

- Tables  

## Property Value

**True** if a link to SQL Server objects is provided; otherwise, **false**. The default value is **false**.  

## Syntax

```AL
LinkedObject = true;
```
  
## Remarks

When you set the LinkedObject property to **true**, the [LinkedInTransaction Property](devenv-linkedintransaction-property.md) becomes available.  
  
## See Also

[Table Properties](devenv-table-properties.md)