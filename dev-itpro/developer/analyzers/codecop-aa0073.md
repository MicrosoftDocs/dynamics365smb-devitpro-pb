---
title: "CodeCop Warning AA0073"
description: "Only temporary variable names must be prefixed with Temp."
ms.author: solsen
ms.custom: na
ms.date: 12/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# CodeCop Warning AA0073
The name of temporary variable must be prefixed with Temp.

## Description
Only temporary variable names must be prefixed with Temp.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Reason for the rule
Temporary variables must be named with identifiers that abbreviate the word temporary, such as temp. This improves readability of the code.

## Bad code example
```AL
JobWIPBuffer : Record "Job WIP Buffer" temporary;
```

## Good code example
```AL
TempJobWIPBuffer : Record "Job WIP Buffer" temporary;
```

## See Also  
[CodeCop Analyzer](codecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  