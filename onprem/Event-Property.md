---
title: "Event Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b1d795a4-66d1-4ff6-9aa9-30951b31139b
caps.latest.revision: 6
manager: edupont
---
# Event Property
Specifies whether the function is used to publish or subscribe to an event.  

## Applies to  

-   C/AL functions.  

## Property Value  

|Value|Description|  
|-----------|-----------------|  
|**No**|The function is a normal function that does not publish or subscribe to an event.|  
|**Publisher**|The function is an event publisher, which is used to declare and raise a business or integration event in the application.<br /><br /> For more information, see [Publishing Events](Publishing-Events.md).|  
|**Subscriber**|The function is an event subscriber, which is used to handle a published event.<br /><br /> For more information, see [Subscribing to Events](Subscribing-to-Events.md).|  

## Remarks  
 For more information about events, see [Events in Microsoft Dynamics NAV](Events-in-Microsoft-Dynamics-NAV.md).  

## See Also  
 [Raising Events](Raising-Events.md)   
 [C/AL Function Statements](C-AL-Function-Statements.md)
