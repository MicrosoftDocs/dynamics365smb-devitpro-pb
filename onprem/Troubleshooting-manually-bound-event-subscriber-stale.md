---
title: "Troubleshooting Events - A manually bound event subscriber is stale and will no longer be called"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
---
# Troubleshooting: A manually bound event subscriber is stale and will no longer be called

In the **Event Viewer Application** log cient, the following runtime error can occur on an event subscription:   

**A manually bound event subscriber is stale and will no longer be called. This can be caused by the subscriber object being updated by an operation in the development environment.**  
**Publisher object and function: [Codeunit/Table] - [ID], [PublisherFunction]**  
**Subscriber object and function: Codeunit - [ID], [SubscriptionFunction]**`

## Cause
This error can occur when calling a event subscriber function that is manually bound to a event subscriber codeunit instance, and you have made changes to the codeunit by an operation done in the [!INCLUDE[nav_dev_long_md](includes/nav_dev_long_md.md)], such as recompiling the object. 

An event subscriber codeunit has the [EventSubscriberInstance](EventSubscriberInstance-property.md) that you can set to **Manual**. This means that the event will only be called if a live and current codeunit instance has been invoked with a call to the [BINDSUBSCRIPTION Function](BINDSUBSCRIPTION-Function.md). With a manually bound event subscriber instance, you control the control its lifespan.

So, for example, if the manual event subscription is added in **CompanyOpen** trigger in codeunit 1, then the instance of the event subscription lasts the whole client session, unless the [UNBINDSUBSCRIPTION Function](UNBINDSUBSCRIPTION-Function.md) is called. If you recompile the event subscriber codeunit in [!INCLUDE[nav_dev_short_md](includes/nav_dev_short_md.md)], the codeunit metadata is changed. When the event fires, the [!INCLUDE[nav_server_md](includes/nav_server_md.md)] instance uses the new metadata for the codeunit, but because the binding using the previous codunit metadata is still alive, a conflict occurs and will be ignored.

## Resolution
To resolve the issue in the current session, the user has to restart the client. In the event design, you should add code to unbind and then bind the instance again, or use a static-automatic event subscriber instance by changing the [EventSubscriberInstance](EventSubscriberInstance-property.md).

## See Also  
 [Publishing Events](Publishing-Events.md)   
 [Raising Events](Raising-Events.md)   
 [Subscribing to Events](Subscribing-to-Events.md)   
 [C/AL Function Statements](C-AL-Function-Statements.md)
