---
title: "AppSourceCop Warning AS0146"
description: "Starting with runtime version 18.0 (Fall 2026), you can change a table field from Integer to BigInteger."
ms.author: solsen
ms.date: 03/11/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Warning AS0146
Changing a field from Integer to BigInteger may break dependent extensions.

## Description
Starting with runtime version 18.0 (Fall 2026), you can change a table field from Integer to BigInteger. However, this change may cause runtime errors in extensions that reference this field. Ensure all dependent extensions can handle BigInteger values before making this change.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[AppSourceCop analyzer](appsourcecop.md)  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  