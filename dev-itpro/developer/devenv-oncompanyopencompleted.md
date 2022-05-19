---
title: Moving from OnCompanyOpen
description: Explains why you should use OnAfterLogin instead of OnCompanyOpen.
author: jswymer
ms.custom: na
ms.date: 05/19/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: dynamics365-business-central
ms.author: jswymer
---
# Moving from OnCompanyOpen

[!INCLUDE[2022_releasewave1](../includes/2022_releasewave1.md)]

Your AL code might have to rely on an event to run immediately after a user signs in, and the `OnAfterLogin` event is the right one for the job in many cases. With the introduction of [isolated events](devenv-events-isolated.md), it's possible to write events that don't stop executing when errors occur in their event subscribers. `OnAfterLogin` is such an isolated event. Subscribing to the `OnAfterLogin` event helps make sure users aren't prevented from signing in to Business Central because of a failed event subscriber.

## About the OnAfterLogin and OnCompanyOpenCompleted events

The base application subscribes to a platform-based event, `OnCompanyOpenCompleted`, that is also an isolated event, and raises `OnAfterLogin`. We recommend that you subscribe to `OnAfterLogin` in your code, and that you do not subscribe directly to the platform-based event.  

The `OnAfterLogin` and `OnCompanyOpenCompleted` events are both designed to replace the `OnCompanyOpen` event, which is obsolete and will eventually be removed. The application event subscribes to the platform event, so they are both raised during sign-in when [!INCLUDE [prod_short](includes/prod_short.md)] tries to open the relevant company.  

With the now obsolete `OnCompanyOpen` event, a failure in any event subscriber will stop the sign-in process. This behavior can be problematic for a couple reasons. There may be several subscribers from various extensions, and failures don't necessarily justify preventing the user from signing in. With the `OnAfterLogin` event, and it's sibling platform-based event, the sign-in process continues even though an event subscriber fails.  

## Move to the OnAfterLogin event

We recommend subscribing to the `OnAfterLogin` event instead of the OnCompanyOpen event, or even the OnCompanyOpenCompleted event, especially when developing for Business Central online. Moving from the OnCompanyOpen event to `OnAfterLogin` is as easy as changing the event subscriber definition. For example, change:

```al
[EventSubscriber(ObjectType::Codeunit, Codeunit::"Company Triggers", 'OnCompanyOpen', '', false, false)]
```

to:

```al
[EventSubscriber(ObjectType::Codeunit, Codeunit::"System Initialization", 'OnAfterLogin', '', false, false)]
```

> [!NOTE]
> Events that are emitted from within the OnCompanyOpen event will eventually be moved to the OnCompanyOpenCompleted event, or they'll be changed to isolated events.

## See Also

[Isolated Events](devenv-events-isolated.md)  
