---
title: Environment Telemetry | Microsoft Docs
description: Learn how the Business Central admin center provides telemetry for each environment.  
author: jaredha

ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: edupont
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 04/01/2019
ms.author: jaredha
---

# Environment Telemetry

The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] provides telemetry for the tenant environments to enable troubleshooting and support for the tenant. The Telemetry tab provides telemetry of top-level AL events, and any errors resulting from calls through the telemetry stack.

To filter the telemetry for an environment:

1. Select a base point-in-time for the timestamp of the telemetry messages.
2. Enter a number of minutes before or after the base point-in-time to set a range of time for the timestamp. A negative number indicates a number of minutes before the base point-in-time, and a positive number indicates a number of minutes following the base point-in-time. For example, a value of *-15* will filter the telemetry messages to a timestamp range of up to 15 minutes before the base point-in-time.
3. Choose the message type.
4. Choose the environment.
5. Select **Filter**.

## See also

[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
