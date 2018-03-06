---
title: "Event Subscriptions"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0131069b-3daa-44ac-abb1-309493767502
caps.latest.revision: 3
manager: edupont
translation.priority.ht: 
  - da-dk
  - de-at
  - de-ch
  - de-de
  - en-au
  - en-ca
  - en-gb
  - en-nz
  - es-es
  - es-mx
  - fi-fi
  - fr-be
  - fr-ca
  - fr-ch
  - fr-fr
  - is-is
  - it-ch
  - it-it
  - nb-no
  - nl-be
  - nl-nl
  - ru-ru
  - sv-se
---
# Event Subscriptions
Specifies the current subscriptions to published events.  
  
 A subscription is defined by an event subscriber function and an event publisher function that event subscriber function subscribes to. When a published event is raised in the application, the event subscriber function is called.  
  
 The following table describes the fields that are available for a subscription:  
  
|[!INCLUDE[bp_tablefield](../includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|Subscriber Codeunit ID|Specifies the ID of codeunit that contains the event subscriber function.|  
|Subscriber function|Specifies the event subscriber function in the subscriber codeunit that subscribes to the event.|  
|Event type|Specifies the event type, which can be **Business**, **Integration**, or **Trigger**. For more information about the types, see [Event Types](../Event-Types.md).|  
|Publisher Object Type|The type of object that contains the event publisher function that publishes the event.|  
|Publisher Object ID|Specifies the ID of the object that contains the event publisher function that publishes the event.|  
|Published Function|Specifies the name of the event publisher function in the publisher object that the event subscriber function subscribes to.|  
|Active|Specifies whether the event subscription is active or inactive. When the check box is cleared, the event subscription is inactive. This occurs if the event publisher object or function cannot be found.|  
|Number of calls|Specifies how many times the event subscriber function has been called. The event subscriber function is called when the published event is raised in the application.<br /><br /> This field specifies the total number of calls since the last time the [!INCLUDE[nav_server](../includes/nav_server_md.md)] instance was started or since the last event subscription error was fixed. The field will reset to zero when the [!INCLUDE[nav_server](../includes/nav_server_md.md)] instance is restarted or when an event subscription error occurs.|  
|Error Information|Specifies the error message when an error occurs and the event subscription fails.<br /><br /> For more information about the error messages, see [Event Errors](../Event-Errors.md).|  
  
## See Also  
 [Events in Microsoft Dynamics NAV](../Events-in-Microsoft-Dynamics-NAV.md)   
 [Publishing Events](../Publishing-Events.md)   
 [Subscribing to Events](../Subscribing-to-Events.md)