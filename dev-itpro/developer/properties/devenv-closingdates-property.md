---
title: "ClosingDates Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 9a98bc80-1b56-4f55-a31c-71a0609b9991
caps.latest.revision: 9
author: SusanneWindfeldPedersen
---

 

# ClosingDates Property
Sets a value that determines whether users can enter a closing date in this field. The default value is **false**.  
  
## Applies To  
  
-   Table Fields  
  
-   Page Fields  

## Property value
**True** if users can enter a closing date in the field, otherwise **false**. The default is **false**.

## Syntax
```
ClosingDates = true;
```

## Remarks  
 All dates have a corresponding closing date. A closing date is a period following the given date, but before the next date. Closing dates are sorted immediately after the corresponding date but before the next date.  
  
 <!-- For fields, this property only applies to [Date and Time Methods](date-and-time-methods.md).  -->
  
## See Also  
 [Date and Time Methods](../methods/devenv-date-and-time-methods.md)