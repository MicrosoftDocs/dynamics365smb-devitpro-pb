---
title: Marketplace Names, Affixes, and ID Ranges FAQ
description: Find answers about publisher affixes, object ID ranges, namespaces, and object name limits when preparing Business Central apps for Marketplace.
author: SusanneWindfeldPedersen
ms.date: 11/27/2026
ms.reviewer: solsen
ms.topic: faq
ms.author: solsen
ms.custom: sfi-ropc-nochange
ai-usage: ai-assisted
---

# Marketplace names, affixes, and ID ranges FAQ

This article addresses some of the most frequently asked questions around how affixes and ID ranges are assigned to Marketplace apps.

## Do I need to register different affixes for each of my extensions?

No, you don't need to register affixes for each of your extensions.

Publishers register object affixes, so apps with the same publisher can share the same affixes. For new registrations, the affix must have exactly three characters. You can use a longer prefix or suffix for each extension. For example, if you registered **ABC** as your affix, you can use **ABCD** as the prefix in Extension 1 and **ABCE** as the prefix in Extension 2.

Automated validation checks the applicable naming requirements. A namespace with at least two levels can replace the affix on top-level objects. Members you add to objects from other publishers still need affixes where required. Learn more in [Prefix and suffix for naming in extensions](../compliance/apptest-prefix-suffix.md).

## Do I need to request a different ID range for each of my extensions?

No, you don't need to request a new ID range for each of your extensions.

The Marketplace assigns object ID ranges per partner, not per extension. You can use a subset of this range for each of your extensions. Assign nonoverlapping IDs within each object type across your extensions. You can't install together in the same environment extensions that define different objects with the same object type and ID. Learn more in [Get started building apps](readiness/get-started.md#requesting-an-object-range).

## What are the object name length limits, and can I use namespaces?

The general application-object name limit remains 30 characters. Namespaces have been available since Business Central version 23. They help organize objects and reduce naming conflicts without increasing this limit. References can use fully qualified names or `using` directives. Changing an existing object's namespace can break dependent apps. Learn more in [Namespaces in AL](devenv-namespaces-overview.md).

SQL Server identifiers have a maximum length of 128 characters. Business Central SQL table names can include the company name, table name, and app ID, so the generated name must fit within that limit. Learn more in [Database identifiers](/sql/relational-databases/databases/database-identifiers).

## Related information

[Technical validation checklist](devenv-checklist-submission.md)  
[Technical validation process FAQ](devenv-checklist-submission-validation-process.md)  
[App identity FAQ](devenv-checklist-submission-app-identity.md)  
[Azure Application Insights and Marketplace submission FAQ](devenv-checklist-submission-app-insights.md)  
[Marketplace app previews FAQ](devenv-checklist-submission-app-preview.md)  
[Business Central offer FAQ](devenv-checklist-submission-offer.md)  
[Develop and maintain Marketplace apps FAQ](devenv-checklist-submission-develop-maintain.md)  
[Code-signing validation FAQ](devenv-checklist-submission-code-sign.md)  
[Channels for questions and issues FAQ](devenv-checklist-submission-channels.md)

