---
title: "AppSourceCop Error AS0141"
description: "When a table is moved from one app to another under the Application umbrella, the destination table must have the MovedFrom property set to the source app ID."
ms.author: solsen
ms.date: 03/11/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0141
A table that appears to be moved from another app must have the MovedFrom property.

## Description
When a table is moved from one app to another under the Application umbrella, the destination table must have the MovedFrom property set to the source app ID. This is required to maintain the integrity of the table schema during upgrades.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[AppSourceCop analyzer](appsourcecop.md)  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  