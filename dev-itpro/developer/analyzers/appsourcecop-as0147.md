---
title: "AppSourceCop Warning AS0147"
description: "Starting with runtime version 18.0 (2026 release wave 2), you can change a procedure parameter from Integer to BigInteger."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Warning AS0147
Changing a parameter from Integer to BigInteger might break dependent extensions.

## Description
Starting with runtime version 18.0 (2026 release wave 2), you can change a procedure parameter from Integer to BigInteger. However, this change might cause runtime errors in extensions that call this procedure. Ensure all dependent extensions can handle BigInteger values before making this change.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[AppSourceCop analyzer](appsourcecop.md)  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  