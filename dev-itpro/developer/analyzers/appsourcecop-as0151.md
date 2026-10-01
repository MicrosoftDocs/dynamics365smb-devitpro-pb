---
title: "AppSourceCop Info AS0151"
description: "The FullNamespaceScope feature is enabled but mandatory affix settings (mandatoryAffixes, mandatoryPrefix, or mandatorySuffix) are also configured."
ms.author: solsen
ms.date: 08/31/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Info AS0151
FullNamespaceScope conflicts with mandatory affix configuration

## Description
The FullNamespaceScope feature is enabled but mandatory affix settings (mandatoryAffixes, mandatoryPrefix, or mandatorySuffix) are also configured. Affix rules are not enforced when FullNamespaceScope is active. Remove the affix configuration from AppSourceCop.json to avoid confusion.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[AppSourceCop analyzer](appsourcecop.md)  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  