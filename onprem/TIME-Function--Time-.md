---
title: "TIME Function (Time)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: d670fe72-94d5-43b8-bb4b-4b48805b16c9
caps.latest.revision: 9
manager: edupont
---
# TIME Function (Time)
Gets the current time from the operating system.  
  
## Syntax  
  
```  
  
Time := TIME  
```  
  
## Property Value/Return Value  
 Type: Time  
  
 The current time.  
  
## Remarks  
 You can only use the TIME function to retrieve the time from the operating system. You cannot use it to set the time in the operating system.  
  
## Example  
 This example requires that you create the following text constant in the **C/AL Globals** window.  
  
|Name|ConstValue|  
|----------|----------------|  
|Text000|The current system time is %1.|  
  
```  
MESSAGE(Text000, TIME);  
```  
  
 On a computer that has the regional format set to English \(United States\), the message window could display the following:  
  
 **The current system time is 11:15:46 AM.**  
  
## See Also  
 [Time Data Type](Time-Data-Type.md)   
 [Date and Time Functions](Date-and-Time-Functions.md)