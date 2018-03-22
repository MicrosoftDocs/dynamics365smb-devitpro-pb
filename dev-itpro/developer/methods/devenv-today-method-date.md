---
title: "TODAY Method (Date)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: c2042afd-b4c1-4753-9fba-cf069857fb08
caps.latest.revision: 7
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# TODAY Method (Date)
Gets the current date set in the operating system.  
  
## Syntax  
  
```  
  
Date := TODAY  
```  
  
## Property Value/Return Value  
 Type: Date  
  
 The current date defined by the operating system.  
  
## Remarks  
 You can only use the **TODAY** method to retrieve the current date from the operating system. You cannot use it to set the date in the operating system.  
  
## Example  
 This example shows how to use the **TODAY** method. This example requires that you create the following global text constant.  
  
|Name|ConstValue|  
|----------|----------------|  
|Text000|The current date is: %1|  
  
```  
MESSAGE(Text000, TODAY);  
```  
  
 The message window could display the following:  
  
 **The current date is: 05/27/08**  
  
## See Also  
 [Date and Time Methods](devenv-Date-and-Time-Methods.md)