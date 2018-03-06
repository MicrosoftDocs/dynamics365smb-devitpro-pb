---
title: "TIME Method (Time)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: d670fe72-94d5-43b8-bb4b-4b48805b16c9
caps.latest.revision: 9
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# TIME Method (Time)
Gets the current time from the operating system.  
  
## Syntax  
  
```  
  
Time := TIME  
```  
  
## Property Value/Return Value  
 Type: Time  
  
 The current time.  
  
## Remarks  
 You can only use the TIME method to retrieve the time from the operating system. You cannot use it to set the time in the operating system.  
  
## Example  
 This example requires that you create the following global text constant.  
  
|Name|ConstValue|  
|----------|----------------|  
|Text000|The current system time is %1.|  
  
```  
MESSAGE(Text000, TIME);  
```  
  
 On a computer that has the regional format set to English \(United States\), the message window could display the following:  
  
 **The current system time is 11:15:46 AM.**  
  
## See Also  
 [Time Data Type](../datatypes/devenv-Time-Data-Type.md)   
 [Date and Time Methods](devenv-Date-and-Time-Methods.md)