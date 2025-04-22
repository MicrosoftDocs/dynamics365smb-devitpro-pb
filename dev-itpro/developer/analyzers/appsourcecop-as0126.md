---
title: "AppSourceCop Warning AS0126"
description: "By specifying a different publisher name for your extension, you grant extensions from that publisher the permission to access the internal features of your extension."
ms.author: solsen
ms.date: 12/19/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
ai-usage: ai-assisted
ms.custom:
 - ai-gen-docs-bap
 - ai-seo-date: 12/19/2024
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Warning AS0126
InternalsVisibleTo should not specifying a different publisher name than the one of this extension.

## Description
By specifying a different publisher name for your extension, you grant extensions from that publisher the permission to access the internal features of your extension.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Specifying a different publisher name grants extensions from that publisher access to the internal features of your extension. This can lead to unintended access and potential security risks, as it allows external extensions to interact with your internal code.

## How to fix this diagnostic?

To address the AS0126 warning, ensure that the `InternalsVisibleTo` attribute specifies the same publisher name as the current extension. If you need to grant access to internal features, consider using proper access control mechanisms or APIs. Here are the steps to fix this diagnostic:

1. Identify the `InternalsVisibleTo` attribute in your extension's configuration.
2. Ensure that the publisher name specified in the `InternalsVisibleTo` attribute matches the publisher name of your extension.
3. If access needs to be granted to another publisher, evaluate whether it can be done through public APIs or other access control mechanisms.
4. Update the `InternalsVisibleTo` attribute to reflect the correct publisher name or remove the attribute if it's not necessary.

## Related information  

[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  