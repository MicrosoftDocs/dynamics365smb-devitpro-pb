---
title: "AppSourceCop Error AS0142"
description: "A table with a published SQL schema cannot be moved between apps."
ms.author: solsen
ms.date: 03/11/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0142
The destination table must have the MovedFrom property.

## Description
A table with a published SQL schema cannot be moved between apps. If a table with the same ID is found in another app, the destination table must declare the MovedFrom property to indicate the source app.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[AppSourceCop analyzer](appsourcecop.md)  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  