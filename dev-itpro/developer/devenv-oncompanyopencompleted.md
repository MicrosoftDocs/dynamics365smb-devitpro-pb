---
title: "Moving from OnCompanyOpen to OnCompanyOpenCompleted"
description: Explains why you should use OnCompanyOpenCompleted instead of OnCompanyOpen.
author: jswymer
ms.custom: na
ms.date: 01/12/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: jswymer
---
# Moving from OnCompanyOpen to OnCompanyOpenCompleted

[!INCLUDE[2022_releasewave1](../includes/2022_releasewave1.md)]

With the introduction of [isolated events](devenv-events-isolated.md), it's possible to write events that don't stop executing when errors occur in their event subscribers. The platform-based event OnCompanyOpenCompleted is an isolated event that takes advantage of this functionality. Subscribing to the OnCompanyOpenCompleted event helps ensure users aren't prevented from signing in to Business Central because of a failed event subscriber.

## About 

The OnCompanyOpenCompleted event is designed to replace the OnCompanyOpen event, which is obsolete and will eventually be removed. The OnCompanyOpenCompleted event, like the OnCompanyOpen event, is raised during sign-in, when trying to open the company. With the OnCompanyOpen event, a failure in any event subscriber will stop the sign-in process. This behavior can be problematic for a couple reasons. There may be several subscribers from various extensions, and failures don't necessarily justify preventing the user from signing in. With the OnCompanyOpenCompleted event, the sign-in process continues even though an event subscriber fails.

## Move from OnCompanyOpen to OnCompanyOpenCompleted

We recommend subscribing to the OnCompanyOpenCompleted event instead of the OnCompanyOpen event, especially when developing for Business Central online. Moving from the OnCompanyOpen event to OnCompanyOpenCompleted event is as easy as changing the event subscriber definition. For example, change:

```al
[EventSubscriber(ObjectType::Codeunit, Codeunit::"Company Triggers", 'OnCompanyOpen', '', false, false)]
```

to:

```al
[EventSubscriber(ObjectType::Codeunit, Codeunit::"Company Triggers", 'OnCompanyOpenCompleted', '', false, false)]
```

> [!NOTE]
> Events that are emitted from within the OnCompanyOpen event will eventually be moved to the OnCompanyOpenCompleted event or they'll be changed to isolated events.

## See Also

[Isolated Events](devenv-events-isolated.md)
[Checklist for Submitting Your App](../developer/devenv-checklist-submission.md)  
[Rules and Guidelines for AL Code](apptest-overview.md)  