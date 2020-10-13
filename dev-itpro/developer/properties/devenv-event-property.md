---
title: "Event Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: b1d795a4-66d1-4ff6-9aa9-30951b31139b
caps.latest.revision: 6
author: SusanneWindfeldPedersen
---

 

# Event Property
Specifies whether the method is used to publish or subscribe to an event.  

## Applies to  

-   AL Methods.  

## Property Value  

|Value|Description|  
|-----------|-----------------|  
|**False**|The method is a normal method that does not publish or subscribe to an event.|  
|**Publisher**|The method is an event publisher, which is used to declare and raise a business or integration event in the application.<br /><br /> <!-- For more information, see [Publishing Events](Publishing-Events.md). -->|  
|**Subscriber**|The method is an event subscriber, which is used to handle a published event.<br /><br /> <!-- //NAV  For more information, see [Subscribing to Events](Subscribing-to-Events.md).-->|  
<!--
## Remarks  
 For more information about events, see [Events in Microsoft Dynamics NAV](Events-in-Microsoft-Dynamics-NAV.md).  

## See Also  
 [Raising Events](Raising-Events.md)   
 [AL Method Statements](../devenv-al-method-statements.md)
-->