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

With the introduction of [isolated events](devenv-events-isolated.md), it's possible to write events that don't interrupt execution when errors occur in event subscribers. The platform-based event OnCompanyOpenCompleted takes advantage of this to ensure the user will no longer be unable to login upon a failure in an event subscriber.

Moving from the OnCompanyOpen event to OnCompanyOpenCompleted event is as easy as changing the event subscriber definition. Furthermore, events that are emitted from within the OnCompanyOpen will slowly be moved onto the OnCompanyOpenCompleted or becomes isolated themselves.

## See Also

[Isolated Events](devenv-events-isolated.md)
[Checklist for Submitting Your App](../developer/devenv-checklist-submission.md)  
[Rules and Guidelines for AL Code](apptest-overview.md)  