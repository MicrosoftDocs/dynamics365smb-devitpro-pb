---
title: "TODAY Function (Date)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c2042afd-b4c1-4753-9fba-cf069857fb08
caps.latest.revision: 7
manager: edupont
---
# TODAY Function (Date)
Gets the current date set in the operating system.  
  
## Syntax  
  
```  
  
Date := TODAY  
```  
  
## Property Value/Return Value  
 Type: Date  
  
 The current date defined by the operating system.  
  
## Remarks  
 You can only use the **TODAY** function to retrieve the current date from the operating system. You cannot use it to set the date in the operating system.  
  
## Example  
 This example shows how to use the **TODAY** function. This example requires that you create the following text constant in the **C/AL Globals** window.  
  
|Name|ConstValue|  
|----------|----------------|  
|Text000|The current date is: %1|  
  
```  
MESSAGE(Text000, TODAY);  
```  
  
 The message window could display the following:  
  
 **The current date is: 05/27/08**  
  
## See Also  
 [Date and Time Functions](Date-and-Time-Functions.md)