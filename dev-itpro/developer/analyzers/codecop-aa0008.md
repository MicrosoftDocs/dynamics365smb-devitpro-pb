---
title: "CodeCop Warning AA0008"
description: "Use parenthesis in a function call even if the function does not have any parameters."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# CodeCop Warning AA0008
Function calls should have parenthesis even if they do not have any parameters.

## Description
Use parenthesis in a function call even if the function does not have any parameters.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

> [!NOTE]
> This rule doesn't give a warning on system methods referenced using property syntax. For example, when accessing the system method `RecordId` from a `Record` variable using `RecId := MyRecord.RecordId` instead of `RecId := MyRecord.RecordId()`. 

## See Also  
[CodeCop Analyzer](codecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
