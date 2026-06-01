---
title: "Compiler Error AL0630"
description: "Unrecognized escape sequence."
ms.author: solsen
ms.date: 05/27/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Error AL0630

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

Unrecognized escape sequence.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This error occurs when a text literal contains a backslash (`\`) followed by a character that isn't a recognized escape sequence. In AL, the backslash is used as a newline indicator in methods like `Message`, `Error`, `Confirm`, and `Dialog.Open`. To display a literal backslash, use a double backslash (`\\`). Learn more in [Text data type](../methods-auto/text/text-data-type.md#escape-sequences-in-text-literals).

## Related information  
[Text data type](../methods-auto/text/text-data-type.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  