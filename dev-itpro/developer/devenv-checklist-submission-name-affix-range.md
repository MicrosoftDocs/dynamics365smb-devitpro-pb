---
title: Names, Affixes, and ID Ranges FAQ
description: Describes the most common questions about names, affixes, and ID ranges in your AppSource app for Business Central.
author: qutreson
ms.date: 10/08/2025
ms.reviewer: solsen
ms.topic: faq
ms.author: qutreson
ms.custom: sfi-ropc-nochange
---

# Names, affixes, and ID ranges FAQ

This article addresses some of the most frequently asked questions around how affixes and ID ranges are assigned to AppSource apps.

## Do I need to register different affixes for each of my extensions?

No, you don't need to register affixes for each of your extensions.

The object affixes are registered per publisher so if your apps all have the same publisher, they can share the same affixes. The automated validation verifies that you're using the three letters affix registered by Microsoft in your extension, but this still allows you to create longer affixes per extension. For example, if you registered ABC as your affix, you can use ABCD as the prefix in Extension 1 and ABCE as the prefix in Extension 2. Learn more in [Prefix and suffix for naming in extensions](../compliance/apptest-prefix-suffix.md).

## Do I need to request a different ID range for each of my extensions?

No, you don't need to request a new ID range for each of your extensions.

The object IDs are registered per partner, not per extension. You can then use a subset of this range for each of your extensions. It is your responsibility to ensure that you aren't defining objects with the same IDs in different extensions. If you're doing so, the extensions defining these objects can't be installed together on the same environment. Learn more in [Get started building apps](readiness/get-started.md#requesting-an-object-range).

## Will there be any changes made to the object names character limitation (30 characters) within the near future? 

We would like longer names as well. Introducing namespaces could be one investment. However, such a change has down-stream breaking impact (any caller needs to qualify calls) and there are SQL constraints on name lengths for tables, which currently include company name, table name, app ID and needs to be maximum 255. This is on our long term backlog, but haven't any changes planned soon.

## Related information

[Technical validation checklist](devenv-checklist-submission.md)  
[Technical validation process FAQ](devenv-checklist-submission-validation-process.md)  
[App identity FAQ](devenv-checklist-submission-app-identity.md)  
[Azure Application Insights and AppSource submission FAQ](devenv-checklist-submission-app-insights.md)  
[AppSource app previews FAQ](devenv-checklist-submission-app-preview.md)  
[Business Central offer FAQ](devenv-checklist-submission-offer.md)  
[Names, affixes, and ID ranges FAQ](devenv-checklist-submission-name-affix-range.md)  
[Develop and maintain AppSource apps FAQ](devenv-checklist-submission-develop-maintain.md)  
[Code-signing validation FAQ](devenv-checklist-submission-code-sign.md)  
[Channels for questions and issues FAQ](devenv-checklist-submission-channels.md)

