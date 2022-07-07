---
title: "CodeCop Warning AA0244"
description: "Do not use identical names for parameters and global variables."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# CodeCop Warning AA0244
Do not use identical names for parameters and global variables.

## Description
Do not use identical names for parameters and global variables. 
[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
This CodeCop rule is similar to [AA0198](codecop-aa0198.md), but it applies to method parameters. The rule warns when a method's parameters names collide with global variable names, but with the following specifics for Event declaration.

AA0244 doesn't warn on Events with the exception of Integration Events that have GlobalVarAccess set to `true`.

## No warning

```AL
codeunit 50100 MyCodeunit
{
    // GlobalVarAccess = false hence we don't warn
    [IntegrationEvent(true, false)]
    local procedure MyNewEvent(EventParamA: Integer)
    begin
    end;
}
```
## Warning

```AL
codeunit 50100 MyCodeunit
{
    // GlobalVarAccess = true hence we warn
    [IntegrationEvent(true, true)]
    local procedure MyNewEvent(EventParamA: Integer)
    begin
    end;
}
```

> [!NOTE]  
> Rule AA0244 warns on EventSubscribers and even if the subscribers don't have control over the names of the parameters, they have control over the global variables living in the Codeunit.

## See Also  
[CodeCop Analyzer](codecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
