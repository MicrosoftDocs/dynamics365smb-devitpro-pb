---
title: "CodeCop Warning AA0074"
description: "TextConst and Label variable names should have a suffix (an approved three-letter suffix: Msg, Tok, Err, Qst, Lbl, Txt) describing usage."
ms.author: solsen
ms.custom: na
ms.date: 02/26/2024
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# CodeCop Warning AA0074
TextConst and Label variable names should have an approved suffix.

## Description
TextConst and Label variable names should have a suffix (an approved three-letter suffix: Msg, Tok, Err, Qst, Lbl, Txt) describing usage.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

|Three-letter suffix  |Meaning  |
|---------------------|---------|
|Msg                  |Message  |
|Tok                  |Token   |
|Err                  |Error  |
|Qst                  |StrMenu or Confirm |
|Lbl                  |Label, Caption |
|Txt                  |Text |

> [!NOTE]  
> The `Tok` suffix is generally used for short tokens such as "GET", "PUT", "HTTPS" etc. Furthermore, the variable name should align with the label itself, for example, `GetTok`, `PutTok` and `HttpsTok`. In general, these tokens should have the `Locked = true;` set so that they're not translated.

## Example

```AL
// Label suffixed with Tok for Token
GetTok: Label 'GET', Locked = true;
```

## See also

[CodeCop Analyzer](codecop.md)  
[Get started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  
