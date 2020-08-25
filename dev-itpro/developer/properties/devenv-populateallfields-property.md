---
title: "PopulateAllFields Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: dd157345-e6b8-48d4-a38c-9da55a49289e
caps.latest.revision: 13
author: SusanneWindfeldPedersen
---

 

# PopulateAllFields Property
Sets whether fields are filled out automatically with a single filter value when a new record is inserted in a table.  
  
## Applies to  
  
-   Pages  

## Property Value  
 **True** if you want the fields filled out automatically; otherwise, **false**. The default is **false**.  

## Syntax
```
PopulateAllFields = true;
``` 

## Remarks  
 Values are inserted in those fields where a currently active filter expression evaluates to exactly one value. Key fields are always populated.  
  
## See Also  
 [Properties](devenv-properties.md)