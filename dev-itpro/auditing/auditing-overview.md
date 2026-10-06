---
title: Business Central Auditing Overview
description: Learn about Business Central auditing for reviewing permissions, tracking data changes, and analyzing change logs, plus related data classification guidance.
author: jobulsin
ms.reviewer: solsen
ms.topic: overview
ms.date: 10/06/2026
ms.author: jswymer
---

# Auditing in Business Central

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] provides several auditing capabilities to help maintain data integrity and accountability. You can track changes to configured tables and fields, review changes to security-related system tables, assess users' effective permissions, and audit supported administrative events in Microsoft Purview. These capabilities don't provide a comprehensive log of all data access, user activity, or business transactions.

You can also analyze changes to configured tables and fields, including who made each change and when. Use the following articles to find guidance for your auditing goal or a related data-governance task.

| Goal | Article |
|---|---|
| Review supported administrative events from online environments in Microsoft Purview | [Auditing events in Microsoft Purview](audit-events-in-purview.md) |
| Review a user's effective permissions | [Get an overview of a user's permissions](/dynamics365/business-central/ui-define-granular-permissions#get-an-overview-of-a-users-permissions) |
| Track changes to selected tables and fields | [Audit changes](/dynamics365/business-central/across-log-changes) |
| Review changes to security-related system tables that the change log always records | [Security auditing](../security/security-auditing.md) |
| Analyze change log data | [Analyze data in the change log](/dynamics365/business-central/across-log-changes#analyze-data-in-the-change-log) |
| Classify the sensitivity of data stored in standard and custom fields | [Data classification](/dynamics365/business-central/admin-classifying-data-sensitivity) |

## Related information

[Auditing events in Microsoft Purview](audit-events-in-purview.md)  
[Get an overview of a user's permissions](/dynamics365/business-central/ui-define-granular-permissions#get-an-overview-of-a-users-permissions)  
[Audit changes](/dynamics365/business-central/across-log-changes)  
[Security auditing](../security/security-auditing.md)  
[Analyze data in the change log](/dynamics365/business-central/across-log-changes#analyze-data-in-the-change-log)  
[Data classification](/dynamics365/business-central/admin-classifying-data-sensitivity)
