---
title: "OnMissingPermission Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 8f682697-4113-4530-af1a-b4ee1ca4b63a
caps.latest.revision: 3
author: SusanneWindfeldPedersen
---

 

# OnMissingPermission Property
Specifies what happens to the subscriber method call when the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] user account that is running the current session does not have permission to the codeunit that contains the subscriber method. The permissions are defined by the permission sets on the user account.  
  
## Applies to  
  
-   AL methods in codeunits.  
  
     This property is only available when the [Event Property](devenv-event-property.md) is set to **Subscriber**.  
  
## Property Value  
  
|Value|Description|  
|-----------|-----------------|  
|**Error**|An error is thrown and code execution will stop. This is the default value.|  
|**Skip**|The subscriber method call is ignored and the execution continues the next subscriber.|  
  
## Remarks  
Before the permissions of the user account are evaluated, the user's license is evaluated to make sure that it includes the codeunit. If the license is not valid for the codeunit, the call to the subscriber is stopped and this property is irrelevant.  
<!-- 
For more information about events, see [Events in Microsoft Dynamics NAV](Events-in-Microsoft-Dynamics-NAV.md).
-->  
## See Also  
[properties](devenv-properties.md)  
[OnMissingLicense Property](devenv-onmissinglicense-property.md)  
[EventSubscriberInstance Property](devenv-eventsubscriberinstance-property.md)
<!--
[Publishing Events](Publishing-Events.md)   
[Raising Events](Raising-Events.md)   
[Subscribing to Events](Subscribing-to-Events.md)   
[AL Method Statements](../devenv-al-method-statements.md)
-->